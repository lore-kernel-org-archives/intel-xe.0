Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE7CC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 19:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB2A10E093;
	Tue, 28 May 2024 19:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNqHMqkw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9885710E093
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 19:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716926341; x=1748462341;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9kVE0lEkkfA9FN6bLOBd7on53H1/uCs5WuoRDheAOvI=;
 b=gNqHMqkw60mu56U4lIU0adCWcPnOpfbXAs3DonhiKSHFydODQmt1yTxs
 F1qhKCWaCWKyM8h+sfpDhEa1bYMZ7sbqR/48OGGdKOVTmSD9+FR8V3Djz
 0ri2jqh5r0oRTrJXlmw1qLICyHMUsUiBAGOnZePGd9dWQ87sQAqFdui8C
 bJoXpZjZwX6HlueEmCUYs+D4LYOT8K+JPhig0+7hxG/3GBDxmaWXxJ0Pc
 hC8gLZJE0RemGjn1HcLB9DAwkSHkftoBZBKDIHg3PPDHqE7fzSHU3qkiV
 OTsOVtCX2o6q03Sa21NRJFS8ybyb9owPvzm78ScyaSxix+PaqrFG8TVbL Q==;
X-CSE-ConnectionGUID: uEErCxgUSBeAQVAvdSRmIA==
X-CSE-MsgGUID: qK6QsDu5SZGQryr+jmeHWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13139643"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="13139643"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 12:59:00 -0700
X-CSE-ConnectionGUID: UW+t7xFGQLa+bjuW0s9hsg==
X-CSE-MsgGUID: Ld0lwJmrTBOJK7XKxG+HAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="35108624"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 12:59:00 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 12:58:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 12:58:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 12:58:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqkLUeM/oKK0WnFvVoafITpDu2i0JhJ6RguoFwB0yaQ942TSXa/z4IZup+7z/ODrweGfLr3zAsjAXRmeI0CUcTz/5rHWL//xImCveY1JvAVBduXetoqB3+Eb39PgXQtcqvtqIMQqsAivEcL/JUnuXzf4ES5pr7pwocKnW4vIFsM5Ockblv0FrqZu8vulkboB7hQqGPH3XtFxeBoS1izu3lG86fC0qTWltcUGHwkT59zdWjHik4ExVPXqXmF3CrwKc0MjjptHzEegGJAX4QtNo4fS9gEEZzyDEARcDWZW7qbEGf/n/6kHMFRe4Vf6JMLOiKODD9EkHou9p3pDsOVgMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyFLlq113kJF9sHaLsdd6f/VXRXsU/XqbGjZ+qBt46k=;
 b=UyxLEM1eXNw3eWVNaiZxP4efVREcoaQBoE/yEXNOtXm5mlYqrGxY7sNPtLYmaVI0hTb5WHp/fetRmqjrl+SG8tdJVTw5xwAAkDhWQqXeXspG+Z6vrlJF9RBfwbtmP0vQLQI+9TSFVn16xToiKlyTWlFQL7xXKWejqCzrPSBta0FFPXwtRF+h21I8fQsvztlHsc7pGnJbG7bIOu/RCGuK+PwRS7uKlCvk3AUf8oMNmEE0iQW6GI2MIinifsMYjJxXfNKeM3CnsUy2ENPkt19QftJKQRNtTfu4hmAnmVuI2PTsji0nYeNX18BM0/0fjFW/vSh0TzfXoTRVdV+jTLU7qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6969.namprd11.prod.outlook.com (2603:10b6:806:2a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 19:58:55 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 19:58:54 +0000
Date: Tue, 28 May 2024 14:58:52 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/lnl: Apply Wa_22019338487
Message-ID: <47qsb6taavnnu7v35u6efyiud627qrbixwivlpwzkcjwk5cbkn@yckt47y4aj2j>
References: <20240524234109.1731675-1-vinay.belgaumkar@intel.com>
 <20240524234109.1731675-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240524234109.1731675-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4P221CA0004.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fd5118b-58c6-41ae-b866-08dc7f509a41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lbDbwa83/Ybl5fUpFxFO5KJSlxYLj0/y4n2p8gOM6kMg5aZ/nLB62zqoFHXb?=
 =?us-ascii?Q?3ipCSgCazNte1V+WgcGROjUo87GmyGwApuzySQ82TYOuQuWNctE8d3nK2gj1?=
 =?us-ascii?Q?f01EnmzGMfm3gTosaLUw0zjfhVsB16O4ctZnqTSNFfcBKgDgG4oFsyO2RuFc?=
 =?us-ascii?Q?+V4onL8vmxgn5TFlFMS2Yz9uEGh3pzTJT6N7Q6EvC9BdzQ4qDMsw3bgrkgFy?=
 =?us-ascii?Q?h5JNsDbxS0qCtggOdfpFjxGqARw+3H2Gg6quS5qQFV6WJ0tAQyBhiFjPlhR0?=
 =?us-ascii?Q?iQvJWGoEF70ZfL8DBUGitbODSkg3Fd091hJrf0/E57M5q9b6AthsGlpqhlkE?=
 =?us-ascii?Q?53S7vvHQIi8v/Wpew4FmYtbViIHCmbaMfybXQwE1ROdEfYFMtQyEHcgwpIAT?=
 =?us-ascii?Q?ZD0vNe4a6QSLmyjIDrVnWo3KnGa7K3Lygy1CVEWHzo7gHeVmwf63H/Qcemi9?=
 =?us-ascii?Q?6nqifZMYqyYxLa9xWkJh6h/n31t9QuYQfzGMq0yjCOS1pyJIJBcj6bMODhie?=
 =?us-ascii?Q?21pm8tFjv1Pfupxj0Z79WujJ2uZ0USRpYgjJ0W+Crzwkmfz3kgDNpey9X+wc?=
 =?us-ascii?Q?s4gFfI/8gJ+vCkRLN0UrAjs2kRl5IrxzBiPJjh0pVY24Gjf/4qwZNWmI8TB+?=
 =?us-ascii?Q?nAOGq6iR0Dp7CNUL+nZNTOJuoIDi5RCgFqaZvhD3vsLoUBL6Ga7yHsEADrLb?=
 =?us-ascii?Q?ECUICE7OoQeoeSUomNAyblE63ttIRLrwScfAOWbkdrQ6PTJfFxhIbQfOvdQR?=
 =?us-ascii?Q?lwOjU4TMr4Cv5WPgzqyz5rjprL6AWp40tuD5cOQpbAEBMbVfu37jsCM9tyUW?=
 =?us-ascii?Q?xz4ac+tWooLv9gSrJUfMphIJICiWvq3js2li65+hSEBkTQouLfmu9vncOKEq?=
 =?us-ascii?Q?f+lGqS1m1W7p67bsgqFDy7VCmP6r8x9HF8iOB9MB7NxrhdJtKeyY0rjdJBap?=
 =?us-ascii?Q?emDC8fseoPdvEnDVX7LbkkfZUoEwWtEA+JoZRLPIQjYKacsZILUu+AKAmDNJ?=
 =?us-ascii?Q?IkWplRq2cGcLPQmdYpZUBpsLrWSTgky+mEmBvWykWqzLVAM3G1KfTEzUWMjh?=
 =?us-ascii?Q?NXiZ8+rLAGj3FFEA9AtcqBJqs80s2ROqIXCu+PDAFBRf0hGISihTFL5M1jjy?=
 =?us-ascii?Q?iYalk/pGxa4qP6SZmA8Zhpyfve6VCnhmTkd0JeSr2r9adxbeGTJ8Vh1JjY4K?=
 =?us-ascii?Q?pgAtBiqT1KAK3RpYOGZ9ujmuXBetdUP0tObuRDaPHJbTGENPeDRX4F940hU?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FyH99xZkaHd3bOfRj6HYBCOKf0y1Ib+YD2DsUBj4TXoWuhVCromtQfK9gmOa?=
 =?us-ascii?Q?pQg6mQff8bweQnmgL6wERuy+HYVmaaoKvhhBIImgyUbuGqDEMaW+gY+fqyCn?=
 =?us-ascii?Q?Bf/d+Aw5tAlRiX25nnpb9SoseHbc3nB3tfZjkwKPtJTXxT9I1AZoot6PNBiL?=
 =?us-ascii?Q?an1/ZQveIjNoInXHgWOvX1dehGqDiGsRv9rsArRDUXXQJ6LzUW0gbJwUkDdE?=
 =?us-ascii?Q?s0hJKQ46zr4QCyBt9K5WM0GaH6iRe/lMQELgo0b0qfOMWUQ6bzI6lXAL/y35?=
 =?us-ascii?Q?rf4yULOzCqUmGQ+t0B4Tu+wJtqN2WcdIrEpYH1J3xvc+GcFO7fOfZdQHy7mJ?=
 =?us-ascii?Q?J3IV3D8i+yqm4HSFsJIbP8GhGQEyCSWcTw1dITRGvfelu5jBsHsfxLIRA3bY?=
 =?us-ascii?Q?IJ80+bj5ms/45m/s9T66Kn8RYwpL7mm6hlPM6c+4BaMIaPOxRdCr3yWwTpVi?=
 =?us-ascii?Q?/in/Am6+0MkHX2DKAN26SdWCXcPovfgfuTECVnxY2ob/IfmfuVuxgK5CbBMi?=
 =?us-ascii?Q?9K23Mj7ODzEkM+TGAPBczhMD7KN18H7Kse/SMyW0MrBDonBrcfwRYnIrxcxb?=
 =?us-ascii?Q?tOvVaZeXh1Sm+CRKVc7FCPrPCr7WD4dN2uzuFEbts7B7p2uhp3dII+MHuxjp?=
 =?us-ascii?Q?Tvd7rpncdBLgLizN7BWBUI5FGQjwn7a9GOzGB72/bsHBCGGfrfOQ1Y8yGdj3?=
 =?us-ascii?Q?5fPRtP2761aWY6u7nt0G9tQKBkK2qnP0LUQa2HyniCEbqpufK0+PeWRk4KZv?=
 =?us-ascii?Q?MzDIPNoBmo/CB7fsWpemTomWApJ0gSN92DwEAMO8Ts4IT3rSpscqnvvLoXyT?=
 =?us-ascii?Q?zoSuUuiJAdFbf05zvM9FzPNqCx2TB5bxoOcq4NzrYbmFb46kpcLL8rLVCrXw?=
 =?us-ascii?Q?h5Gypxv7g8nOf9gBfyTlvBHbrV0VZAKKc2WnRgK3rXKnw4W8/vXX5X33MM5W?=
 =?us-ascii?Q?PZgiCrcOhsf/LvqLz8fSsY49jq/WZuK95cGZXjq/SdqxZ/VWpvKZqkbwWQSD?=
 =?us-ascii?Q?Vn0+MhTPmHa7aHi64sfuIWEiDiWBBsw5vOcx9qeELg1SArOg1yuDMhu93Cs/?=
 =?us-ascii?Q?6nzGNBMh91fO0O6yB8nYrQ59ZrVwS7Ch8Fshto+bHT4FnFMIJ1ulNjoMxOnc?=
 =?us-ascii?Q?KCbCNGlFADPR7eAPQmeWi9L4P3Jfqfi0Qfq3tx/J/pgDeYhT87KAMG+6RHV6?=
 =?us-ascii?Q?1QzdN8FhyH5EaRdZPotOZalu6qpHfMgFucxizTNsyetkdiAxA4+/0le+AO+Y?=
 =?us-ascii?Q?DJfrF2HbzQBvB+cbvXioGh3KCISvxqIyq/xWgq1o7VtNm3kBu5WzZY0/51pz?=
 =?us-ascii?Q?kIyb3dcSIZDJLqA8ETAfQMB6e5Se/CqT2SCb1rCKwAt+D1gy5X0XJs87wVQl?=
 =?us-ascii?Q?o2iUYLuv6ImnTMH+uzpCg2Txr0lFePJDoINQo+bp/tBi5tKAWWPDNf5Ma59l?=
 =?us-ascii?Q?ErpepbWtzmfwRFH6Yw66PZ5jQVr3dNu46Ysi+1l0idBAxPGtoJHoVU51b0O9?=
 =?us-ascii?Q?Fr54i55sWeB91t1G5n/tIvURG5mfaU6AzwZpvlDQs+b2tKxiA9WpiZg61YVx?=
 =?us-ascii?Q?PHIBDneZM6R7DJzPHsRYS0S2iJS9a2UU6WOXM+yZvN5DY0pQM+IUVN/Okzw0?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd5118b-58c6-41ae-b866-08dc7f509a41
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 19:58:54.5067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pC3SFVa698hK8vUtcdOtVL8BbKUCfX62HGMkq//0sOV8BwoP5+q04MRec0CERmdAguANpDyRTXr20qaBRE2HAAFpZ+4k7+aArACLVwU9d1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6969
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

On Fri, May 24, 2024 at 04:41:08PM GMT, Vinay Belgaumkar wrote:
>This WA requires us to limit media GT frequency requests to a certain
>cap value during driver load as well as after driver unload. Freq limits
>are restored after driver load completes, so perf will not be
>affected during normal operations.
>
>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Comments from https://lore.kernel.org/all/u5bsgsjzqzvm2cqorgl7uggaiyagpjzwhxv6vl6pmpolgbbivo@nh52juk6ql3f/
apply here. I reviewed it in the series from Daniele rather than the
right one.

Lucas De Marchi

>---
> drivers/gpu/drm/xe/Makefile        |  2 ++
> drivers/gpu/drm/xe/xe_device.c     |  8 ++++++++
> drivers/gpu/drm/xe/xe_gsc.c        |  8 ++++++++
> drivers/gpu/drm/xe/xe_guc_pc.c     | 31 ++++++++++++++++++++++++++++--
> drivers/gpu/drm/xe/xe_guc_pc.h     |  2 ++
> drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
> 6 files changed, 50 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index ae07f3d6a068..9f596c963328 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -47,9 +47,11 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
> 	$(call cmd,wa_oob)
>
> uses_generated_oob := \
>+	$(obj)/xe_device.o \
> 	$(obj)/xe_gsc.o \
> 	$(obj)/xe_guc.o \
> 	$(obj)/xe_guc_ads.o \
>+	$(obj)/xe_guc_pc.o \
> 	$(obj)/xe_migrate.o \
> 	$(obj)/xe_ring_ops.o \
> 	$(obj)/xe_vm.o \
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 2eba1e32c633..7a594ee53fde 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -15,6 +15,7 @@
> #include <drm/drm_managed.h>
> #include <drm/drm_print.h>
> #include <drm/xe_drm.h>
>+#include <generated/xe_wa_oob.h>
>
> #include "display/xe_display.h"
> #include "instructions/xe_gpu_commands.h"
>@@ -34,6 +35,7 @@
> #include "xe_gt.h"
> #include "xe_gt_mcr.h"
> #include "xe_gt_printk.h"
>+#include "xe_guc_pc.h"
> #include "xe_hwmon.h"
> #include "xe_irq.h"
> #include "xe_memirq.h"
>@@ -48,6 +50,7 @@
> #include "xe_ttm_stolen_mgr.h"
> #include "xe_ttm_sys_mgr.h"
> #include "xe_vm.h"
>+#include "xe_wa.h"
> #include "xe_wait_user_fence.h"
>
> static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>@@ -334,6 +337,7 @@ static void xe_driver_flr(struct xe_device *xe)
> {
> 	const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
> 	struct xe_gt *gt = xe_root_mmio_gt(xe);
>+	struct xe_guc_pc *pc = &gt->uc.guc.pc;
> 	int ret;
>
> 	if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
>@@ -341,6 +345,10 @@ static void xe_driver_flr(struct xe_device *xe)
> 		return;
> 	}
>
>+	/* Set requested freq to mert_freq_cap before FLR */
>+	if (XE_WA(gt, 22019338487))
>+		pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), pc->rpe_freq));
>+
> 	drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
>
> 	/*
>diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>index 80a61934decc..4369e3ff19cf 100644
>--- a/drivers/gpu/drm/xe/xe_gsc.c
>+++ b/drivers/gpu/drm/xe/xe_gsc.c
>@@ -22,6 +22,7 @@
> #include "xe_gt.h"
> #include "xe_gt_mcr.h"
> #include "xe_gt_printk.h"
>+#include "xe_guc_pc.h"
> #include "xe_huc.h"
> #include "xe_map.h"
> #include "xe_mmio.h"
>@@ -342,6 +343,7 @@ static void gsc_work(struct work_struct *work)
> 	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
> 	struct xe_gt *gt = gsc_to_gt(gsc);
> 	struct xe_device *xe = gt_to_xe(gt);
>+	struct xe_guc_pc *pc = &gt->uc.guc.pc;
> 	u32 actions;
> 	int ret;
>
>@@ -370,6 +372,12 @@ static void gsc_work(struct work_struct *work)
> 	if (actions & GSC_ACTION_SW_PROXY)
> 		xe_gsc_proxy_request_handler(gsc);
>
>+	/* Revert the min/max freq limits as we're done with GSC/driver load */
>+	if (XE_WA(gt, 22019338487)) {
>+		xe_guc_pc_set_max_freq(pc, pc->rp0_freq);
>+		xe_guc_pc_set_min_freq(pc, pc->rpe_freq);
>+	}
>+
> out:
> 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
> 	xe_pm_runtime_put(xe);
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>index 8187dfb2ad6c..3ecfbaa75495 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.c
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>@@ -8,6 +8,7 @@
> #include <linux/delay.h>
>
> #include <drm/drm_managed.h>
>+#include <generated/xe_wa_oob.h>
>
> #include "abi/guc_actions_abi.h"
> #include "abi/guc_actions_slpc_abi.h"
>@@ -24,6 +25,7 @@
> #include "xe_map.h"
> #include "xe_mmio.h"
> #include "xe_pcode.h"
>+#include "xe_wa.h"
>
> #define MCHBAR_MIRROR_BASE_SNB	0x140000
>
>@@ -41,6 +43,8 @@
> #define GT_FREQUENCY_MULTIPLIER	50
> #define GT_FREQUENCY_SCALER	3
>
>+#define LNL_MERT_FREQ_CAP	800
>+
> /**
>  * DOC: GuC Power Conservation (PC)
>  *
>@@ -238,7 +242,7 @@ static void pc_set_manual_rp_ctrl(struct xe_guc_pc *pc, bool enable)
> 	xe_mmio_write32(gt, RP_CONTROL, state);
> }
>
>-static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>+void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
> {
> 	struct xe_gt *gt = pc_to_gt(pc);
> 	u32 rpnswreq;
>@@ -674,6 +678,14 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
> 		tgl_init_fused_rp_values(pc);
> }
>
>+u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc)
>+{
>+	if (MEDIA_VERx100(pc_to_xe(pc)) == 2000)
>+		return LNL_MERT_FREQ_CAP;
>+	else
>+		return 0;
>+}
>+
> /**
>  * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
>  * frequency to allow faster GuC load times
>@@ -685,7 +697,11 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>
> 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> 	pc_init_fused_rp_values(pc);
>-	pc_set_cur_freq(pc, pc->rp0_freq);
>+
>+	if (XE_WA(gt, 22019338487))
>+		pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), pc->rp0_freq));
>+	else
>+		pc_set_cur_freq(pc, pc->rp0_freq);
> }
>
> static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>@@ -716,6 +732,17 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
> 	if (pc_get_min_freq(pc) > pc->rp0_freq)
> 		ret = pc_set_min_freq(pc, pc->rp0_freq);
>
>+	if (!ret && XE_WA(pc_to_gt(pc), 22019338487)) {
>+		/*
>+		 * Setting min to RPn disables use of efficient freq
>+		 * which could otherwise interfere with this WA for media GT.
>+		 * We will also bind max to MERT_FREQ_CAP until driver loads.
>+		 */
>+		ret = pc_set_min_freq(pc, pc->rpn_freq);
>+		if (!ret)
>+			ret = pc_set_max_freq(pc, min(pc->rp0_freq, xe_guc_pc_mert_freq_cap(pc)));
>+	}
>+
> out:
> 	return ret;
> }
>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>index 532cac985a6d..4abdefa36b9a 100644
>--- a/drivers/gpu/drm/xe/xe_guc_pc.h
>+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>@@ -29,5 +29,7 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
> u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
> u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
> void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>+void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq);
>+u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc);
>
> #endif /* _XE_GUC_PC_H_ */
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>index 12fe88796a49..a6b897030fde 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -27,3 +27,4 @@
> 16022287689	GRAPHICS_VERSION(2001)
> 		GRAPHICS_VERSION(2004)
> 13011645652	GRAPHICS_VERSION(2004)
>+22019338487	MEDIA_VERSION(2000)
>-- 
>2.38.1
>
