Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09ABC77B61
	for <intel-xe@archiver.kernel.org>; Fri, 28 Apr 2023 08:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A0710EC66;
	Fri, 28 Apr 2023 08:00:18 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18F710EC7E
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Apr 2023 08:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682668814; x=1714204814;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ONIyRyHIZvytoNa/6pHbTwWeQ4cwtRQerLWJ+XSHeAE=;
 b=OZRNn1azfBZWOujN7du5bF3nzMw4avLFM+kCGAvt23b2Smz3U8RGZuJ9
 l2DrSbvwHCt13lSTSYuNFfcI8EDuUlOUJYqnMh/58HlPQ54H3pkzdNLjW
 ANf86o8VZOgK7ZtDHHw1TJWlMIrtVD/fHxU9TTMsVStVllPgWCnPzRGAk
 F0xl1IWFfWWYS9KAtyTQeyyNcNyhHVPInaNGMcXQHT9kdJJ9H5Eg2cZHS
 JqBPIHjm7bf2L4jC2OCSGL1NuYg8HKDlrQ+3kddEdC5woahxySHUYAsTJ
 ZLt4G208pcrTgRPRThq/HU0XW4UPQMuL+E4QkOsd4ZNbyVvsqALvYxvml g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346447346"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="346447346"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 01:00:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="818916143"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="818916143"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 28 Apr 2023 01:00:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 01:00:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 28 Apr 2023 01:00:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 28 Apr 2023 01:00:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHD0XeDT9icWabS1QL0/38r7qAQkquf0gIvlUutQ4PS5+KlAgfqbsU6y5KqXxWJqaZfXdsIBu9ormeilrjKNgUOmHXbchcOafa3vsx6VjGVG7aBRMcbP3DlRES2sfzdX4doXVSGh7M5kKB9ZvF1u7YYUk9kaAfJsJZvRAocxD8Jppg+ZWWvwKZwAl48/oYKGq2dhG4LhiutuGQysieSFJmzcpj1z75LsPUCSfWuNiVHpdGRukZyS7k0YXWsf+fO9JfoaYwt8CEHF5qT+5xtBe+rErP7KBtrFdfvVUWzbkC9OGaY9HJR7deF2hGmm56IOvMoJqBp0FT6S2maHNuG0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoYBW1o7SgISGAQ0Zrrk/Lext0QMtS5pgMxj6t0zrgM=;
 b=AV9lKEiR0TQkzp2d5wfOTyk25iaFpw5olukC3njmJoNcHW3OaqztMl509PxY1yFDIei4+ZaQbflxv7DI8kSdZwqt+uJ4CDHPaCTWYA5kpHu/q5YkPL8nfi87bUu/KXOxIAa+ObCCfXlam3cFa+IeIgQ2k2BtxISq0rKNyLTWYtszjbh6TIKFpzPGpiLdG4whJz+aE50gVljCPmfhUwYvec4xz5ToVuQIUnhzb6pVXvRlGsCfwlfxmovKa+qN1fnsj+mzxdhV+h5F+Ysz89WC4PiESk5JYmAqmK/W3qLV2+mIzSVUEbjcFtzqd7N8DRBKaBZ5goKPn772w9dDJpgapw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ1PR11MB6177.namprd11.prod.outlook.com (2603:10b6:a03:45c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 08:00:04 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%5]) with mapi id 15.20.6340.021; Fri, 28 Apr 2023
 08:00:04 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/4] drm/xe/ras: Log the GT hw errors.
Thread-Index: AQHZaGmAzaVkhsBDhE+u6f0fPeDYhq87R1cAgAUOuKA=
Date: Fri, 28 Apr 2023 08:00:04 +0000
Message-ID: <MW4PR11MB7056F4BB0BE08B3A9772A8C1B36B9@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230406092631.2820028-1-himal.prasad.ghimiray@intel.com>
 <20230406092631.2820028-3-himal.prasad.ghimiray@intel.com>
 <20230425002256.GK10045@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20230425002256.GK10045@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|SJ1PR11MB6177:EE_
