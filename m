Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021A5C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 18:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7D610E654;
	Tue, 11 Mar 2025 18:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nXA7pIbR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8520A10E654
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 18:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741716532; x=1773252532;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IgYBYgOxoCtLFnVcHoCAZWif+NYn9+WVHXp4SEvkGog=;
 b=nXA7pIbR6kI800wuhARf8HZ9VMVxQxIHAGkcyMIloVuhkKa5vuoz7Ixe
 I3G6SRvrBI3pCjyINvjuPnSEv0kej5S2CHZ30g4vhKqnDvb+l4MGY/6TD
 o4ld4F2yBnG9JS9sqloaEGOwHr8C3+lkHAAFO3uqAyE4MM6BwKu/CkYno
 +HcvoXngCnnwsDYqmwIrWpHvYI1RJJDzyZ2qlrFI/2n3bFG070mLEho/p
 n3mbLoUCONUrFKqOb2Rn+qJOGetUJM++Y/9gRu/SDJmMzJy8BAHXCg+8a
 0SjsMl7TxR3sNjQcrbr9ygloh0jW+sozMKAwYA/Rl70/4Jaqw3IreZBKe Q==;
X-CSE-ConnectionGUID: Jj2LLCQ7Q228kgN4EtaT9g==
X-CSE-MsgGUID: 4U/ySiM6SnqmbWYM8AY6Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53763866"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="53763866"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 11:08:52 -0700
X-CSE-ConnectionGUID: O7+IaRK3SlKmZhNcFM/vsg==
X-CSE-MsgGUID: aqslqiM3T6WwzHJnEl46Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120345731"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 11:08:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 11:08:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 11:08:51 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 11:08:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4xyJy58EZhKD4JuL9QthvLCwhOXSOBb1wCPOFZBcKO5cdFPEoQ3PmkYmgLJ11xDOCkRR63aXv9Nx10xvLeWcGf3vl9jqim1EK+3LM3NPJJVYj+WpA4+yMQCNfcBe+50HGny8OtekLIM0PeqKF1t2FZTQmqT0bayqUPh/wCg1ovbWS7YGE4nRI4Z6PYRyAhaDOHaM1zpG5CyMN2fh0NeURQbH8k8ICHagjKED6W+NxaYH3L9GFknBQjZI/Uh4qAHK8jYF0o5gL02Ghafsg2Tdt445ffTvWbe429RvTEbs4Wv7/qgKxcANOSFzukvMrIAbyvTLLog6SXaMOWRzINzIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Abs5N5SZTBg0FI/YRGIPyo6JiuYlV3H0fkAtv9CCAg=;
 b=EhJ7hGHfn+vsmeObqFnDmLMBLcEXace0/A4CX1uGniTITSEn2c8gZVM6YOCuLQR0gEvjJYdZ/uPlpnP8G/5Qk6Z7z/4uXcgSnezEOmdkyRTrX39hvYLL0e36JYSVuBUWqSK2FDu/146VQIkgUC94xPvTH6t0Q3r0v1NTwyA5sAH+y7Wjku1nyRjZ9fqGzhvGKtUZpr8hJWxghB1maq4k34loRckWK3JuHM22qD2BlHO1DlI1becILFAsfbNG/V8x4DzU+3uddQLQdDtupY7+3NeDhtZmriEPpDxj/IpyPcUx+BUEAwaYmjrnJhskzA//p64+tAki3K2h4sB66QAPlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8858.namprd11.prod.outlook.com (2603:10b6:806:46a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 18:08:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 18:08:45 +0000
