Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD61C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 23:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2E010E82C;
	Thu,  8 Aug 2024 23:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AmSmYQk1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B1810E82C
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 23:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723161197; x=1754697197;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EGMwOXfEm9G8ZSInzjP53m1h4D1X4HJmuMgBzso+i2A=;
 b=AmSmYQk1ZCuVdJrwIXYgqiUo7AKlNcvrtK5f5hxJ8c9Uch3G6oqBzRx+
 YAVKz4YyU/tSgi/rb/z3lUCiaibjA1WkZjhOUAKfYY5bDiamK0fsi+WXY
 xl6Ty28eMxHIloSMu9O4PEu44thmGgUHrBAmtg2wgH1tadvkfR203OOkI
 x+nl/MhuJyeXlSYGWH0HPGiULfnB3nS/GkNfObDNBzXz5x7gkJTMvrTwX
 zVJ3PSDxc/xjrtrFo0VHuI2KRoP5nd/u4/aNBrvJcYGvVgGmfLRRm9WB2
 g4R8sxoThXhVaGnoIsgfMo6HHNla/hUZ239lCoj9hMh8Pa3oNB/j4SwZq w==;
X-CSE-ConnectionGUID: M/m8C7cIS12K4OzqwkOg7A==
X-CSE-MsgGUID: /YQnsfHgQiK4fP+RJ4rcKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21471837"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="21471837"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 16:53:17 -0700
X-CSE-ConnectionGUID: tYODf+rYT0ulYD9GQjUB0g==
X-CSE-MsgGUID: C4ZAfgU6SFKpmlY6KGolTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="57049104"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 16:53:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 16:53:15 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 16:53:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 16:53:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 16:53:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPV6YQwbE6YZvlC/tSXap2/1wqCXSdrSoZgKdBcIV5aK/B0qzFLbxSYrkNA7xAqihI9eCwfBNw5KCsvvoixHSzhls0iMcpMq6yIs0J7i/5AvtRQIzWo+oxGWnB1nvfybiDt6HjoJgODisgn9WOOxqBSyWebVhNJUPFN4Ow+lmWHgDAQps6qCULCtqWeEx0ninPoWxRnY44p/jELwBuxMNGRxRoAZB/ClPjyKbLBBGt5Ryvm8+oeSYQNnz9Hx1rnUrAoOw4gZ0+asCgI4phn8VK3s4GRm9InMZ8qMcuOIFL480A/tcet1We6MnMAXFCp+0fsv2PPltaH3sJoj+Um/Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+QyqWy9SBsgDia1XC28WA4Ow6913i62AhF8hd66L/A=;
 b=juTOc5pST8pxG6NI0g2y0t2poSuqZ/nMhQOoV8QWL5fF3f3eVp/Kh6PP7lcqvVFaaVScM9fbpy1uYqBC6U9tvfjTasDLknsq45OE+h8AGjCgFJZ41FyCIG0mA5VkKIyp/bTRL+bYn+4495LbnLR2yU62j8ZYmcwkHVnMzG+bpIqVqLuXI7r/0FUonqdHI+9ZwPRQA3X2qyZ4cpjF771JAcBLqCTpv1wBoqm1x5wymV1fdoLiDbZVYE5V4WtW/2TJWCc9PDflcxX3iHC4NMN4Q6Cml10ZTDUeRf5UTxsmbMXU/7h1aMM4CG+gZqyiB0WNsoKW7Z7hIyzRFAL//YcM/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6323.namprd11.prod.outlook.com (2603:10b6:208:389::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 8 Aug
 2024 23:53:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 23:53:12 +0000
Date: Thu, 8 Aug 2024 23:51:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 02/11] drm/xe/guc_submit: Make suspend_wait
 interruptible
