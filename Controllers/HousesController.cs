namespace gregslist_dotnet.Controllers;


[ApiController]
[Route("api/houses")]
public class HousesController : ControllerBase
{

    private readonly HousesService _housesService;
    private readonly Auth0Provider _auth0Provider;

    public HousesController(HousesService housesService, Auth0Provider auth0Provider)
    {
        _housesService = housesService;
        _auth0Provider = auth0Provider;
    }



}