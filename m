Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B131F513E1
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 22:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A33110EC8E;
	Thu,  5 Mar 2026 22:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTkS4i+F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC65010EC8E
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 22:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772749383; x=1804285383;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OX0TlFegBRF6y9p5d+QYACFkLVvRBu/Rk+J1rdHtjrQ=;
 b=jTkS4i+F9kibTNRM9dTcHA2yI9qznrzBpY8mviqV9dLjKP0obmiiEpWv
 e5xjCyz+eW6XpvJNOqNaXYI7OPNhfM4msqIxfXkuyZoysT1hRV276IkzM
 pKJ6tlNwgkp2VVpG5weW6TIAlrV0FUkJ0qd0x+0eyosbOl8ZauNaVBud2
 y7ErMiMPV6VSxBJxP0rsFQewsxQmwtS0yoljyWg8mx//sEHHG4VyjX5xJ
 orRJmStGBz6sIQH8JC3IEen9cV105qLEc5c8QHK7BUp04eCVQtx1ODLoY
 1Vo7EFcyn477dv2YwtJFNd1nDPs7mdUu9MzRh1YxZjV3jWTjSfTOWlUG+ g==;
X-CSE-ConnectionGUID: 0VoKAObOTwy1A28+LO/yVQ==
X-CSE-MsgGUID: wvJv9HDwSga+wgV9rA22CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="76454190"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="76454190"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 14:23:02 -0800
X-CSE-ConnectionGUID: iAXbx8p0RNGlp+vU+a5DqA==
X-CSE-MsgGUID: JljMCEUqRwyiPRxgHWUGJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="215998302"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 14:23:02 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 14:23:01 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 14:23:01 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 14:23:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZS2BzkRfG/rAbSP12LPwL+IwBTb2RLEI/oKDRrINlLjEIBfEWsozjHyhs/5Q3vD+DSmDJKb/jROb60TLhl/23rjyY907V/CR7ZNxvdq8Tyx42vtDp3KZbqs5pJMd7EHDeUwW1n3Bb0E4fyPxdTIilTMpTTlpplhDHIK6vyEI793NS1/4NPOQWSeA1v3PVv6ed/m3lF++Y9zp1Hjm5a8N0nj2QyW0ITfiB9+97rrx4P4OaWSIPxl3t7Pafz9j8C1Ua1m5G7A3WN4SX7varIJSm8qX/g9F6l41NmSbAA05hTTFZQfq7bwRT+Sn3GUpU+60xUuVhffOWPeYSR+UMBl+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odS/lgMN/OOVFfkDxD3e3TVsaKyLFMr+1x0K8FFRMww=;
 b=yFkcwzz8/iEdfYWk7bwdusJjFXoGrqX8QRuQuaq3/9tKj1veGa7k3IBhkBVsVt4VmCQHkinUspSxulGVwVFH0kDnWcIMmrbJPGdEdySVgxop534E+/zt9/RnzVsXZQujbTKTld4I1lLFyoV2U63Q2DLlGiTX3lpwx2k5ulAK9x3/P/EnEjICGpEz22S+ztDfc4bym6XvEym8dFQ8wrsetLHLmGvBlSev8tNUK6/IMiZAduDn8UtQBvIRBQpvU/702yFh0wAGvR+22xZtvWdF60qcrpy+1o1W1jtyk5ujXYqv7WP7KXsAOBNCH9ETtpOdqR+VdvyU6DOS4+kcs08xFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL1PR11MB5303.namprd11.prod.outlook.com (2603:10b6:208:31b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 22:22:59 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 22:22:59 +0000
Date: Thu, 5 Mar 2026 14:22:56 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/7] drm/xe/rtp: Add support for matching platform-level
 stepping
Message-ID: <20260305222256.GS4694@mdroper-desk1.amr.corp.intel.com>
References: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
 <20260305-extra-nvl-p-enabling-patches-v1-4-5020d5289dea@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260305-extra-nvl-p-enabling-patches-v1-4-5020d5289dea@intel.com>
