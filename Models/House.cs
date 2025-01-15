using System.ComponentModel.DataAnnotations;

namespace gregslist_dotnet.Models;

public class House
{
    public int Id { get; set; }
    [MinLength(0), MaxLength(100000)] public int sqft { get; set; }
    [MinLength(0), MaxLength(1000)] public int bedrooms { get; set; }
    [MinLength(0), MaxLength(1000)] public int bathrooms { get; set; }
    [Url] public string img_url { get; set; }
    public string description { get; set; }
    public int price { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
    public Account Creator { get; set; }
}