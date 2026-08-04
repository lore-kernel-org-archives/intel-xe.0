Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E407C55184
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 15:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F0B10EAE8;
	Tue,  4 Aug 2026 15:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWZBh8rT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0851F10EAE8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 15:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785856944; x=1817392944;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gSUXniBlomjeMpTJ6k34cEflf65u1q1oGW5b6lHXUI4=;
 b=dWZBh8rTh5SWmb6nhACht7N0r69DPSsMeo2TsjpEILvoMgfsyL9sh3sv
 aQ2tPUg4ktG0m9rvwlK1byaMDFHKIlrLncBT/z9oqFkfosWIRjCrqbn0+
 P4uOT8mr0Y+7aTSnsat3Wndr6e6QkApjeR3HDrBQKwzlVvsUS2EOWs1Gw
 ZHEJp0EC8wW9QDmpxmz5Y1sCRyiIGDFlsryuIAVSVbT+50I66N8lAIe/f
 zer4ebeuAr5jBV+XKNAuRBlLBaRnosFgQDKWQns0YgLN7wXUj08/LyMOr
 Th/slMpveGLQutz3yhC1WSueeXd3hE2TSmweROcvBOzbyGKOwN9ARv14Y g==;
X-CSE-ConnectionGUID: he42daZbSw6hfRHdat6KKQ==
X-CSE-MsgGUID: AMgO5aoQTKiR+cE6Y09epQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="96770376"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="96770376"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 08:22:22 -0700
X-CSE-ConnectionGUID: j2ATLVLgTVmvakBgua6usQ==
X-CSE-MsgGUID: SBsYgDnqTxihLKkhDTMrmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="263526460"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 08:17:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 08:17:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 08:17:17 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 08:17:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tituQ+33gDEaouKQKtMGngnrEXDz4ag6ud3VJO8vNDWiWWM5mMadBWJO0eTeWesLG9iAGYlrc6jyfiS5mI3qy5tP8wrcYO9srrPnEbuDvSfiDyuf08UhyBI7G61/YcLsIHFKltUrUKVYJcxEp6odezB6W2xSf4f+igVGTCxRr4WQubAv2tq7EUgbcL2Qu/DSH3tcRWl0kAvjLCsvykYl6lLS0m0W/vdW6uz1X2gCchFEtrsoKJ1O9WXDfRRK/C/letrzbiO52vwcGwy3tcl2SopOGmAdDGFu1opuKjzrn7fq84rS1WJ34EVEaUc8ZUlmWXlYmYr+rpQMqT5+xazA+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MViAUxURea/58jBnU61SRYbZZJDN64bbaykzc4rJN0=;
 b=ItuowitYHaT4Pjf7/pEyxiM+8lZg2axcq19XrtTaFiaDLIOT+REjKkPpGS6tGOWNdGjYqNvZYv5eSg2EMhcp9hoeYpmm8UhRqo1QdAhPZ2SsXq2mddgLjcTHg9F9u+qEiP9okPfkAr/xeb0bMescrASJfwArJQhUQnkN+1DssAKdO6/DfO+U3R7bTkusqXktAVTUm/3On+4SyYsz+l6WCQqWGTqxZuUjtMxN/AizgUPlly8qLYrlJeOG4TTcnaUCs47dq3YEcak/RhGluTP7LT5mRRX0iNYzPeiyyZsxlNqGhTJh7tGq8oZSm7lKKxmzcyJ6rUJ/5lWaX/r2e3zXAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 PH8PR11MB8258.namprd11.prod.outlook.com (2603:10b6:510:1c1::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.15; Tue, 4 Aug 2026 15:17:15 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 15:17:15 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 2/3] drm/xe/display: drop redundant
 intel_hdcp_component_fini() call
Thread-Topic: [PATCH 2/3] drm/xe/display: drop redundant
 intel_hdcp_component_fini() call
Thread-Index: AQHdHqCAMApyU98osEW55r2aCKDeRraOCzgg
Date: Tue, 4 Aug 2026 15:17:15 +0000
Message-ID: <DM4PR11MB6360B136B27924F623AAE38DF4D42@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <cover.1785250188.git.jani.nikula@intel.com>
 <08355094a47cbf63f2092dae000780567636c967.1785250188.git.jani.nikula@intel.com>