X-ClientProxiedBy: BY3PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL1PR11MB5303:EE_
X-MS-Office365-Filtering-Correlation-Id: b1afeb12-8739-422c-a640-08de7b05c1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: RPuLun1u8h92PI6iM3e1MH66J0ptssU5TSpnRyClxQ9rvgzOxZdhDozcwQfQ6F+oNPHGJmSZVGdH0phhnvMxBFracXcXFZEDZirw97vwDDnQDpqSarIpzltv7ec95DoC6CdygkCLilU6lsL/QKozfrUd6wPXPe4t/fzpyEKnnFsvG9q9oVIo2MQwLsydCzYoLKmfbcYn5R0HP4+H0OquUvUwtuOt6mlnjsefIrkiAmOfoZEOp7sKAxrpQApHY1LD9rBVBtdutcnS5q1cF25Fmx2gvVS6INbfYq/drtAVUOVIP6a9CFXzGSiIbHTpqMAS+mlomQ0ZuCfLK/FRQR/kXkgAv4VoNuKipvDZpPAjba1JSw0j7YxAWzEqGnmp+HPHxcIniawV8/mP93PoYl/ZL427p4xVzBzWi+uU98ZpnVRzptxQzAbw2ZY5yfsnVJK9G/M1z+GR1AHXtilfXp1VozftN66MHD2pbMh2ihe94R0p02tINNEG/p4hEwFkEXEe3YwDpSQXKDpKo1v8JB5Zz3zDhrrDyavqU6AFM4Mg8r6fwmYVHsYb1qa87jyTnEVdu5LxmQWgaTIUuc5kUbXeOzZkY1n9UW32VYgzGOz9VMTMkYsC0lsX5ARjBOpR8BH+0YGKM0EX7dYkyF59eJYKr84HQsOml4nfyQbnZbKlBme5AWBz80r729BEm3s6hOwJccMlIshPQM5Q9+fNlq//5WnymQ/jke7J9kZexut7apc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?paadeHq1bTBl7aiu8NoN3Z22CHGhbct052gIXX5ifxd4XWS+jsGKr3unY0hl?=
 =?us-ascii?Q?f8IaKe8bXYcix2UbGzS4joNMkTi/TN+XAAex4RD/NyeC1rZr1wWGKSADm40H?=
 =?us-ascii?Q?mCz6CIwRBXJUd1r5+/W64iimRwq3XDJPajclqo1jQeVUsO+5CWGUbmVqmOxM?=
 =?us-ascii?Q?VHfaBanV7zwj5erdBYcLByBSYKdqqD4gwkYwCDDwOG/KxI1h64VG+i8Hy32y?=
 =?us-ascii?Q?JFeBLI49/2Dk46+aeZ0HtcHLLdTaD1yGxSZ1neyZg+TEydaQr7xx96/SyBg3?=
 =?us-ascii?Q?8XjGruaBfBX6n2d6p/TZaqCabQsDiFLkJ1a7lD0NyYFErBnwjSj+54Ls0Je5?=
 =?us-ascii?Q?4xrc9D88W5m+N9E6qPc0mazmxqlRH/vG9je4NdFL/KvbGzQx+aX3i4erjvtM?=
 =?us-ascii?Q?Lm0KfP028+QyR9gY6N18oKov5hkB0mcHIlJGi9aKgWUFrsU3E6UnCdgPa5gr?=
 =?us-ascii?Q?o+ZqiXaO0uz0D2lauHKmaMkkgB1k+jzOqEIwQrtzEr7S+1VfhrC3ehlUA7wz?=
 =?us-ascii?Q?eCGKxMbYiApJif4FaXKxDCst6ShKGsfZL9H+iazWGpGoqa7rv3THX8p1QXok?=
 =?us-ascii?Q?7l8+mOLDLiBIGG5t98TMzUiDW4EwjtKfsGwGIz0zjXCrsDFyimTXfeiiz0F4?=
 =?us-ascii?Q?5GVxRcg22/c7oxxhNFjlGkA4hDNJ182aNnutjYwa4pouvVUZ7uNAJBCpw6CI?=
 =?us-ascii?Q?pPD3mmOsyuQYUVjCUs7fwBvGzuLKgb6ESkj6s22sEbJaF5DpfFILHfXxhkqN?=
 =?us-ascii?Q?I2YzcRA+F/GevfiVNyEwsnUwFr37KKF5lnr+Bm7/ifMgcKyf/hpdn+J7osG3?=
 =?us-ascii?Q?J9kf27hghkWHpPxX3UyHlR5UPXUukcAHEpIaIEdCdHoFI3mbygzQa/BC9zmq?=
 =?us-ascii?Q?c6tqm8LADIY8q4JFROJ/JxINCoe5vKrgLByEsXsQ53BeQHGxqI4DQOZb+IM3?=
 =?us-ascii?Q?EdBvUMwUnxDasvgFN1DG2EYaxWURz00044ITRm6ZpNO4Ps1ANzmWSvXA8X5j?=
 =?us-ascii?Q?porcQXzn65V4aYHqOeXM4Q2shP7c0jJQlMdlKPyqnJ1PNVkJzpckTecYriqS?=
 =?us-ascii?Q?ewQvM1HXZNVgSdHr70Yc5DeieaypwDTJG4iNVHxDAfFiDrIS0VrE/JGU+3Qj?=
 =?us-ascii?Q?lwULi2RhjLnSRGGrXmwgXDbYlDaZjQ06C+1lXoqdFZvOoAycd1urJwAlfaaC?=
 =?us-ascii?Q?dVPJR0Qt9zhZ3oX0k9I4nWTNr3oSG4u1y5MhA6yNgAm6Egc686+ucpc9tACg?=
 =?us-ascii?Q?WZcu7j6nTG5pXFMcP2rX4+R8qDqYHuyKAjB9evpHHHIEkfRN7sxRPlZiFzgJ?=
 =?us-ascii?Q?kHSFWHaT9HlazgoX7fwPIDuePmgMDNW4OYrT04/jAg9uRkcNs8cLvyRmtaw6?=
 =?us-ascii?Q?oJ0thrjABKll8HJHOgozynfTTIOF6BMAYG+obAW9/bj7mSQcXy1nqqFf0gIJ?=
 =?us-ascii?Q?+5Dn4rADqM3zkYJ1IKRu/J4ok34tWFezLks6KUx2FJ1tEAfeFL6TL1egAobR?=
 =?us-ascii?Q?5ZuH5jl1+XPB3eWowccSWT+8H7flM22blhAmIuvL/1ciRYW2Kwp4srG4hI4E?=
 =?us-ascii?Q?tD0qOadKX+iiLzP4tRgKrrZTov/PwpMB34rb7YqzA+HQOikVpbUKXVOYGsEJ?=
 =?us-ascii?Q?xWi2JKVenJ+Bj8CKChRIsG/Cti+ZsDi7ZDnxO7favv7cXDHCs5mDYWvmjWdj?=
 =?us-ascii?Q?7sMFwzLYgldg6DNBn60tg2keIc2At+aNmMlguPpVFhfBV3KXs4B3OQ34svnr?=
 =?us-ascii?Q?BpmLPWmJM4Rp1NyBwzPgBjdJzxqHEKE=3D?=
