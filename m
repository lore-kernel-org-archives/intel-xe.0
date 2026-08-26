Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90361C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 20:15:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D6810EAC1;
	Wed, 26 Aug 2026 20:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FDQ8wUFD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3A110E92A;
 Wed, 26 Aug 2026 20:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787775329; x=1819311329;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lUek4hbhZT+dBrUd37XjvGRHWfb5ca+pei974kIy+88=;
 b=FDQ8wUFDsncnXCpsaXnwl/IDPwfACY0KNsxUgmLUY/gAf4uCRvau+pSI
 NAZ8+GFVsWrlsrVRyy8iT+Utsv2Vm3bVCSRZQbttD2GR+0Gu2Xy1XVp16
 gInV4mLmzdRzEYeFcC9KKHEkqlp4ivzYQbHmT1O7dI+TQRTlO4Swj73Fy
 C4P4jI4OgeFKveBfLpa2bTmtBE+vFZV0gWM4JOtlr4x59l/dQKE6wBhmR
 YJL751lBS+MvNh4/wGKeQUiv+j3VQtvsMqWxUJYRJda08G9Nx+KF4q2h8
 ajmBDFDqsxidg12oCd36jTNA1h8gxLT6cu3OWT2Bcj5FdmWMISaJqZD8i w==;
X-CSE-ConnectionGUID: f31zEjabRhOzamrwzUtGOw==
X-CSE-MsgGUID: j/zoJ5IzRZmtNiDy19vZjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88124357"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88124357"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 13:15:29 -0700
X-CSE-ConnectionGUID: Kt3aDYWzTiWKKm86UvxlfQ==
X-CSE-MsgGUID: B6rT+PZKRI+mjqk49Xm0fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="265075324"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 13:15:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 13:15:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 13:15:28 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 13:15:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8inDjqnMoZncz4HQvStwwIG6DsxJj8yiJIdE3yJALue+nS7FD/3SVErbPTn4fcGRQK2PojexLz5+oGzz4BvLKC3LWtgpx/q7EKim1MKHA7ANI2Q4o6JOrfzzPmxfci83f0E6KPxpJlSLqCJfpFXa5v0WrAwsC9blFksgVURNVyxuvrJTOPQIfAPtnTBa6YaAXCcMn0lVL+KVZ39TSHdjyTUD9H+76XFErpK7PAiY9GbtNOVMrVAYjmOyvLC73/Pt5Urr3nCnbnqKYl5F4N0ewJFrMUu5aq3wcgaaeWvzoKUa5tfgNXihQHqJU6vO7kVR+YR/fvpKVHuNS3xourb5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mldvr8h8sjyg+75akI1mUYjEdpK0pSoo4en8nlrBG5Q=;
 b=R5LuQkoly6NL5AyqnL2p+GHPil7GiL4GRSBd10P/qOtQFviA0pEessJErAO/rEwcQv0LLQfzph4xpA8i8++E5ObBCF9c8MzhL59xzO9ICutrcEnQf3dqKPDTyjv1K68CcxxwW2JZrLM2KDVWHcMRsefG8JYiU7wj3opJIgk4b2EbkD3+xaxFxsWzPbWRORkReuMttjahvhnMr7+mrM0hZzgguxGtPp1P23VOT2c9rZ14KTHR68/tNOPISOGUJqoFGtfRAyGCsT3rpiDidBxxnDF+07ngW4hl26xYvfC/9slg7Juw62q+l5F0VkLNGeAtBuUNSAoIDdf1C8LckkJUjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB9519.namprd11.prod.outlook.com (2603:10b6:208:5d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 20:15:26 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 20:15:26 +0000
Date: Wed, 26 Aug 2026 13:15:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/cdclk: Fix dg2_power_well_count() return type
Message-ID: <20260826201524.GM681121@mdroper-desk1.amr.corp.intel.com>
References: <20260826143100.19401-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260826143100.19401-1-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: BY1P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB9519:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d13e95-6924-499b-5187-08df03aec405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: KUccmknC5OFkPlw44dQUd7X74Yvkjrw060yeyu/3IvojkI0xopm06oXt5Gy5vDN9PGPZ7KI23PVwqoZis09XiCUxHq7AFIr1beOwVA93TPeOO6EMhicwhHE3BqozrPYLXDmqcSRgqfaCB8ZF9IoVjt5n68y0Laq1dY5Wfi6ImtS4INj7AuB3s9B9947eLRGvRHMPHFbDzM3sbiK9IOT137heOsELLzO6aX/ZvMx+wVGQlFtJTMqbkVo9SwY/nVS8g8uCpKkFn/TTXwJlatEJKj9nVuge9ldKsIyJSvoCqfxeFZvRgO/Q9PnaB9oehGSOpQ3hoIiR0K7YVa5Wxi/Ki468td0c1coLR04FUfGq2XJqWV04M4vB0f1ZvD3/Ap5pFsAaJF0NHtI3SiT+xn9DuSw2iU2qUlIQNuFx2LkAtgF/We/1M7NIuWnwijjNjf/bIILJc/H7M9J4gyhvrjorsj9gN3cEN/zWxmEwIY1NxIGkDOuu+iiuzPQ88cvJDLyClEdMtdiPKS+MhGzwHBjb28AEThOY3mF7+sqFy/MU96D9pqhsPxf7Sgtk8SBvEKk2YhRC1OYsRVAaqVtNigBSrSJvPE+z3OBR4fVidC3K2GmaxYF2I+3idwfh6MAD2iQnAmDo3Vxy+fzRqACBi6ln/3B7CI5PA47RABoFFNhF13I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?H4Yc6HfSw38LojmoC0s01SvGfxHG3Dx0V8Zm37qSm09azjYhqZVKpDn58K?=
 =?iso-8859-1?Q?Trdp6fpjEX9WFG8HJ6BD7pyppn5PYL0fLQOm2/L9EGOLSIvhFAQs+sT05T?=
 =?iso-8859-1?Q?Bkf37DfoPTsQvyGG12blw+I/CIMITqxgSph/aVY5HbVKOF5X8JMaD59fl0?=
 =?iso-8859-1?Q?we7Nn/l9n/5YyCvz6naRJ9L4rUUq02t7J7suiwp9UCbaBBE535Jwk8DOSL?=
 =?iso-8859-1?Q?ZC+RkYztlTSQYdXrsp+ZYYsdIHus1s+LasIJH2aJeFQU8lLXmEq1hO4Psr?=
 =?iso-8859-1?Q?JHHPxfdyeWALkHf9LQZ8asCPLInanqaTKCwfxM9hccVvK2AMqu14jbUmye?=
 =?iso-8859-1?Q?cMyotMUstnZ8bRRjody47bmTehTwd6hgu6xuz6TXmPgtadZfLefX03dffj?=
 =?iso-8859-1?Q?4OmtjA2HVQcqmGw1YetZGRORXJIPkRf4PL5vv3+lj1RqDqpjq8Mb0tIf9B?=
 =?iso-8859-1?Q?AVGf2Lhs23tHNQ2ctmll67UgXAhRVNfHMjSkro3QMT9ZpA6VElG8wAATAo?=
 =?iso-8859-1?Q?VQ1vxm1IjKVehWjg/WUXZgGD+Skj9lHNWFnZVlz4ILgwQEe3FRg4itiaSU?=
 =?iso-8859-1?Q?Q1N0jmACaGHyoL7UR/eYqa2XANh6WVgudLzI/shHPBVLRFcYe7kQ1YxsSg?=
 =?iso-8859-1?Q?0jxrNjmLThQzxHETygmbHTQMpgSpPVnP7sRGqkD8g9uz4J4GHE1GjlQmZm?=
 =?iso-8859-1?Q?80AYPuBtuYXATXuNb9Tf8uIdnywh5uEmZfaUFzHYRH36yjYcghZROZSkq0?=
 =?iso-8859-1?Q?CkIgVSWJf+z8K5E2MZiprpxIMdiuurfCB5Y9SulgUsG/SmQivaPYfh2KoZ?=
 =?iso-8859-1?Q?y7mp2wciukhhtom1tq9KX8thNJWq7uXe0Gn0vXlz8Y+V8wP6OBghk2gv5P?=
 =?iso-8859-1?Q?ep7Aw3PC9KM0Y9ze+10JsH1CevLabx6Mbndin/Udyu6UyuEmg2w6kg5uvP?=
 =?iso-8859-1?Q?JSkvfD/RCybE8qfIK0t1o4v6r2MyDJZbZVUGVymIsWCyyN9XB3i7yBQhNf?=
 =?iso-8859-1?Q?yKwmtvHJZetBoKw0Igg2O/vQ11jQiROS5VNQitMlIqVK9Q9brhh9LOdJ0I?=
 =?iso-8859-1?Q?GiTI53HJZ38kMOuyNoY4D4zoDLLoQWKKAT0V8W9eLx5Kx8Gtq2uxAeTUr1?=
 =?iso-8859-1?Q?kkjG4QIExE8gOuXvX7/yOnWI6G2Udcf8TadE8uQtqz/m76N3hzse1yymlg?=
 =?iso-8859-1?Q?ce2K7JQ5ydXtYOs5qg1KXhkz9ylW/lTMPeXbql7LU3FVXg+m6SDp7EKl66?=
 =?iso-8859-1?Q?fLYp3KQK0/5smUudJgQdabqJ1ZcZW106XQt2H2/RiWhpOugcmnvf4uDbOn?=
 =?iso-8859-1?Q?+2g4Kxk6+2+plzKhWmxz+t5b0aGcV2h+4PT93EIMrP7n7wO+v7Krc8OQt9?=
 =?iso-8859-1?Q?PSgAPVyKzz4FVYTknKsfkPrgjJbWXTmmO22k+5wKmNxjkXoG7kdGSJ4VsM?=
 =?iso-8859-1?Q?nz41s53/jevEMQlzQzuUjM8xBxEIrq3WNdIzAm7oOw1rrk+Npx8aJRMADR?=
 =?iso-8859-1?Q?ra9BkBdZbvStkwshZg7C2QCOXtAgqiKbNuxMex7YuneBFdREPEQgtCmhb3?=
 =?iso-8859-1?Q?w9DKMeDviMdoemBPNosjShCa5twAnHXCQcpb8qGFPxFKJSNIlD2djmi1ky?=
 =?iso-8859-1?Q?IHEWq8T2bSpxXKaEP6zd4Vj9hKKHCms292exsDJ/tTzD+SoCu0Sb0eAPVp?=
 =?iso-8859-1?Q?UsTLjRSh4v8qd1PQ2Q96ehBDM/YuImuRziYmb0fTiNbovyqZG4QPKn5Evi?=
 =?iso-8859-1?Q?fqzf8U9H/NfkwDJd2S0AXidOyWgaEFR/5tbE9FiKDKqeqfy/X7nZbZ2hqf?=
 =?iso-8859-1?Q?Nlm+yCvjWlU0t0CehnALjOLNBsT8PCs=3D?=
X-Exchange-RoutingPolicyChecked: EBS6qhywpU30bzLj7pWDp7kdFf+CwfIIQRAP+K3HMdcgqlwNMv5/20tH1Fi9nGTv2/kIs5dsx9BjeXEWASqgcc+zq5YUVLXpQgsKRGznGnB8gMbP0R7tAPfNKblhQ2QaJocTzfyDQWwcb62NzVN1LPYTAL5gOD0Jki1NgQy5M4eCHVXxBvq46S6jQSnnypC7DdjM611EPf6KhC4LMz4F/kS0ahDhOpYySnZHHtxv7HLBjMq361/458CR14qic2/LzAbNotdDYy4XH1NEMtaslUXIpGY+X0ZB7wtb3fTV9mwEj4nzx3+b/0bTLkM1HgpYDrG4otXwt8wMjYc7Urf1ew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d13e95-6924-499b-5187-08df03aec405
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 20:15:25.9695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zI22HFY46QkEfqexP9LRXVqeD84u+WrRguAwjbTa6Pj56yukbw2bLwUEg4ccvIXklm3VK9aLxmNdgJRzo83lClZmPSaecJjgYldmd1uzmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9519
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

On Wed, Aug 26, 2026 at 05:31:00PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> dg2_power_well_count() is supposed to return an integer,
> not a boolean. Make it so.
> 
> Fixes: 9112ce99c1d7 ("drm/i915/cdclk: Extract dg2_power_well_count()")
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> index 75ada941d113..279006f7b881 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -2719,8 +2719,8 @@ static void intel_set_cdclk(struct intel_display *display,
>  	}
>  }
>  
> -static bool dg2_power_well_count(struct intel_display *display,
> -				 const struct intel_cdclk_state *cdclk_state)
> +static int dg2_power_well_count(struct intel_display *display,
> +				const struct intel_cdclk_state *cdclk_state)
>  {
>  	return display->platform.dg2 ? hweight8(cdclk_state->active_pipes) : 0;
>  }
> -- 
> 2.54.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