Date: Tue, 11 Mar 2025 11:08:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/vf: Catch all unexpected register reads
Message-ID: <20250311180843.GE3701377@mdroper-desk1.amr.corp.intel.com>
References: <20250311135726.1998-1-michal.wajdeczko@intel.com>
 <20250311135726.1998-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250311135726.1998-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR06CA0064.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::41) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6a0234-5fe6-46dc-5d2e-08dd60c7c3ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rkmashEJrT8C92P8rB3bqOYEg6rXcSlhy5seCcXOng5bLp+wZe9nLFvkpIl9?=
 =?us-ascii?Q?6kfZt4wt2GQEMFViU9RkH9Lyety9833nv6X4z7lpt043MARv1DnHrm8nZdUw?=
 =?us-ascii?Q?8U3wkuh9l4IdacTy3G8OGi8Vf9PWqhZEeotMFV8EEMsII1tHaKoUuoggnuDQ?=
 =?us-ascii?Q?lIBinFDBPQ3dA3uFYu9cQrTG53R8kZj88n/Wy5iIGduGUFQRlNVtoFK5hYym?=
 =?us-ascii?Q?dWlD1e8lpQQRFRDHY3mbKBZ9xAbIKqYIww9BVI2H4JeLYCj2/AePwO9p/r4E?=
 =?us-ascii?Q?jeC0PhtBtw/e4CoCb3Z2hGq0g0+4zWzsRqXAidVdNq0qvVJm20+37nruMX2/?=
 =?us-ascii?Q?XR0UlWcureRf9H/TRVSxcHWr7fVQPiN6SaZ89NhvywmQsBnTwZFBhWN+nuq8?=
 =?us-ascii?Q?DESfZnnDVR7A/sEbqbigNrTsVU0yU3L0WJD9q3uE04VJJ4UC7s4yW0RhjVlj?=
 =?us-ascii?Q?J0WWzRVSF+1DDzV/K40SfloLF76SrH3VcYSfNFONkkdtYh4+L4mNJIgrjMB1?=
 =?us-ascii?Q?rPnpxIwxoBEb2adtXEn9nMGpuiRlGwbvSLk48Ca0Ptp7roeuC/OozQI1XlZJ?=
 =?us-ascii?Q?DiIqaYE00zZA5S3J+jeZzb2NmQ+WvDojjomYon4msnKZI8/am3QnPkYkIHk9?=
 =?us-ascii?Q?jJml/qwdnUd1th8d+pZ6MC+6RAafUMbSvgUNSBESgbEBCCopzx6Ul3FDOfVm?=
 =?us-ascii?Q?E66ebzVgNRpOyizWKqcxVc72S4Oli9CZmVPCSfn3026G+og52rydXWkMozaL?=
 =?us-ascii?Q?ot8bCfHyU0EV2adfN/boLU59nn3+66uo71KdpDYm+vtlA3RZC12VuCa5HCcs?=
 =?us-ascii?Q?UBEE/KQ1xPmx3zDryDFsgFpAGD0HyukfERlc0fHpxGTrWTQJ6yFwugSsUMJt?=
 =?us-ascii?Q?u3VpSJxMlszdkVQxWUw4hHaxF9HJzSu2ni4koPczLKGUkB1uaK/W5g5u4zqD?=
 =?us-ascii?Q?cYQSWxRBVN+TtgfdmY7La++jV94qOWhOdkDZL7pcC4t6o/tpA74E6Tbm0d7b?=
 =?us-ascii?Q?eLJK5j19A8+Xxcznxi3qi/yZcdn2eCP/J9uKUgaPO6bRAEoWMdzsg7WQ5uC8?=
 =?us-ascii?Q?0hNJIztr2oyhrRYgh7u3jZxGzupiOlx/g3QUfpPVDeK6Dytpq+uae0UOEaww?=
 =?us-ascii?Q?wAcEY6xtGKB57ILgVudJsw7CFzd+B2oQWILZu3DHythE8M9s5KuJ1xEhnLmz?=
 =?us-ascii?Q?sgqI5rv6ETIfZADX7Is87KWr5PWF/gRYrRkKIvF477h1ExwBLmZuogI9q1sc?=
 =?us-ascii?Q?mgHGjwvoHRYGH8dQhHPQweMWgwAZ5Y/2lFxYgho+ZIpiFBggLPXJTa8TYeaQ?=
 =?us-ascii?Q?OSZ5sYGcfgTJUUmdbLC1vZJS4uuzifaTIJAo2scJEopcRimxRJDyDoDrDEwN?=
 =?us-ascii?Q?TntMBEyY5+T0NbN1ulDYioZCYSCo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wvyKixHESei298uY2cSO+SWt7TaW9maB7qYvph2ajavlh/txhyeZGtUz2D+z?=
 =?us-ascii?Q?gci1ZmIhWp68C3i8a0vV7ynizOiqKPVAJfuZgDIkXkrEN/uG1WYtikkNdUy+?=
 =?us-ascii?Q?lzsVU8OT4QK1S0xds14EHtSHtUbdZNWOPPwotfCgLuBpi9KSzOHOeri5WDTI?=
 =?us-ascii?Q?3/Us/45NdxDE3EWJEDn9DdJUOrQE09VzAWbcUduBEjJCH6+BFQz3qJUoOtwq?=
 =?us-ascii?Q?uywPBAqSgFqCAMT+L9dQK1fpPqWGKgrpYgN1rFwmfzvhEV9YU4RwbsEgqbda?=
 =?us-ascii?Q?vmQkvg+FYJ1gFstkiabMVt0i7WTkU6bwe0ctOHh8veEm0GrU+msIQM2BL4Hd?=
 =?us-ascii?Q?3iiZ65mGwFR1OEnAqN/1JcJ164iUUuCc7W1Pp+9pZXhrX2oKb6gCVqEkFvWH?=
 =?us-ascii?Q?JN3poGdrQQdJ+jpaASbJDUVmV3e24JoLRvszrOZrfIFQ0g4qDjQbarhipj0u?=
 =?us-ascii?Q?ZD8xxd9zLnMpXejKcJyTanWqiOMPDYwz7246TXa7D5ucJ0bM1I6+BaOWlOAF?=
 =?us-ascii?Q?3duzYW/IKPsenAmahYXzQ6Mq8Tn94SMVB+d+CP/u6BNLzgB6kld9Ar5gSVEn?=
 =?us-ascii?Q?y4gyIHwnDoRIKKs5jt7bmvUAqpNupeRbPSJw84TUla97kTRSFyY9t4r9ShKi?=
 =?us-ascii?Q?yAXhXkvpRQJJK61/hZyns2KccTZ3dPVwQYrogGfT++9Q3JgeFtxYTON/oS5A?=
 =?us-ascii?Q?dYQoVANW2cTDaVRD1npI9/wufeAaoGs3ub9blb5TqovfUd0gsO1+H08Dw61v?=
 =?us-ascii?Q?cIsvWAanfabDm038o8rlHCtYXjaiT0W6C7wHKbGCeXUU3oYG/g+bQOKfyQ3i?=
 =?us-ascii?Q?2MBkWOLmtDy31+LbMGQ/yWKqZiRSrGd5wo/z0OoV6A56M32U/Tz10ZUdNlyK?=
 =?us-ascii?Q?/oF9F3wTznWoEunF6wTPTGoNoD/GJCUJ4sQ67vLWAVKixnIaJ4xoEdUS6j8P?=
 =?us-ascii?Q?BQ4O41xjTAF+hEhnwAMCuWDBbAditlW2DsqdaJIp4519nsacGrlGbhKCvzqm?=
 =?us-ascii?Q?QpsLIWdepy6nwi6n90O8JjRcNzi4gR1djB6+QQTb7Ne1BbIdFnvxbHvi22vr?=
 =?us-ascii?Q?2cvIOY21rtB15lUrsfoGnGFYGORlk+c0omqhdN1R74/iqMjLPzUvKN/GMGM7?=
 =?us-ascii?Q?pk+m1vsGAexMWk4T0g2RNXu1kHucbL1EXbvkCKw8PAWsKsbhoKaYxbF+5dcg?=
 =?us-ascii?Q?ipBB1jkEm9KzmUsIxfnMfm/QEexIgf/r1mjy0O1FduNvrpvZOK4kaHc5IWaB?=
 =?us-ascii?Q?Ya6rRxUGR8MRnvAXRv11oEEfOGYYRWNmvSKRu2yqHMGUilYYJZRfIuhyMhc6?=
 =?us-ascii?Q?5sQvYckHYIIH2bW7k55qdnEgHPEORe7WCTO0hbtKVfunWNg0gGhFHvwOtnV9?=
 =?us-ascii?Q?5yy5xUWR2da5p82Z3uuDv35Exru9s0gN6apWLNY/uogJgxVtokg2rXONksfE?=
 =?us-ascii?Q?e1MgocK67v2mkW4EJ6/g5OajiA7cIEY5GCEYqjxUV/a1rYeUQ+d/4k1UmqM1?=
 =?us-ascii?Q?jDlQeGjZssOam9lAe0byZaZNSB1B5yMo+Txo9w1s2EL2WjcvSMjiLPoP7dpb?=
 =?us-ascii?Q?c1AOVWl/6NEcAbpHdGFeiLO6gqyVNWYWHwqoxN4f8gx/e5HUF4Q1GBA4S7Jv?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6a0234-5fe6-46dc-5d2e-08dd60c7c3ac
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 18:08:45.5602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CDX3JbitPLhdIpg//aeNa0AAvBmshRWqkQHoZMOvd0spFvB6ATZEg3bD9ZMXlXhb5xMYB3pBAFbOWebHOva/1ekZgJlVsa79I8d0NF3ZRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8858
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

