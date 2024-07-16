Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D3FC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 17:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D85510E06B;
	Tue, 16 Jul 2024 17:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ST3kJ87u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE32010E06B
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 17:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721150696; x=1752686696;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UNLV4TAnlcPV9CXkvXlYjOzegmrcdzwYef8AJRVbIoA=;
 b=ST3kJ87uGxxvWo7bY/0uViFtotMeJabMy+MW1mQwF6Kgd7u1KvIOj/cA
 XM15FTeyURW7G7ZZBpqKawZSw//Obw6vHyJRQnlTbDCXKamLyKg5WK4bo
 GDBzZvMMcpz3Px+WG9rgchgS40Eos0JbMjy8f4XaOl9JR+4nRneigWoZp
 kQclAjHehfDmK8uWfl//xOIDAr4m8nxOh/4A0a6OCTb3okyYLeybxNDkY
 F35MWvcqqdDK1C+gaN7S6IwRrFPkNoivfeIGBJYjAia2LdWIXkPdH8uK9
 G6fDaoyQssso1vlTOLY6Gwp27EnXNoeQSqXFhobFAsVIJXQeTUvkeMCyO A==;
X-CSE-ConnectionGUID: gngfslgLTuuLCCdOh/tsig==
X-CSE-MsgGUID: D1wlPEs8TbaTfS1jLQtWjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="22472867"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="22472867"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 10:24:55 -0700
X-CSE-ConnectionGUID: bEDsdXBOQXK+MhJFSPA4Tw==
X-CSE-MsgGUID: jFjPPgKjQQu1T+Z6dz8rQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="73306455"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 10:24:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 10:24:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 10:24:54 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 10:24:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fU930e3XVN7mdxWS9rOKBcR9BFGXCuxCp0PjklVwkACqI3IZt+sOQQ3OH13Huj0Oa9K9TZL6X1efoB8hdr+WO6iFmNULfynQND0WzC/Vi0MWr1m+EKb7rpBipSDAcgvoe5TKNCGEc/UpwvqC0zsgjoqLoaZc75Vygt2Fqbu9sJ0EpmARb7vMNpCMUYpHUM3ghOJvtizRrwMvAuIq2UvpzuKNtajIAEHy2qqwENo1V/FrMCxjsX9CzIU5eQw/llpl1VWcxWYB45STAF/QutPkeZCcFfM/qYPcnYHzahL227lX74/DjqxVGP1yuKcGGRIZas4fgnagu3fTPnV0JzgBqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4lfJdcoGhSeNkSgu8/N5JbG4dT+8M8FdNh0BmOubWs=;
 b=H4S0H/XV+OBb+qwkAftVnI9Q00JAuod1oncs6MVjR+jq5fdJ4toTxad9BgxuGZKoq3yXe68EzZ9FNjAzpm257Qbk949BFFVSGsedTLMdmopNhusP5VpISvydp4ibJwIQZOumrD6UAcpfd1HCQp94RKHI0OT8ja4dSGYyV94ftmJ/+oTRCVF8XMZt/0eyHhRt/aK9PM6yfX2tRPfSR7B7wRLymkw/4kpzOlgTuqxv+neRBwBUB5L2cu0okNYZs4pa1l0pjUp4Sko855iXCESvweJddn4+B7xVzZFg4LPc+8iGFzXjP3Q1yUjHnB5VDW23QKvEsouGSIgY4XoT0izWag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7137.namprd11.prod.outlook.com (2603:10b6:806:2a0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 17:24:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 17:24:51 +0000
Date: Tue, 16 Jul 2024 17:24:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 06/12] drm/xe: Rename xe_ggtt_node related functions
Message-ID: <ZpastMST3h00ILzL@DUT025-TGLU.fm.intel.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
 <20240711171155.173717-6-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240711171155.173717-6-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a03:505::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: 88492a62-b157-4535-71bf-08dca5bc3323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wPP5tgNO6/Wq79OpZB88/HRBp8CJOK8Tvs/UksH+WeSGP76aBfuKac5yFPlI?=
 =?us-ascii?Q?afXRLe2qXDjqkPOg5SWjwU/hw+9LvChKthfZ9oDPn070LDTMisnUg4xQwveS?=
 =?us-ascii?Q?u3UTfXe7OC2bpHZpvEOTJsDasgi0PrVCfXclbndUWBppvBPPk2MRRIEOGvtO?=
 =?us-ascii?Q?9wf7tpu9ixV/+y5fM6XE/Svrndy7Rm8B1rM9/JZmlIvDwRjASaTA3Un7kR/F?=
 =?us-ascii?Q?FxecmIYEMjGzCKYy3hSyfJ8yeghnKid/DV1NCPl+ZNW1ZlTFo7tGuzWR1RHY?=
 =?us-ascii?Q?JRNknGrhJK92pvVmT/lACtyX71hupU6fG2LueYbbUvA3ukBvjat6wHx4BSJg?=
 =?us-ascii?Q?LXSWlJOdLOAUAMHDQ82wiRHxrraf04TRgv5rIBb4spyTHI93LrW4wCIMBF0h?=
 =?us-ascii?Q?JWIQyIqHJlZ4vKub+bpLW0mFQ9e5sPDKLQTp0UTwwKFPDEdfeCcYXnywTkaK?=
 =?us-ascii?Q?tbRGUZvjk6DPBXO6uC6kT1Tuxbg74mngeBPs8P3zvhFkwjENvMjV7whL1p6p?=
 =?us-ascii?Q?gHbSx5GKWScgkATDNLQtyG0xL5+FPHUF2lRqEdhMjdegqr88q/VhzW1T+DlT?=
 =?us-ascii?Q?TsYiwgsf3IlbUKlxEvMlJ2Cfc1ywkBGZSSM6hiB05cqpIzFlKmRgtNX4ILhf?=
 =?us-ascii?Q?kIxzbV87TEJlnsXGt/na1GuFps8OE/kDcE7TGGkO89kPozD7U+zzAp2kDDwO?=
 =?us-ascii?Q?tYnpdFFMACmF6kKt+FaXfAAxSzImVb0m9mqCGyMDpglnDPDOISUsh/dZKiK1?=
 =?us-ascii?Q?IkMVcCikn0f3aa8B2HgvlwuiwzSYNtOMrWQs58hEcdo7FsY46SGkkZVdUEAm?=
 =?us-ascii?Q?BP24UOGUC7KcsMHa4v/jzmjYYuRWs+Rk8LUxVNiQtSjB7k73kRJ7Yc5sAmXF?=
 =?us-ascii?Q?5xPy5jtyFgp7qYFlt/yIoek6sI2IVfeN+myAy9IRSzRn3Httd34Qbg/CqS0p?=
 =?us-ascii?Q?OchqVM2ZdsvEPXud25uumkQ9vfOfidjt0aoE3Y9V6ySHJJgABvnhfMhM6VFv?=
 =?us-ascii?Q?Xf4ebtiS1+9sdmSLAjmHwkFPxE4MqSoAtinhl4yvup6Tz9ZKrKaJlkBj9bh/?=
 =?us-ascii?Q?0tj6ObDBQuOQIEzMcP0f/rCpu/C1Mncfkf4xB6xxPT7NHVh1dzHQa5Z6LwZ/?=
 =?us-ascii?Q?eVAKSRHr88IIABJiSX8z9Lti6evAf4rov2NAYM4YyMn2P8BYF/OducFgoNVW?=
 =?us-ascii?Q?c/q4TvPC+5pE0OK+Ozlu/QDp3iW45GfPt5LAm6TgUynxd92EVUh+vy15JSJ7?=
 =?us-ascii?Q?6wR/07PVbLdhFl9qm16OKpyxZe0nkK66d4ELMRz2GGoKL53Se+BapTu58tkf?=
 =?us-ascii?Q?+UbdQQHwbVc51Oe+RCICGvnsYs+0RkUTRa8UHBDTVswarw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tGDEOAiRj23uR6VhgFxdBft+fxAgg1BJJV0UW0nyPri/a9DaBK/zfnsjPjKi?=
 =?us-ascii?Q?3FTIB5yZ84g6KxbBhWjVWOSPtt1jk3lWyTBFBN7mTuxhv11Nq0nwkbeOhtPN?=
 =?us-ascii?Q?giB7/VRoO7zSwCwRRbmiuKZHPSMRDES5+mNyVpB0DxmzztXDZ0OlQauupF+0?=
 =?us-ascii?Q?vtwxpAQwEwtozz2WiP/eaII1K7FEoh7Y8CBaFPWci65HjTfxGYyvMjyhfzUM?=
 =?us-ascii?Q?Tq2bGUBdNoTLtKMQKhm00dsm09bZaenNZhTdy4Gvlfx0M6hLUBmRSsAmKX4L?=
 =?us-ascii?Q?wyz+0KyOi799PwJjhvsUB4InRucQkqP+HYerta1YZL5UMgzNlSVbOKnD+/87?=
 =?us-ascii?Q?/UkAGLT6UE7e0/DpTlDj4Q4BVQeJzbrsq0gK15ECw8LPvKZguYH7W+9z2ELx?=
 =?us-ascii?Q?vZf9fBPvb63bZDwTbC+1QpUvQ3ZzmY7SoiJzfzX1VrSRjTydZLuKcQub3oNE?=
 =?us-ascii?Q?DpjFL6IYNISCmLfhMgbk52Wlom1HrP73CIJJQlFzEx1R01dYqo7E4KSkOBhn?=
 =?us-ascii?Q?bo/L15QLEFRNbpuHdwj9Eqaby+UvBIWLFodDVDD1StwS6BukN93wMgh8SESv?=
 =?us-ascii?Q?AKl4A5Ai3vfRI/RMmoP5LfR3jQuhlvrbbz/N5x0MGt9PhaPdwKsOKw+bgjiZ?=
 =?us-ascii?Q?E8ommNq0qTHu4yIuD+WARE5077uhAwYQU4EjKAi9hwh2hUCXQstpdRuCBy7I?=
 =?us-ascii?Q?bZc2hOp2T9ndDM9NBrpEynFvAm/j+lbgMXP3UspktNOtojI6n7bQtuG8iHmY?=
 =?us-ascii?Q?yWz9Wz3G/8GGCmFs7dMU5QFUxbY8mSQ5USmS9PcCIK2lZmHTeLeDyC00B8Op?=
 =?us-ascii?Q?PopdahUVuun3ir8sWltYTpYT175xlAPJjBdrRtZfpJLZQNfTnjTWbqDQwnkA?=
 =?us-ascii?Q?f+cFBowANmbvuqKe0FewKf7sBoFKRfwuZtW9WAV2QBhYarbtWjD3ljbjWtRH?=
 =?us-ascii?Q?uwUdouk8W5T/Y6dT/1/Q6gaFraX9U2XoEb12cpqpLvwQpcE0nhy7hhRzh2Tb?=
 =?us-ascii?Q?gobNJRe2x4p3EKBwJt762GCZVjylBVPrnpEIbuI99myyqqL+ydGo5a5462Lh?=
 =?us-ascii?Q?9nt3IEntFK79aNHoAEx/HCvkDVQt+i5RwKfvcrwNMRQaCGOTgWvdTZPQ/WPc?=
 =?us-ascii?Q?SO3XpB7INaBJcAKPnPap4432ZUvjqnxJ28F+9JenWtrPRaJWZcn3v307HeB4?=
 =?us-ascii?Q?xEt+/PlqIxKT9K1xG9Bhv/x4rhGxtu2Q6KfRcqArWnkiTorY2bvpbtvOLtjo?=
 =?us-ascii?Q?l29D8OPZ5+mJhmVNmsI/AlfDP60En9xZ1BmwOT3JemInHazxYFKZzFKws6vN?=
 =?us-ascii?Q?NYv3nCwgIjmvT6M4G68jp7KYioyPTk3+aIgTdXIT2PWHw3YChYochqbCSWl2?=
 =?us-ascii?Q?hGeLpzf456zfdiqNIUbRIw92LNhlZTcU7iE0ickREwgUml0rOn2kyhQhuWkQ?=
 =?us-ascii?Q?ib1aQuou1/LeOsWzmSU9oIzrCA1kNFoEPV9CQp6BW+wp0EvujG+WuzDGQs5v?=
 =?us-ascii?Q?YZKnHK8zCCpDvicdg2IXpIc3O3qlFaxIlBlHwXG1Egg7R3fLZN59MZfFHECW?=
 =?us-ascii?Q?u0YqocYaY3A0jz+jmmoAzpgjub9hl6LVpn6wafqMZWSA4esI8vVaQonPKSVq?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88492a62-b157-4535-71bf-08dca5bc3323
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 17:24:51.1996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: byFi0ckKrZmW2I+pzt8sMADd45XdatbKvyAJvv+vVGuETVbsfaknAhet+kJC8PMYiTMcdrE7zNL/pR4V+jDybA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7137
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

