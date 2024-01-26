Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1A8C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 13:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD9310FA55;
	Fri, 26 Jan 2024 13:11:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F6210FA57
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 13:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706274710; x=1737810710;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eJznuGJj7jKMfWBbVdyqdOtQEdqyDbsIlVcmJfmrlSI=;
 b=WQb34WOVKCE6L1d0eYrxZK8B11SV33wADUunuPasc1my81DcjaNSdi+5
 KUyWY5m9D9dQDqy6nUaGCWs3FwuS46UXrUXGAfFnq/g6rGrcUgRabjVOt
 aMOdpA1sD6ELwll+/tddRpFM9aeVapSPo2wrVXoQBdpPi+mTGr44Y+8QO
 nhKRIgYC7+BHiAbzAM24PpDipU3z+QB9F3gemMlrKN2BwvZgVdfkfRxiB
 O0aXbMibb3j5bOrwQfUl2dOPKVa/XIuiuoR+NUjSe4KxfbKX1feEIlEzJ
 P702NcB2nlWCe7BhY8Ciwf1WeMRD4ehs9AY8jcMMX8mTyWg1g8+1uopyY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2349392"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2349392"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 05:11:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="35434336"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 05:11:49 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 05:11:48 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 05:11:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 05:11:47 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 05:11:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3hhlFj/4Pe9vUuKJAmEnLx14D26BNvOcLVP874G7AdVGjCiX7esd4+RX5n01eLobektuSg5qyNRXN5DC450Ur0SgMbjKPlTdMA61m0xOMDLkVT2g9ikT2gSpVVI12UH/Tv6IfpYJ5PUr1YAU7RVAFAp428TgGGi74WGFtEkQDOKWMBssFzawuEFUrBzc6ts1CDhfQBA19GzQoNBWY6UGTEtO3ttP9K2prap8hYYMiEuexdGpnKc8+DozHfv4l+Gxwud++c3gjZEuQ683USLer0PU9FaYFrnqPNTro/fwwnuJnrVXe4Kss00TlckZTBxX40dqDzsgGaJEhW/R93hHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhLnSGp2xGwc5EcpXzgrAqMkUMikCZVnxL7uDdrpueM=;
 b=G8+1VwGo4+RU8MScsAmPZIDpDvr85gAU9mnTdQwErm+rF6kn2c1N1Z4RrJGGskoT4ZxDLinK+NZrXNHvE7iUuvuxZnLJFJk63+5G57E3BNfE2LXcL3D7YqfMd7GDDJWwik1HA47I236oU6CcbnaYHPnv4vQrazJAzLfqP2ScngKzhPZXGQVzopjb/IX5Itfu3as5vepdp3oynrU3wsl+bISq/MKLbuWDtHUAYgyzEAc3i8SeXn5go62HelR4QwXfgYJbKz6FlstXbSODBJJao7slXh7M5MZ+pGVMIuTJULKJtWcN4ekxl/pb5KaaUJI+D9YgD0HMUTcEHD7CXlibnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH0PR11MB7167.namprd11.prod.outlook.com (2603:10b6:510:1e9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Fri, 26 Jan
 2024 13:11:38 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7228.023; Fri, 26 Jan 2024
 13:11:37 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe/hwmon: Refactor xe hwmon
Thread-Topic: [PATCH] drm/xe/hwmon: Refactor xe hwmon
Thread-Index: AQHaUCrp3xuCsFtlGEqlWVAtWoMQ9bDsEXuw
Date: Fri, 26 Jan 2024 13:11:37 +0000
Message-ID: <CY5PR11MB6211B12B8D0CB3D723E23B2F95792@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240126074819.3851075-1-karthik.poosa@intel.com>
In-Reply-To: <20240126074819.3851075-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: matthew.d.roper@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH0PR11MB7167:EE_
x-ms-office365-filtering-correlation-id: 32ab936e-ce2a-4309-ed48-08dc1e705450
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X55+beBxyQorE9z2waqu+5am2QhAOjeInJOXErmPq5EuB3BTDOfgEH4uGfyPg/P4Azxmi04b39oOaaW0IEeTxng1GdkKFHXvUAubfsc8gMomzQ+vh/MxhvI5w1me5l6s6uzj+72Pk3/6mcf+9RKu5XEuRy6e/G+iQz9VQJDGlGDNNWqGRywkVGs72Fl2EA04/eVbQAWgoinoRKonwbd8ixldvafYYRCic9U9x9qFzes3mz3JgjXOCnN27yCT57mGMZSAcn5nTdvDGyFNhwjMuM3oOPTmyjAvdCnT57vURatLx+lReTq1EznEQrKTfucb3BiIJ5stUiRisyvRSgRFPOzgv4eII3XCPYv3/rqp3OWF3x0nEdgPV6VL0OcYor8GiJ1ZAU0mVXFNxRPivvlM9sbYye6rJwwiR/OQFW/MByCrDmzZ4mU9FXE5niKs9s1XCpCap6m0h9MACKPsKqOsVUZuSinYA5q74VqAyRVFFXpJ6g+HQjOB2LnYhb0p1JTSremgO6bWOjinOx4HcP5xjyillqO7yYKpfJlbyktCU+cmdhuGeVP3FPM0jA6tydJtYeE8/ET/oI3fN0GzsC+t90mpbTF8IDvhaG0rFWpTCD4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(55016003)(33656002)(316002)(53546011)(71200400001)(41300700001)(478600001)(4326008)(38070700009)(86362001)(82960400001)(5660300002)(66556008)(7696005)(26005)(52536014)(8936002)(9686003)(8676002)(64756008)(6506007)(83380400001)(6636002)(76116006)(66446008)(107886003)(110136005)(2906002)(66946007)(66476007)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7mu2/MMBZMBUeuZypH4nnxV5f4vl46/rlq+aedNWH/T1u5wEDCh421PhOaKj?=
 =?us-ascii?Q?UUHQZuNRHqlTUJdIahhs/6y1rHSfd3EojZnamE2fods2jGDzmO4fPdPraoy8?=
 =?us-ascii?Q?OQ9dCQnZqt4ZjsmPeA30DI6+51htnBCi9iZn2V7RDoOWz3xq2xVfSQLsmh7d?=
 =?us-ascii?Q?FvmRmHGibN6jLRwhc5S6h8B3l/yX1gEMprcMkh5kVZ7k03y9zo/KnltS4o3n?=
 =?us-ascii?Q?JvFRmUeFbuu4mq9mHsaIJS667GH6Aethx8KAA6t82ZMwxFZkyRDpFOsV9QwC?=
 =?us-ascii?Q?wMUJNMIGr6wV5BISva5/YvhTSbxI8xv+YaIdndOyzxAGC8vVPB1y4yYT9CP2?=
 =?us-ascii?Q?o9GcCxoFSkbvdkiT1zRyDFvou16lvn0hcRNdEtfIxS+9ZTBOrZ5XwI4eZdi9?=
 =?us-ascii?Q?VCqyKdnbWcyvgv2FEOVtq3Tv7oSEjjlU8iR/HPUQ+mtZZy6qqLWHOhFbNEEc?=
 =?us-ascii?Q?tBiGXhNdK6xnBn1AVOcGoF7tbZSUBDC0qny6boyqyUHTAZiWvlsYpacZI5WQ?=
 =?us-ascii?Q?n/qkiVWUWtQbyZj6iXQNaLtRydn6cAo0IkbBvav48GV/m6u1fnn8JCT9Vb9J?=
 =?us-ascii?Q?c9P+eEzHj7YFd04cvIQY4NWM0AAGhr3IjqeQWEgx8N1XnbCKHXML1iHw6NQx?=
 =?us-ascii?Q?StiKqVnkYRy21xckI+NdTowbMhIgbI6nDUAZbRJOJpcwEhVhA8qao0vMpXkJ?=
 =?us-ascii?Q?jRWxSweJcBLb7jBOKF9AkAaPGQlGOd5dMFg564vbn3sZx5howRp61QFxdC6S?=
 =?us-ascii?Q?d5iS7/ZqAqKwBofr+aXEyjabRPGtAdtyYY8aZGw9RkN6hEvw2o2meFhF3say?=
 =?us-ascii?Q?kaIcg62+tIjYJzZjSNyQplJTGpWSBUPQYihFyDadVFwbmo0H5mJREmhR+bLR?=
 =?us-ascii?Q?FtvdWlk+lEvGn142z0+YjHFWSp6BJkPLcvNVWTDZ4XOFBPg2lD/rCUHsqPlu?=
 =?us-ascii?Q?W2EOOwphRq+L+/ySccTOU/vPnQrjLnByuogqIhQ9Rg9yWcMLjOnvu5HDx6KY?=
 =?us-ascii?Q?JqLUX/wCGgrGlDIY2XrMyLIVS4JuYqBmRB4d/hRc6S4Z5DkwhAjjhrjA9uk3?=
 =?us-ascii?Q?wP1v+CkgSGJOUVqI8YhjdbWaTLK81Td0q3YPWPF0wtIdGzXDQdGdgJkT907C?=
 =?us-ascii?Q?65Dq3U9Ne9dbnuRD7WUlMIXcVWd8NsJvLCzUYnvfe2+ErOrtIMmYNuryFs8p?=
 =?us-ascii?Q?d87iIIwuMlN2MQtoTIeSyYsbVLWz2Paq3wzzBCuA7ogE+v5YTSQXPdVf1RQd?=
 =?us-ascii?Q?YkFUx4auQG96M5avdUpevsq2VecuZqyo+UgKQ8vt9zSKpFhNzPpCyNTfU2Bd?=
 =?us-ascii?Q?B7NsV5xPSC7V3jO0ehx0qXPrx/mRB/O6RsOUH6kmupwsH+fT1hPnfquKUdTc?=
 =?us-ascii?Q?//ZLsNKIWb2VbbCYbj/j+8lkFQw40AFQzqlL++tcEnniLuBgoBw+wx1oPIQq?=
 =?us-ascii?Q?HAWUDPY3M+0mnDUsXgfnSsJTzuEFfeUOPDuG1Czj8mSNy3sydewiRBmifxsX?=
 =?us-ascii?Q?5OwZr8h+HesNhJpNcc0gYaA3BCLnbti8LYCeORoCgU0NwSScBoLFpftxnFN9?=
 =?us-ascii?Q?WL+7qs3QvUj60O/fQcyVnBd4iKnvLPZd0ZmKnN6X?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ab936e-ce2a-4309-ed48-08dc1e705450
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2024 13:11:37.8925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zRCj/ABRFbp8gi78WrAGGvR/hHBRSMoo+Zlp1BFPs7Kb+wzisMqjCs8PzbQM1RNIDRHYtno2m3CdZwpzWQz9m9ifJA4N8RB7iINEk3Tkzi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7167
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Poosa, Karthik <karthik.poosa@intel.com>
> Sent: Friday, January 26, 2024 1:18 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>; Poosa, Karthik <karthik.poosa@intel.com>
> Subject: [PATCH] drm/xe/hwmon: Refactor xe hwmon
>=20
> Check latest platform first in xe_hwmon_get_reg.
> Move PVC registers to xe_mchbar_regs.h.
>=20
> Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  6 ------
>  drivers/gpu/drm/xe/regs/xe_mchbar_regs.h |  6 ++++++
>  drivers/gpu/drm/xe/xe_hwmon.c            | 24 ++++++++++++------------
>  3 files changed, 18 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index cd27480f6486..15ac2d284d48 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -490,10 +490,4 @@
>  #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
>  #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>=20
> -#define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
> -#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
> -#define PVC_GT0_PACKAGE_POWER_SKU_UNIT
> 	XE_REG(0x281068)
> -#define PVC_GT0_PLATFORM_ENERGY_STATUS
> 	XE_REG(0x28106c)
> -#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
> -
>  #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> index 519dd1067a19..97652b4297ff 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -41,4 +41,10 @@
>  #define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23,
> 22)
>  #define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21,
> 17)
>=20
> +#define PVC_GT0_PACKAGE_ENERGY_STATUS           XE_REG(0x281004)
> +#define PVC_GT0_PACKAGE_RAPL_LIMIT              XE_REG(0x281008)
> +#define PVC_GT0_PACKAGE_POWER_SKU_UNIT          XE_REG(0x281068)
> +#define PVC_GT0_PLATFORM_ENERGY_STATUS          XE_REG(0x28106c)
> +#define PVC_GT0_PACKAGE_POWER_SKU               XE_REG(0x281080)
Above are pcode specific register, IMO it is better to create a=20
regs/xe_pcode.h header.
@Roper, Matthew D what is your opinion here ?
Thanks,
Anshuman Gupta.
> +
>  #endif /* _XE_MCHBAR_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
> b/drivers/gpu/drm/xe/xe_hwmon.c index 89c6f7f84b5a..c19a0daf7fd7
> 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -77,32 +77,32 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon
> *hwmon, enum xe_hwmon_reg hwmon_reg)
>=20
>  	switch (hwmon_reg) {
>  	case REG_PKG_RAPL_LIMIT:
> -		if (xe->info.platform =3D=3D XE_DG2)
> -			reg =3D PCU_CR_PACKAGE_RAPL_LIMIT;
> -		else if (xe->info.platform =3D=3D XE_PVC)
> +		if (xe->info.platform =3D=3D XE_PVC)
>  			reg =3D PVC_GT0_PACKAGE_RAPL_LIMIT;
> +		else if (xe->info.platform =3D=3D XE_DG2)
> +			reg =3D PCU_CR_PACKAGE_RAPL_LIMIT;
>  		break;
>  	case REG_PKG_POWER_SKU:
> -		if (xe->info.platform =3D=3D XE_DG2)
> -			reg =3D PCU_CR_PACKAGE_POWER_SKU;
> -		else if (xe->info.platform =3D=3D XE_PVC)
> +		if (xe->info.platform =3D=3D XE_PVC)
>  			reg =3D PVC_GT0_PACKAGE_POWER_SKU;
> +		else if (xe->info.platform =3D=3D XE_DG2)
> +			reg =3D PCU_CR_PACKAGE_POWER_SKU;
>  		break;
>  	case REG_PKG_POWER_SKU_UNIT:
> -		if (xe->info.platform =3D=3D XE_DG2)
> -			reg =3D PCU_CR_PACKAGE_POWER_SKU_UNIT;
> -		else if (xe->info.platform =3D=3D XE_PVC)
> +		if (xe->info.platform =3D=3D XE_PVC)
>  			reg =3D PVC_GT0_PACKAGE_POWER_SKU_UNIT;
> +		else if (xe->info.platform =3D=3D XE_DG2)
> +			reg =3D PCU_CR_PACKAGE_POWER_SKU_UNIT;
>  		break;
>  	case REG_GT_PERF_STATUS:
>  		if (xe->info.platform =3D=3D XE_DG2)
>  			reg =3D GT_PERF_STATUS;
>  		break;
>  	case REG_PKG_ENERGY_STATUS:
> -		if (xe->info.platform =3D=3D XE_DG2)
> -			reg =3D PCU_CR_PACKAGE_ENERGY_STATUS;
> -		else if (xe->info.platform =3D=3D XE_PVC)
> +		if (xe->info.platform =3D=3D XE_PVC)
>  			reg =3D PVC_GT0_PLATFORM_ENERGY_STATUS;
> +		else if (xe->info.platform =3D=3D XE_DG2)
> +			reg =3D PCU_CR_PACKAGE_ENERGY_STATUS;
>  		break;
>  	default:
>  		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n",
> hwmon_reg);
> --
> 2.25.1

