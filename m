Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23FEE77188
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 16:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7083510E051;
	Fri, 20 Dec 2024 16:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZo7x4Ij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC4B10E051
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734711894; x=1766247894;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0rgNjAwpR2MbM/tdb10ufUL+YdPjk5tKWtkksb7JjYQ=;
 b=lZo7x4Ij5Qe7cwSwu6rhNe/yCjeNl7TjKkd3z4tW4pk+Lnfj6MWx215I
 E2xt5MvcoLOMd3nQnxOuSfpIDXknx5TPmdLjvZsdgm434hPPesB5GNXyn
 jdCLTvGYztrEaK0Hl4gj8c/1TIuwFA44rkRdkHhowJ9sxk53WFq5CPRho
 Gzq3lMr8+3JUfgGkiJ4ue8iFKqXpcbhCdReLtQzu3wXvzGEEORXrsEZvB
 kVKNkyWEfp96Tte6aWGJJPhuc23/tlGxfRAB1v6+UwaPfCkq8bztDIPp8
 Nzab5Udzh70H9xNXPqIawI2MJY6zsUhnJ9eapaQnQZZ/E2DIGkoDbmcgy A==;
X-CSE-ConnectionGUID: 40VskwVFTSugjvbulM2pcg==
X-CSE-MsgGUID: CoooSm4pSLKaXWUNyGmBOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35410236"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="35410236"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 08:24:53 -0800
X-CSE-ConnectionGUID: qbMjw1RhTVK5s1v20cNZwQ==
X-CSE-MsgGUID: iAkmn17yTtuSi0KwMDKYCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="129510156"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 08:24:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 08:24:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 08:24:52 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 08:24:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xovFvIzY4g325E627gAFVRdThLGnotNDd7iBPhhrfN7hYz2V2CDARoQDSE11OuKJccpM3jEIjiot3KN0toXjEmVJ+E8+OLouw5NFvpp46RqV2KQ4/Ra5ZJ46fMy61ZhNFYTuNyUek2mRMEPCdNPjXOz2eyjH7/ZDjKSyYj8ZjsqJoUIzdbuDYCL3/cZiA7vNh6uespD4XqeuSyKhAXHcoKS/evw4vecGoQWndC65yOKxSC8zOn7fJpysVD8NavtUz/cMZmaPZYLGzSzSF0tCQ6tLmKaSjc5dkdR38IXj7WjeADwY+98kHCUJewUVXXCJ15x4CN9fjxyxUW4Hp5WILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmLj83JsaKyMzcumsfbTSc4MouKKZ2LtmVNkcrV4I4Q=;
 b=P5ad+SIW9al17+LaqiYprNEJhM7x7Ob3W06E5YGgBYz0Sw/BgiTC7pRIloQJ3RRwCDpWDp8KNeBVskUfu7Cdns4ERBRwsTKRArPGTE8NwL/OmFjP737gOSw0qb7RGD0te1t2NzzLp5xlCeJjnuvZ/c0El5fCm+2WFDZEKDOiE6j+UaYjh+CdhSz5qapS1VVd51o3vSWZ5/ent9XSaN86+wJMYBHO5Udbjo9+gevNKFTqXEsMvC0UcLwJxfMeX6TFS24x9w32y+1akrfZ+vL1x2C6IaooR5jwHKhqMC5sHFM0UCOxvpYyeNgt0LDCaOpA+VHLhwuRU9LPTESHlR0XUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by DS7PR11MB6199.namprd11.prod.outlook.com (2603:10b6:8:99::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.17; Fri, 20 Dec 2024 16:24:46 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 16:24:46 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/2] drm/xe: Introduce GuC PC debugfs
