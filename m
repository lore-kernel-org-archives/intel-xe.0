Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B8AC02183
	for <intel-xe@archiver.kernel.org>; Sat, 18 Jan 2025 01:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A0210EB8B;
	Sat, 18 Jan 2025 01:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WLhQqAGk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721DF10EB8B
 for <Intel-Xe@lists.freedesktop.org>; Sat, 18 Jan 2025 01:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737162148; x=1768698148;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AqLty/anfhloRvOUUBe6tSOv4uy4V/2prRMaUCpTaJo=;
 b=WLhQqAGkeRGzP8enD6zLYedG95eDBH5JHPvZbbprQNiXxvTYfrqig/C7
 vT2SRWjtyrqzqNmthKBUNKoSSl0ud98tXiP8B57XeKD9g/G3AEC3i8M88
 2QjPLyeatQvf7S+jIGCasPi01a/eoc9fVacHJhecHjoO1nvCFSOMGUsXA
 gBwEEg0lJ4571NhPCluAkKhFqYG9EPKfw/MDNUu5LjTqTqqhv7+gkq7pU
 2dv0f7ze2Y3p+n+20nHD29sQPbHECexXV/nwGAKumaVPgyISPMFnvpZsh
 WPDBwhXN64pAh/BAFczJ8D5CG/1rLlvU77JaYmy5gLgBL6mMOP7ULBQue Q==;