On Thu, Jul 11, 2024 at 01:11:49PM -0400, Rodrigo Vivi wrote:
> Bring some consistency and prepare for more xe_ggtt_node related
> functions to be introduced.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c     |  8 +-
>  drivers/gpu/drm/xe/xe_ggtt.c               | 86 +++++++++++-----------
>  drivers/gpu/drm/xe/xe_ggtt.h               | 12 +--
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  4 +-
>  4 files changed, 54 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index a93923fb8721..db74c3395ef8 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -209,8 +209,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
>  	} else if (view->type == I915_GTT_VIEW_NORMAL) {
>  		u32 x, size = bo->ttm.base.size;
>  
> -		ret = xe_ggtt_insert_special_node_locked(ggtt, &vma->node, size,
> -							 align, 0);
> +		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
>  		if (ret)
>  			goto out_unlock;
>  
> @@ -227,8 +226,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
>  		/* display seems to use tiles instead of bytes here, so convert it back.. */
>  		u32 size = intel_rotation_info_size(rot_info) * XE_PAGE_SIZE;
>  
> -		ret = xe_ggtt_insert_special_node_locked(ggtt, &vma->node, size,
> -							 align, 0);
> +		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
>  		if (ret)
>  			goto out_unlock;
>  
> @@ -327,7 +325,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
>  		xe_bo_unpin_map_no_vm(vma->dpt);
>  	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node.base) ||
>  		 vma->bo->ggtt_node.base.start != vma->node.base.start)
> -		xe_ggtt_remove_node(ggtt, &vma->node, false);
> +		xe_ggtt_node_remove(ggtt, &vma->node, false);
>  
>  	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
>  	ttm_bo_unpin(&vma->bo->ttm);
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index ea55c7eabee4..3ab29588a068 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -403,7 +403,7 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
>  }
>  
>  /**
> - * xe_ggtt_insert_special_node_locked - Locked version to insert a &xe_ggtt_node into the GGTT
> + * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
>   * @ggtt: the &xe_ggtt where node will be inserted
>   * @node: the &xe_ggtt_node to be inserted
>   * @size: size of the node
> @@ -414,15 +414,15 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> -				       u32 size, u32 align, u32 mm_flags)
> +int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> +			       u32 size, u32 align, u32 mm_flags)
>  {
>  	return drm_mm_insert_node_generic(&ggtt->mm, &node->base, size, align, 0,
>  					  mm_flags);
>  }
>  
>  /**
> - * xe_ggtt_insert_special_node - Insert a &xe_ggtt_node into the GGTT
> + * xe_ggtt_node_insert - Insert a &xe_ggtt_node into the GGTT
>   * @ggtt: the &xe_ggtt where node will be inserted
>   * @node: the &xe_ggtt_node to be inserted
>   * @size: size of the node
> @@ -430,19 +430,53 @@ int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> -				u32 size, u32 align)
> +int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> +			u32 size, u32 align)
>  {
>  	int ret;
>  
>  	mutex_lock(&ggtt->lock);
> -	ret = xe_ggtt_insert_special_node_locked(ggtt, node, size,
> -						 align, DRM_MM_INSERT_HIGH);
> +	ret = xe_ggtt_node_insert_locked(ggtt, node, size,
> +					 align, DRM_MM_INSERT_HIGH);
>  	mutex_unlock(&ggtt->lock);
>  
>  	return ret;
>  }
>  
> +/**
> + * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
> + * @ggtt: the &xe_ggtt where node will be removed
> + * @node: the &xe_ggtt_node to be removed
> + * @invalidate: if node needs invalidation upon removal
> + */
> +void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> +			 bool invalidate)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +	bool bound;
> +	int idx;
> +
> +	bound = drm_dev_enter(&xe->drm, &idx);
> +	if (bound)
> +		xe_pm_runtime_get_noresume(xe);
> +
> +	mutex_lock(&ggtt->lock);
> +	if (bound)
> +		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
> +	drm_mm_remove_node(&node->base);
> +	node->base.size = 0;
> +	mutex_unlock(&ggtt->lock);
> +
> +	if (!bound)
> +		return;
> +
> +	if (invalidate)
> +		xe_ggtt_invalidate(ggtt);
> +
> +	xe_pm_runtime_put(xe);
> +	drm_dev_exit(idx);
> +}
> +
>  /**
>   * xe_ggtt_map_bo - Map the BO into GGTT
>   * @ggtt: the &xe_ggtt where node will be mapped
> @@ -522,40 +556,6 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
>  }
>  
> -/**
> - * xe_ggtt_remove_node - Remove a &xe_ggtt_node from the GGTT
> - * @ggtt: the &xe_ggtt where node will be removed
> - * @node: the &xe_ggtt_node to be removed
> - * @invalidate: if node needs invalidation upon removal
> - */
> -void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> -			 bool invalidate)
> -{
> -	struct xe_device *xe = tile_to_xe(ggtt->tile);
> -	bool bound;
> -	int idx;
> -
> -	bound = drm_dev_enter(&xe->drm, &idx);
> -	if (bound)
> -		xe_pm_runtime_get_noresume(xe);
> -
> -	mutex_lock(&ggtt->lock);
> -	if (bound)
> -		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
> -	drm_mm_remove_node(&node->base);
> -	node->base.size = 0;
> -	mutex_unlock(&ggtt->lock);
> -
> -	if (!bound)
> -		return;
> -
> -	if (invalidate)
> -		xe_ggtt_invalidate(ggtt);
> -
> -	xe_pm_runtime_put(xe);
> -	drm_dev_exit(idx);
> -}
> -
>  /**
>   * xe_ggtt_remove_bo - Remove a BO from the GGTT
>   * @ggtt: the &xe_ggtt where node will be removed
> @@ -569,7 +569,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  	/* This BO is not currently in the GGTT */
>  	xe_tile_assert(ggtt->tile, bo->ggtt_node.base.size == bo->size);
>  
> -	xe_ggtt_remove_node(ggtt, &bo->ggtt_node,
> +	xe_ggtt_node_remove(ggtt, &bo->ggtt_node,
>  			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 30a521f7b075..5147930357de 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -16,12 +16,12 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
>  int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
>  void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
>  
> -int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> -				u32 size, u32 align);
> -int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt,
> -				       struct xe_ggtt_node *node,
> -				       u32 size, u32 align, u32 mm_flags);
> -void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> +int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> +			u32 size, u32 align);
> +int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt,
> +			       struct xe_ggtt_node *node,
> +			       u32 size, u32 align, u32 mm_flags);
> +void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>  			 bool invalidate);
>  void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 3600468da013..dfa71bcd0f56 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -382,7 +382,7 @@ static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
>  		 * is redundant, as PTE will be implicitly re-assigned to PF by
>  		 * the xe_ggtt_clear() called by below xe_ggtt_remove_node().
>  		 */
> -		xe_ggtt_remove_node(ggtt, node, false);
> +		xe_ggtt_node_remove(ggtt, node, false);
>  	}
>  }
>  
> @@ -418,7 +418,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  	if (!size)
>  		return 0;
>  
> -	err = xe_ggtt_insert_special_node(ggtt, node, size, alignment);
> +	err = xe_ggtt_node_insert(ggtt, node, size, alignment);
>  	if (unlikely(err))
>  		return err;
>  
> -- 
> 2.45.2
> 