Thread-Topic: [PATCH 1/2] drm/xe: Introduce GuC PC debugfs
Thread-Index: AQHbUvQl1LeomsU4R0SRpZkGwsP7vLLvT1Cw
Date: Fri, 20 Dec 2024 16:24:46 +0000
Message-ID: <BL1PR11MB54459B1949A962F122D5BCAEE5072@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20241220153010.623747-1-rodrigo.vivi@intel.com>
In-Reply-To: <20241220153010.623747-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|DS7PR11MB6199:EE_
x-ms-office365-filtering-correlation-id: 659510a8-1573-4ca5-c243-08dd2112d186
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?R4djQW/fPDyy1eKp27hKWbD57wpvjWz15gq8owmldzBulCL3GVba99Gtmblv?=
 =?us-ascii?Q?oOfTWtwb6nFojHrRcsnR6p28BTZlE7LM0OnEWNbFJB0ukR9a/4qSs/oOJUoH?=
 =?us-ascii?Q?QMF1graNkWFjnCcc/AJ/pSR+BOS7IJTdy7f87Jr6JZINx0KTQjbbiEg3+LXx?=
 =?us-ascii?Q?sf3y4yl5XBsdPmxsEKmgyn/ynfASNkPEHQUQQsoO1m5VoCVKm4lnhBzv7tA1?=
 =?us-ascii?Q?itOVQzMo3pHXUz6hu7DAXi3DXUimAEx/wiIH9nZtkzrCg/ovGgiFaskmlXBN?=
 =?us-ascii?Q?SZWwa8062rC0qDtp0AaXbAAZLI5BySuVSb/5FB0At6SKiO7NQJPUAWcA5CWE?=
 =?us-ascii?Q?u7WstXOUsikziw0kSqDKxKsDXFH1ggfKr5R97o17/WD+Davzbrzan7vWQH0o?=
 =?us-ascii?Q?20eXhxDWg7LGGuOIhRAWxRYBnbmDUebzQvsEP7aRKNPSCvZj5y26UgiLnxXV?=
 =?us-ascii?Q?d+HJvX3hwGrnminm6pNrq2Z2VZ544UaQHivszPujzAQZEv1nP8JRNAq0iHEw?=
 =?us-ascii?Q?8GoJhZkmnBauq/Em+D7izUuRDqXFXQ+feLzUCTpCWkHWWFwSshr9ggdMp8L+?=
 =?us-ascii?Q?wbCnqsg5YUcyYyF8zoPGuQUwK8ajjFEfdOVNE6PkzTOQOENSg//uTXN/gziV?=
 =?us-ascii?Q?Oa6qsuVV33Iy2VBZ9gHJ4m203SRJbICYYAP3fhJfeEiMEyEmTCNxl/CqxMXY?=
 =?us-ascii?Q?QEaLvTvAkyT+uUmP/Tig1rGK6woS5DxAxczpxRkoqIwAQyzwM0JfJbBDWTzq?=
 =?us-ascii?Q?ksxoJwXZq0DmyokEQ2oUUMqC0UCdIzxkAct1W1R30c2RxUaHAAyD18pUT5LI?=
 =?us-ascii?Q?97EbHqqnO2gGZYgFO1wo05fhMg8O9la/JFIag0u5a42R32eRNo3ujJcYf2OZ?=
 =?us-ascii?Q?UD8WyzBkzvko+vtCZshBpjXwv3Vm2O7me9JelUtrpD3WyFUUKCmMLFO0i51c?=
 =?us-ascii?Q?JoLA1Xo3/wknKKIddS+XD6xVWgqEMo3YjnTQnN29P/yO21pelDTLvL8hJFuk?=
 =?us-ascii?Q?cjc0QyIuCDWGaB4q4QsSf7tAvLrpdXqxZVqwby9hNrX69bfsYFkLYyfC5RI4?=
 =?us-ascii?Q?sDm63Zz9t40WT3/0rDbbKweCLZUTnbWVEaX/iDztKq5hbrrpBJgxWJpFaUuD?=
 =?us-ascii?Q?4rMunKaEpYO0MsmdpgPMpWLUSEQS9LRvrZaJcy82EJwE0vp5vGlktk22UPDE?=
 =?us-ascii?Q?tW+bbul6trQLXX8xyud6KKeSFZAxVf4pFU1byqWvhk4GUteVbW/daFfZtsNU?=
 =?us-ascii?Q?AiEpSPk77dkSzvM1zIcm5JgClv7h6bTahX1fLx1ONPVKfqG6CUIncqZJKXJg?=
 =?us-ascii?Q?ilXdYl2ZuUZ66KmT0xy221zt1DNTa5FllMR2/xYHtVh2L6DymxZ+1KHweqWQ?=
 =?us-ascii?Q?GBTZvloCnlphPOj/MyfKIAlYKQv5XkTi09EgGfIdbqFO7HUXKz6W4sS8cISO?=
 =?us-ascii?Q?QKirrhSgL5pX9D3FQrPfitmmsreDlzQT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lnI8x4loqvlirjd7W26lY4FA/2oYu93xCbs0LSJneS6/JbEExhtjYWPt6dyx?=
 =?us-ascii?Q?Wx6Ku9+pH2QtgFPFq9n37a0S71vlrCf3uyYQs3PAGq4YwJsCz7vXAJlQloO8?=
 =?us-ascii?Q?ngqFYDpjIMf6tJPOLL0wayu2DIBbUJTwxFCFwl0mrNLuuMFR0CL7u2Ud73Lo?=
 =?us-ascii?Q?8nk+YDpR/MOIhvA/D6er1DBbDkYvRJva7iFoXLYCcl097qwebPJJodLp30YB?=
 =?us-ascii?Q?THQJJSiqFKWv3k2ZFFiGMnTIbcWuJ1zXDuvoabVFXYYq/HgTHpJXkSI95IZ4?=
 =?us-ascii?Q?3PKqcYxGdiV86nRIXU1zXBOMX2au/8HyYLFemtH69seBRR9htuQYIuolj0qY?=
 =?us-ascii?Q?feQQ0quPVNzmeGsAV59ksLMhq4GoCBHRIlRlbo20kzxuvbx4bfAXo6mTo+Vn?=
 =?us-ascii?Q?685dXPlh7Czu4GJfJ53ZnUDCU0sRAs46LBf2UdL3p5tOz3vOAEnjGIeZnIaQ?=
 =?us-ascii?Q?yc3WZvL2T6JIO6IIvhZ4SQOUv2iUaOqrbWkHWjAHH1+zUNN+NldXZzR+56Ai?=
 =?us-ascii?Q?WA6QYwAQxfikXpM3p8kKP250jCpQJHCKAW4TLfKBpzxccRGOAbNJ7oNuckCO?=
 =?us-ascii?Q?Tc4ElVlpTHHhMZpymhrOcBvZZsuFICgVut98WnIxTs6bTWazFjk1WVxNI82U?=
 =?us-ascii?Q?NfFghgNROiE6J4e2dqS29YJrUENIS4ue2uJI3BSONyt9YhDrJraazv7jAsrt?=
 =?us-ascii?Q?p3YGXRSsT4daJMCrKsTP4525NOFIfOFGq2z1HWTt0zgIsqr0iaPczDWCo92X?=
 =?us-ascii?Q?I9bQV2/KTF1Il+FS1DWn1cMw8FohBFCOhv7cDGk9o7e31idXwRslr+XRqRXz?=
 =?us-ascii?Q?OnX8Ps3xizcEgDGzWTpuRMsDUhOI63ZMCEI5zyqyY90r378UFoXwKusu24uI?=
 =?us-ascii?Q?nDqP52NIhKwrHBMa2AgYlIOGfBHXsKIKnLaoZleM3udmOMcu13Vhlf5PmZNg?=
 =?us-ascii?Q?9VhwxYLPfRKR0ps8PmAld7tN8D/UMcQkc/IoF2BlgBKSx44covlvQqpr+D6c?=
 =?us-ascii?Q?/w65/Ys43jqFrrZJMQXjn3nvu+zWsGiBl/OH7ASiSDDMh232w3lbg/2IWrDT?=
 =?us-ascii?Q?VfBZVmuwOnjUiguCtrZptDhaT6ljiz+PyngiFsv82qSB4MoYECwxDDgw5S/2?=
 =?us-ascii?Q?qACuWhsc7ug9tQ9R62YuBeLv3CuBhBxigT+yX35euSzb5YCaFyMuwBQyrBt3?=
 =?us-ascii?Q?HSfey18WRQAAD84N2H1IbPETJ+bX2kSY2xT1iFXpJbHMl3yAi/UBdEbIgLcj?=
 =?us-ascii?Q?S8p+0BC6tEq2ewUXHHYpbyn5PoxrVtwGWJQsTHa58XbAx5Z2Z8VdkPl5jPQ1?=
 =?us-ascii?Q?/U7UaXZm04pW+m2pgToQyb0b5SX3VZ1LmlkskTjcRCtIknK+IzEcjrGGEQyI?=
 =?us-ascii?Q?rJXn8gWMjTS5JbJbAJw+lPvd21KoNXb8nYrdYuOmLsEhkp0SDXdKo39FHHfs?=
 =?us-ascii?Q?tjCHvkeSZK2x8zgbsj8qTy6WWgd94XbMvCmehL3Y34nEqGsa3SmK3544IGLV?=
 =?us-ascii?Q?ajfCw8vqS/8u36wdOhfemwRfyvWiY51J2VrQahNhPHikjtlWV1ba6l5UQMdi?=
 =?us-ascii?Q?GDQ4cZwASi9Nu7Fl5YNfcFrU7KcjoW1L7cde0sOp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 659510a8-1573-4ca5-c243-08dd2112d186
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 16:24:46.4237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qBd7yj8vsM8u7B4h7ixs9QQrByAgB/4JmcnIjMBCvuhCvgyS/nZwggnZvwkwexsFenN+XNCZAQ63inTf/nHZVnU0T8Z6QI7MtwBG+WcA3w8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6199
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrig=
o Vivi
Sent: Friday, December 20, 2024 7:30 AM
To: intel-xe@lists.freedesktop.org
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Belgaumkar, Vinay <vinay.belgau=
mkar@intel.com>
Subject: [PATCH 1/2] drm/xe: Introduce GuC PC debugfs
>=20
> Allows the visualization of the current GuC power conservation
> status and policies.
>=20
> v2: Fix DCC msg (Vinay)
>=20
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_debugfs.c | 15 +++++++
>  drivers/gpu/drm/xe/xe_guc_pc.c      | 67 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_pc.h      |  2 +
>  3 files changed, 84 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_=
guc_debugfs.c
> index 995b306aced7..0aff1d462bc0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> @@ -13,6 +13,7 @@
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_log.h"
> +#include "xe_guc_pc.h"
>  #include "xe_macros.h"
>  #include "xe_pm.h"
> =20
> @@ -60,10 +61,24 @@ static int guc_ctb(struct seq_file *m, void *data)
>  	return 0;
>  }
> =20
> +static int guc_pc(struct seq_file *m, void *data)
> +{
> +	struct xe_guc *guc =3D node_to_guc(m->private);
> +	struct xe_device *xe =3D guc_to_xe(guc);
> +	struct drm_printer p =3D drm_seq_file_printer(m);
> +
> +	xe_pm_runtime_get(xe);
> +	xe_guc_pc_print(&guc->pc, &p);
> +	xe_pm_runtime_put(xe);
> +
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] =3D {
>  	{"guc_info", guc_info, 0},
>  	{"guc_log", guc_log, 0},
>  	{"guc_ctb", guc_ctb, 0},
> +	{"guc_pc", guc_pc, 0},
>  };
> =20
>  void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_p=
c.c
> index e8b9faeaef64..9f9e0642c796 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -8,6 +8,7 @@
>  #include <linux/delay.h>
> =20
>  #include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
>  #include <generated/xe_wa_oob.h>
> =20
>  #include "abi/guc_actions_slpc_abi.h"
> @@ -1094,3 +1095,69 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
> =20
>  	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini_hw, pc);
>  }
> +
> +static const char *slpc_global_state_to_string(enum slpc_global_state st=
ate)

