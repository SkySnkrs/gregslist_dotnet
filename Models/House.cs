using System.ComponentModel.DataAnnotations;

namespace gregslist_dotnet.Models;

public class House
{
    public int Id { get; set; }

    [Range(0, 100000)]
    public int sqft { get; set; }

    [Range(0, 1000)]
    public int bedrooms { get; set; }

    [Range(0, 1000)]
    public int bathrooms { get; set; }

    public string img_url { get; set; }

    public string description { get; set; }

    public int price { get; set; }

    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
    public string CreatorId { get; set; }
    public Account Creator { get; set; }
}