Message-ID: <ZrVaFfu1QvhglpYB@DUT025-TGLU.fm.intel.com>
References: <20240808184220.1715625-1-francois.dugast@intel.com>
 <20240808184220.1715625-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240808184220.1715625-3-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 250d87a5-188a-4669-652d-08dcb8054326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WHxejTEUpRne2AsOXQhCJumrc515KiI48ZJQGFtYQTqjKEF/E/qAua/FmZZE?=
 =?us-ascii?Q?x/JFPuWHyQdW/0XPk0i6DBXJ+msbMwyRM2i4kHYrgwMc+sGDqPBQWawafGM4?=
 =?us-ascii?Q?n5YVJhcTK18UFRvFSwOXbZ6kQG73IRJGPJs06N/pPHl7wsl828f4HI3TK/58?=
 =?us-ascii?Q?wE90Gui1S5Xqhw5+uFNlpwKaJUlqNEoR9PmTiA5gYH5FPZGfjx9YBRgDizBQ?=
 =?us-ascii?Q?R+4vdmNo7VgAcNWR52SO/k6P2mquRH8ZJN6tilEy/B1fTH33TY4yUfRRZc8z?=
 =?us-ascii?Q?PHX3dslVopEhNB6p6L0jaGi9+EVj7f5k9ghDcB8QbzIponLBQcVXUlUIE9wj?=
 =?us-ascii?Q?V/lTu9xvEMkFKqWr/PG+fprnlZV9sSP1vyCQW6ksvTTFK+15N+P+Tuw0Asbs?=
 =?us-ascii?Q?5IVEcx8evUm70+UYO/HVBl+25rRox1r/RA08c64Xg5pYQ2HegQ1ioACbyNuS?=
 =?us-ascii?Q?OZ2lD/XYVpPPL5T6v9/GDPR3URhykipARic6LgaNYxEkGCeM2V4Y5qmAgVSa?=
 =?us-ascii?Q?szb6dIb8igX7F7zrjbI7A613VGva55985vONFJncN9XFOJkD9JPN1TuHD3hr?=
 =?us-ascii?Q?w2k7EZkDa+coQFn+eo6Dpj7e7fhpnXXmHpYXnJJ21u2cdVXkp5bieAHLiXWe?=
 =?us-ascii?Q?uZ1p47xq8Ta/jhvXOcrESWIXOnVVKGQt1rem5C8br9GuXzBwqc0pnYHxWwB4?=
 =?us-ascii?Q?mBKV4fZvMk6ODcEwya2Srwd8LepoJ7dNCkrTfp/5/BO65MK5AeEeP1LLk1S8?=
 =?us-ascii?Q?4vbaChoCCpiAT2ApL8f1C14TZWz9wTOZfZ/oE+Bm4Ass6JfKgMHGkc9NZm6O?=
 =?us-ascii?Q?tDHd/OYc8ud4CN46macmr9j52vqrZRzqW55rjcU0qoT0RrbP9DLEwl/YekPD?=
 =?us-ascii?Q?vNENrad5AtIU377FnH/Omw1Df3ncSHFxUkphmCqFcOqgLpUo7qO2IZ746PMS?=
 =?us-ascii?Q?s/St2tcaWSh97v/OuvP/z9tyHL+ufG9pn8KmM2ybbtSgjqCUVdOho5AL1zv1?=
 =?us-ascii?Q?4MVH1HeGGEljquDIj9h9sG2BvfdfMXeTbxuYQsZyhEGPpniaJNzpAPCxYQGP?=
 =?us-ascii?Q?oIxUyd4G85XTIngtQf+H2FMYCmhXJkWFk4YUz/+mNqMEAU8B968KC4yMClXv?=
 =?us-ascii?Q?AsQkSepkgG7qzrO2SP17P1xv89tCc8a/prrPQYOncVRHfcRk3KpvJXRbriXu?=
 =?us-ascii?Q?D46tSI0T+Wbsop6/fD/U4GzP6Cg+rCozLn8zpe3cncJmV0w91UXRxWGFBzbY?=
 =?us-ascii?Q?v/6UXwtChAQGGigoXmDudZjSfM4SG3f98ohvgaDD/fkX1FEYG+clmiyMwiam?=
 =?us-ascii?Q?4DN+SpeYchKT2+fCwTT12/6N0qo1bhnax1wBfvPZHV7/WQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i6wquqBwCY7n/guTMkFIEc0y77bB8xVYO5GNtuERmX+t4YY23Of8T7SAe8pJ?=
 =?us-ascii?Q?2PNTvqdNlblhIBTXfEkSH7/XxM4sktEmUXop/l/uekZQZiv/XpLFPHshMLRM?=
 =?us-ascii?Q?RhVEMAVzbaxPs5Y0meCjg1p0rb8BZ8v53ZS2JiunVCQMo2RuoZ9Ww+xKbBRI?=
 =?us-ascii?Q?uCw82ikPtNEmMtzp5woSr686JfjrQjr5DeYpkTuufRuI0tsAgo8ohOeY/Vir?=
 =?us-ascii?Q?k42fWcb7R/Q/J9m/NqiiuuGnGw6CjeaFrpYnCbr2cRs8V3vC54Oj9BZ3henl?=
 =?us-ascii?Q?H1K0VR7WMPBHzYPOPjZRkAN30GKy0LfhzfWi7CaaISMiHK1rw36TFFUVnPiZ?=
 =?us-ascii?Q?mwrqhJKQ/tSFer6D3szGsoBydG5PFBG5PwarTYPeaD2qVOb5J0aQrYX7RLme?=
 =?us-ascii?Q?1WnlyCNvgWJQEoib82B0QomSQQmjuklIFNOcaCKIiYBbFrUSjHAxGeQ7XoWO?=
 =?us-ascii?Q?vvBP8v7KDUzOn5hsTpeV6lTXUjspOll0Bf8osDhWzMmle83gdj7Gdnu1L5rf?=
 =?us-ascii?Q?emENjoI579C7nFxd0o7BS7stNR5RAjbfykBb2xlXXokWCqM94uRUqEbQ4/g0?=
 =?us-ascii?Q?J2eptsRFi6du34c/TA2yF2/35oorhpSzeXA3/6BBmcMOCYc5H1eb5WEsUfT4?=
 =?us-ascii?Q?qr7fvhjy94Zg4wmr1TaWiCIMvUvpz6UskomUOLxPhHJODdEQJkeIYDv4V9S6?=
 =?us-ascii?Q?XUj4SnQiUX6qfu8Zdm4aWDDH06KuDve0g55Bu4+mc5XzwYOlyK7vZJkZkBCl?=
 =?us-ascii?Q?BX4leENnXwMqGHLes0e1h53Twfb+gYcljzayzP6SIfsrvOSHce+unbLAHEfz?=
 =?us-ascii?Q?h8Q7QxoCoRD1tVNN7DaAPJ1VH4DvpB+zKwMbbMkijIQxOswwYazDn6WIjUDe?=
 =?us-ascii?Q?lY0Kb7GT0xWtfrtxu2gM81ISnM2btcFZ8RhNZtgoQ0h7Bg9sopQzBlMpM/Hp?=
 =?us-ascii?Q?aG3gBeJjxp2xfbyVEq2SMvA0KDvPLw9wYP080J2vdIRRs6oul1WqN1WXKiGy?=
 =?us-ascii?Q?BhZJRJF2wVcxp1BC5Qr1VrZPlQWuLhM0QRopMrNjRgCY72kgubxQyh31/CM0?=
 =?us-ascii?Q?/hyBX8C7vTtEPVc6QoxSM0BHxD1/qbNYu9iohz49FDRmuxzYyb0zhF9DvTlM?=
 =?us-ascii?Q?x4qRQ8Pccu9t3hP0B3xlBvUXVxjUgUUSIFT6oatvuJ7SdUDP7zJOkWEp8tmp?=
 =?us-ascii?Q?kZDhdJfkhcqv0TTzvc8f/yunhklByK1hn0Wf7FKeAjbFRR5Ro2FHr/M371bK?=
 =?us-ascii?Q?ojGtx3KYZNk+97uMwVCaeQnvy9E5IEqY3J5yWB9KKxHTrdp2uvRxzLHCZi+L?=
 =?us-ascii?Q?nnwWmXmPQ+8/WrlBYPHOroXp2EpNqMZUCzUz1+eLHrhvzmyj+UoQmTp/fb54?=
 =?us-ascii?Q?MzKeGLwCVMrFihIv2eg8pKGGpBZMqhAjcGkGuhIEeCLNYIa1E76IREmZlx3n?=
 =?us-ascii?Q?toknIAbClQEysmuGZxQlyMSdXgWHWzL9LllXNLBYUWM9HHwh46XwydSCTQ/4?=
 =?us-ascii?Q?mIatd2amchI85luZu14WW6aeHDBGk8Q+zrDep/Z34mFptXNoomz3pbYAS7Gn?=
 =?us-ascii?Q?e9gIyMngM4nSXyp9rRc0PYAntrLDdxDs+OqtLwIhfBDTo5LUu//u+7d8nwZ1?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 250d87a5-188a-4669-652d-08dcb8054326
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 23:53:12.1852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNhYzAbNekOKpqbJqmW0RHqQAQl8fs1JHyBfb2UOlXatJ7A6QDVpoTz8VeYg9wYDI16IheFnaVVKOqICWTX79A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6323
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

