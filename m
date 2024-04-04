Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA970CD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 15:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B4210F294;
	Thu,  4 Apr 2024 15:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lS1qcMS7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AC210F294
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 15:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712244814; x=1743780814;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K8otxRSwDHMionkJDQq1rL+SgBRpW1v0njh2/+ETpGI=;
 b=lS1qcMS7kOCxNa01pH0TTkTbILgcsuJUs4/OGs6dfTTGNR3NzZwh95cf
 m8C9Q5IVtYjNLt0sgDDOnA9zPJCILasMHyGsbpEZSOX966bxG8Q5pdMYc
 2XvQDPmmRFS0VkpzaOJOO01frYNFsy2ITqQBhFm7tN588jlIDYBA4lDqZ
 muIWuK81NiKrN3XKz5hpwKIIfw5Fb4pmhx/Yo+w+rEv0TBKJgrMvUssFP
 Tff5saLFAa3MvE7PU5Dlacl7qPtUp1//EfoEGI71Qs1CuVDN04xxmGgvD
 RlK5fY9KpsMRBTFK1ijz+dk0MdkUO4lRGcCznKAEf0+Z4K1OOaxdouuiT Q==;
X-CSE-ConnectionGUID: pe00CiS4TE2pS60pn+Qc1g==
X-CSE-MsgGUID: S+m0JjpLSFGwCdBQFQmgUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7404224"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7404224"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:33:15 -0700
X-CSE-ConnectionGUID: wbfSMv22Rda7AYi9DgCKeg==
X-CSE-MsgGUID: 9fd7Q7LSSyKw/l0MN59OVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="23505595"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 08:33:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 08:33:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 08:33:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 08:33:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTJigeNGtTdb4llr+ZZhchkUlBIP8ygzo/GvJEDlitPydiUy92oId0mgAlj63m23nBLKV6V/c8vlQVd2zkkyqoffYkRCTiL1EP+tCiySegoQvFTuthxO2O/gaK/zbnJhbZEMCR+eNUFpBGlM9GOPWrslAtIuUZjOE5AgdAVnEc/6J8IHtEliXE5Ab1AyNFZazReV+gHOHS8Ap8wlSWP/LmDjFNoXzH9BqCKS4v8Mh4Aj+zcOc8GR+yT1yfNOVIvrPuNfW+c5CgpjtEzI1zasrFhjPRNT4VrVBQ1G/LNdumHVq73mzexCuKWDHISipq0Ap/sKjV/U2f9RsdFvmKUWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d98S2XCfNaXytg+UkoiNU8J6P1DRn7EozUbYpDKVsXU=;
 b=GBuYYEdvLTsXDxfhr8RJ0K/y7RkjdegrILWiNu7D7zmXSrQRSD8vDJpuxwW9T/UQbIMlKd6lSrtHxgP0ztK0ETGEYIeVxlKO1VeOIW9r5Wvri2+5AT7+zNukFxA2N6cWUv2/e0f0C7uBExrM5N5zz4kjOi4Rj3FuhnNLyL68tY1GPzyqYFBCvIIMpn3Ie+A1Hu0No2bWCiyXUdhWR/i7RZt7hnn1u11DXwlxpWZfGdU0Mdei/0D/51JKVXhvFAtZXX4YLsh7Uq2zFudE5m8aGVIqdjFOu82Vk9U7xDkaE2THLmEHNPmzjYkw1JxVrhCWm6F9Wl+6eypQW+QlqNBI1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW3PR11MB4537.namprd11.prod.outlook.com (2603:10b6:303:5d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 4 Apr
 2024 15:33:12 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 15:33:12 +0000
Date: Thu, 4 Apr 2024 08:33:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/xe2_lpg: Add workaround 14021567978
Message-ID: <20240404153309.GB958162@mdroper-desk1.amr.corp.intel.com>
References: <20240404093529.734251-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240404093529.734251-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0176.namprd03.prod.outlook.com
 (2603:10b6:a03:338::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW3PR11MB4537:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HJbnt+MUCcX5rIJRSPGBiiVyNnZ6hdj0z0EZsIqoozM4MzXdcGisB3v3RSevhPBgL+OVlh6c2l3twBHxheL/1ghyq6zqg7fIPMAagQzLiNTR+S6UzfEOcKeL/bBHN0EBwcsiFKAUbMU331GnQaP6KoVsWZSldHZa2vHMcz1ZGJa6w8a4SGM9mzOZuDZNgf7Vj6PtddktLzlsvURrGgdNwaw2mHNYa+DsPZjvOyxUdu3+Ewa7AAbpIg7vomR/LVpnEDS/SYftnQOBrEjx6002NTVamQmdjdb0JfPf1+zM1nvVRjiK8nl/90SGSY82mxwgmV7hXO79STsOdMQqWE5Y9mNRfgZS91niXSY26ePAnynPrYL5JLpX/0J/JUc/6viZ3EWWzH9KJY1poCxgAZ3Q79y0vyfoo5Cq3BnsBzik4BSuqAtAPyrshqYWCM3K3+IcbRtTlqaGatse4qG1w0mevMLnwDRVxXNArphKx5RONSgNTTUW5g5FI4wTofiR0FfmXu+JglJv9HNNrKQkas36AtLTqJWyDEeLaMOh+ZuR63aIuvAimdAvq0gEMx67xIw5Fgcy11BWjlUbILiTvXf8W9+VF2Tu3wjQe0Ts5E0Dp1iom0E+5jU7IKewkhsm/p6pkgGM4AOtejMKhTMnMglv+2XyUUPg2Hk+yHa2AMsVqkU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+DZ6f2EEQYI7msFhMhOLScntntS8X9NsM9LK6Q0FEudNa4OHnIcx8rfasqVg?=
 =?us-ascii?Q?X5ApZ7Ey++EwvE9GzH2F45AXer7wvkETM2UUIAf1Q7zwh+QhUOc6JYbQ8EUL?=
 =?us-ascii?Q?qMKeR/ukQHahQALZhDijemS2WBdACjda7miGhpP/6DYPyl+RrQvnsxXTuP7F?=
 =?us-ascii?Q?RXUzJqsq+3lTHzJ3/ZzKd+TkxjlN7gytUWRiji8SwIwafJtKekN+QJWWhR42?=
 =?us-ascii?Q?QJD/GNuE9OqTfiAokcKauAbBW7wzZ56WII7koaxjd1WO5tVCVafYeaN+naQn?=
 =?us-ascii?Q?RPu/nfSBsvL6+ldT+2Ec/6G1rtzSwcKI5ITH9aDHLpkwT3rMPNSnUXfrn0h2?=
 =?us-ascii?Q?/xVj8kxmPFPAjLV8Ykth7KNxy3llr8XS5h2/mYEMPz0cNJt+bE0BMqsNiGs4?=
 =?us-ascii?Q?R9f1QBFrEYfhPZf7Qj6dlOQTRcwHuvsU9OHwqxbZF2gI6zm/iace+6u/2Aza?=
 =?us-ascii?Q?x0AG8AiIeTEGPeKJKPFLwj6iV9+gq0Z1J+2r+7dOF+gyN/XgKtT9rIdhiP+8?=
 =?us-ascii?Q?RCBFpIs8cNlniLX4NUSqDTp5q1liMVK1E+ZmFpDkL01HEtx1LlMwzT5b0jk5?=
 =?us-ascii?Q?HCX8raFWozEus5eFbRH8BuCBtGMr8uLB4flAvqCO8+/jZNnmM3ZhXaCWHLDb?=
 =?us-ascii?Q?i/qGroBGX7heze/WABFsjbsop9Ud8YT/xf5Y2C9l8Z/iHaRyWxxz7CSgnbqY?=
 =?us-ascii?Q?0/foSJ01l+SKAbibpzXvb75Qh1Ygb7SNEZupEELceBCQPMuT+C1HCKKLJw0K?=
 =?us-ascii?Q?eEl2adKdCeas6OswReOljtQGVQH1rcNJ+M8lvicoEbJ1Fod2n/K+Q1cghuKo?=
 =?us-ascii?Q?MfRD1gH/YbjrHfp+81vJklnU5sCHP1m/pu63E6TMAaP70YDBFRLvbiKTeFpT?=
 =?us-ascii?Q?DUXJz+nEpNa5Bbr4NZie6lbrorNNkoeczIWawJ3N/n7Qiva63zOHhHsOD7sQ?=
 =?us-ascii?Q?YMcQ7SGePg/HHnctJa6yz+U00MF0t+EBgMSDHpx2O7b1cR/jDATEZW/S2nUx?=
 =?us-ascii?Q?rkOLQa89W1QqFq1VqtSVg5+FqcmX4nM8Z/qmPEr0y/+xZLiRzQvV0c3ctQlD?=
 =?us-ascii?Q?5ufIGpFHlDm5AMdwiLhQVOsAdhCLipeQg0tkZXelztHtMJxpms7wNjuyvxow?=
 =?us-ascii?Q?KeRCPc8WTcZ4/U0/BXy4tLA7QIIkmhyQ+zVmpTNKVJyKj2naFIYmVwgdhwzI?=
 =?us-ascii?Q?fu0buOFrf9Uj9slzATRj3E2pKJsJGAgWs+5usNpAKBOOEDMd0x5H6a3rodFT?=
 =?us-ascii?Q?dTuzQDU+Q666flt++HXgcea69R9rATynDTYOwaNjhlIhJSRNThmJRK+qKMPc?=
 =?us-ascii?Q?NcEl1bGatjPkSfw6/W9852Wo9wH/d2EMCibJMVE6XL0zBrPgSR/uR7eg5v4v?=
 =?us-ascii?Q?u1SE0BvYF4sgssmAQfhpBrYqoRlYsGuXjYZunfuwQl4yROPFDDjS3L49v/m1?=
 =?us-ascii?Q?odVcdTyqe5Dc3nzaVGuhbdOXMBDeedYR+OLzD2QNDKmD5a1037UVUAiRFOrP?=
 =?us-ascii?Q?cgePs9CjOhIgYFpSg6fNDMTY7z48S2tmgmwAT8SmH3wxOvaMA0jNQLZR3LAQ?=
 =?us-ascii?Q?Nt8iIsXdMiUBNt29pXXYzSUAwunTZMxdpUV1FaVGUQhNbN4/CZhtZkVTsV+b?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb50bf8-b368-4397-3951-08dc54bc8992
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 15:33:11.9644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uy0wnSJxqwSaRnp7VCArSy4KfGn2WArfCjsHQUEWjoSd2PjNlLIwpSRSnvW16XD9IzaX9anaSg0KFMVsNbgtHaL2Y6EJAMT0q1WlGYGI7gQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4537
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

On Thu, Apr 04, 2024 at 03:05:29PM +0530, Tejas Upadhyay wrote:
> Workaround 14021567978 applies to RenderCS xe2_lpg

This is one of those rare workarounds that's documented as not only
applying to the single platform that has the record in the WA database,
but also carrying forward to all future platforms forever (at least
until they make a permanent documentation change).  Since this starts
with the Xe2 family in general (not specific to LNL or BMG) and goes
forever, it might be best to write the bounds as 

        GRAPHICS_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED);

Also, it's still technically considered a "workaround" due to being
documented in the workaround database with a lineage number, rather than
a tuning setting documented on bspec 72161, so we should probably keep
this in xe_wa.c instead of xe_tuning.c.


Matt

> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_tuning.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index bb6db2817ada..cc65e5b4353b 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -93,6 +93,13 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
>  				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>  	},
>  
> +	/* Xe2_LPG */
> +
> +	{ XE_RTP_NAME("Tuning: TBIMR fast clip"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
> +	},
> +
>  	{}
>  };
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