X-CSE-ConnectionGUID: E7yzs4jrTu+A+1l54GdtcA==
X-CSE-MsgGUID: +urTn3ynTl+eS1jOXoEk7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37724305"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37724305"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 17:02:28 -0800
X-CSE-ConnectionGUID: csRuKTmgSmeZ7Sdr7RGXIQ==
X-CSE-MsgGUID: 7n0/V+ZARKywjmMy4Favtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110012559"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 17:02:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 17:02:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 17:02:26 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 17:02:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gqd2KLU51IFfINEXGy+8Ou55oNr14Df3wz+hwKZdBDA2q5EiqwuoI6tms4EPozUHYPtvvBUDM2rKDjUX4hPO9yIFK1X5GndtitO7aaLhjUjRjX0lGHFT/e0zKuRfRFGRT9FBkZwuuv8gX70haMYe5Fv/pR2ISQ1Er9MQR1xiuXVWxgmBNf/yXUcPgDKeBLG++/gl28abflWyTBRMDAmg9hnBWfbP3NFjUV362TI+zrWscv2esh9yzdYQpY6cQgDuN6oud0WvOJxekMbbstH8LWgBpmHxW2o8gDN3RgRP0SLxibLlq5L622p/O5aljhAQvIQ1iad1eJvnHKR+IKGfhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ty+bn9LJxefIIsJ/aAYdcbnkhfQ6losap0sT1y52CY=;
 b=PEQ7SoUszatNOMHIPoSGt5rBuNMCN8ugWTNJgweGIzCG3eZ0NbD2NqJsdCZwj16vBw7AmG1jFyw9FSxtW2ttb3ViAe49xt+zYtJrBMQtFaPGtbMoicI2cQC0hSXFxOZi1VHa9cYjHcQC7msS4CXLu2Q0ZzZrISZxqgXXKcznV9JG45jo3I52TwuTNB3sFGVsg6opnB/SFI/6CHtQoAA+porx8EVOpXa65/WF0a/a9R9FfdTnGAEWSfzb5MlpmMYLkov1CBmdBnt4OSN4uFUHs6pnYIs56pUocLB3RJ5bzktCdI5CR5TL3FyCnbXxldisVMwgiXDyl7V38oRJbjwNfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA2PR11MB4955.namprd11.prod.outlook.com (2603:10b6:806:fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Sat, 18 Jan
 2025 01:01:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8356.010; Sat, 18 Jan 2025
 01:01:42 +0000
Date: Fri, 17 Jan 2025 17:01:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Upgrade complaint about missing slice info
Message-ID: <20250118010140.GC4460@mdroper-desk1.amr.corp.intel.com>
References: <20250118005403.2960807-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250118005403.2960807-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA2PR11MB4955:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bad9009-ee8b-4193-1595-08dd375bac34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B53ZLyFngHN/FLSFF2XqKtK1ee3TG9mfKaXp50kA2MREiMerwQtOFP+ekiEA?=
 =?us-ascii?Q?/L7Ao6uT6NZ973HI9pbRq35hs2UmBchSEjzqcR5JcvEty99fx+W7wbSrIxUj?=
 =?us-ascii?Q?QMWtzdhXJXy7Cw4e8y9u+eUVwugz6BoILJ/CN64K1Hj9MuIIdTzUHDcalAqc?=
 =?us-ascii?Q?zbT1EsNZHakVGgW+CXl7NtywcDjapvwZxBMQFRAVrVM/Z6ddTZwGtJRD4AAt?=
 =?us-ascii?Q?v/Ks/2oLID+OvealJPXeefGgWEzpUfSfEzCMm1D2YEcMdDQkn+Cf2MZ7t2Jr?=
 =?us-ascii?Q?kTEE8AF2AodlqDd/4ivrifJK5lcZ0qdFQqltthTmSc1SuEZlMrCfbL0yT83W?=
 =?us-ascii?Q?W66/0S1ZWI/QKwU624SbQTU1/xrUodE0lq9N/qhaaKoY5hW0tkW9HBJDZp+I?=
 =?us-ascii?Q?fuI+XkZNd1vU0jOMNmwFC6HJCNsV04Y+CIjeE7ax6QRmiJfB7u+CMsgFi0xE?=
 =?us-ascii?Q?b6pa2+bc+3nKKbvU23eOWNwl7LQz0NldQ0Ld/wzjyLUNU9c0qHtHbPFREBEd?=
 =?us-ascii?Q?xuS7drSu8ic4Rby/jobb36AEVPCJAAfZpe+EzW80XY21GmKkt4GlgouN1f3H?=
 =?us-ascii?Q?yuY28uVv9wpmh0BWkEB5TpqmzhIiMvzwLpWABzdzSCJ6pZQlz0I2t6JUSRnt?=
 =?us-ascii?Q?L/hEGhbdLyRQDyi1M6XOc4QpF9DssVOA+GglDwwToBpXmch8pj42b8JI7nBE?=
 =?us-ascii?Q?LqzBeNelsFK2oJ0i36PWZiWxJZKQvbWHn4X9fD7s8FeuVoZ8nWJ6AYHu7UKb?=
 =?us-ascii?Q?1QEaMO6a7IeZUOG5F9hGcOBP1LHKm8C+HK1KMi8XDOGR21kQv2ZYeYdLIdsQ?=
 =?us-ascii?Q?p4/FQAWKvNslQNPbkpTnaMxs62eTLyihhKEApKZAPitqF98RYYP7bUdYbWhw?=
 =?us-ascii?Q?KzhQFYsStC90MFbgpPG8pmtVlLX9WzV9aPCwXQCB8LCQXLg61Sr1to3nlepZ?=
 =?us-ascii?Q?ExXuqZ4ekp61TJybVQ110OgIh94kypJJhsYtw1u4uuSZxzcIESF+ZGliiU8V?=
 =?us-ascii?Q?xx6J87ncB8sxKugLxb6/jfKlSwyuZGPNp1HQF5KAWbfniZh1XXk9RKb4j30+?=
 =?us-ascii?Q?mxyH8d9ekqHNE/9Hryr/bYIoPhaMBO/ehsFN484Piwq5OSbh+yFO2UMcOQ5x?=
 =?us-ascii?Q?ZG6xGzH51ITcd2SVNny0E+lk0/xmEJCLebVGtCz5Mg4OGJB82ZCLrSjsLHVP?=
 =?us-ascii?Q?0qfN2PMNngmBozggk5WRGhyzZ0zpN3qmP/mR9sAkV8mkvo4G5IHjVaiB6tX2?=
 =?us-ascii?Q?YuUWxLiUlTuK8dnxgcD7Q46Ib9VwiKuCSpLDF4UsepJTYg+yGDYCe11XzZUf?=
 =?us-ascii?Q?8oKPYjtXm67Ci0Y//uoNzQIVLCQs+5uUoyg3tgMV5QkMlhsx6WbQ6eMdyOjf?=
 =?us-ascii?Q?7K3Oy3tKHIZCVGWsfJF397z1LcOi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p/2jHQB8Sf5DbFXWFd5iMqVereotzKwV6xu9Pro8JUBNZ4wxYBBr0+zyXmxt?=
 =?us-ascii?Q?9hanqcAJ3IcxaVEs/XSStXbFj6c89ayMSmVKsEtF2H97e1f/v8riFhcP+EjF?=
 =?us-ascii?Q?uJgIl4EblChb7jPJSbcw21aks+4GxoMCpEcQdR4Wp1hMHMKjAgpCEd7fuKD6?=
 =?us-ascii?Q?Rx/7/CAWj2F7PZzkoWGnF6JKa0JXOg32++yoHueuOnnA3YRPj6YuTWZOr3Ax?=
 =?us-ascii?Q?hG6Jm/I8JAcmRLs9596Fxm4p50Dca7i3aYqIB5VnaO+gRG4FajoqRTuEd+GQ?=
 =?us-ascii?Q?UqRisZOokPnlKxZsGY+Hc8iR1Vw9SN/VfkP+iPITTHr3UjdHOpl7JDdVmk0l?=
 =?us-ascii?Q?5uoqt6KT/wPupQIKxbG941ssgiY9aPwgM86WEjIeFB1CMmshL9ESdlaMNsNh?=
 =?us-ascii?Q?LDQ7TmP0ct5Hy9TLkhfLwuu3kf6WrDjqWCR7RfcKJfcWkDS0zITpa9vrl3tG?=
 =?us-ascii?Q?C8aZ9jaPSzcXnmItFko5YqmoYoS8L7mxjtDAJnKsExIvB/4XtKNUYRdd6Hf3?=
 =?us-ascii?Q?sHmJiMIbe7XKv0xnRqpz+K7agZrhezyCdB/nGn/4/eBzh2KVanTGkZ7Qo0TZ?=
 =?us-ascii?Q?GC0XUXhxuEoTdH4SaHvW5i3PsC7Nsmc6RMVATKcNH1PSDpc6+YV3jnwVMYJR?=
 =?us-ascii?Q?OBOVE3UWUk+7DOSCh54956OyPdlQf9g6VxtkB8rRd0lfVH6lxrzXwiaQXrRb?=
 =?us-ascii?Q?Cba9O3bvgarnpZVtJb2EnA1WWYQxDp37ap2ohFfTxBOlGMfCy+FtMlnjEUHA?=
 =?us-ascii?Q?oO/2q6dBQiakrljM0E2HKbz6GKwE3TtwPtVXcV/fynDYp7ZosD+alY4gNJjl?=
 =?us-ascii?Q?lzztv7pKHoWoUGwjzFRDRflK3uEfBL9HFaK/OHXpswoCAWBLufvTqRDB3TKm?=
 =?us-ascii?Q?B/k62e9hldmaXnfK0hd9NV8ulirUmMPSZDnWVpr6nqWYEUiuQ5py1+euAtKe?=
 =?us-ascii?Q?ey5239KowK//9ROhKv8pkBoy7d8kuGZCoHA5mkwmHMyqNdppapSGrGiMZD/l?=
 =?us-ascii?Q?maJ2Cn87GxCxtJCwc2k3uNtS/t+pW+zaM0JyAYyMcWc3DgKxth/UNVUcgDQP?=
 =?us-ascii?Q?/b5s2mT5XdotyLAzgEQpck3wHekzFfW8B3Dt+7198r5LgRS8FARh2Es/XbS9?=
 =?us-ascii?Q?SLNtAsq7iGm4/ymMdmwSu2s5uDEkIE67bYZh6bSctjbefNnQtWowZsT/FAJJ?=
 =?us-ascii?Q?ZT9thKkx7mZyD6Wq9rw/h6cz0WGdNy+d9Ez0bNC0NHhbG9z/LqzjUW+KX8tx?=
 =?us-ascii?Q?Ck7TvhK0e26Bsx5dznt8PdK6nuXB3Te7wVBrgYwyuXQ3PP/Z8hyvIdLFVSIH?=
 =?us-ascii?Q?uCJpkEj9scd+bcOaFR1SOpUmeFDNhbry7xpKxO6FJRr9CmwLfF4EZ//eUk6W?=
 =?us-ascii?Q?zdv6pylTW0r7Y/CR37wMTugOAMHyQX+nekZFKG7RYI/RBRoshuSWZeGeAqSv?=
 =?us-ascii?Q?oq+gNzoHdpf24P6bQBVAEjyK0Dg5HT81LuA87JhzNjE1jrH0ZgW/B80qMSm6?=
 =?us-ascii?Q?kj9vWXlV3Dt1D8CPxPHsqbKqAopQLReWMnJSXHVRSn44qO/0FWA+XBI+7Hly?=
 =?us-ascii?Q?Mj+Lq2RANNXHaP/Nf2ihxTwv97xU5WdjMeZEthEc6zi6kNR7CmrYZ9pmFLIt?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bad9009-ee8b-4193-1595-08dd375bac34
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2025 01:01:42.9025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIcpvaf2OtJ44jewCdhBJbGcUwm2IgtfiYltyoFtS370SGFqCMWRFPdQanqTWkL/Qt7KQ20vcQycJJO/65bBtttHPLGicyfy82zM/NeAvTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4955
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

On Fri, Jan 17, 2025 at 04:54:03PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The steering code needs to know slice/subslice counts and this
> information should be retrieved from the hwconfig table. However,
> earlier platforms don't have it, hence the KMD has a fallback path.
> Newer platforms really should have the entries and if they are missing
> that is a bug that needs to be fixed in the table.
> 
> So update the complaint to be an error on newer platforms and remove
> it completely for older ones that we know are bad (but are not POR for
> the Xe driver anyway). Also, re-word the message a little to make it
> clearer what the issue is.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index a1676b787fdc..605aad3554e7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -341,7 +341,13 @@ static unsigned int dss_per_group(struct xe_gt *gt)
>  	return DIV_ROUND_UP(max_subslices, max_slices);
>  
>  fallback:
> -	xe_gt_dbg(gt, "GuC hwconfig cannot provide dss/slice; using typical fallback values\n");
> +	/*
> +	 * Some older platforms don't have tables or don't have complete tables.
> +	 * Newer platforms should always have the required info.
> +	 */
> +	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000)
> +		xe_gt_err(gt, "Slice/Subslice counts missing from hwconfig table; using typical fallback values\n");
> +
>  	if (gt_to_xe(gt)->info.platform == XE_PVC)
>  		return 8;
>  	else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250)
> -- 
> 2.47.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
