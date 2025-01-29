Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31786C02194
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 22:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E050F10E1FD;
	Wed, 29 Jan 2025 22:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEHsWYqd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D1810E1FD
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 22:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738188680; x=1769724680;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HosIxFvtC1XXXwaMC93upsE8lAmfDvta4E3v8NloAmo=;
 b=DEHsWYqdfmhfOCCyYuxZsVBpzOdvQXaA7LIm+pWWpn9EyJo6JIjgZxwT
 idabVv0x7MTXRPww0+ggpGhOwTDIjbwIP3A0J+LWi6Paq605PEW4jc7Is
 HFOkLWx8y8CJNZ+rPpAsDGNTdA4jdGHZCRFVl6iP4m2FxgjDhdSpJKLvX
 Rs851QEPJVogTeDak5ymZ7PtfkHmHRklFPV+QFlBmuY7Ye4rHPMWUsy7A
 9sQQV6JxgOundGOf4ki+F4peuPIaihoA2ULVULdLdQQMSvd0laaH3OaJB
 oR4KVFWbkPD0w7/QhgyN9Tn4gXRaJeZm3/hjayjNtuDeH/PTBhYXBtkOJ g==;
X-CSE-ConnectionGUID: IHdKS+IUT8KaDpog4VbdHg==
X-CSE-MsgGUID: 2DIYQch9SOqGZ8ELsgBQ0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="42475447"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="42475447"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 14:11:14 -0800
X-CSE-ConnectionGUID: mvog/yNuTdiYJHiJEJ6UmA==
X-CSE-MsgGUID: bMcTNSdUTfCCnPz5DjUGkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="140048211"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 14:11:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 14:11:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 14:11:13 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 14:11:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJAE5T3Rg2tQjMCOpN4BZLlG7mZmcMzwS0azwIS/J0Uvr3YuQ5oISxUv0GHxnLEnQnl3MIS+h5W1cwUzaffcFUHa6i+IPknFwq4NG83XJcV1GZumSvU2zh5B1tXwIKcMf2yeLyOX9NQy+hAgvZLJ8WQ9SE3rDbUX4saDFqznaNbscNxqgl8znJhEXeF1pQ8ssxoYbhfHuL30iSS9b3t0BIktWpnm410PAkUAdA9fgU7EtjGpNnHEI5hTshFZGoBHwfr4WY31/ymd5mQKMw5cCbkp99cJsgIMXiFIuZMWvvchAiyGnanFYCSEt4hlVyOoYbiAIcGZbkiX9Py1qD2bkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjExDVtFNvRzNuEEjIjFj+5YSTR6BqdHutfywkWsKLg=;
 b=ftPO83SPKc2r1tx3U6hFvIeypb4Dr5LPqkk44dqXjI7eb2EmInhd+5HCeIkXQ01wR8OcLBz5DVmhr4OUG/jTZUmiBiIRTqds8w+WkpPSQfJcmarUKrmvdFgK6SOrjBGGiOupcgbCoQGL6dICvZux8BUT/g+XRSwTs1ZP5u54u2PF5NSzk0EmZUoRB32g8kRKp2V3+M8nvwIAE5h5vmZxm96AaeCOLYcOswDVBI1K/rGote0h6U18BvFyQx8ju1Q5tOVms+FMtxohVzUES7/+HT1ljIGsDGJssJ5AlrIrJJWB25qNpAidr8IrvT1jdlu54JWtIm2yX3T5BNYKfp+UKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8137.namprd11.prod.outlook.com (2603:10b6:610:15c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 22:10:56 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8377.027; Wed, 29 Jan 2025
 22:10:56 +0000
Date: Wed, 29 Jan 2025 14:10:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/xe: Refactor max_remote_tiles
Message-ID: <20250129221053.GQ5109@mdroper-desk1.amr.corp.intel.com>
References: <20250119123644.2881474-1-sai.teja.pottumuttu@intel.com>
 <20250119123644.2881474-3-sai.teja.pottumuttu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250119123644.2881474-3-sai.teja.pottumuttu@intel.com>
X-ClientProxiedBy: SJ0PR03CA0195.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f712bf1-d41c-4bbc-cc7a-08dd40b1cd8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DhDuFdjsr3KWeFusM8SkJHBoSA7qxvXQ5beyYvDClfoUrSaZ5pCqhooTfe/G?=
 =?us-ascii?Q?W3Yv2ZchmGmumegGbcccQJROLP1rfjw3BjPjAHX6d5mvT3LbCAu9VosGXYrS?=
 =?us-ascii?Q?KCBZY5gZ7kuZEN/C0eb19q5wdCw40Dl0b/z0Hp/TYLJjtlE9heO8s3G1ZYn2?=
 =?us-ascii?Q?xvVOHVhK0oD1nG0c8UxtuCCkRkYCxVy4c4cQ9kknbvFKOmx/XF31h28GXY7K?=
 =?us-ascii?Q?cBgjILhREEXfxlEJXfI5ThC1lmgTauowdnryfxOW8ZP4znLvrCYIPhaSfufe?=
 =?us-ascii?Q?OIeyFGR4iW++0QP4wd7Wlh/mYRCBQj7hFaoabyF2Yl7Jq/mNwYPxWE7C06Un?=
 =?us-ascii?Q?J5MYVAsqnjH9Tq4qnlr0Vg73znOSRWapYheV2oca0u0nMHx592cqMUeh8mYv?=
 =?us-ascii?Q?n6IXCguBI7dr8olTny8293QB/bou6ht/FGmmUja9tZrxyAx3t+Z1hZe+RZZp?=
 =?us-ascii?Q?92QCW/h9j5WjS5VUeF+h60zpawkmppfFn40sbx7kPCmwWa9Sx+dTQLae+kld?=
 =?us-ascii?Q?FcYl4UpXWos65OaJOqxyvI1uMZxfih80H7A6aumNbPillO4iCqe++CKr1t2y?=
 =?us-ascii?Q?NibtHPBeDXhHnSyMSCJRAbTh+wj9iGd3zaZ8g2O6b3FWPTkumsoejNPbe8B4?=
 =?us-ascii?Q?Qkvz5n4cvkk/7lFN84tFqJXlZHqGAhfrSf6jMQi4m1rR+BsiEqZ0A8YsOFxx?=
 =?us-ascii?Q?TMrGWsBMfocT2TmDiMWP9ROK953lAlq0dxPJ8Rgbl8Wh/f3Ska0MXop0f8MZ?=
 =?us-ascii?Q?vwk3gbGBIOayj1GjqmHYqF6rKUmu401sbO9YtIPfhb3tm8sT1lY+4fBaANPa?=
 =?us-ascii?Q?YFNiWJ/QgTkM4K/n18sFPdOHJGFYsR2Mq6dPnSfp5e1vcD8nuB/5heC4Y9kP?=
 =?us-ascii?Q?JPU49pUt3LamwIksskuLzvaceNxf0K6ckzfkNvN0NVotkfm6f9Wp0ijQQ84O?=
 =?us-ascii?Q?ArTWzrgmT39kEhiPdc1G8xIqgLMX1Dn1SB83mCcBsM7rFwUP+tU15urdpnmm?=
 =?us-ascii?Q?RReD+RoI3MVXbnl+AF90nM9VI1ahViwemI76gpQZENPlCHaFOO3ZutRFCEmD?=
 =?us-ascii?Q?HYGxnHzbTdJssdQ/N0Uf60IYnzKDfcgoicJkXXcyPF8B0GZcPz4/vxRRpgzB?=
 =?us-ascii?Q?ZF+zU6X03pmcQQ4MiM0+35kJg8krP2ytblobm+eGG/qS88EGrK9HHllaMKpx?=
 =?us-ascii?Q?29EteFq+vYAR4KajgFGlWkorJwOrSOkjt1cXUUmtAb9GdX+3ztEkJInxmUc4?=
 =?us-ascii?Q?6xzFYTDguoH2yYptHPP55e4HQJdINXG/tlaudqYMDVrynSA7D7bAlp2q+FNV?=
 =?us-ascii?Q?6Smug3yq9bniAAlitHHcIAfN/kwKnNjkmZ9oOkXlxce+/US/nMNFjLhftfyT?=
 =?us-ascii?Q?NW7sdsXLQg0UHd1aY8lRMAXyaJVj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K+rJqdYf6GRJckZ5lqjOWhHwIbUudH5wE9ToLb4XZO4b/AINXGX7EZNxiOIV?=
 =?us-ascii?Q?SIDJ9ADEjFcQIjhXb3p62QCDiD9TQZMEBEdB30V7aMJdxOu4uDhylKsPbtE4?=
 =?us-ascii?Q?vU7Yzno8dUW8wgOK+2tHouwviIMCEYd0BLgILxldLaj43HUbbS8qRO8Ek+GW?=
 =?us-ascii?Q?FlPjssCHIRP2pTEaKGKcKFDH4SUBEVh428r3ilcwyGtjbOANMZFeeJ9B29YL?=
 =?us-ascii?Q?r603J8eepoVW1fZ7xOS6ofGDVhmmAhZZaD/5U0DQKypitDi5xYmZ93hE88jn?=
 =?us-ascii?Q?TWOgRNcdkZ2ZAb2BBB9QFFWTl0kbdtlKi2qYLLA/SEtb3SBFxq1dUcrizh0/?=
 =?us-ascii?Q?YEmQaLWHxAw4pRod0QBeQZh73PfnDClADTqnCuA3uOvrn/IAJMUXW1kxyfUu?=
 =?us-ascii?Q?naRkBdXc9zjugayFAOE/bn+evc548n77vfAxNF7f+79BxbjnEy/ESMldJCww?=
 =?us-ascii?Q?J63x9wz0EJxWkdj7h3UC5E9jEdk6QhwQSp9l2QdiNrmQ10+eM9r1/85sUUZV?=
 =?us-ascii?Q?GlcSG+c256S4rareM7qmQ1cuD/KeiCaozIOXBXoPC3F+6a+ZgBXIAjwgGBzw?=
 =?us-ascii?Q?mIqvHy8SQ+KTEw7v+frRgm/YVpXqOEz6qAb3F2eAhw3EFMFGTxNak7oGyyI9?=
 =?us-ascii?Q?mmpMogWfIiyJqch1XQZJOIRhix/GF8omZpJnQ78M01E55jqMkX1Le98DeafN?=
 =?us-ascii?Q?tRSbS1nuWSvnPcSEXwc08WP5iMY2VqcT790wJnB1THQI6qUDc6c1NJa4+qj+?=
 =?us-ascii?Q?/dgyMVg0YZKm8x3cT23R3yuyLXfvYMfmjw8vYchKa4Jr5Lwwv0OtEDcwogfj?=
 =?us-ascii?Q?bKGjH+nY6lixM1jC/ntejDR+7pS5eU6mvxCHFrJwwCcQ0mFaYaOjD4hS8ojA?=
 =?us-ascii?Q?2txIFFawg54FL59pDWgFaUzJFvEIsUrlZ04BjXLplm1/HEiyHIYE6HsORtkx?=
 =?us-ascii?Q?lsiL5rrIUs+YozZcj4zYp7ue9djJMIQXrLravy5D0OZ1WtE/0xu1ZgSQ39qF?=
 =?us-ascii?Q?j4JPX4IVgMnBtUfkwZ51fxUIxnnI2exQb01dgBcZJjoZ9cRxvzI5lI3tNy/x?=
 =?us-ascii?Q?/M2IIusvIlPud2IvUIYY2jBvXLtxv/vqz2AOLaOMcO5ao8eXjdCYiGzeufkb?=
 =?us-ascii?Q?G1NnedkcerMxnl89sJ7zmSzmjVbsxUmrdJmpcMupjsn0gTTqChM33070ECTl?=
 =?us-ascii?Q?B/aGxQXGUP6ue6YsuNOivC5IRxvrbXtm/yKrTVEgnfQIh1vtc3vxOlcN58s0?=
 =?us-ascii?Q?u6J3szlu2FuDaznsxTVCXPgEQZfjiNebfBGDkFxKnI13/9WU4Lc2xN5CWMXR?=
 =?us-ascii?Q?LraB51g0qnpAiX2uhVlBDJ0pDFAxDQ+upUSRaqAeX5wrPs1oq5lJijEK4rxW?=
 =?us-ascii?Q?R2j4ZlYDw5QOcWdjGQj/R5Fl6x0lIujqVWqucTe+jpP7RYEw0Zz2nlB9jf2k?=
 =?us-ascii?Q?IAeKvkAvevTLYtKECsnXb/aQAUYJKKJsVTrCISHj+iXak2xjHPKvkTty9Ud2?=
 =?us-ascii?Q?XEWzdSbI1ef/67GY992DDNNuJ7y8dw9evqtcqlJOf/vxVf7fgmp4artcUztT?=
 =?us-ascii?Q?MoU4fu3+qHuvF8JSqPj+zzMswfJ/bwzs35FTmlwR3a61NpsiidZETlMqGRKC?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f712bf1-d41c-4bbc-cc7a-08dd40b1cd8d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 22:10:55.9984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aYwipNRWZs1wNEbtSMhMwphesG2ZGzNmGfyq1kJHk+AMAD5QNYHW4UAwHBpEnJVyogIltbuNmeKTBSJ2gj8WuJxsFp0NkVlZXmwkZx4KolY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8137
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

On Sun, Jan 19, 2025 at 06:06:44PM +0530, Sai Teja Pottumuttu wrote:
> max_remote_tiles is more related to the platform than the GT IP. Thus
> move it to platform descriptor from graphics descriptor. Note that the
> FIXME is no more required, thus it can be dropped.
> 
> Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c       | 9 +++------
>  drivers/gpu/drm/xe/xe_pci_types.h | 2 --
>  2 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a6395050a19f..2f7056d36f78 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -55,6 +55,7 @@ struct xe_device_desc {
>  	enum xe_platform platform;
>  
>  	u8 dma_mask_size;
> +	u8 max_remote_tiles:2;
>  
>  	u8 require_force_probe:1;
>  	u8 is_dgfx:1;
> @@ -136,7 +137,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
>  		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
>  
>  	XE_HP_FEATURES,
> -	.max_remote_tiles = 1,
>  	.va_bits = 57,
>  	.vm_max_level = 4,
>  	.vram_flags = XE_VRAM_FLAGS_NEED64K,
> @@ -333,6 +333,7 @@ static const struct xe_device_desc pvc_desc = {
>  	.dma_mask_size = 52,
>  	.has_display = false,
>  	.has_heci_gscfi = 1,
> +	.max_remote_tiles = 1,
>  	.require_force_probe = true,
>  };
>  
> @@ -641,6 +642,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				 xe_modparam.probe_display &&
>  				 desc->has_display;
> +	xe->info.tile_count = 1 + desc->max_remote_tiles;
>  
>  	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
>  	if (err)
> @@ -712,12 +714,7 @@ static int xe_info_init(struct xe_device *xe,
>  	 * version 13 or higher has an additional dedicated media GT.  And
>  	 * depending on the graphics IP there may be additional "remote tiles."
>  	 * All of these together determine the overall GT count.
> -	 *
> -	 * FIXME: 'tile_count' here is misnamed since the rest of the driver
> -	 * treats it as the number of GTs rather than just the number of tiles.
>  	 */

The remaining part of this comment is sort of orphaned now; it's still
correct information but it's floating at a strange spot in the code.  It
might be best to move this down to just before the next loop that sets
up the GTs.

Aside from that,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> -	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
> -
>  	for_each_remote_tile(tile, xe, id) {
>  		int err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 7437415a54d5..b96423844952 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -19,8 +19,6 @@ struct xe_graphics_desc {
>  
>  	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
>  
> -	u8 max_remote_tiles:2;
> -
>  	u8 has_asid:1;
>  	u8 has_atomic_enable_pte_bit:1;
>  	u8 has_flat_ccs:1;
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
