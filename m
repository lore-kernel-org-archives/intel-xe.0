Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77E6C021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 22:08:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1FB10E9E2;
	Wed, 26 Feb 2025 22:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4Sxur/F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBA510E9E2
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 22:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740607687; x=1772143687;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nKiJyF8C1DIaDHFfBsL7tY5Oa8tTdqcPYYYXGXq91nY=;
 b=U4Sxur/FCnHyBOsFR+8oAMvG3i6ZgE/JFJjuAhAnHsWk0myAZuQ6saqc
 bdxuuCyHVA3dksy4LSEKnX++gI02yAJiEG+pCJl4rLgYyPFIlC2GGIrdc
 4QIkK+Wo6Hj7AyG8OXyDanjR5bKV9ScXN06RzAX1XLfJjLkIfs+hXyDTL
 E+fncVMgCUEAHlX6BEyycb+KwEXrfynjI8aJJ7JS4N+oEI6XfwysRc/Rd
 qDy/EEl730vOxexr4ODaWkEin3NcNW/lVkZGTkkWioctEbe48CJu43xoV
 gDrGjHyAHlqWKQp44SkHmWJfIgwPS++lOwZV0zSwbHdjwyp/wMc7WIfQk g==;
X-CSE-ConnectionGUID: 62iSw0NOTieF+KPu55mPMg==
X-CSE-MsgGUID: HCPK9ZTKT52DvhWjwAixaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52115736"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="52115736"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 14:08:07 -0800
X-CSE-ConnectionGUID: XKXLI8utRUKeX6VCHcuyTw==
X-CSE-MsgGUID: qJu/lJ5iS8+P61MtwFuVZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116700344"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2025 14:08:07 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Feb 2025 14:08:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Feb 2025 14:08:06 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 14:08:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JcM0Mh4/9W7/c+NT0a3/V6jD7CPHlUKO8PMGBWN8HPNWeQie7sZnENhToM5q9BNtgeSWdPE0VhDoZu/Ym56tuJSnFJ1POxpUVq4UfETBM5xcLqSYE07bBMSUO4t/y7OfBwxZSlbx6Qm0Bb/TEygRQnbcoWJ+W1anO+cMTRzUGQEhOH3rJfmVgxezLm5U6mUw3zXNLgZlDxaXjnLf/aG/YAdGD5W3irKKChh87vvJ/ddpNh80E4ckjhlb1+/ANU13wAfyoqX07w9oj7eyzjtfbPwM1lcddAC6l8w2g4rkDbmMgAUfweJorKKJ9I6BSblSTFp3VWOPq9nyFnMsMCgcOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hy+8m8RKiGr0vxuDPq9sLvcUXcPf89fhFtxrspcmF60=;
 b=ubH6tXmICKJxwTPWH8ZDeAcx4WvAoe6SJGNtwPj6w/mldmLZKDevse7kjKV2+YDQKHaXELFPkO1ZpH5ZDRzuMJDrW1gNcz4JBZvB9SUoPK+D5yrXhk/Abi3NKUhuxOlW8Ikmb7sAxo5W45hGMrudEnaKj+3d+65Xlx1sqbMQ+GpZt9XSZwecB5ywrhVO69mU5XLULKhr0KM/lUAyHvn8/AI8rftNZlaoZvuQztmh4tDJ/SM2HnP+SMTkd+zGcKn6P26ouEHsTELQPDa+e26pxZl9Kyg57flnM9WNatPw4xLsMt/FzE+kfHUT+KSWR3pjn3YANuaxO4cezWYJr3tsnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7665.namprd11.prod.outlook.com (2603:10b6:806:340::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 22:07:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 22:07:36 +0000
Date: Wed, 26 Feb 2025 14:07:33 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 3/4] drm/xe/gen12: L3 recommended hashing mask
Message-ID: <20250226220733.GG5109@mdroper-desk1.amr.corp.intel.com>
References: <20250226112106.28173-1-tvrtko.ursulin@igalia.com>
 <20250226112106.28173-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250226112106.28173-4-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR05CA0110.namprd05.prod.outlook.com
 (2603:10b6:a03:334::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: f674daff-a4b0-4085-a685-08dd56b1fa06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PguVcXHLOd3Xr0CdQnl+IxPjgktL+Al7dcd5uxriLl9X7g/yhIBVHgBZs7/q?=
 =?us-ascii?Q?usVMJREqVB53DR5yEVw3rAwEWmMDj0FjFM3k9WduqIJwi/AK85JvLpEa1fnd?=
 =?us-ascii?Q?xIXooKMp9066aaa3nGhE6RBH7ITIT6rE9Z8Z+XtgNcMGNnVBkSbXA911g5fr?=
 =?us-ascii?Q?kR9g3WZH5AN36k8h7qB8VI2izMPJrI1pDfpJtnqGjqgUFtW0uHDMhduC7dB6?=
 =?us-ascii?Q?zS10LCNeFrPTl/eMqucZ7MWQpJ6xsiWDUX8QAtytbfcix09G1PprF9xbt04U?=
 =?us-ascii?Q?baQ8wIxtsz7hS8EVIhgWsKAgIpwisgFJgbMs/eVLL37csUWsY7OfTl/7Dzvb?=
 =?us-ascii?Q?HwPD68rAcpHJhPznVU5y9x9NmXqvuCcEW0NJTOobjh89lGMm0ElujZEHVobI?=
 =?us-ascii?Q?dPtaKRhUYM1RmqxRSocgSUBNxmwvvrCGw3JLi7hV/unH/oWF+33fa+tUaUGe?=
 =?us-ascii?Q?Ou79D7r7CagxeZRR+x9ii2m7Co0PWmCUdB26AUe/WZL79lr606Lk0zn1ueA+?=
 =?us-ascii?Q?EsU21SMRopPXgDi/EGveOy7G5cWQXUHlOf2Q5eWIQLDEifhret+pFEyYYBG2?=
 =?us-ascii?Q?kpb/pkhS7/fflo3So9Byad3eq3lRDOCtRRRs94Sp+rSxyP0M51Nav8nIwO5m?=
 =?us-ascii?Q?MX64ivN0XYUG9AkHr1iirnpMUg6qKSIGEp05a027UE0A03mIzB5gQ6dW4LAJ?=
 =?us-ascii?Q?Z1Rznlh8WMAyYKYLQLvoM5osnzsbcCctI3Mlfqpio9QuQFvJl/7OmjbkWD0W?=
 =?us-ascii?Q?S/nPFk+055rOMOZGnrg2ZSA8hnQRYx+LjEXDAKmsLQrjOXGYzgN4mb+H//k9?=
 =?us-ascii?Q?0DVeMQfiaTThMIQF+54IGAW1cmKn6SV0mkLOiJOjFE0l0+zyz+cgOq+6TXSD?=
 =?us-ascii?Q?5uVvgfHdom6ehj/lGWItBIZEBQufw4vk5wQcBVdRcohritgoSNLBGN9G9H+x?=
 =?us-ascii?Q?+5UpG1ppCtEJ/WRHrTMN2ZdPKQqJ5x9tYUIf64p9IG0/UJ9RWqv2NUYyKsrM?=
 =?us-ascii?Q?xFv0vlKkz2MfFih3pbZmnPZNtwQFw6RhX0QRA6YG8qtLBg90KNFYOCgaHXWw?=
 =?us-ascii?Q?UNp4uHN7UUS4MXttX5rzdDzvgAqS0fNxewoRwY5LVUCaemh6QTmrYRr71mSm?=
 =?us-ascii?Q?Zupr2UxpYRVAOJZnwm0Jmfdn/92MytV/lUT0OPuM+mNk69lHzZbiQT3BXxVn?=
 =?us-ascii?Q?axrRDKISmQzRUwVt8WGWrV+4/KLKv5yYq/ubwr7woDQPrvRBI7XglzxVwuAB?=
 =?us-ascii?Q?NBqH51Dp3DPOkVqMFEYJaX2220NWE7J5QoHK20ghXKgflHWNyldSgI2V36Wv?=
 =?us-ascii?Q?H94O80YwzfK9M6vr6xRg+w83ueBuJAbmucO3L0GlpiMOr3fqMcw7ogF+36qU?=
 =?us-ascii?Q?OyLkaFxTuNujo1FA3NFLffR4gE2N?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VPeDNW3yuaSZFnX8rf12S/rhv7ma7mbXcCE3JiSPsAhrOigMeduJIFRmXyH4?=
 =?us-ascii?Q?xVkP9svd82CuDLdvvSZlyXbX0ViJikOj2Qx3VoyZfZyWL3LhIK0qWNQfLIl/?=
 =?us-ascii?Q?wmb80zVZ/YUV+tn2wxSvRjtgZKtIlJB+ewpRM4Rpd3P6AEp9nYYXoxHxMZVZ?=
 =?us-ascii?Q?foVIKVko2erUldbPc43jWcv+Rsu8oSLz6xdb/d1cZSxwGTXOxw+Wdg+1hRJQ?=
 =?us-ascii?Q?DryFEenqAHwE6QQfKxVWH+Fp2tG1/5QcRSYNwyVtYqlhCzNlRe9ZBTkwfQ4e?=
 =?us-ascii?Q?VC4DRcmegjBEyE3C/4WNwy+uKzvl1Zh5Aw2HIpkdLYP0J/+XJPDJme7/Yb8a?=
 =?us-ascii?Q?+YcT1Rs41ahA901mtKThm8is/tZ9e+xMdpwmzMe3nizh1Hjn3hMEUXePy6z9?=
 =?us-ascii?Q?zsIYH/pMFYueLeh1Xjq7EP0RJXBuWbvCrQARK3TIcssIxI14dHq4tS8mrsx1?=
 =?us-ascii?Q?jwmAAcZZnrHOcj69cqaN725Yo+hP7VkvE6Yu+xNBn+paSYH5p6rvJRmtxybg?=
 =?us-ascii?Q?775mzj45q37ekf2/kM1SmCD1bncQKpFij7sNFAWBOIEDbGf969sqTVT+1agI?=
 =?us-ascii?Q?bU+euOvGHoY25aXSmzt+oehnAd2aheVwuVWobrtqd6FxDG6cE5RMA4Xj57oG?=
 =?us-ascii?Q?reTzb43VHFNqzwQl2Fv6apFMP6FIp7dmcwVl7+tR1j40sdwF2XFuqfzjvV39?=
 =?us-ascii?Q?VOquUvgBymJToog8Oi2Zj/HkEf6PFIcLWnEjEMzMMyabS2ZOKHGqRI6luUIn?=
 =?us-ascii?Q?N3la1bM2Wu9455u3GPN7ZPzzHao50r4jgxUus8gA4WA1u0tj2RF1crjeP/oL?=
 =?us-ascii?Q?dfrrek6sTJTCrCyd9RhYWUA2TjBGJPp+qZA54fIS3yuPxGEmALa0qWNkfcfZ?=
 =?us-ascii?Q?uW8OX7Qfg1G5ymsJtEsalisRIPxcEwNOiNFubg7dvA/Z+V8GfDXVKOIwNPoB?=
 =?us-ascii?Q?wEDw3jW0VYKxxJj9v3dgi6mRmpDLgAPTYP3lSdDlignNPCW7bzicswGFn420?=
 =?us-ascii?Q?1rBwEMN59DLWznbZKLRaZdefEyovkhpmKiz5IcYm/lIBylDC0zLPzOe1kGwf?=
 =?us-ascii?Q?rSA4Dl5z7ut8AWww62CfKUyD5AfnKDIaeF6EEBy4WJVLPQ+E9ox5S75XuGbG?=
 =?us-ascii?Q?c4EboBlZ68NLrjXcWtIl+ePjDwh9NhOpfK33UBrj7hMPglEUUgoIEfnsLXN7?=
 =?us-ascii?Q?0QJwtGOCCO04n8v2SX2KQ944oSLwatORgnqak/9ZoTKBIlpAxChgjHp90lRw?=
 =?us-ascii?Q?PWpTmoh402MFxiKRZ6r76WsGsKRpPfwg3x/diISVQKnl9gxHwbBXn0yRBKRZ?=
 =?us-ascii?Q?2RO/UFCGIfSRgpYl609PX1PHahFLjE34FTHwsVIsVBTdxZEkzICAi50x9k4g?=
 =?us-ascii?Q?Jx9ggJvXcR9D9sOAo8VGnrCqhjUqb2yBIMpZEI/H0D6D7bVxulSyotjnF3VS?=
 =?us-ascii?Q?yLdAykA/4Yu8FCCMMb/iSHKq1CVbgwxsEvnVICF5h/Sgdq4fmZeZPaZnO4JQ?=
 =?us-ascii?Q?4SsfcwK6BzmlCKm0KbcyRk8Tx9n7uWER/deEWddEhGF0NySAgqCJdhyOD0iA?=
 =?us-ascii?Q?sO+eMkTpJd5saH5z3AtDOKFNZKmfwPw1B0WjBJhGwVr2h/54ote0bEmgJu0r?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f674daff-a4b0-4085-a685-08dd56b1fa06
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 22:07:36.2009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vRY7OzjwYVNWBSSGr6/uJGp9rBmAJiOtRKJiv1KpC7616ygkcnzYR1JIMWgdASygUinl2wwYw71jJjR/BYgEcSOG6mLaG8vNgZ5bqShjo+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7665
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

On Wed, Feb 26, 2025 at 11:21:05AM +0000, Tvrtko Ursulin wrote:
> According to the i915 codebase xe missed to set the recommended
> performance tuning for L3 hashing which is applicable to all legacy XeLP
> platforms. Lets add it.
> 
> v2:
>  * Rename prefixes to XELP_.
>  * Tweak version end point.
> 
> v3:
>  * Add bspec tag.
>  * Tweak version range.
> 
> Bspec: 31870
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> References: c46c5fb725be ("drm/i915/gen12: Apply recommended L3 hashing mask")
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 ++++-
>  drivers/gpu/drm/xe/xe_tuning.c       | 6 ++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 282afd22b68b..da833a147c0c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -365,10 +365,13 @@
>  #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
>  #define FORCEWAKE_GSC				XE_REG(0xa618)
>  
> +/* L3 Cache Control */
> +#define XELP_GARBCNTL				XE_REG(0xb004)
> +#define   XELP_BUS_HASH_CTL_BIT_EXC		REG_BIT(7)
> +
>  #define XEHPC_LNCFMISCCFGREG0			XE_REG_MCR(0xb01c, XE_REG_OPTION_MASKED)
>  #define   XEHPC_OVRLSCCC			REG_BIT(0)
>  
> -/* L3 Cache Control */
>  #define LNCFCMOCS_REG_COUNT			32
>  #define XELP_LNCFCMOCS(i)			XE_REG(0xb020 + (i) * 4)
>  #define XEHP_LNCFCMOCS(i)			XE_REG_MCR(0xb020 + (i) * 4)
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 9e7ec36dbd47..454ee00ef45f 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -107,6 +107,12 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {

0xb004 isn't part of the LRC (i.e., it doesn't get saved/restored on
context switch), so this isn't the right place to add this.  We'd want
this in engine_tunings[] instead so that the setting gets re-applied by
the GuC following engine resets.


Matt

>  						FF_MODE2_TDS_TIMER_128))
>  	},
>  
> +	{ XE_RTP_NAME("Tuning: L3 Hashing Mask"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(CLR(XELP_GARBCNTL, XELP_BUS_HASH_CTL_BIT_EXC))
> +	},
> +
>  	/* DG2 */
>  
>  	{ XE_RTP_NAME("Tuning: L3 cache"),
> -- 
> 2.48.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
