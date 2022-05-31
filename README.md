# shoppingMall

## DataBase

```sql
CREATE TABLE [dbo].[member] (
    [id]             INT           IDENTITY (1, 1) NOT NULL,
    [firstName]      NVARCHAR (32) NOT NULL,
    [lastName]       NVARCHAR (32) NOT NULL,
    [userName]       NVARCHAR (64) NOT NULL,
    [profilePicture] TEXT          NOT NULL,
    [email]          NVARCHAR (64) NOT NULL,
    [password]       NVARCHAR (64) NOT NULL,
    [sex]            NVARCHAR (1)  NOT NULL,
    [dateOfBirth]    DATE          NOT NULL,
    [role]           VARCHAR (64)  NULL,
    [createdAt]      DATETIME      DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_member_id] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [AK_member_userName_uique] UNIQUE NONCLUSTERED ([userName] ASC),
    CONSTRAINT [AK_member_email_uique] UNIQUE NONCLUSTERED ([email] ASC),
    CONSTRAINT [CK_member_sex_checker] CHECK ([sex]='m' OR [sex]='f')
);
```

```sql
INSERT INTO [product]
  ([name], [image], [description], [category], [brand], [countInStock], [price]) VALUES
  (
    'Rii RK202 Gaming Keyboard,LED Rainbow Backlit Light up Keyboard With Membrane Keys',
    '/images/products/Rii RK202 Gaming Keyboard,LED Rainbow Backlit Light up Keyboard With Membrane Keys.jpg',
    'Rainbow Light up Keyboard】Using Rii light up gaming keyboard will Light up your gaming area to increase the gaming atmosphere and make your game more interesting.\nspecially in dark this PC gaming keyboard will be more amazing.\nYou also can adjust the lighting modes, brightness or close it by your need.\nMechanical Feeling Gaming Keyboard】Rii gaming keyboard use the new membrane technology,even if it is not a real mechanical keyboard, but it has the feeling of mechanical keyboard.\nNo keys stick, playing games and typing will be smoother.\nIt is worth using for games/office.',
    'keyboard',
    'brand1',
    10,
    30
  );
INSERT INTO [product]
  ([name], [image], [description], [category], [brand], [countInStock], [price]) VALUES
  (
    'VGUARD Gaming Mouse, Comfortable Wired USB Optical RGB Ergonomic Mice for PC Computer Laptop, 6 Programmable Buttons, 4 Adjustable Sensitivity, 7 Colors LED Backlight - Bla',
    '/images/products/VGUARD Gaming Mouse, Comfortable Wired USB Optical RGB Ergonomic Mice for PC Computer Laptop, 6 Programmable Buttons, 4 Adjustable Sensitivity, 7 Colors LED Backlight - Bla.jpg',
    '♥ High precision opical mouse with 4 kinds adjustable DPI(800 / 1200 / 1600 /2400), high sensitivity & fluent tracking under rapid movement, stable cursor, optimized data transfer, no lagging, super quiet, meets all requests in your mind.\n♥ Ergonomic right hand design offers extremely comfortable mechanical solid feeling, easy to find a good position for your gaming hand, frosted texture skin, enjoy in your champion show.',
    'mouse',
    'brand2',
    7,
    10
  );
INSERT INTO [product]
  ([name], [image], [description], [category], [brand], [countInStock], [price]) VALUES
  (
    'Gaming Mouse Wired, VersionTECH. Computer USB Mouse 2400 DPI Adjustable, Side Buttons Lighting Modes Ergonomic Wired Mouse Gaming Mice for Laptop Windows Gamer, White',
    '/images/products/Gaming Mouse Wired, VersionTECH. Computer USB Mouse 2400 DPI Adjustable, Side Buttons Lighting Modes Ergonomic Wired Mouse Gaming Mice for Laptop Windows Gamer, White.jpg',
    'RGB 7-COLOR BREATHING LIGHT】 Unique cracking design combining with 7 colors glaring LED light，multiple colors are glowing at once, highlights the atmosphere of gaming.\nPress Forward / Back Button + DPI to turn off the light.\n【4 DPI OPTIONS FOR GAMES & WORK】 800 / 1200 / 1600 /2400 DPI Resolution Optical Tracking Technology provides sensitivity and precise tracking on a wide range of surfaces.\nMeet your multiple needs, either for daily work or gaming.',
    'mouse',
    'brand1',
    8,
    12
  );
INSERT INTO [product]
  ([name], [image], [description], [category], [brand], [countInStock], [price]) VALUES
  (
    'Hcman RGB Large Gaming Mouse Mat, XXL Mouse Pad 800×300×4mm, PC Gaming Accessories Mousepad, Keyboard Desk Mat for Computer Gamer- Black',
    '/images/products/Hcman RGB Large Gaming Mouse Mat, XXL Mouse Pad 800×300×4mm, PC Gaming Accessories Mousepad, Keyboard Desk Mat for Computer Gamer- Black.jpg',
    '【RGB LED Backlit】The RGB soft mouse pad has a true RGB backlit effect,there are 10 lighting modes.\nYou can turn off the light if you want to.\nAlso you can use rainbow mode match up with Hcman backlit mechanical keyboard and mouse.\n【10 Lighting Modes 】Super Glow Fiber - Chroma customizable lighting provides a distinctive appearance , Choose from 10 lighting modes : Rainbow breathing, Red , Purple ,Blue ,Cyan , Green , Yellow , Flowing Circling Motion , Colorful Circling Motion, Turn off.',
    'mouse mate',
    'brand3',
    8,
    12
  );
```
