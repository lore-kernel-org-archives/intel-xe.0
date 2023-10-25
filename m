Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9CCC25B6B
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 10:31:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211EE10E630;
	Wed, 25 Oct 2023 10:31:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA3510E62F
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 10:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698229889; x=1729765889;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qMKwVvZQsQmqroDe0C5MQy7roMAKg1ymeWrcDeBtPAU=;
 b=mIb93MYoDeiL0BCA1wUnryQ6MaWwTFoFjRKtwYlI3JG+FedOMyPKKAuk
 iYyumkzCqPF8bhcUCKDCcRdMMi4FxzyUd0k5m0/9Q8RrkGyy1RTId86R/
 sUfL/iyKLmRtz6IaOPiAaHrMX5SHH2+SmRyjCKCeV5yN4vBYJgzaWp2nu
 x3C5GfwJQ5UpFK1xh+wn8p60G34HsHlzb/nOvOkza5suxH3j+6pQyZIwv
 ZtoxOzhsMaRDixZ2atNl8lbxPq9FODZ2uAh8GLpjemb+bL4TrMICRNfQ0
 tJ7yaUUCiGlS33OxurRKTP0W1Acp83mmc0sWUVlu/LDvpIrfPgd/saM2n w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="5893510"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="5893510"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 03:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="793802200"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="793802200"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 03:31:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 03:31:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 25 Oct 2023 03:31:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 25 Oct 2023 03:31:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 03:31:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2cdBvJzpznDF0sizADyxm0AKC0InWTVfo6OL7F9THYpWhW3DeNNGNlW7SvKaEEJKMd5v6OfgdafGASDeTIzJ3JLq5QHwNqkZpaeuEZexUTjKWg3ANZMSOn9yyVAFHiI+hzctPYYrNppMlpxh5MpTthc3QutcUGxEJrRT5jTyIrKff7b4jjwv9GBudLgPMeEUpnkGbFdlIneV9lGeavNwHokiScVW+f6ThuHw8MxT+opZP/iaV5U7Xe5T07Nj+XJk5isO6DbBlNGyQ1/JUbXW91LP8Zscj6BjyCkQVN+e9vqFEZKduw18dyCjCqr3dAGhH3e6ib6J4VTQwNmOrZemg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXYYu7C48+BWNznJErrck3m7IDNlTk7khAyXZfBEqiE=;
 b=ev7vPsRh2GxrAAKLm7/saEAVQEjJR1XPqSCyHkh+YIPlQmBZQUHuWYeGgqj+GclviN2zRzPU8Nv0aymOvk/jYNGsV99PT7X+SI4E9fq3sGlCk0bZhVhY7ts0iIM10JJryj0Z5jQO8puy8ukzw+CJ8qRF4UPLBQ6ZoEyMMBsF+bXeKdKBFkBgqJ6ZuX98MJRvkOkbj3Eo7QWbhrKrxTC7bRLN1Qohd6zC7Mt0ThJpOA0e05gOPokqWCIDpcgrG0sjiV9o0DW7LS1REKgZ2Y9jKv0lmxR2JoJ770kTM3KGT1ruV2LWr2IM1c+ADZJduwOfvN8S9lVmSYh8RozVSwTHMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CO1PR11MB5188.namprd11.prod.outlook.com (2603:10b6:303:95::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Wed, 25 Oct
 2023 10:31:19 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::94b:839a:3fa0:e539]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::94b:839a:3fa0:e539%3]) with mapi id 15.20.6907.025; Wed, 25 Oct 2023
 10:31:19 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Elbaz, Koby (Habana)" <kelbaz@habana.ai>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: move the lmem verification code into
 a separate function