It looks like this function is being used as a helper function for pc_get_s=
tate_string.

There's nothing wrong with that, though pc_get_state_string is already ligh=
tweight
enough that we probably don't need this separation of responsibilities:

"""
static const char *pc_get_state_string(struct xe_guc_pc *pc)
{
	enum slpc_global_state state =3D slpc_shared_data_read(pc, header.global_s=
tate);

	switch (state) {
	case SLPC_GLOBAL_STATE_NOT_RUNNING:
		return "not running";
...
"""
It's just something to consider.  I won't block on it in either direction.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>


> +{
> +	switch (state) {
> +	case SLPC_GLOBAL_STATE_NOT_RUNNING:
> +		return "not running";
> +	case SLPC_GLOBAL_STATE_INITIALIZING:
> +		return "initializing";
> +	case SLPC_GLOBAL_STATE_RESETTING:
> +		return "resetting";
> +	case SLPC_GLOBAL_STATE_RUNNING:
> +		return "running";
> +	case SLPC_GLOBAL_STATE_SHUTTING_DOWN:
> +		return "shutting down";
> +	case SLPC_GLOBAL_STATE_ERROR:
> +		return "error";
> +	default:
> +		return "unknown";
> +	}
> +}
> +
> +static const char *pc_get_state_string(struct xe_guc_pc *pc)
> +{
> +	enum slpc_global_state state;
> +
> +	state =3D slpc_shared_data_read(pc, header.global_state);
> +	return slpc_global_state_to_string(state);
> +}
> +
> +/**
> + * xe_guc_pc_print - Print GuC's Power Conservation information for debu=
g
> + * @pc: Xe_GuC_PC instance
> + * @p: drm_printer
> + */
> +void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p)
> +{
> +	drm_printf(p, "SLPC Shared Data Header:\n");
> +	drm_printf(p, "\tSize: %x\n", slpc_shared_data_read(pc, header.size));
> +	drm_printf(p, "\tGlobal State: %s\n", pc_get_state_string(pc));
> +
> +	if (pc_action_query_task_state(pc))
> +		return;
> +
> +	drm_printf(p, "\nSLPC Tasks Status:\n");
> +	drm_printf(p, "\tGTPERF enabled: %s\n",
> +		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
> +			      SLPC_GTPERF_TASK_ENABLED));
> +	drm_printf(p, "\tDCC enabled: %s\n",
> +		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
> +			      SLPC_DCC_TASK_ENABLED));
> +	drm_printf(p, "\tDCC in use: %s\n",
> +		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
> +			      SLPC_IN_DCC));
> +	drm_printf(p, "\tBalancer enabled: %s\n",
> +		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
> +			      SLPC_BALANCER_ENABLED));
> +	drm_printf(p, "\tIBC enabled: %s\n",
> +		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
> +			      SLPC_IBC_TASK_ENABLED));
> +	drm_printf(p, "\tBalancer IA LMT enabled: %s\n",
> +		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
> +			      SLPC_BALANCER_IA_LMT_ENABLED));
> +	drm_printf(p, "\tBalancer IA LMT active: %s\n",
> +		   str_yes_no(slpc_shared_data_read(pc, task_state_data.status) &
> +			      SLPC_BALANCER_IA_LMT_ACTIVE));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_p=
c.h
> index efda432fadfc..e333eddafcef 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -10,6 +10,7 @@
> =20
>  struct xe_guc_pc;
>  enum slpc_gucrc_mode;
> +struct drm_printer;
> =20
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
>  int xe_guc_pc_start(struct xe_guc_pc *pc);
> @@ -17,6 +18,7 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc);
>  int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>  int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_=
mode mode);
>  int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
> +void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
> =20
>  u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
>  int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
> --=20
> 2.47.1
>=20
>=20