X-Exchange-RoutingPolicyChecked: eGKTV+bjqF6307TG7CLK8NsPRnmOmTzQ+zKaDbDMtYU9GZDAPIUyCw5+wjjv4AET3aPkKaD1tbrfaxScDWzdQdZmhRc0H+EDcWsSG5VoYVS/8rxHCNA1AmUPLgVZSB3qemld5m/+ih+SxJ90PXeAy6miew6tPOUYagRGASV/fIdMigwbFnTpBUgwIU6IOzf+tBkQwnrO3rYKyM/Tsy2wkZI01e8vdmjqZIXN/cp2c28HOA0EphFMu8FS+zesprIAvN9hDz/j1LefcpqiLAQFoH2nW9fSt5A0G1n00O3kREPEBuBrX07o1Lj2OTBh2rSb9eDE54v4VArUKo0rtzud5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: b1afeb12-8739-422c-a640-08de7b05c1c7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 22:22:59.0751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OAbAsM3qbkjaD5aERCks4KMMsGy7roX3odUneIRL5q+2VdD18O3mfMT2mWd7XETG0DJZ9jC1ZsNgziJZDVXlDNqRDF3HOwvOSSjFrZpR/Z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5303
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

On Thu, Mar 05, 2026 at 09:02:31AM -0300, Gustavo Sousa wrote:
> Add support for matching platform-level stepping, which will be used for
> an upcoming NVL-P workaround.
> 
> As support for reading platform-level stepping information is added only
> as needed in the driver, add a warning when the rule finds a STEP_NONE
> value, which is an indication that the driver is missing such a support.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_rtp.c       |  7 +++++++
>  drivers/gpu/drm/xe/xe_rtp.h       | 20 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_rtp_types.h |  1 +
>  3 files changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 7bfdc6795ce6..991f218f1cc3 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -55,6 +55,13 @@ static bool rule_matches(const struct xe_device *xe,
>  			match = xe->info.platform == r->platform &&
>  				xe->info.subplatform == r->subplatform;
>  			break;
> +		case XE_RTP_MATCH_PLATFORM_STEP:
> +			if (drm_WARN_ON(&xe->drm, xe->info.step.platform == STEP_NONE))
> +				return false;
> +
> +			match = xe->info.step.platform >= r->step_start &&
> +				xe->info.step.platform < r->step_end;
> +			break;
>  		case XE_RTP_MATCH_GRAPHICS_VERSION:
>  			if (drm_WARN_ON(&xe->drm, !gt))
>  				return false;
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index be4195264286..7d6daa7eb1e4 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -35,6 +35,10 @@ struct xe_reg_sr;
>  	{ .match_type = XE_RTP_MATCH_SUBPLATFORM,				\
>  	  .platform = plat__, .subplatform = sub__ }
>  
> +#define _XE_RTP_RULE_PLATFORM_STEP(start__, end__)				\
> +	{ .match_type = XE_RTP_MATCH_PLATFORM_STEP,				\
> +	  .step_start = start__, .step_end = end__ }
> +
>  #define _XE_RTP_RULE_GRAPHICS_STEP(start__, end__)				\
>  	{ .match_type = XE_RTP_MATCH_GRAPHICS_STEP,				\
>  	  .step_start = start__, .step_end = end__ }
> @@ -66,6 +70,22 @@ struct xe_reg_sr;
>  #define XE_RTP_RULE_SUBPLATFORM(plat_, sub_)					\
>  	_XE_RTP_RULE_SUBPLATFORM(XE_##plat_, XE_SUBPLATFORM_##plat_##_##sub_)
>  
> +/**
> + * XE_RTP_RULE_PLATFORM_STEP - Create rule matching platform-level stepping
> + * @start_: First stepping matching the rule
> + * @end_: First stepping that does not match the rule
> + *
> + * Note that the range matching this rule is [ @start_, @end_ ), i.e. inclusive
> + * on the left, exclusive on the right.
> + *
> + * You need to make sure that proper support for reading platform-level stepping
> + * information is present for the target platform before using this rule.
> + *
> + * Refer to XE_RTP_RULES() for expected usage.
> + */
> +#define XE_RTP_RULE_PLATFORM_STEP(start_, end_)					\
> +	_XE_RTP_RULE_PLATFORM_STEP(STEP_##start_, STEP_##end_)

To use this effectively someone will need to pair this with another rule
like

        PLATFORM(NOVALAKE_P), PLATFORM_STEP(A2, C1)

and using PLATFORM_STEP() by itself without a corresponding PLATFORM()
or SUBPLATFORM() would be a bug.  Maybe we should just make
PLATFORM_STEP a rule that takes the platform as well as the stepping
range so that it's impossible for anyone to ever use PLATFORM_STEP
without tying it to a specific platform?  And also make a corresponding
SUBPLATFORM_STEP() rule for cases where that's relevant.  E.g.,

        PLATFORM_STEP(NOVALAKE_P, A2, C1)

or

        SUBPLATFORM_STEP(BATTLEMAGE, BATTLEMAGE_G21, A0, B0)

We'd need to update the union in struct xe_rtp_rule, but the size of the
union shouldn't increase.

What do you think?


Matt

> +
>  /**
>   * XE_RTP_RULE_GRAPHICS_STEP - Create rule matching graphics stepping
>   * @start_: First stepping matching the rule
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index 6ba7f226c227..166251615be1 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -41,6 +41,7 @@ struct xe_rtp_action {
>  enum {
>  	XE_RTP_MATCH_PLATFORM,
>  	XE_RTP_MATCH_SUBPLATFORM,
> +	XE_RTP_MATCH_PLATFORM_STEP,
>  	XE_RTP_MATCH_GRAPHICS_VERSION,
>  	XE_RTP_MATCH_GRAPHICS_VERSION_RANGE,
>  	XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT,
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
