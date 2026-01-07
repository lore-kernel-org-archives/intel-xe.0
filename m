Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32E2D0D151
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E1610E5F4;
	Wed,  7 Jan 2026 18:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FATkoMu0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5E310E5F4
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 18:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767808859; x=1799344859;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m4pSlYmMx5Iz1owBT5vEQlAH5BbB5ONJVPKD3k35UjI=;
 b=FATkoMu0wbDtdYj7UM6RtovIiTD8Nktr1RwR699Ofg0lwiIr2No29G09
 NBzMnaP0BkYAxvHzwdznjgLLtqpCb1T3WERZGJpsIL3PjR0B79/Dj3aVI
 hgI5tSShaiOafCppHleUqBPpAbpOCTWk4xwUizq6aKjKpqF1RWQR8qN+p
 eFkaPoiCVyx/fZpE78g9UX88fvuFo84PwkzJySQvutmCTb0a/KDpxRvBn
 BgyxNMN2cDvwRM+ekonXrGsVJjWNM6fw6hYW8GsntwatyPNtvatDM6IQl
 ZrlSs0Wn4GGh3lpmdP9PXisX9rPYPJiQE3M2NlY+3AB1WCWiEZLNlV5fa Q==;
X-CSE-ConnectionGUID: ZFf5m1OvSP6Zzp1TNQJE/A==
X-CSE-MsgGUID: IsWY/ZgxSf6j+8mU+le2rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69165394"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="69165394"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:00:59 -0800
X-CSE-ConnectionGUID: tHJpm9IkTIOxLx7ZFFRO2Q==
X-CSE-MsgGUID: 1bhK1F3QQJ2mHbbK0bYlxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="226461862"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:00:58 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 10:00:57 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 10:00:57 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 10:00:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlrZj58UqWgmyQI8KOMRjPJKGA/VGFNJMxIn/KB0yQzRxWaBHwS3tkjLtN6Tgh7lspgV5qTWeEmGgSbefZ5r9x8YqTS444Ibngnqb2TrB73Oc65q861AznKOZejnB7lGXYaYuB6Xtw11u8+uAp9bQU8l/+iCl+Ik/ZZ9mhBjdMu7kouKs+0mxUhTuJkK96pXB7cgJKEvAJZU/s4dSGh/jxYsqbw5Xp3b3sVBFT9b0XGjzDkVGUaamBe4KW5vIwNl15+BZHUS7SF4ZPmc9MM8SDr6bEQFutWagePcB/8pQAOnwAICAcdWKpxTPGFxzCrZgxQtUVxZ44DO2Ow407eSMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hjl25uZc1/uDk5tOjAjQFjmSz9FfcwO0ggdlOC+hq4=;
 b=tlu51FqGCd9jxYvhzR0xLzOeEG4bq5BE3kr16gOWI2wvaNFehco2MKuorEF7nb0pHBYhpDj5m+G8jUXb1H3rCaKAbjn4hBG/c6M4IJVIJCDOCY1CLJSrmuX8ci/Vjd98yHmOBk6SErUR7J+TAZGvyQoOSdInauXfvGfDsG1eK4QJhAnHvcCKWSpNwBZbnpf/riukDJ0gL4neq5fru5LQlo0yOoEQFp4XpB/BRh5KtS1h/J9pyKhu/jw9yYKwduGNW1LaI9HnHhsrN99cUpvTMHsg6/k30UQAnOUCIYpJ3ODhjdgbCfZkpsDvhBmIc5d3zKeEl1JBYyVNIABkNOmQ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB5026.namprd11.prod.outlook.com (2603:10b6:303:9c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 18:00:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 18:00:54 +0000
Date: Wed, 7 Jan 2026 10:00:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/5] drm/xe: improve header check
Message-ID: <20260107180051.GT1180203@mdroper-desk1.amr.corp.intel.com>
References: <20260107155401.2379127-1-jani.nikula@intel.com>
 <20260107155401.2379127-5-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260107155401.2379127-5-jani.nikula@intel.com>