Thread-Index: AQHaBxK80MCRsfmbrEKwSDbD3QO//bBaThGg
Date: Wed, 25 Oct 2023 10:31:19 +0000
Message-ID: <SJ1PR11MB62049A6217EC2ED8DC38960281DEA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20231025071252.168758-1-kelbaz@habana.ai>
In-Reply-To: <20231025071252.168758-1-kelbaz@habana.ai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CO1PR11MB5188:EE_
x-ms-office365-filtering-correlation-id: e2b54671-c34b-4df0-a7e9-08dbd54586ba
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E+YnlWX8KgWgkm91y6jVlJEHR3bJYchT0zCZC4WNVaUCqNTwayxuCoGQ2mJzVWzkpDEHvjLPcYrkl+GS50rsSiAfISlvEpw29Vh+5GjXvI9MGwflgVJdH12aE4VCHQ84LV9dqH2LcF3LSqVK/vDTBCoKYZaPPRrz3mIZCGvn3d3DB9dAiksi2K79Gdpmw7TaWZMAr2NT7vDwKh7Uz6mhxVLBh9Dkuile7NMfg1Fx/3/uAzUNAmrRG35eXi1bGn8jAmgX6qtgMQhklpuZC9D1LsepRVjT2qEJ1mOU0W2ZT2fxEFvB/q42CRnaSKRkuHIq0CSOOAG7GWyjSemjUEr9u3qBjsI9LY1Z50uBSbggF3FgA7/hURWeOMNlFHEyKmtHy69nJ0b9nmAO+GjzEpn9D7sXmUOEn7sv65/gVEL+Z0ERsa1Po3TwufupA+4vTVcdlHtL9dfLAyVDPHEkQt0FzpvIkfglMi3TpMbkIMmVJW6D+ca70a3i3Og3cIftF1kiXcIZZczcEM5FQ65ec/pFCNvF+VtZLGnLpxWdGjcz+DUyMksLKlojcVUxo0dl/+yWBSvJt8/BC+u0y3BKpo7OaXZa5JUXG76nv84KBI4o91BzkBMzwj+sGWc82/JzKTV/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(39860400002)(376002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(55016003)(54906003)(6506007)(316002)(7696005)(71200400001)(8676002)(53546011)(26005)(478600001)(52536014)(5660300002)(4326008)(2906002)(66556008)(110136005)(8936002)(41300700001)(15650500001)(86362001)(64756008)(38100700002)(66946007)(76116006)(66446008)(122000001)(66476007)(82960400001)(107886003)(9686003)(33656002)(83380400001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ebt1yWGAWUaMGmGOj8qRaONY9+nTootl1vzAsQT2Ivp4pMs5G4pKboYnwjmX?=
 =?us-ascii?Q?NpPr134zO7MrA83PUcL6EdJVXDuBvh+CeUap1nPbHnGwwTX9ePnOAW6rcCS2?=
 =?us-ascii?Q?Rwgh35WgU9GQ+cBSpAx7I2dMmZQ6ADBgE1i4Bvq83OD2rd8Yzbn1op+CRbvU?=
 =?us-ascii?Q?D3JjJ7uCnQJskMnZfvmuy5UO2PCU/WmUUzkj4Cb9qpgaBFPT9S6rLuOZByjM?=
 =?us-ascii?Q?Yv0hvzD2sKEdnUh+eyE+MfQ3VkMyBj1BdXPiQ28m2YoLwwnOSn3W60SY5Wtj?=
 =?us-ascii?Q?SeEqrMWdXsCLHSbmjCQ3c54SersSJons2rtgFnVpWxo76lpDWxbnASM31tD/?=
 =?us-ascii?Q?W8MpBte7D5gB0ScqQATe+uQVJxPjiuWxLuXAWCK+aHdNqWkoxhcQ9HFYnOot?=
 =?us-ascii?Q?dkzGRB8aLFUmj5/UatK5O6gJTDplL+XYYd43eykyuIDyR44iSUNpKchKnmOG?=
 =?us-ascii?Q?AApI/dSfsaaGAASyvao8tduiv452QHbu5JI5rfTM8e6U0qLkSg1zDAAQWQTL?=
 =?us-ascii?Q?5/jzPvCvWbRur1Z+Xr0BtBsOnD9zJFmxDzBocuaWPuRGay307JHkACeVyhZg?=
 =?us-ascii?Q?I1xfUYMvVJZLV0oti7Vf502JH7SClGVbqZNa9tEre/i7w/AIeN9Tt+MJKOkq?=
 =?us-ascii?Q?MZW5arqzXnjj2cctihOFlE4rB7Oj4TD1VloqMFFuvXfPUdVGKGNE2ql7pUOa?=
 =?us-ascii?Q?v6kgyXzKEiVwKz5aqS6b1Hb2141jDP8wyAfPLcCBISgkOxexdBV4rwXtDcRC?=
 =?us-ascii?Q?ZloxwwS+1GgF/FH5o0t66KPQ2l+cnD0HacZ4p19SuR/swBnhXRWl43v3EDzh?=
 =?us-ascii?Q?G4WyxR1I+rlTMramjbs0BGwCwgKOyMc30bMS6WtioeVn9xMOV2ulYQ/UPejF?=
 =?us-ascii?Q?kj4Oh+Vv801YYNh0srHkAbCZGMopu+tKGJLnsdoQNVMP40/bpzKLyaJVOzfj?=
 =?us-ascii?Q?i1xZvBEApZG8dUdmG5YK+uNfNq4HDxegoqIJ7W2Idu6yMFWm2qc+xX0xjVwK?=
 =?us-ascii?Q?O6T1gmBtlIhmQBYH1XR/UyIMa4QtH60lEbzPJ7w9PbeIURRZERBPird5GO8Z?=
 =?us-ascii?Q?V9Y9owB67lbT5asgl5Ha1gRHa50RwWkNfLtMDqYweZcrkFmRO/hzSF1Mbm2h?=
 =?us-ascii?Q?mHtj6s+ZdIHfgTI+kARS+BGbYBAsVYKijN4CBQ7N9yuq65MVgoSUv7YScLio?=
 =?us-ascii?Q?bU1N1DWX+7y3k5jIKyw1gxEjncSOLCtnsnC50UlW3noG0XGrFi0u6k2/i3Dx?=
 =?us-ascii?Q?RNEJmTsCyLzwwBEStj7fhVKJAxVfmsnLQA/IhCKPNrKFas7Ejgxr1WJRqyJ9?=
 =?us-ascii?Q?WCJCLVqS5GcVfy6/Cyc4WjW0z7Y8bG1vcdRmL4OAd7XjpNcwMg8O3Nj8cQYH?=
 =?us-ascii?Q?r+G2bjd2apd2fLo9IqCK6quX/+2dXY4+1fTqtjEJZVHEFvKladJK3sdPaatJ?=
 =?us-ascii?Q?yMsy/mIaHIu+y3mspLx5WEASK70by4FETNqIJitLYvbfv1Yp96GusKWjvayc?=
 =?us-ascii?Q?c9kivORpxi/FeZuFDgp/UqDfBbUC2IQuR8o48aXpDFOSlJwg8WndOLlXrsPK?=
 =?us-ascii?Q?YNjw5/Y9IOce1uBJnOBwdCdQq00nav7+Geykjycg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b54671-c34b-4df0-a7e9-08dbd54586ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 10:31:19.2531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xhaxX4q/ViMkt+tINHfDTegUj7pxJIz+KRHckRJj0iAkFZX5jXb8gKttW+lL4B8wh7gpjrsNX/G4qs/s9LIEi8bnXQyQFacFI/nc2okSfcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5188
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: move the lmem verification code into
 a separate function
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
Cc: "obitton@intel.com" <obitton@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Koby
> Elbaz
> Sent: Wednesday, October 25, 2023 12:43 PM
> To: intel-xe@lists.freedesktop.org
> Cc: obitton@intel.com; De Marchi, Lucas <lucas.demarchi@intel.com>
> Subject: [Intel-xe] [PATCH] drm/xe: move the lmem verification code into =
a
> separate function
>=20
> If lmem (VRAM) is not fully initialized, the punit will power down the GT=
,
> which will prevent register access from the driver side.
> That code moved into a corresponding function (xe_verify_lmem_ready) to
> make the code clearer.
>=20
> Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 33 ++++++++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 0da4f75c07bf..d10230bd0c1a 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -381,10 +381,27 @@ static void mmio_fini(struct drm_device *drm, void
> *arg)
>  		iounmap(xe->mem.vram.mapping);
>  }
>=20
> +static int xe_verify_lmem_ready(struct xe_device *xe) {
> +	struct xe_gt *gt =3D xe_root_mmio_gt(xe);
> +
> +	/*
> +	 * The boot firmware initializes local memory and assesses its health.
> +	 * If memory training fails, the punit will have been instructed to
> +	 * keep the GT powered down; we won't be able to communicate
> with it
> +	 * and we should not continue with driver initialization.
> +	 */
> +	if (IS_DGFX(xe) && !(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
> +		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
>  int xe_mmio_init(struct xe_device *xe)
>  {
>  	struct xe_tile *root_tile =3D xe_device_get_root_tile(xe);
> -	struct xe_gt *gt =3D xe_root_mmio_gt(xe);
>  	const int mmio_bar =3D 0;
>  	int err;
>=20
> @@ -409,16 +426,10 @@ int xe_mmio_init(struct xe_device *xe)
>  	root_tile->mmio.size =3D xe->mmio.size;
>  	root_tile->mmio.regs =3D xe->mmio.regs;
>=20
> -	/*
> -	 * The boot firmware initializes local memory and assesses its health.
> -	 * If memory training fails, the punit will have been instructed to
> -	 * keep the GT powered down; we won't be able to communicate
> with it
> -	 * and we should not continue with driver initialization.
> -	 */
> -	if (IS_DGFX(xe) && !(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
> -		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
> -		return -ENODEV;
> -	}

Does not look like required thing  as comment above if() already talking ab=
out condition check and action. But let other comment too.

Thanks,
Tejas
> +	/* lmem verification must be done before mmio-probing the other
> tiles */
> +	err =3D xe_verify_lmem_ready(xe);
> +	if (err)
> +		return err;
>=20
>  	err =3D xe_set_dma_info(xe);
>  	if (err)
> --
> 2.34.1