On Thu, Aug 08, 2024 at 08:40:20PM +0200, Francois Dugast wrote:
> Rely on wait_event_interruptible_timeout() to put the process to sleep
> with TASK_INTERRUPTIBLE. It allows using this function in interruptible
> context.
> 
> v2: Propagate error on wait_event_interruptible_timeout (Matt Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 460808507947..97d77fa39070 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1603,11 +1603,11 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  	 * suspend_pending upon kill but to be paranoid but races in which
>  	 * suspend_pending is set after kill also check kill here.
>  	 */
> -	ret = wait_event_timeout(q->guc->suspend_wait,
> -				 !READ_ONCE(q->guc->suspend_pending) ||
> -				 exec_queue_killed(q) ||
> -				 guc_read_stopped(guc),
> -				 HZ * 5);
> +	ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
> +					       !READ_ONCE(q->guc->suspend_pending) ||
> +					       exec_queue_killed(q) ||
> +					       guc_read_stopped(guc),
> +					       HZ * 5);
>  
>  	if (!ret) {
>  		xe_gt_warn(guc_to_gt(guc),
> @@ -1617,7 +1617,7 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>  		return -ETIME;
>  	}
>  
> -	return 0;
> +	return ret < 0 ? ret : 0;
>  }
>  
>  static void guc_exec_queue_resume(struct xe_exec_queue *q)
> -- 
> 2.43.0
> 
