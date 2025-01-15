

namespace gregslist_dotnet.Services;


public class HousesService
{
    private readonly HousesRepository _repository;
    public HousesService(HousesRepository repository)
    {
        _repository = repository;
    }

    internal House CreateHouse(House houseData)
    {
        House house = _repository.CreateHouse(houseData);
        return house;
    }

    internal List<House> GetAllHouses()
    {
        List<House> houses = _repository.GetAllHouses();
        return houses;
    }

    internal House GetHouseById(int houseId)
    {
        House house = _repository.GetHouseById(houseId);
        return house;
    }
}