X-ClientProxiedBy: BY5PR16CA0013.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB5026:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f9d8df5-6aa6-4340-d698-08de4e16b366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h/z8FFwHQjMY4mMb32RTCq51XLMDnsavxMdNAYDQtvkk0pSqbo3xlVvJmvsN?=
 =?us-ascii?Q?mOd98jvBytLXDI4Osr/Cx81GRCL0lAwZQL8WSVgcOzKn28PiLIA4ISkU6RXc?=
 =?us-ascii?Q?WWEUmvRXdmZKhqRyoysE+UMNrnAbnbsmOYHgZNB7XgBY5l9+mv6X1gXCoosK?=
 =?us-ascii?Q?cZgG6k+4LnL3MgOJFufyKe73APXiEc1ftRfFtoLJK3DwiqAXuWvA55ipOdKk?=
 =?us-ascii?Q?BOx2T719Ub8QW3CpFWMKMYU0V7dl5NyZmh0eWiPsu8Z0bNFEOkMA5+q3GmrH?=
 =?us-ascii?Q?NRoyYB7moVazKzJzIu+clF/tsH+XR9EZb61LGFI7yips9SWCTXGRuMEbmSVc?=
 =?us-ascii?Q?mZNxgOGUl8Gzm5M/oBMVLkHVUcfJpTBgJxIqaQqoh0uFkhykW6nleE8g2Z9m?=
 =?us-ascii?Q?ydoCom8Ml7pvPUwyGvqIVXMqOxaZff6OMA4PU3tjmD3pdx2T46VhZlRuJvQK?=
 =?us-ascii?Q?XLRLFCj7VB25Tq4VNTmLzXpX9itHgeRdLnph62syo8wQKOEwASXBMJ2QFuX5?=
 =?us-ascii?Q?fNvZXzYO8Kpm4bTL6jORG3//ARv9TwLZCWqmEk+9ZDB5joU41gXHjzQSbJNI?=
 =?us-ascii?Q?IboLwTaKmIgqLVZtzQz0MCnvDL7vwEZ0O8BLSus683oN0/QXEOxz6vq6cfEl?=
 =?us-ascii?Q?qt9uhxwnV+wIn9UR/uyaiHIuYKcrjATb6M75cRLQqc7fv4MjRU5hONFvtSbZ?=
 =?us-ascii?Q?vlAMIOR++eFXe8c9UH6TK/aFbZ8FhG+77Zv3Mvl8hYkCwOOhyW6XRCU1UPnP?=
 =?us-ascii?Q?RKrFZi6v7hoWBWnr+D9o8fMwjvSBOuu9A6dMB+ZQYm6zdSfx7gT8msXqZzie?=
 =?us-ascii?Q?FHhqA8GQ17aSzqGCFnFScX4WiKc/i2A6o02YNn7pSElCZedcW2Dssg3v0IZN?=
 =?us-ascii?Q?nbeRBFzBK08BPOc3aPSMR9RJfjT6/37StZq2JCScGxtAyTnB/hfIvKNRpEyZ?=
 =?us-ascii?Q?i9zmuBnQ5AzJWlC+gj61V9tg0xL2MdLJIe+FOKs1TsebQThUt/bjM+dKplRY?=
 =?us-ascii?Q?3yn+tgX6OXIWkZchA0Pn9SnTe6CsreG8/7IK+Txp02NB26bBeqqDeBYArIF/?=
 =?us-ascii?Q?4e3UbfJaiOpsF0lUgOk2xwd0tGiczb2CEhqCYI0ohqifOCj/shK2FtdTZjRA?=
 =?us-ascii?Q?BFtItAW0oqclQP9yrH3HrKPvuhXz9PZdN59B4TtS86nd/g10lDOS+PzmdrHQ?=
 =?us-ascii?Q?DyxmFN8DmiS5g2nFfHhC9vWSKLCAH9UV9/Nkzj6JlaWWRiTQWuTR/usvRsum?=
 =?us-ascii?Q?NFnNC/1+p/vsbNIiAKtTFBZ5lXjxPw2V0wKWEnKW8KYwK9hVjPTVrnPaydpM?=
 =?us-ascii?Q?XR9YZIWhwuPq2WhPhwj4hItG5haHKfnyuRxxyPbCsTdjBkOr4huiHnU4sNf5?=
 =?us-ascii?Q?ZAiMTKGJe6ncFZrIPWGh+pjqGIphlLXghJH5vTnDIxRhtgnJv6OujzYTzlxa?=
 =?us-ascii?Q?Lguwheo3uIIhCjMvYgfSZlaCVSFAF4eB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2fLwCtCR0xYlWBApi1zS3VKIX0eFDGtVlriXaXXajZlm+9p4GonCJc9+0ExS?=
 =?us-ascii?Q?zkxaDnFWG9Kf8zZclHrzXfak06xOkXJL2NUjsj4KeXYHFGfda/nZQ0xw2sPV?=
 =?us-ascii?Q?TH5ZAdTSiumf2rNZGuuR5TnupTlM951Uv8GotQIBM3wIKjFFLbmaWbG4B24G?=
 =?us-ascii?Q?Bjsa88pJAw+qBHQOn9s/MZYgYGZKRdUSsDPmTPU+T+/FfW53oZT/4+DiKoW7?=
 =?us-ascii?Q?AZ/oKeddv771vjMLqL2Q6dCwnKi5xm4gUnN19I9b8uXA0O/922wGO9iXYOor?=
 =?us-ascii?Q?3NKevfxcJKPTHTJrAqeqW75lGADHfk+DGU3TFpaUIo49QDexiedEWszOwdgm?=
 =?us-ascii?Q?oY1+Kp6h2Pb/Urjzl7SqeXckgLB1lxBi4Z0THcqn96qy+YRi9dXjKndjneXa?=
 =?us-ascii?Q?m2tv8/lKqOZz8seZg35XflJNhd5lMULwHwi1gF4ndpW32ERLozUQT/hxD+Cs?=
 =?us-ascii?Q?w09Sf5io5ZsFBxu/PR1JTiZ2nf9PHrkd8DVu/GtF6tlOyx+hcOSn93Dy79XJ?=
 =?us-ascii?Q?FOw2EpFPIGbI1nEUJMFJCk/c+fLQdoBmbO1ohJEqJw2snzjjKI9qz1Olj+vJ?=
 =?us-ascii?Q?+ZblMR4KzmYOJoMxJu1SbLJnGdrf/8yQfTsVJwSH0aE0/ajHb1pUkz+XcrKU?=
 =?us-ascii?Q?j8pbAMmQJm+EP4LBk2jFhwzEo/yCjV4HNBsx/FPP+LL0jXjxhQ6KI4wBDAZ1?=
 =?us-ascii?Q?VOago2fF2ezHeXj1HP0KNbmC8lDCv0XA+2CIpIj1iWQ2Q5zaOPhvxFzE+A3F?=
 =?us-ascii?Q?JCZOUZRVPwEzQPuvJmo7Eev/LoeHwwF6g+ygxuNVEIAs9Bwnfux5SsNUVx7L?=
 =?us-ascii?Q?LEq+T47RmaXc68HzNZaGtGGfhOELl5z3kISWOwgD30unFzAqtYbwwjst7IPv?=
 =?us-ascii?Q?jcWNqPTrBdKpYAAGi7O4YvaCgltBSNTDfBMeLac0qYu9nbquvix2SZr2zxgV?=
 =?us-ascii?Q?XjbC5wHz1794IqSrsjAx3OtYD9wFKGJQj6bsN03s/llJjOA+a52CWg7IQ8sF?=
 =?us-ascii?Q?9ZnpDSDxC7SKLZtOLAMbKsttfjzGYEHnUHSdX9NwLVeC5j/RvmVn42A6mb3A?=
 =?us-ascii?Q?+xXpEN38OBHjw5AES7rDWvC63BSH4/yxD+NpJvk0h11vLc7RFpQmlVylcYnL?=
 =?us-ascii?Q?fTNwZ6qAri0cB1WFKuhX9wsJHW1Ydx9r1tWlo8XgrgvZ1YCNyghskOL6Gitn?=
 =?us-ascii?Q?DG74JIAzu7KCQtACJUF6+u7H0M+kmjFL4CK62RI4wfMmHN3FGr/8tFQTlGgg?=
 =?us-ascii?Q?YaDmNvvyRbwi2YJMe6gsUS0f/Dz4RrtPGlUuxtZPU1qxuo3jP7220wOnrV2U?=
 =?us-ascii?Q?WjJ8G/oJzXA01TptrbVveoyC1GA8ym2HRM3+kEAUhxrkI6w9gDo++4yCqkUf?=
 =?us-ascii?Q?WnDmUWaTmzVa6+8jyHGT+IzAhlLpz1Eg/TLKKBo0P9/iqe1kIvvJM85yDh4p?=
 =?us-ascii?Q?KAMvhBX7HxcDATljEn0YC2a5KO8QZCrxi65hOP8kzNyd3qufWKrK63lddFtk?=
 =?us-ascii?Q?zhP8tjgbvIIkzat7j5zl0GEXT905mIP2XYRZYg8xMF1eLK2XoxW2AB7vPr63?=
 =?us-ascii?Q?BjW52VDHl4QCpnfJibo1vi7lVGGhHs1LKBrx7ZV/5JKYPW9MYgX7jzEtiQFp?=
 =?us-ascii?Q?Mw6mSVRvX9hb3I01U0HZ+oy1KXMOF0fWtAwJbcufvbmM+bH8sr0Ah4/TojD2?=
 =?us-ascii?Q?CBUVacdsXGR2Om5wlo4PkPGqYTSi4smPJM8JjZLmmYnRPvoJwMmYFmzSNuwV?=
 =?us-ascii?Q?vCDUnbjUkye4YSBqnV6LHr69OnG5+dQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9d8df5-6aa6-4340-d698-08de4e16b366
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 18:00:54.1241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFh8XGRKywmsw+D8zoQhOockaEhLv/x2n1hdfPzvRgkbLDloYO9fb4woXu9ewPta9PFalUwp5uZBMPR94ejvgXhyau/1TUIQATUBw2nhVOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5026
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

On Wed, Jan 07, 2026 at 05:54:01PM +0200, Jani Nikula wrote:
> Improve header check: Remove unused -DHDRTEST. Include the header twice
> to check for include guards. Run kernel-doc on the header.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Didn't we used to have kerneldoc checks running in a CI.Hooks task on
pre-merge?  It seems like those vanished at some point and these
mistakes started creeping in...


Matt

> ---
>  drivers/gpu/drm/xe/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 2b20c79d7ec9..b39cbb756232 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -370,7 +370,8 @@ always-$(CONFIG_DRM_XE_WERROR) += \
>  	$(patsubst %.h,%.hdrtest, $(shell cd $(src) && find * -name '*.h' $(hdrtest_find_args)))
>  
>  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
> -      cmd_hdrtest = $(CC) -DHDRTEST $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $<; touch $@
> +      cmd_hdrtest = $(CC) $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $< -include $<; \
> +		$(srctree)/scripts/kernel-doc -none -Werror $<; touch $@
>  
>  $(obj)/%.hdrtest: $(src)/%.h FORCE
>  	$(call if_changed_dep,hdrtest)
> -- 
> 2.47.3
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