On Tue, Mar 11, 2025 at 02:57:26PM +0100, Michal Wajdeczko wrote:
> While we can only mimic read32 for a few GT registers for which
> the PF shared the values, we shouldn't avoid calling helper code
> if we try to access non-GT register, as then we miss to trigger
> a debug warning. For cases where sriov_vf_gt was not set, just
> use primary_gt instead.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 70a36e777546..13e06a956ceb 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -204,8 +204,9 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
>  
>  	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
>  
> -	if (!reg.vf && mmio->sriov_vf_gt)
> -		xe_gt_sriov_vf_write32(mmio->sriov_vf_gt, reg, val);
> +	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
> +		xe_gt_sriov_vf_write32(mmio->sriov_vf_gt ?:
> +				       mmio->tile->primary_gt, reg, val);
>  	else
>  		writel(val, mmio->regs + addr);
>  }
> @@ -218,8 +219,9 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
>  	/* Wa_15015404425 */
>  	mmio_flush_pending_writes(mmio);
>  
> -	if (!reg.vf && mmio->sriov_vf_gt)
> -		val = xe_gt_sriov_vf_read32(mmio->sriov_vf_gt, reg);
> +	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
> +		val = xe_gt_sriov_vf_read32(mmio->sriov_vf_gt ?:
> +					    mmio->tile->primary_gt, reg);
>  	else
>  		val = readl(mmio->regs + addr);
>  
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