In-Reply-To: <08355094a47cbf63f2092dae000780567636c967.1785250188.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|PH8PR11MB8258:EE_
x-ms-office365-filtering-correlation-id: 7e69ea0b-8e74-4ff0-82b6-08def23b7759
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|38070700021|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: R3SDTbdCehdqS+cwvJxGgQjdqV66OL+UaiyjbtvDeTE4O8tyaAwlZbpbtQaB7mPBFDHg1jUh9AWDvKqQXHjM7xXRRyVkpzacFp5+59uwL4M+jfioAEqNFNOfXKKCGaRPBjhBQQz+U+HS1jPiMEoVB1uQu/c8GMjg37vQhpQT6sSlgPEc9lTHSpu7ERaOfR0K5p6PPb6ABQGcNa3xkOd1gPrpycJLGgiURmaKEOtkGVcMVCco6Co0X7wbIlc5UiRXTqVM2OAiPg3v2zzkOKKPbc++oIIwdFRjVMTVO7xAoSNM5XLHOrbfD+Gp9LTCtXm4So+LsnSyc7q4j81Q5tmhpGIAHeao59qU+1ozjheuhqi/L0WVmmCRq/wdM5oDNem/wwcWdl5usJ1NYvpvx1Hw2WEalgRgz4E4beahLXD4A7UTRDsMxg0t33U5iAUwJtzpQ9GzBnPFuqLcohOy2AHz2PlgJ16XpwiAla2jUYip6fhqC5S1CZbdGrW0xIqI0XoYV3XBYpG5Gms7g4AYfNjbo6k6X4ON21/Ni8usQZOeUeAPHFeQ8/+p3ICFt/AcACcQurNHFdMUBcGDSEun49vIi3WJDMwC2IrsmQmTXo8ftP6RaQacYAz2hnMiVVDzVeSN10VuGB6AcxXKErLiRpVEbD1Cj19XbaktL07Xdo/o1D+RoYDgvnHiSO9xez+woDTkD3tjMptVCn9HXEXf6N4XoSZnRovl2yjXFERTgejEIaE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fQyVZ6VsE9zHDjnc1HtW9X5+fJmI7MtdykT7SonCNjJIP5KPaK2iU8/u/Kj/?=
 =?us-ascii?Q?kEAUL71i41G4VEgHTX08YP68H8zKrX1hHf98Ov65dzuNO36/5tW4hfgNQJt2?=
 =?us-ascii?Q?TvsabzZnuvWhJB0GFMPhzWI/WM5JywuhUxQOmT+EuUecc3Jvib4thHUXFhdf?=
 =?us-ascii?Q?TDxnqDJ4ZUaAKb4C4PGa+A5aYK7putt5656ijxRqJA8RqRsN2w+v+uHLqS/H?=
 =?us-ascii?Q?zKBJaRptSWz/jEujwui3Mvqs/W+S2M/Z/uxwWQXNk+Z7lKiJE6nm8PZx8Bu5?=
 =?us-ascii?Q?/Ccu8BXt53n6kb1L9YN2CHd/QLRpqAExnmFA2uwB00OmOuOaqowNz619aZfW?=
 =?us-ascii?Q?QiNo6CSSz5KB/yAMFoGWSNwhfMa1rVlh/WjfI9H0xese2/Ppd9ziSfmazz+U?=
 =?us-ascii?Q?qN0qIx1HP+V08PVvdUlXIpxMwr1goYoadWpJYVgsR1W0UE7jjeJr7fDncKye?=
 =?us-ascii?Q?1h1eB5ocLeTLW6CxFvL73pGU4HV4ZQchntMPJiqPXtLj1kC4JPMjXscbRNlX?=
 =?us-ascii?Q?vXL3oDVdpvT/PJZeZ8w/+Jbsro8AZKZ+7GUq0h1yfIMAAg5uVhJ0rt5F7l0V?=
 =?us-ascii?Q?s2WY6u7TMc6wXLj9vxTxPx0uPxS3Zq6Ne7ufUhNExgrOLXiCxGKGocsTZoQj?=
 =?us-ascii?Q?9jz43CPuLS9sU/14zs0n1Lw3TTZ87Tqv1Qrlg5+cRcqiTAdz2QUqzdftnlEC?=
 =?us-ascii?Q?yCII0zTAMHKPNC+9eCGTXGgRmxvNGY0tyn0JhysKI2A7AYdPZZkOu90ajgx3?=
 =?us-ascii?Q?Bdy2MOyzpq/HB6dchowc1UM/tzsST4Djb+GcVVKEGhpqfiOAAPozwcb4/FYc?=
 =?us-ascii?Q?2F86EJNAiG/aEYcE8g0I6FDKnaok+KTLDUD7QsQKKL59UfZAQXWBEa/XXf/u?=
 =?us-ascii?Q?Fcl59+IUC63XHWKE7gdSKYY9QUWbzC9ittCwFFHIBckc2BfC/QF8A0J+Hll6?=
 =?us-ascii?Q?LRDXiJ2dAlI/6lz+ZjAzLjeHSKbe73w4mBDTDmsefJRQxk2ObLJf1LSzGU6e?=
 =?us-ascii?Q?Og/xXCvA5vJA1MUCa2f3kjnNWGuXpLFl/1l4JpoMi4sGltlV3yWzf1pSwkzG?=
 =?us-ascii?Q?j4h/SKLnxUmpOl+CDdpOUVjQQ3tGfPgFqmDAo2XFl2U5whq2lWTTuTHsaZQD?=
 =?us-ascii?Q?0uRAeF061b63fGmRraRuv3c366WX/FIlaIcWwku4r8DJ3eNDT11v18L+NKiz?=
 =?us-ascii?Q?1MCE5UtrpvxWSFXWJNcgZg4zj+AlolRMA1IlXp6uXswmSbLuUBQYFvrcP7un?=
 =?us-ascii?Q?E77EIfbyRK3ukvlLjWlrf+1gNiSY+fOp/i+cMfTN17VwxTcxHZ3ko0Da/2K2?=
 =?us-ascii?Q?bAEPu1A8crOn1UD0jvionh1PCOCKmBK1vTPLownBdYZP6o8/9SxIG75M4Y9G?=
 =?us-ascii?Q?c7oK4xdcG+wY7RYh+qljLxI+XUmDXjwZbVWpqC1hCJEC/LRTYfIINyWa4pIq?=
 =?us-ascii?Q?l6p9178i3B0bFkVxE1Rk+4wR0C/iGByNBjI3X+b9NbAWytqit64SzmjmckeT?=
 =?us-ascii?Q?CbvqqKyA1k44aWl+s9gzpjUMzBf8SKkSCoCcfQqpXFFpHYmGiHe6JXwmDOYz?=
 =?us-ascii?Q?r7unKjEJoxjM+2W0/6eGfPjQo5PQswDXrINKsIhq3fDO7jbdciN1KGt5aR0W?=
 =?us-ascii?Q?QXAfOLgFfPe94snO8qonD1PjlLxVcBb1gdtDbcl0Dj2+ciLceR52C0oxGGDU?=
 =?us-ascii?Q?qasa62BLh+T4Pej0tIvTWFd37TLjGaJRnbTXp1+ogZF4JbndXN+FlD4TukfU?=
 =?us-ascii?Q?FNZSwtbQEw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NA5GgwB2Nz4IxAphyXXSy+KVt6/dgrAA6GnXoyITVY5mtxUKvQ3+9n4BBQ8ZnS9cHHAL+4Jo6EZqN75s7SjUIDBXcHQOjW0MFl7wNayBJYFNaAwt1vrAxUy8uETgSW7SkYolK+D4+7c6fPi0PysGhZ4XyFitB8l/zZgX+FL7Le+dSKFaEud82vbK0Ebv65Jr8gLGcMFkUiK8QhD1ZcpP0txXcRk0CYnS8TVRTqbOPzF3726+Q6F5e2LHILetE90pAW1hs+mKCkDl0jPdNwqRF75NQK5r1lqByJGIypXZ1GmyPMMiCR4VUlMuuSzPAGr2EnNsW1uboGls8Si1GwWBNw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e69ea0b-8e74-4ff0-82b6-08def23b7759
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 15:17:15.2031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WN+85k6p5GjcILWeFiCjjoxyeTSXSQGA/JBN/AxZubqMBmOvDGZ8VfzddD+jlQfcI0kpwYS+rXMpUSViiELm1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8258
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Jani=
 Nikula
> Sent: Tuesday, July 28, 2026 8:20 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Nikula, Jani <jani.nikula@intel.com>
> Subject: [PATCH 2/3] drm/xe/display: drop redundant intel_hdcp_component_=
fini()
> call
>=20
> intel_hdcp_component_fini() is already being called via
> xe_display_fini_early() -> intel_display_driver_remove_noirq(). Remove th=
e
> redundant call.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c
> b/drivers/gpu/drm/xe/display/xe_display.c
> index 57088e24aba2..2fc12592627c 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -29,7 +29,6 @@
>  #include "intel_dmc_wl.h"
>  #include "intel_dp.h"
>  #include "intel_fbdev.h"
> -#include "intel_hdcp.h"
>  #include "intel_hotplug.h"
>  #include "intel_opregion.h"
>  #include "skl_watermark.h"
> @@ -129,7 +128,6 @@ static void xe_display_fini(void *arg)
>  	struct xe_device *xe =3D arg;
>  	struct intel_display *display =3D xe->display;
>=20
> -	intel_hdcp_component_fini(display);
>  	intel_audio_deinit(display);
>  	intel_display_driver_remove(display);
>  }
> --
> 2.47.3