x-ms-office365-filtering-correlation-id: 1f5bd293-536c-40cd-6f43-08db47be932b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2u2Zz1IFatrcBN96p6NkC9phqzkebjMBTr5M95GcpoghVJMFyjXp3FHti0qNR8lRZNehiUYXZuBRGAWiNcXi1sajR07H7kBEQ78YwMVC/YafXLg9VtAKHHJsdRf2/90XRsSpcUqwuf+pc37lcXY7jIRKttAU5ZklbieId+2W0apJy2zTR5ogJFSw0yUF7tDXsJCpCd9gr5Yqgy0H8pH8jJBknd1IcIx7C+8u8TmmtNFzVR126bvflquhYDpAkpJ5YscliIAwoPs+9Nz2WPhXxMGW6raOVKsA59f7i+uGHS7+8GyCP3iEtw4vK9LrIn9dwuz23gLr3iTP/Bvop8d5h5sNh0mbuSlKC2jUFk3a/3/VhLYlDA7TAXD4iS1g6fDsaEsQuU1KR9rZA38dvJGTPpM6bT/ZdBoDRw0pByQjwuDLkRZeiNOASgH7veI7v8IOl25ATu4GjlXR18gbtD30HPPMk1hgn1sfS94GuUKQfC4G0b8EtS9LNiGJPKj9McDVIVmBsNSHOySRw7kNvPxtuJ/2IMOZWKRSG1YJlLGBd7Uu2m1jiGmuPrOVZSKQ69G3SVAAuBzAyhLyfbY9XKFy+CHJ7lyq2phgws/jhL4pf3E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199021)(26005)(55016003)(9686003)(6506007)(53546011)(186003)(478600001)(6636002)(33656002)(52536014)(71200400001)(966005)(7696005)(5660300002)(6862004)(30864003)(8936002)(2906002)(38070700005)(4326008)(82960400001)(38100700002)(316002)(64756008)(66476007)(66556008)(66446008)(66946007)(76116006)(122000001)(41300700001)(8676002)(86362001)(83380400001)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OnEkue3XQpYvo4dNLivtJXYZNWEUDB3r/LltTW2bUMTRV+Ty/b9zVefKAPSH?=
 =?us-ascii?Q?40WWH+vjsZES4l+PCM1KDMiD8NcuvE2mKaVeSq3B8TRT0zH7A4XhSPh2duZm?=
 =?us-ascii?Q?CL4R/nFDYGqbWdGIuBKNYskr4sGiT5Hdp3QqQBosMJV9w+aSSxi69k1qiI+r?=
 =?us-ascii?Q?I3mISd5lW1I2ntuXSbi/UdBN0CeJaTfHJS5A03zhAwUdDBLAkzvIdAJNZ9kC?=
 =?us-ascii?Q?wkE6FCqQO+MClyuqDrJVrEaEXt8BcvrEFIxBEa0ruHsHiJJxCVSD0FngmflI?=
 =?us-ascii?Q?JzZIEZJe06APAl7pJpJElrZ36j96KwofvTrI6FmB3/+uRf7TegFnDyoQ1Ve7?=
 =?us-ascii?Q?L65J/bRPOxRMIbHFlwykoURrdJqM1TX9+mesxODra6blfwHz0ltNklR9wZpq?=
 =?us-ascii?Q?Efb/Pn+NzWS4/YqLn1TQQRPDuoygNzstfHI5oE3oBvc9Y1QzFmEWqD/GGntV?=
 =?us-ascii?Q?OCVyDmzRFM8/9XjbGy11aPDvhPoYIl9PqgxDru4BayNs4sCMYxRGVJ3fsGds?=
 =?us-ascii?Q?D7lfs/W7mp9z7ssa9Bg/bCuN8i5zj0Y9qe/LrLi8rfxidVlkgFhpyqR+kglq?=
 =?us-ascii?Q?4+KVQflaVU31+gM3M0ZyFM2Hu0nryv/Qe9R/Ui9kr4KuTuqagaJYqoWAVntu?=
 =?us-ascii?Q?FD5ENXsL5eehDsSrhWMJZgAg8JZYy+tKH+FM54UiYvq8k8nc5JhXTlxdqO4f?=
 =?us-ascii?Q?O8EIjdmgMrGbqYtDvtXNDLRRFnssoHpYIY/Ll2I6cFaZryWo/VtyygCUAsvk?=
 =?us-ascii?Q?YkB4CUpgBirT6GdV1+W/nwu05eTlCkgYzzMjWGbE5M9Fr6dymx7qpjxfy5kc?=
 =?us-ascii?Q?f7X81brimfBtXdjLpVhq71sgQtYxem3wKNy84B61bA6SE+oFfp4i27vIRfoj?=
 =?us-ascii?Q?Qrk4I1LT2maYm8xxhBmfpdh2ZHtqRMC3TosSUcI5JBdKAmpB366Sy8cBSFTV?=
 =?us-ascii?Q?az3yn1Qm1JD+E15CV3f3wrbMs9XK0Iso7FilUKJaZBUsO4f+t419y8yVZrRm?=
 =?us-ascii?Q?thNl8YnkCe7FZpFD86WnjRckl//iFBAUgW5Pm/pPF/a67F0upiaamxaAxZip?=
 =?us-ascii?Q?fx0aD6OEPyA0FMFOREd/zgBzYS/g3t2B3EtSyDkgP4aE5Q8ad7FYwLapy4YV?=
 =?us-ascii?Q?VQBKC0cWLX0JCCeHHQQ94PKo0QgKKctqLImKnnXPkexXd19FjXhPkWfoovIY?=
 =?us-ascii?Q?faS6yoGyDUpHLSglv5VirLERkD5PuoqupLoUwvNRUoazbxI2YLH7IigCtFM3?=
 =?us-ascii?Q?AkjlYplpD34YEFQg+v1QwLs7DvW3Wo5Q7qUctTmtERT+jyea8XW/RMAdn90u?=
 =?us-ascii?Q?ep9p38mu2jEPWCP1BVXBMJYgUIYJC7r51Fj2bSYc053vjTXt23UjoTaC/UNP?=
 =?us-ascii?Q?O/c4GUHwkQOIN3gkIIIX78Kgm/BIXatGQa0kDZmW9uDvRn2Erz2h26u7T1Tb?=
 =?us-ascii?Q?GsWcBZwAEXZB3lHaBnH2iqyhsLZ/T9u2LuweFhRq5YkxBoeqjNFY8LkLnWXu?=
 =?us-ascii?Q?RJkdFmiomcN1ocGbOb+lGuPB7ksYeAtjnTVsSljvsNjXR7aIfCHWnXDPEPpy?=
 =?us-ascii?Q?L/We4fbXLn/CGkurZpjCI9CmRnE7NyV18sH2Nx71adIb3kGirp+btmOLaKm6?=
 =?us-ascii?Q?PQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5bd293-536c-40cd-6f43-08db47be932b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2023 08:00:04.1435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 71gDx6EpbuQBG4p4hplP9cH+kSApgoeMdwIG2l4x8hYhvzh3UHzmM8c5+pX9G1UbyvA2x8J1TFBwhqqR4IQBMl3Z/MWB7einTvayraEySpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6177
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe/ras: Log the GT hw errors.
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: 25 April 2023 05:53
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe/ras: Log the GT hw errors.
>=20
> On Thu, Apr 06, 2023 at 02:56:29PM +0530, Himal Prasad Ghimiray wrote:
> > From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> >
> > Count the CORRECTABLE and FATAL GT hardware errors as signaled by
> > relevant interrupt and respective registers.
> >
> > For non relevant interrupts count them as driver interrupt error.
> >
> > For platform supporting error vector registers count and report the
> > respective vector errors.
> >
> > Co-authored-by: Himal Prasad Ghimiray
> > <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_regs.h    |  77 ++++++-
> >  drivers/gpu/drm/xe/xe_device_types.h |   2 +
> >  drivers/gpu/drm/xe/xe_gt.c           |  29 +++
> >  drivers/gpu/drm/xe/xe_gt_types.h     |  43 ++++
> >  drivers/gpu/drm/xe/xe_irq.c          | 332 ++++++++++++++++++++++++---
> >  drivers/gpu/drm/xe/xe_pci.c          |   3 +
> >  6 files changed, 453 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_regs.h
> > index dff74b093d4e..b3d35d0c5a77 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> > @@ -122,14 +122,50 @@ enum hardware_error {
> >  	HARDWARE_ERROR_MAX,
> >  };
> >
> > +#define DEV_PCIEERR_STATUS              _MMIO(0x100180)
> > +#define DEV_PCIEERR_IS_FATAL(x)         (REG_BIT(2) << (x * 4))
>=20
> Just move the math inside the REG_BIT parameter.  I.e.
>=20
>         #define DEV_PCIEERR_IS_FATAL(x)   REG_BIT(x * 4 + 2)
>=20
> >  #define _DEV_ERR_STAT_FATAL             0x100174
> >  #define _DEV_ERR_STAT_NONFATAL          0x100178
> >  #define _DEV_ERR_STAT_CORRECTABLE       0x10017c
> >  #define DEV_ERR_STAT_REG(x)             _MMIO(_PICK_EVEN((x), \
> >
> 	_DEV_ERR_STAT_CORRECTABLE, \
> >
> 	_DEV_ERR_STAT_NONFATAL))
> > +
> >  #define  DEV_ERR_STAT_GT_ERROR          REG_BIT(0)
> >
> > +enum gt_vctr_registers {
> > +	ERR_STAT_GT_VCTR0 =3D 0,
> > +	ERR_STAT_GT_VCTR1,
> > +	ERR_STAT_GT_VCTR2,
> > +	ERR_STAT_GT_VCTR3,
> > +	ERR_STAT_GT_VCTR4,
> > +	ERR_STAT_GT_VCTR5,
> > +	ERR_STAT_GT_VCTR6,
> > +	ERR_STAT_GT_VCTR7,
> > +};
> > +
> > +#define ERR_STAT_GT_COR_VCTR_LEN        (4)
> > +#define _ERR_STAT_GT_COR_VCTR_0         0x1002a0
> > +#define _ERR_STAT_GT_COR_VCTR_1         0x1002a4
> > +#define _ERR_STAT_GT_COR_VCTR_2         0x1002a8
> > +#define _ERR_STAT_GT_COR_VCTR_3         0x1002ac
> > +#define ERR_STAT_GT_COR_VCTR_REG(x)     _MMIO(_PICK_EVEN((x), \
> > +
> 	_ERR_STAT_GT_COR_VCTR_0, \
> > +
> 	_ERR_STAT_GT_COR_VCTR_1))
> > +
> > +#define ERR_STAT_GT_FATAL_VCTR_LEN      (8)
> > +#define _ERR_STAT_GT_FATAL_VCTR_0       0x100260
> > +#define _ERR_STAT_GT_FATAL_VCTR_1       0x100264
> > +#define _ERR_STAT_GT_FATAL_VCTR_2       0x100268
> > +#define _ERR_STAT_GT_FATAL_VCTR_3       0x10026c
> > +#define _ERR_STAT_GT_FATAL_VCTR_4       0x100270
> > +#define _ERR_STAT_GT_FATAL_VCTR_5       0x100274
> > +#define _ERR_STAT_GT_FATAL_VCTR_6       0x100278
> > +#define _ERR_STAT_GT_FATAL_VCTR_7       0x10027c
> > +#define ERR_STAT_GT_FATAL_VCTR_REG(x)   _MMIO(_PICK_EVEN((x), \
> > +					_ERR_STAT_GT_FATAL_VCTR_0, \
> > +					_ERR_STAT_GT_FATAL_VCTR_1))
> > +
> >  #define _ERR_STAT_GT_COR                0x100160
> >  #define _ERR_STAT_GT_NONFATAL           0x100164
> >  #define _ERR_STAT_GT_FATAL              0x100168
> > @@ -137,7 +173,42 @@ enum hardware_error {
> >  						_ERR_STAT_GT_COR, \
> >  						_ERR_STAT_GT_NONFATAL))
> >
> > -#define  EU_GRF_ERROR                   REG_BIT(15)
> > -#define  EU_IC_ERROR                    REG_BIT(14)
> > -
> > +#define  EU_GRF_COR_ERR                 (15)
> > +#define  EU_IC_COR_ERR                  (14)
> > +#define  SLM_COR_ERR                    (13)
> > +#define  SAMPLER_COR_ERR                (12)
> > +#define  GUC_COR_ERR                    (1)
> > +#define  L3_SNG_COR_ERR                 (0)
> > +
> > +#define PVC_COR_ERR_MASK \
> > +		(REG_BIT(GUC_COR_ERR) | \
> > +		 REG_BIT(SLM_COR_ERR) | \
> > +		 REG_BIT(EU_IC_COR_ERR) | \
> > +		 REG_BIT(EU_GRF_COR_ERR))
> > +
> > +#define EU_GRF_FAT_ERR                  (15)
> > +#define EU_IC_FAT_ERR                   (14)
> > +#define SLM_FAT_ERR                     (13)
> > +#define SAMPLER_FAT_ERR                 (12)
> > +#define SQIDI_FAT_ERR                   (9)
> > +#define IDI_PAR_FAT_ERR                 (8)
> > +#define GUC_FAT_ERR                     (6)
> > +#define L3_ECC_CHK_FAT_ERR              (5)
> > +#define L3_DOUBLE_FAT_ERR               (4)
> > +#define FPU_UNCORR_FAT_ERR              (3)
> > +#define ARRAY_BIST_FAT_ERR              (1)
> > +
> > +#define PVC_FAT_ERR_MASK \
> > +		(REG_BIT(FPU_UNCORR_FAT_ERR) | \
> > +		 REG_BIT(GUC_FAT_ERR)  | \
> > +		 REG_BIT(SLM_FAT_ERR)  | \
> > +		 REG_BIT(EU_GRF_FAT_ERR))
> > +
> > +#define GT_HW_ERROR_MAX_ERR_BITS        16
> > +
> > +#define _SLM_ECC_ERROR_CNT              0xe7f4
> > +#define _SLM_UNCORR_ECC_ERROR_CNT       0xe7c0
> > +#define SLM_ECC_ERROR_CNTR(x)           _MMIO((x) =3D=3D
> HARDWARE_ERROR_CORRECTABLE ? \
> > +						_SLM_ECC_ERROR_CNT : \
> > +
> 	_SLM_UNCORR_ECC_ERROR_CNT)
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index 88f863edc41c..ecabf4d6690d 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -99,6 +99,8 @@ struct xe_device {
> >  		bool has_link_copy_engine;
> >  		/** @enable_display: display enabled */
> >  		bool enable_display;
> > +		/** @has_gt_error_vectors: whether platform supports
> ERROR VECTORS */
> > +		bool has_gt_error_vectors;
> >
> >  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> >  		struct xe_device_display_info {
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index bc821f431c45..ce9ce2748394 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -44,6 +44,35 @@
> >  #include "xe_wa.h"
> >  #include "xe_wopcm.h"
> >
> > +static const char * const xe_gt_driver_errors_to_str[] =3D {
> > +	[INTEL_GT_DRIVER_ERROR_INTERRUPT] =3D "INTERRUPT", };
> > +
> > +void xe_gt_log_driver_error(struct xe_gt *gt,
>=20
> It looks like the things this function gets used for fall into one of two
> categories:
>=20
>  - Software assertions that we don't expect to happen unless we screwed
>    up and missed something in the code.
>  - Hardware is doing something out of spec (e.g., raising interrupt bits
>    that aren't documented).
>=20
> For the first one, I don't see a reason to be counting up such errors; th=
ey're
> just there for early developers and such mistakes should not be present i=
n
> the driver anymore by the time it gets into real users'
> hands.  For the latter, classifying these as "driver errors" is incorrect=
 since it's
> the hardware misbehaving, not the driver.
Yes you are right. Will address this in next patch
>=20
> All of this new infrastructure seems pretty questionable at the moment.
> We're doing extra work to count up errors, but then never doing anything
> with the counts.  You mention in the cover letter that these will be expo=
sed
> to userspace eventually, but what's the benefit of that?  Which userspace
> component is going to actually use this information?  What do you expect
> userspace to do if it finds out there's been a fatal or correctable error=
 in
> some low-level hardware unit?  Generally userspace shouldn't even need to
> care about the really low-level hardware details; if something has truly =
gone
> fatally wrong, it's game over for userspace and it probably doesn't matte=
r
> exactly where in the hardware things are actually busted.
>=20
> Without some extra justification from the userspace point of view, it fee=
ls
> like we're just adding a bunch of code that doesn't have a real-world
> purpose.
The error counters  exposed by KMD will be used by sysman=20
They will be categorized to specific category of error in sysman:
 https://spec.oneapi.io/level-zero/latest/sysman/api.html#ras
>=20
> > +			    const enum xe_gt_driver_errors error,
> > +			    const char *fmt, ...)
> > +{
> > +	struct va_format vaf;
> > +	va_list args;
> > +
> > +	va_start(args, fmt);
> > +	vaf.fmt =3D fmt;
> > +	vaf.va =3D &args;
> > +
> > +	BUILD_BUG_ON(ARRAY_SIZE(xe_gt_driver_errors_to_str) !=3D
> > +		     INTEL_GT_DRIVER_ERROR_COUNT);
> > +
> > +	WARN_ON_ONCE(error >=3D INTEL_GT_DRIVER_ERROR_COUNT);
> > +
> > +	gt->errors.driver[error]++;
> > +
> > +	drm_err_ratelimited(&gt_to_xe(gt)->drm, "GT%u [%s] %pV",
> > +			    gt->info.id,
> > +			    xe_gt_driver_errors_to_str[error],
> > +			    &vaf);
> > +	va_end(args);
> > +}
> > +
> >  struct xe_gt *xe_find_full_gt(struct xe_gt *gt)  {
> >  	struct xe_gt *search;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> > b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 8f29aba455e0..9580a40c0142 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -33,6 +33,43 @@ enum xe_gt_type {
> >  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 *
> > XE_MAX_DSS_FUSE_REGS)];  typedef unsigned long
> > xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
> >
> > +/* Count of GT Correctable and FATAL HW ERRORS */ enum
> > +intel_gt_hw_errors {
> > +	INTEL_GT_HW_ERROR_COR_SUBSLICE =3D 0,
> > +	INTEL_GT_HW_ERROR_COR_L3BANK,
> > +	INTEL_GT_HW_ERROR_COR_L3_SNG,
> > +	INTEL_GT_HW_ERROR_COR_GUC,
> > +	INTEL_GT_HW_ERROR_COR_SAMPLER,
> > +	INTEL_GT_HW_ERROR_COR_SLM,
> > +	INTEL_GT_HW_ERROR_COR_EU_IC,
> > +	INTEL_GT_HW_ERROR_COR_EU_GRF,
> > +	INTEL_GT_HW_ERROR_FAT_SUBSLICE,
> > +	INTEL_GT_HW_ERROR_FAT_L3BANK,
> > +	INTEL_GT_HW_ERROR_FAT_ARR_BIST,
> > +	INTEL_GT_HW_ERROR_FAT_FPU,
> > +	INTEL_GT_HW_ERROR_FAT_L3_DOUB,
> > +	INTEL_GT_HW_ERROR_FAT_L3_ECC_CHK,
> > +	INTEL_GT_HW_ERROR_FAT_GUC,
> > +	INTEL_GT_HW_ERROR_FAT_IDI_PAR,
> > +	INTEL_GT_HW_ERROR_FAT_SQIDI,
> > +	INTEL_GT_HW_ERROR_FAT_SAMPLER,
> > +	INTEL_GT_HW_ERROR_FAT_SLM,
> > +	INTEL_GT_HW_ERROR_FAT_EU_IC,
> > +	INTEL_GT_HW_ERROR_FAT_EU_GRF,
> > +	INTEL_GT_HW_ERROR_FAT_TLB,
> > +	INTEL_GT_HW_ERROR_FAT_L3_FABRIC,
> > +	INTEL_GT_HW_ERROR_COUNT
> > +};
> > +
> > +enum xe_gt_driver_errors {
> > +	INTEL_GT_DRIVER_ERROR_INTERRUPT =3D 0,
> > +	INTEL_GT_DRIVER_ERROR_COUNT
> > +};
> > +
> > +void xe_gt_log_driver_error(struct xe_gt *gt,
> > +			    const enum xe_gt_driver_errors error,
> > +			    const char *fmt, ...);
> > +
> >  struct xe_mmio_range {
> >  	u32 start;
> >  	u32 end;
> > @@ -357,6 +394,12 @@ struct xe_gt {
> >  	 *    of a steered operation
> >  	 */
> >  	spinlock_t mcr_lock;
> > +
> > +	struct intel_hw_errors {
> > +		unsigned long hw[INTEL_GT_HW_ERROR_COUNT];
> > +		unsigned long driver[INTEL_GT_DRIVER_ERROR_COUNT];
> > +	} errors;
> > +
> >  };
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> > index 6b922332bff1..4626f7280aaf 100644
> > --- a/drivers/gpu/drm/xe/xe_irq.c
> > +++ b/drivers/gpu/drm/xe/xe_irq.c
> > @@ -19,6 +19,7 @@
> >  #include "xe_hw_engine.h"
> >  #include "xe_mmio.h"
> >
> > +#define HAS_GT_ERROR_VECTORS(xe) ((xe)->info.has_gt_error_vectors)
> >  static void gen3_assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
> > {
> >  	u32 val =3D xe_mmio_read32(gt, reg.reg); @@ -359,44 +360,281 @@
> > hardware_error_type_to_str(const enum hardware_error hw_err)
> >  	}
> >  }
> >
> > +#define xe_gt_hw_err(gt, fmt, ...) \
> > +	drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "GT%d detected "
> fmt, \
> > +			(gt)->info.id, ##__VA_ARGS__)
>=20
> As on the previous patch, it looks like we're printing error-level kernel
> messages for correctable errors (i.e., things the hardware caught and fix=
ed
> internally like ECC).  Generally those kind of things shouldn't be puttin=
g
> errors in the kernel log because there's no actual problem from the end u=
ser
> perspective.
Agreed. Should we use warning for correctable errors ?
>=20
> > +
> >  static void
> > -xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error
> > hw_err)
> > +xe_gt_correctable_hw_error_stats_update(struct xe_gt  *gt, unsigned
> > +long errstat)
> >  {
> > -	const char *hw_err_str =3D hardware_error_type_to_str(hw_err);
> > -	u32 other_errors =3D ~(EU_GRF_ERROR | EU_IC_ERROR);
> > -	u32 errstat;
> > +	u32 errbit, cnt;
> >
> > -	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
> > +	if (!errstat && HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
> > +		return;
> >
> > -	errstat =3D xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
> > +	for_each_set_bit(errbit, &errstat, GT_HW_ERROR_MAX_ERR_BITS) {
> > +		if (gt->xe->info.platform =3D=3D XE_PVC && !(REG_BIT(errbit) &
> PVC_COR_ERR_MASK)) {
> > +			xe_gt_log_driver_error(gt,
> INTEL_GT_DRIVER_ERROR_INTERRUPT,
> > +					       "UNKNOWN CORRECTABLE
> error\n");
> > +			continue;
> > +		}
> >
> > -	if (unlikely(!errstat)) {
> > -		DRM_ERROR("ERR_STAT_GT_REG_%s blank!\n",
> hw_err_str);
> > -		return;
> > +	switch (errbit) {
> > +	case L3_SNG_COR_ERR:
> > +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_L3_SNG]++;
> > +		xe_gt_hw_err(gt, "L3 SINGLE CORRECTABLE error\n");
> > +		break;
> > +	case GUC_COR_ERR:
> > +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_GUC]++;
> > +		xe_gt_hw_err(gt, "SINGLE BIT GUC SRAM CORRECTABLE
> error\n");
> > +		break;
> > +	case SAMPLER_COR_ERR:
> > +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_SAMPLER]++;
> > +		xe_gt_hw_err(gt, "SINGLE BIT SAMPLER CORRECTABLE
> error\n");
> > +		break;
> > +	case SLM_COR_ERR:
> > +		cnt =3D xe_mmio_read32(gt,
> SLM_ECC_ERROR_CNTR(HARDWARE_ERROR_CORRECTABLE).reg);
> > +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_SLM] =3D cnt;
> > +		xe_gt_hw_err(gt, "%u SINGLE BIT SLM CORRECTABLE
> error\n", cnt);
> > +		break;
> > +	case EU_IC_COR_ERR:
> > +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_EU_IC]++;
> > +		xe_gt_hw_err(gt, "SINGLE BIT EU IC CORRECTABLE error\n");
> > +		break;
> > +	case EU_GRF_COR_ERR:
> > +		gt->errors.hw[INTEL_GT_HW_ERROR_COR_EU_GRF]++;
> > +		xe_gt_hw_err(gt, "SINGLE BIT EU GRF CORRECTABLE
> error\n");
> > +		break;
> > +	default:
> > +		xe_gt_log_driver_error(gt,
> INTEL_GT_DRIVER_ERROR_INTERRUPT, "UNKNOWN CORRECTABLE error\n");
> > +		break;
> > +	}
> >  	}
> > +}
> >
> > -	/*
> > -	 * TODO: The GT Non Fatal Error Status Register
> > -	 * only has reserved bitfields defined.
> > -	 * Remove once there is something to service.
> > -	 */
> > -	if (hw_err =3D=3D HARDWARE_ERROR_NONFATAL) {
> > -		DRM_ERROR("detected Non-Fatal error\n");
> > -		xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg,
> errstat);
> > +static void xe_gt_fatal_hw_error_stats_update(struct xe_gt *gt,
> > +unsigned long errstat) {
> > +	u32 errbit, cnt;
> > +
> > +	if (!errstat && HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
> >  		return;
> > +
> > +	for_each_set_bit(errbit, &errstat, GT_HW_ERROR_MAX_ERR_BITS) {
> > +		if (gt->xe->info.platform =3D=3D XE_PVC && !(REG_BIT(errbit) &
> PVC_FAT_ERR_MASK)) {
> > +			xe_gt_log_driver_error(gt,
> INTEL_GT_DRIVER_ERROR_INTERRUPT,
> > +					       "UNKNOWN FATAL error\n");
> > +			continue;
> > +		}
> > +
> > +	switch (errbit) {
> > +	case ARRAY_BIST_FAT_ERR:
> > +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_ARR_BIST]++;
> > +		xe_gt_hw_err(gt, "Array BIST FATAL error\n");
> > +		break;
> > +	case FPU_UNCORR_FAT_ERR:
> > +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_FPU]++;
> > +		xe_gt_hw_err(gt, "FPU FATAL error\n");
> > +		break;
> > +	case L3_DOUBLE_FAT_ERR:
> > +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_L3_DOUB]++;
> > +		xe_gt_hw_err(gt, "L3 Double FATAL error\n");
> > +		break;
> > +	case L3_ECC_CHK_FAT_ERR:
> > +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_L3_ECC_CHK]++;
> > +		xe_gt_hw_err(gt, "L3 ECC Checker FATAL error\n");
> > +		break;
> > +	case GUC_FAT_ERR:
> > +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_GUC]++;
> > +		xe_gt_hw_err(gt, "GUC SRAM FATAL error\n");
> > +		break;
> > +	case IDI_PAR_FAT_ERR:
> > +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_IDI_PAR]++;
> > +		xe_gt_hw_err(gt, "IDI PARITY FATAL error\n");
> > +		break;
> > +	case SQIDI_FAT_ERR:
> > +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SQIDI]++;
> > +		xe_gt_hw_err(gt, "SQIDI FATAL error\n");
> > +		break;
> > +	case SAMPLER_FAT_ERR:
> > +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SAMPLER]++;
> > +		xe_gt_hw_err(gt, "SAMPLER FATAL error\n");
> > +		break;
> > +	case SLM_FAT_ERR:
> > +		cnt =3D xe_mmio_read32(gt,
> SLM_ECC_ERROR_CNTR(HARDWARE_ERROR_FATAL).reg);
> > +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SLM] =3D cnt;
> > +		xe_gt_hw_err(gt, "%u SLM FATAL error\n", cnt);
> > +		break;
> > +	case EU_IC_FAT_ERR:
> > +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_EU_IC]++;
> > +		xe_gt_hw_err(gt, "EU IC FATAL error\n");
> > +		break;
> > +	case EU_GRF_FAT_ERR:
> > +		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_EU_GRF]++;
> > +		xe_gt_hw_err(gt, "EU GRF FATAL error\n");
> > +		break;
> > +	default:
> > +		xe_gt_log_driver_error(gt,
> INTEL_GT_DRIVER_ERROR_INTERRUPT,
> > +				       "UNKNOWN FATAL error\n");
> > +		break;
> > +	}
> >  	}
> > +}
> >
> > -	/*
> > -	 * TODO: The remaining GT errors don't have a
> > -	 * need for targeted logging at the moment. We
> > -	 * still want to log detection of these errors, but
> > -	 * let's aggregate them until someone has a need for them.
> > -	 */
> > -	if (errstat & other_errors)
> > -		DRM_ERROR("detected hardware error(s) in
> ERR_STAT_GT_REG_%s: 0x%08x\n",
> > -			  hw_err_str, errstat & other_errors);
> > +static void
> > +xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error
> > +hw_err) {
> > +	const char *hw_err_str =3D hardware_error_type_to_str(hw_err);
> > +	unsigned long errstat;
> > +
> > +	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
> >
> > -	xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg, errstat);
> > +	if (!HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
> > +		errstat =3D xe_mmio_read32(gt,
> ERR_STAT_GT_REG(hw_err).reg);
> > +		if (unlikely(!errstat)) {
> > +			xe_gt_log_driver_error(gt,
> INTEL_GT_DRIVER_ERROR_INTERRUPT,
> > +					       "ERR_STAT_GT_REG_%s
> blank!\n", hw_err_str);
> > +			return;
> > +		}
> > +	}
> > +
> > +	switch (hw_err) {
> > +	case HARDWARE_ERROR_CORRECTABLE:
> > +		if (HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
> > +			bool error =3D false;
> > +			int i;
> > +
> > +			errstat =3D 0;
> > +			for (i =3D 0; i < ERR_STAT_GT_COR_VCTR_LEN; i++) {
> > +				u32 err_type =3D
> ERR_STAT_GT_COR_VCTR_LEN;
> > +				unsigned long vctr;
> > +				const char *name;
> > +
> > +				vctr =3D xe_mmio_read32(gt,
> ERR_STAT_GT_COR_VCTR_REG(i).reg);
> > +				if (!vctr)
> > +					continue;
> > +
> > +				switch (i) {
> > +				case ERR_STAT_GT_VCTR0:
> > +				case ERR_STAT_GT_VCTR1:
> > +					err_type =3D
> INTEL_GT_HW_ERROR_COR_SUBSLICE;
> > +					gt->errors.hw[err_type] +=3D
> hweight32(vctr);
> > +					name =3D "SUBSLICE";
> > +
> > +					/* Avoid second read/write to error
> status register*/
> > +					if (errstat)
> > +						break;
> > +
> > +					errstat =3D xe_mmio_read32(gt,
> ERR_STAT_GT_REG(hw_err).reg);
> > +					xe_gt_hw_err(gt,
> "ERR_STAT_GT_CORRECTABLE:0x%08lx\n",
> > +						     errstat);
> > +
> 	xe_gt_correctable_hw_error_stats_update(gt, errstat);
> > +					if (errstat)
> > +						xe_mmio_write32(gt,
> ERR_STAT_GT_REG(hw_err).reg,
> > +								errstat);
> > +					break;
> > +
> > +				case ERR_STAT_GT_VCTR2:
> > +				case ERR_STAT_GT_VCTR3:
> > +					err_type =3D
> INTEL_GT_HW_ERROR_COR_L3BANK;
> > +					gt->errors.hw[err_type] +=3D
> hweight32(vctr);
> > +					name =3D "L3 BANK";
> > +					break;
> > +				default:
> > +					name =3D "UNKNOWN";
> > +					break;
> > +				}
> > +				xe_mmio_write32(gt,
> ERR_STAT_GT_COR_VCTR_REG(i).reg, vctr);
> > +				xe_gt_hw_err(gt, "%s CORRECTABLE error,
> ERR_VECT_GT_CORRECTABLE_%d:0x%08lx\n",
> > +					     name, i, vctr);
> > +				error =3D true;
> > +			}
> > +
> > +			if (!error)
> > +				xe_gt_hw_err(gt, "UNKNOWN CORRECTABLE
> error\n");
> > +		} else {
> > +			xe_gt_correctable_hw_error_stats_update(gt,
> errstat);
> > +			xe_gt_hw_err(gt,
> "ERR_STAT_GT_CORRECTABLE:0x%08lx\n", errstat);
> > +		}
> > +		break;
> > +	case HARDWARE_ERROR_NONFATAL:
> > +	      /*
> > +	       * TODO: The GT Non Fatal Error Status Register
> > +	       * only has reserved bitfields defined.
> > +	       * Remove once there is something to service.
> > +	       */
> > +		drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "detected
> Non-Fatal error\n");
> > +		break;
> > +	case HARDWARE_ERROR_FATAL:
> > +		if (HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
> > +			bool error =3D false;
> > +			int i;
> > +
> > +			errstat =3D 0;
> > +			for (i =3D 0; i < ERR_STAT_GT_FATAL_VCTR_LEN; i++) {
> > +				u32 err_type =3D
> ERR_STAT_GT_FATAL_VCTR_LEN;
> > +				unsigned long vctr;
> > +				const char *name;
> > +
> > +				vctr =3D xe_mmio_read32(gt,
> ERR_STAT_GT_FATAL_VCTR_REG(i).reg);
> > +				if (!vctr)
> > +					continue;
> > +
> > +				/* i represents the vector register index */
> > +				switch (i) {
> > +				case ERR_STAT_GT_VCTR0:
> > +				case ERR_STAT_GT_VCTR1:
> > +					err_type =3D
> INTEL_GT_HW_ERROR_FAT_SUBSLICE;
> > +					gt->errors.hw[err_type] +=3D
> hweight32(vctr);
> > +					name =3D "SUBSLICE";
> > +
> > +					/*Avoid second read/write to error
> status register.*/
> > +					if (errstat)
> > +						break;
> > +
> > +					errstat =3D xe_mmio_read32(gt,
> ERR_STAT_GT_REG(hw_err).reg);
> > +					xe_gt_hw_err(gt,
> "ERR_STAT_GT_FATAL:0x%08lx\n", errstat);
> > +
> 	xe_gt_fatal_hw_error_stats_update(gt, errstat);
> > +					if (errstat)
> > +						xe_mmio_write32(gt,
> ERR_STAT_GT_REG(hw_err).reg,
> > +								errstat);
> > +					break;
> > +
> > +				case ERR_STAT_GT_VCTR2:
> > +				case ERR_STAT_GT_VCTR3:
> > +					err_type =3D
> INTEL_GT_HW_ERROR_FAT_L3BANK;
> > +					gt->errors.hw[err_type] +=3D
> hweight32(vctr);
> > +					name =3D "L3 BANK";
> > +					break;
> > +				case ERR_STAT_GT_VCTR6:
> > +					gt-
> >errors.hw[INTEL_GT_HW_ERROR_FAT_TLB] +=3D hweight16(vctr);
> > +					name =3D "TLB";
> > +					break;
> > +				case ERR_STAT_GT_VCTR7:
> > +					gt-
> >errors.hw[INTEL_GT_HW_ERROR_FAT_L3_FABRIC] +=3D hweight8(vctr);
> > +					name =3D "L3 FABRIC";
> > +					break;
> > +				default:
> > +					name =3D "UNKNOWN";
> > +					break;
> > +				}
> > +				xe_mmio_write32(gt,
> ERR_STAT_GT_FATAL_VCTR_REG(i).reg, vctr);
> > +				xe_gt_hw_err(gt, "%s FATAL error,
> ERR_VECT_GT_FATAL_%d:0x%08lx\n",
> > +					     name, i, vctr);
> > +				error =3D true;
> > +			}
> > +			if (!error)
> > +				xe_gt_hw_err(gt, "UNKNOWN FATAL
> error\n");
> > +		} else {
> > +			xe_gt_fatal_hw_error_stats_update(gt, errstat);
> > +			xe_gt_hw_err(gt, "ERR_STAT_GT_FATAL:0x%08lx\n",
> errstat);
> > +		}
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	if (!HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
> > +		xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg,
> errstat);
> >  }
> >
> >  static void
> > @@ -409,7 +647,8 @@ xe_hw_error_source_handler(struct xe_gt *gt,
> const enum hardware_error hw_err)
> >  	spin_lock_irqsave(&gt_to_xe(gt)->irq.lock, flags);
> >  	errsrc =3D xe_mmio_read32(gt, DEV_ERR_STAT_REG(hw_err).reg);
> >  	if (unlikely(!errsrc)) {
> > -		DRM_ERROR("DEV_ERR_STAT_REG_%s blank!\n",
> hw_err_str);
> > +		xe_gt_log_driver_error(gt,
> INTEL_GT_DRIVER_ERROR_INTERRUPT,
> > +				       "DEV_ERR_STAT_REG_%s blank!\n",
> hw_err_str);
> >  		goto out_unlock;
> >  	}
> >
> > @@ -417,8 +656,9 @@ xe_hw_error_source_handler(struct xe_gt *gt,
> const enum hardware_error hw_err)
> >  		xe_gt_hw_error_handler(gt, hw_err);
> >
> >  	if (errsrc & ~DEV_ERR_STAT_GT_ERROR)
> > -		DRM_ERROR("non-GT hardware error(s) in
> DEV_ERR_STAT_REG_%s: 0x%08x\n",
> > -			  hw_err_str, errsrc & ~DEV_ERR_STAT_GT_ERROR);
> > +		xe_gt_log_driver_error(gt,
> INTEL_GT_DRIVER_ERROR_INTERRUPT,
> > +				       "non-GT hardware error(s) in
> DEV_ERR_STAT_REG_%s: 0x%08x\n",
> > +				       hw_err_str, errsrc &
> ~DEV_ERR_STAT_GT_ERROR);
> >
> >  	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err).reg, errsrc);
> >
> > @@ -634,12 +874,44 @@ static void irq_uninstall(struct drm_device *drm,
> void *arg)
> >  		pci_disable_msi(pdev);
> >  }
> >
> > +/**
> > + * process_hw_errors - checks for the occurrence of HW errors
> > + *
> > + * This checks for the HW Errors including FATAL error that might
> > + * have occurred in the previous boot of the driver which will
> > + * initiate PCIe FLR reset of the device and cause the
> > + * driver to reload.
>=20
> Is this saying that there's already been a PCIe FLR and you're trying to =
read
> the registers after that reset has happened?  The bspec indicates that th=
ese
> registers have 'DEV' style reset, so they wouldn't be able to preserve th=
eir
> values across a reset.
Registers preserve the value across reset.
BSPEC: 50875
>=20
> > + */
> > +static void process_hw_errors(struct xe_device *xe) {
> > +	struct xe_gt *gt0 =3D xe_device_get_gt(xe, 0);
> > +	u32 dev_pcieerr_status, master_ctl;
> > +	struct xe_gt *gt;
> > +	int i;
> > +
> > +	dev_pcieerr_status =3D xe_mmio_read32(gt0,
> DEV_PCIEERR_STATUS.reg);
> > +
> > +	for_each_gt(gt, xe, i) {
> > +		if (dev_pcieerr_status & DEV_PCIEERR_IS_FATAL(i))
> > +			xe_hw_error_source_handler(gt,
> HARDWARE_ERROR_FATAL);
> > +
> > +		master_ctl =3D xe_mmio_read32(gt,
> GEN11_GFX_MSTR_IRQ.reg);
> > +		xe_mmio_write32(gt, GEN11_GFX_MSTR_IRQ.reg,
> master_ctl);
> > +		xe_hw_error_irq_handler(gt, master_ctl);
> > +	}
> > +	if (dev_pcieerr_status)
> > +		xe_mmio_write32(gt, DEV_PCIEERR_STATUS.reg,
> dev_pcieerr_status); }
> > +
> >  int xe_irq_install(struct xe_device *xe)  {
> >  	int irq =3D to_pci_dev(xe->drm.dev)->irq;
> >  	irq_handler_t irq_handler;
> >  	int err;
> >
> > +	if (IS_DGFX(xe))
> > +		process_hw_errors(xe);
>=20
> Why is this conditional on DGFX?  From what I can see this also applies t=
o
> integrated platforms like MTL too.
From RAS perspective report of error is required on DGFX only.
sysman don't use these counters from IGFX
>=20
>=20
> Matt
>=20
> > +
> >  	irq_handler =3D xe_irq_handler(xe);
> >  	if (!irq_handler) {
> >  		drm_err(&xe->drm, "No supported interrupt handler"); diff --
> git
> > a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c index
> > 1844cff8fba8..69098194cef8 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -73,6 +73,7 @@ struct xe_device_desc {
> >  	bool has_range_tlb_invalidation;
> >  	bool has_asid;
> >  	bool has_link_copy_engine;
> > +	bool has_gt_error_vectors;
> >  };
> >
> >  __diag_push();
> > @@ -232,6 +233,7 @@ static const struct xe_device_desc pvc_desc =3D {
> >  	.supports_usm =3D true,
> >  	.has_asid =3D true,
> >  	.has_link_copy_engine =3D true,
> > +	.has_gt_error_vectors =3D true,
> >  };
> >
> >  #define MTL_MEDIA_ENGINES \
> > @@ -418,6 +420,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const
> struct pci_device_id *ent)
> >  	xe->info.vm_max_level =3D desc->vm_max_level;
> >  	xe->info.supports_usm =3D desc->supports_usm;
> >  	xe->info.has_asid =3D desc->has_asid;
> > +	xe->info.has_gt_error_vectors =3D desc->has_gt_error_vectors;
> >  	xe->info.has_flat_ccs =3D desc->has_flat_ccs;
> >  	xe->info.has_4tile =3D desc->has_4tile;
> >  	xe->info.has_range_tlb_invalidation =3D
> > desc->has_range_tlb_invalidation;
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
