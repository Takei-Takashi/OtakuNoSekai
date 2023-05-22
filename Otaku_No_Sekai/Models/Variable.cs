namespace Otaku_No_Sekai.Models
{
    public class Variable
    {
        public Variable() { }
        public Boolean checkExistAccount(Account a, List<Account> accounts)
        {
            foreach (Account acc in accounts)
            {
                if (acc.Equals(a))
                {
                    return true;
                }
            }
            return false;
        }
        public Product GetProduct(int id, List<Product> products)
        {
            foreach (Product product in products)
            {
                if (product.Id.Equals(id))
                {
                    return product;
                }
            }
            return null;
        }
        public List<Product> GetProductById(int aid, List<Product> products)
        {
            List<Product> list = new List<Product>();
            foreach (Product product in products)
            {
                if (product.Poster.Equals(aid))
                {
                    list.Add(product);
                }
            }
            return list;
        }
        public Boolean checkExistName(string name, List<Product> products)
        {
            foreach (Product product in products)
            {
                if (product.Name.Equals(name))
                {
                    return true;
                }
            }
            return false;
        }
    }
}
