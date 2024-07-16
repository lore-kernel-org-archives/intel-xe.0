Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9CDC3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 09:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C741810E618;
	Tue, 16 Jul 2024 09:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EgCyPFV5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC94710E618
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 09:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721123118; x=1752659118;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QfFBP6HxI3T2mx5nu3CCw3D8bpODvWgGGZljBRNU4U0=;
 b=EgCyPFV5hYG1QlMEuUtTkWyNxA55oFLWG83qpQGPvzA5lBZ82SBsDOba
 XAtSXaTzqo7vILWaGPrER6+wXcGKw5TaXh2psVTdbCRGW7DBAcO8p9onC
 6AN0dBhg+D0k9FmJ8yZ9FHS0mhbggm+RbRZXKo7Feq4M/nzpdUTIteUta
 RXaU17vu3uUleZVw+OT9inTIA2neLAeiacN+Nj9i0y4ngQynMG5qNja6t
 aBARTV2IWysEXqI9yTbhq6Qnv5TpiARVVWspGWSeVAi5O/KzQGVLEwM8M
 ZMzxxZ6AVopQE1yrecs9s1jYueUcYuA4F5Fi33cAmFNSEGAvk4UzOBO83 g==;
X-CSE-ConnectionGUID: kzSMtrTWSJaT5eN6BkGbzQ==
X-CSE-MsgGUID: pVMZfl3hS2GmXMlK1mbnUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18701623"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="18701623"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 02:45:16 -0700
X-CSE-ConnectionGUID: Y/P6TOrAQ1u2liD1Qhv+9g==
X-CSE-MsgGUID: bJzZrBRRQ3+aEldIRUe8/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="49874563"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 02:45:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 02:45:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 02:45:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 02:45:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZqXCm8ukeXJmVTDQ/wXK4ZcMYf9rRYduCWWO8xbvXZlFQduDNR6t/WFWwc9RYGlP1a/oMFCaqCgSKvOpTdNYCS8HxkwXsJgbsEwahmrKyhvQzbIRd1NB1TYyhaNiaACML75/DL8WvZN3dUGpqQ8HqrIySEcSE65Widb19c7HAKcbvJ9Tep4aETl9SyewdX19OYUClNm+bS9lzlrTaCOEe6exW6aEjsHFaDruQBLaccl6EEVrwKXahIBIJb89u/4pyJ1OCSl7rq1gVTmFsjJ6RyXD6KOP/sw/hdb0ianPy8m7wwQSJA7YrDBtQChLeRDVzgyHDleAoq+ac645zY/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j17byv1al+lyj3PpBJR4Ptk0D2M40Mw4/7a2TvGaR5A=;
 b=IqYhBq/YQ9Lbw++JbOXHpU+0iP4fPdEf7FUSbSKE09jLMuKqAFGTcDs0L5fe7GNkDcT252DVjdgnnVJn9VkrDbzdhua9hQy1M4DrBw4ts429V5O6ZtAZU2woUNPctRljf638PzvWWVK2AB53BzBX9rj9+qeoMEhe54LeRoHmN/uAfCL6hb4KrJO/oi2dV6rMF9HCIY7uHttEaGwCHOEuLydH+r8T8eU+kc+c06v8pKk4g0s3M/A5jh6Auqtv5i6OBBKcVTKVzKAUtVLfcOOYOQEFVPnUgLu7u5Ri050cldAyBd17xAHzTUJu8ZzoUo5xgaonBxToplSV9AbJ4ibU8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SN7PR11MB7640.namprd11.prod.outlook.com (2603:10b6:806:341::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 09:45:10 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 09:45:09 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe/xe2lpg: fixup! "drm/xe/xe2: Add Wa_15015404425"
Thread-Topic: [PATCH] drm/xe/xe2lpg: fixup! "drm/xe/xe2: Add Wa_15015404425"
Thread-Index: AQHa10Q1mgSWh3yfx0KGXN/owTPpw7H5GwIA
Date: Tue, 16 Jul 2024 09:45:09 +0000
Message-ID: <SJ1PR11MB62043A0F9098428D8A21532D81A22@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240716055235.3420111-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240716055235.3420111-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SN7PR11MB7640:EE_
x-ms-office365-filtering-correlation-id: 5a5ca9c0-273a-49f3-a042-08dca57bfb81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?4ORXXMAu8Rx66tAq4koqzh1gcTVUj5pd3XdyeTkxX8+jwqjgNAbIDXfPVhOk?=
 =?us-ascii?Q?b0LUxCjzGilgvhoB9dJhINd+WEdhBB+ky523FzCbzWrFVHQaJF86M8jGnsyv?=
 =?us-ascii?Q?1raNCz0h/vwVYWuK0UQh2VPaXyt3OJ3UNPDps5y45uYVPlXrWvwu8KLOV4Ij?=
 =?us-ascii?Q?plc/eKikKPeWQd8hrac9SPycD5ZlLHFj+1ueoHPFHpJEFPglZ7oOA6otAByH?=
 =?us-ascii?Q?i8Dz1J1LbctEhNdgPyJRa+zQeaDlZYalhlDWLfyLWTAFc6B/43T4IuqXMIOj?=
 =?us-ascii?Q?rL/tVXhgdmJ+OWWpu3k7Suy+zksf7MT5ttjStyDNBAW9MTz/RYzM5/5KJeD1?=
 =?us-ascii?Q?QGb923qi/kcJUZ3L0RgqDtoFr3sb4sQ/orFb+gWoyYl3hpL4/Q6b8t82ZdKE?=
 =?us-ascii?Q?fNV6Y4Ov7XlddCF5lAkAADnJ+RB/8dM47ljSAwmTus6MymXRelJA0BVok9Ra?=
 =?us-ascii?Q?oE6g6u5cV4KU1408ycV2L5Ddv5xWM7IH7sdj9+9BgiVZieF60XhRWBwzzRlN?=
 =?us-ascii?Q?eISwE9eAUlZ3ZH87yX9uhHqU8TP03r5cH5x4xEHJylBgWVQBWKflUvd8wFS7?=
 =?us-ascii?Q?cpfLK0+3dVQLofAiQ//z3X7FYyKw7KtSthck/k6BxoLg2TcBE5pcrfsm7pmE?=
 =?us-ascii?Q?OZHrk1ayMpKX/mnhPSEYeSGRH6h7s+Ibxin/dyofd2R1av7+9SLRVFPRMJQM?=
 =?us-ascii?Q?hJmqlT5tsGt2yx1woD75eVLQM9x1jewqJ+E81vsjrdH4KkDZumHaQSrg1+tg?=
 =?us-ascii?Q?iFqbeQfNclbq1eG3Heyf3BGWUy+aiCei8e37jkObLuX6yW/CAMYNKOCgdgq5?=
 =?us-ascii?Q?XiC2HW6BmdxGWFZPmpsssOVz6dtVWCkuATjXlrCkGvfA+9DLMgGpRuBQfPlb?=
 =?us-ascii?Q?tBG/5hST70Qq7I8FiD9hCytjMLEPej8yBTtw/iCWZ4LfJKn4KpNUIY9m8PRM?=
 =?us-ascii?Q?bTXJC3RIbOYdqNjMlEjO5AtXwBFe9bbU2AaJ97ksFDa3uFVFDJLC65RswIfk?=
 =?us-ascii?Q?Su48a1Axxlb6XF+yWDWuCMB1RIhBtSVSGY8Br0UUUykWc9nm/RBe24zMTqae?=
 =?us-ascii?Q?OQg0VkFVohnn28t8bAFjLVEE5CPMsIDCTXi8SEpXUhCJbkHKXuM/nd9YxP+i?=
 =?us-ascii?Q?Ftr9Cd6bxxlPyUfgc1Vqcr/qxn05qWHwMYx4oqRMDt5ag8zNO1I8G7VPb2Wz?=
 =?us-ascii?Q?1H4qP/L2SiucgT3tQdG66MGj7nGSqKYpC8pmwPMGtlf2rVSeLGXgKu3Ei8y+?=
 =?us-ascii?Q?m1ELh/L83eEfcLcxlagJMB0GDc/ch337xhhYbk48IJ9xgykJVeyRaxdtt5zU?=
 =?us-ascii?Q?m703lKGI5+TUX73SraRi2sCBj4ngwpwOcWIQpU1V/PeEq4cq1h2+d9XDYv4s?=
 =?us-ascii?Q?gnBp22nqLLvrtiPtvFuD2QvBBrSqrTYtNAw4+otLzyFDRUwicg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?X3TpAGliNMSilWahzqxYzaRkTCc7zxDlq+cr+o2f4SsSPMCgaoAAvs/98j7L?=
 =?us-ascii?Q?MPObdeUViRw/SZdg1yHEPUPgN7l/bZL5ZhjzgQ+98V2+q/cKHEhgF9ZGp9xo?=
 =?us-ascii?Q?j39TlnUiHhQN1a/1YQEg8IcYvKepelbwYvi7BhP6lsjSEAR2tJ6t/jpr21sf?=
 =?us-ascii?Q?wtofCodsZs+Ve8xC5XBMPXZ7/8BYP3LvM4hOJybQ2yT83hAmZ3hxFZx8+V9r?=
 =?us-ascii?Q?6riQJft89IqAoOATZZpanMyCq/ZK7dMuDEBkFOmDXxrYHKjOQEN7YZZLLII/?=
 =?us-ascii?Q?ldN4rAMPRPOgx+1fSyQ6LwXD16gSByvL2efSgdcT89C1b4CVTzO5EBnwAHRm?=
 =?us-ascii?Q?1Akv4Qp4i62lciL62oJ7sxRL+wz6IZUw59lAsjOVbkGiSdvC8ySyJcVFNw/I?=
 =?us-ascii?Q?5xwK+t2K7c3WQXQvTFX0kU6QqpuMYSSyYShqhjER6nYSoVuZt6tBmt1WQXKE?=
 =?us-ascii?Q?r2/ij003+TIYgKIkPtW30FiGT9DNpsKlH1xNZHS9tXnq7KiRFHkwPZy+ZUUS?=
 =?us-ascii?Q?boOX4tKcs2YBOUpPjNUX+W6EDBbJvziL8BuWJ4mWd2CNv7VEuHTXEzIMhc+k?=
 =?us-ascii?Q?G/ClRi2mDGOPrC2/iZNDowktznP0yTxH4P3QBGWVAEDiunqaCGx10J/ddZCs?=
 =?us-ascii?Q?qExICM4HZWni14be7UB5v90VV31Nk3od0gjzhgu6dnNSiXFz+dtU5OxaaSiA?=
 =?us-ascii?Q?2ZVzWxT2x9z5PGe3GXoXgvPCetBsEW1pLguKhVfZEpuUruIF5Q135NKKsQWY?=
 =?us-ascii?Q?llGhsGA56y0SQwZRrlf1ZVDYyHV6LSE4XLoPXQ06yHlkm1FgGinuu8tWxe8s?=
 =?us-ascii?Q?wIcug+Jl0lNsDyyrwrfAwf9mVDZ+3rF95zJKLupebL5h7yMjCG5xfXkZWKKx?=
 =?us-ascii?Q?cOsT1DEm8tcBZEJiPLpWCJNjsAF8j2K4elH2pZlWe72JIsE7yjZt+R75CgG9?=
 =?us-ascii?Q?bE+cSfbKzioP3fFSsdFc4vQTK/FOXML8h4z1R9Fy8DpN53cnufvHAtNWKHBN?=
 =?us-ascii?Q?671NQQI22NrI3g+SJr6POqCMErRrQDKj4o5YqRbQAjkL/IRAofHG1G2cFywN?=
 =?us-ascii?Q?oeKPGBcM5MXi81UuQ6AcH4BceyuIafQPpB17nK/B/UBFsdHnx9ljU1ujNsXA?=
 =?us-ascii?Q?P749hD0Jl8Mdi/lB/AI5vS7brWrEk6pwgXNKJWPHSPxnshkWecD8KzYC8NHp?=
 =?us-ascii?Q?etOKs+f0TamNUAkwhh2Y/8KdjoUe83RCKsdc0HKXH5cW91bA9Zlv+GUR9625?=
 =?us-ascii?Q?BzG3avOeIr/YtRnYmNzJAs8Q7s4FkC7lloSZ0eui5ovKhFnEdsK4ph0jUVDh?=
 =?us-ascii?Q?QFORdfYRv1N+28ypWwx0CArhDNm0+XltAHFIMzqYSdeF6jyQGwKGaC0KiEYR?=
 =?us-ascii?Q?WkBZ0B5gDYstJcwMMFVApz1U6/7mHM+okXVXNWDI0Djv3Veb4h9962a8iUBT?=
 =?us-ascii?Q?Q/GgxqMLPtXFeOZB13JHe+9GOJeaKAZmH0dYcRO+TI2zaFu/Ib8qDrCUG3np?=
 =?us-ascii?Q?gDZdEDFhPLMdpzFku2Mvahb2d+iObwOazuKQTnir0ur6hNeDHSo/qd50hLvw?=
 =?us-ascii?Q?ztKKKAZFxOK5VCAnfZHjyzf1bW73r86zsQtA8p7Y?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5ca9c0-273a-49f3-a042-08dca57bfb81
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 09:45:09.8353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PE66a3vLHSxkE74jH0HV+yOM+wBJYJYc9YrwZ2yWZiOtJflS3pKGtCpYHwvM+/ogkcsChkK+8D6lvPa3LB/kSUkT1zFlsJ9uTn1vtsmY3Vs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7640
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

Please don't review this patch, sent by mistake. Sending out new patch.

> -----Original Message-----
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: Tuesday, July 16, 2024 11:23 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH] drm/xe/xe2lpg: fixup! "drm/xe/xe2: Add Wa_15015404425"
>=20
> Use XE_WA as used elsewhere.
>=20
> Fixes: 86c5b70a9c0c ("drm/xe/xe2: Add Wa_15015404425")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c       | 5 ++++-
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index cf622d07e190..30409357487d 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -13,6 +13,8 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
>=20
> +#include <generated/xe_wa_oob.h>
> +
>  #include "regs/xe_bars.h"
>  #include "regs/xe_regs.h"
>  #include "xe_device.h"
> @@ -22,6 +24,7 @@
>  #include "xe_macros.h"
>  #include "xe_sriov.h"
>  #include "xe_trace.h"
> +#include "xe_wa.h"
>=20
>  static void tiles_fini(void *arg)
>  {
> @@ -127,7 +130,7 @@ static void mmio_flush_pending_writes(struct xe_gt
> *gt)
>  	struct xe_tile *tile =3D gt_to_tile(gt);
>  	int i;
>=20
> -	if (tile->xe->info.platform !=3D XE_LUNARLAKE)
> +	if (!XE_WA(gt, 15015404425))
>  		return;
>=20
>  	/* 4 dummy writes */
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
> b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 08f7336881e3..3d0e0779a833 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -30,3 +30,4 @@
>  22019338487	MEDIA_VERSION(2000)
>  		GRAPHICS_VERSION(2001)
>  16023588340	GRAPHICS_VERSION(2001)
> +15015404425	GRAPHICS_VERSION(2004)
> --
> 2.25.1

