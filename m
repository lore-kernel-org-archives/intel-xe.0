Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EB0C71130
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 05:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE74610E584;
	Tue,  8 Jul 2025 05:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nm+Dkgv3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1491C10E584
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 05:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751951256; x=1783487256;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f6oE3ytaAiauWXBXbmIsfftOEKd7DMwwQ5Jw2+CPZTs=;
 b=Nm+Dkgv3CDUGzSEgsWkgZfs08WyZyUOU0Vyk+pW97+ReCoxuxPe+L0Wg
 Y8yi8b0422kbgTPjlQisp9r1wezwPgBfyHA1Fv2kLCqKwJUQ0aRqf2GfK
 X3gMdq/ZfWZjfmTfhYwyXTifiZvVcC5lqkEX88sq0X/tTlnwAWjZUJLMT
 oWPMqTPSNoN/avIhBOhaVvOZZihpcXP5m735LQCz+IUuinRcRPYbHit9J
 PHeTq4xNig0aN7OHo/Y7gGd+MybQdxgrnnLWD+8aqlkD1zKXoQd1dJ85m
 /ak9kret1A66uTaqxrb8aua8Yw/cdZjYOF086OgXS65DXf7jZQ0YJBNNM A==;
X-CSE-ConnectionGUID: F33jvsiiSg6ks/rCSlETeQ==
X-CSE-MsgGUID: 7+naiw+9QCCaXK4OBnBriw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64427461"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="64427461"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 22:07:35 -0700
X-CSE-ConnectionGUID: qmpGj39jRk2o/Jyx3VxzMA==
X-CSE-MsgGUID: TVDEGjTMQ1q8j0EcsdYsNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="155136041"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 22:07:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 22:07:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 22:07:33 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.80)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 22:07:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGDwkke+GFgsr1utfvCCLcN6PwbFLxiWJb4wnUTq8nHFUEqNeEbTLIp1yjV2ecYMfJ077MRm348DUmvAYpS8Q1USjWnWqSd+kgM7eAVmrPBHaxnptj05H9yyQEdMOw4FwlKsNZwfSKkfaEXi+HTPXf0DhtREbbPpcBzko7vUxZ6oSKHxuNoeJMmHN2K5BEgAX4wudDR4Zb4okpenk8dNd27QrCRAa0g1WC/mpCtkN+tyeR+soQZk9ZvYSh/dTl2i6HfifaZYe2M9EPvqF697Dffntxnl0lnHZvxPBFj73txb1UlmKN1dkpVWDkpI5Hqv+x+PJdemJJGD6J/PVQ3Wyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmwowS9YgI36lvlNR41+7OSUbb12MIy7c+8G+k+IiKA=;
 b=KryWdHkZkYR+Zoz5YUJ8jJg3+wbbZPhcbXfQcnLtKUMoTo72Cysiti5VFbbapbBhJnRFUsmNwgOr+p0B68cwJIcv+MB+lHjZh+V0e6iuRF3V+DraY+l4rQsnd4VYRVBHTmgVPqpd4gSNlr/EeLZRErcm/GzuSdceBWQjw5VLT+bJQ90UlfpY4LGgKyQc3MEy4BROYQguJS0B80npaA7wlXQHV8EpWyB2pBK9RWDGl3tDXeakD0iOh84uU+nvKsR2lrhNNZX4XWKI27tsrPKW77vtD6HY1oTTizOnUymxZ9ylSN4xnuweGmsHziyZg+FT9tan9M0XjgGHtksmrGMiAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6188.namprd11.prod.outlook.com (2603:10b6:930:24::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 05:06:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Tue, 8 Jul 2025
 05:06:50 +0000
Date: Mon, 7 Jul 2025 22:08:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 5/7] drm/xe/lrc: Remove leftover TODO
Message-ID: <aGyn0RFgRICZAeM8@lstrano-desk.jf.intel.com>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
 <20250703-lrc-refactors-v1-5-6aa22f174041@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250703-lrc-refactors-v1-5-6aa22f174041@intel.com>
X-ClientProxiedBy: MW4PR04CA0305.namprd04.prod.outlook.com
 (2603:10b6:303:82::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: bae174a0-8f9e-4c15-e792-08ddbddd3f12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sFa0KtjExnncTQzdcR6I8A6Kg+qUK/mvDIDMWYOmaRs6v00FxS41NPSVkdwC?=
 =?us-ascii?Q?y7LU4AuN/+U2ADSsqJzWuYWrDRuyjoZDVRKBXq18PGpmQSDZqJ1Hb32qgIg7?=
 =?us-ascii?Q?84ntV2eAEPVFRd6Klgn3B1KUMBIIUAzm0wOctEOB8ujXm2X2SMvLT6eKyUSf?=
 =?us-ascii?Q?PxEj7Mc/SKtcaciE/8YR7MTIFHHNwR94HvVPmkeX3V3w2guUAPXxR6hxJNWI?=
 =?us-ascii?Q?IBc8jLNxJxy4B559K2LUVxaNC7/PN4OS1h4xQwo/LCK1n5m69nf8CeNFZPlB?=
 =?us-ascii?Q?/MdHD2ZlOW6RuOR2gCfGOSsYRKQQqFADFosY2j5bINp1g+bjE6rCrG6T2Q0r?=
 =?us-ascii?Q?s+X8gBmopAgfO6VVvw2S8lHldqM9TRZxcw6DlmWPt++unEShutHoPsmoX8V7?=
 =?us-ascii?Q?AToXesXanuv1RB/B+6kemYG9gS4IXHJVEkMoWlSqEX1pfcjefBMFUNSuZhrg?=
 =?us-ascii?Q?LYncKis/wHe1/vNN6Su+cxQM9k6/RyNJ4F74LBhD9IgfzFlw+VpIdlNweuxm?=
 =?us-ascii?Q?wjU7ggyms1JColMtdFiR0sTmIPPkh5bVR05InOUtotROxl/gaq6rq+F8Rx8p?=
 =?us-ascii?Q?TAYd2BPUlZvRohEVfjKqNYtB7HDlwz8KRK7C+EQCgW4uf+NqGluVH0lQaYud?=
 =?us-ascii?Q?jcQCyitCB0szpedMNi0XImqFpw5DJ7s4fQKo816mXa67uG7wSHZcREAnp2/N?=
 =?us-ascii?Q?pAIijprv+rzjCe1fuPeL+RiaYmPIE+DtgM+1DZTgx/jD88wc/B8YAIJzPovY?=
 =?us-ascii?Q?eBxj87s5V4pQ0n/jHjoytmyJ+TDpL879w1tfzWNarrwiSX64P/RcWyyBCM6w?=
 =?us-ascii?Q?7qppPUBCf2tBIElFvhGcpqDOw4TtZXM6N3YcVYP/QR0+oBG/n1q6oRoQxZ51?=
 =?us-ascii?Q?hLcBrQHLJGgyPqmq6cpoaUC7cdEGPbjBK3Q2U9NlRzykvxrLV1jjTRSDbvRa?=
 =?us-ascii?Q?SP8wKONPJ4kJMRQ0KrjEuR4G9pocykPTGg0nDbUU2TSmioAWPZfpeHKexAMz?=
 =?us-ascii?Q?rKAoXtZBW4n6QQXDEXQ5WsnFYixt4q9+qlrYz0fcYvAmSyTMFeP6TSxbnTl9?=
 =?us-ascii?Q?Ri+dg269eiuN6dcj7kkdRoMsZ44wcjsCQtSs4ILp/5vrPgx3uXCVVzjLpDP6?=
 =?us-ascii?Q?tgGKHkGZwBdd7irj0Fh/KEXR+EKmCHyJY3Pyd44v7olH+3ztSnRpneA0B3CD?=
 =?us-ascii?Q?M16qdjWVXSW6J6Ax7hW8nNErAaxFKx4eRuygiTceg24tgRCoVmuj/ChSJQ5S?=
 =?us-ascii?Q?8XjLDoF6qfuBnRyxIXGzjNJBsNSEPz2Jp+Y7yTG5AMMFSs0IXOOmFprdXDY/?=
 =?us-ascii?Q?J4lRUbvMLc7jwNLsq5/Vi6uvpwLXmH328U1qKOFVRVGjoaRp1P5Tdz6ZgTaa?=
 =?us-ascii?Q?gver9cYt6dynbneoL2UGVlAiQ/Y3F27BUbteOYxZ39nB57XfIBek68G6rEaq?=
 =?us-ascii?Q?eZpvhjYA5z0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1W8t9CrgpxlizMX+9C7s2P5ti+KrBYcr1HX2zvIQFxm39LtgkCdAyQZRsnGZ?=
 =?us-ascii?Q?3t3dD2z3JOxty754V0G3vD+qnompBdmQa0Dgt0YoRSY0GNsxedl7BkmzXhTn?=
 =?us-ascii?Q?IG+jZy10rXHyE0MP70yZbcK4qdNeZwVeR9irKRy2F0aOpL61yHWmAv87JyEC?=
 =?us-ascii?Q?oXfCcwx/6TMtbhCZbMjibYd3zBGlKWqha+vSofei8oPvBzYEvk3ix4sCWLPf?=
 =?us-ascii?Q?j4a+IE10FA84EEgzwYhWJ98kBQ/zzDXS/n+Myh9oZs555FnTAz8JiF00Nm8U?=
 =?us-ascii?Q?TTlFbY39idbpTxcYX8EPZDLr9AYiC1CtTyqFiJI8ga0IAxacBCCReWciLvtu?=
 =?us-ascii?Q?zV8EyoiChdP9eWOx4Kt74R3g9/4Yp0IvtCm3PDrWo2d/AenIu+hvOQ7BnF9Y?=
 =?us-ascii?Q?g2r2R9uWHM5gUqlVBjCthUX46FmwjO7fyu/nHu1u/DtVi9LD9PyQRiTeYr+9?=
 =?us-ascii?Q?oaBTh8TS65H3nygtbmYEK3+o3XZRq/lvAhrWZvzgJAI9Gy4/kdmxnyLPitFT?=
 =?us-ascii?Q?g/ut42KS219U6aCtJIZHsseOjlSfYGuC06zgXlGsmzzbn3cwlQM9DOHq4lQ4?=
 =?us-ascii?Q?A/dOnEb9oACZHLOdRvv99maNnNe0qoV+b6ru8pjVmRlqTmYNDQfhHSDWiCSl?=
 =?us-ascii?Q?E7sldbfWtroQitG3HUqRELzE3n5z/sA3kOf6SXgmSgKwbMrIAVncvmnUvvrj?=
 =?us-ascii?Q?o71QGxR+8spZYEojk1CLbm8BbQzjpk1/hcKcqLzg85S+O0rV8MbrfkkvJQ/Z?=
 =?us-ascii?Q?EKh0LRjb12S9HiRBwKM+bmkOniQJHAJ8dROsnKrhdKTwYLDsgVq+5Ucs52dq?=
 =?us-ascii?Q?tvO5hBzAfLaf9Y0jfpWOY/WnefGi5c35paULSNhQJjAgf6+lHT6qLrzxI/Y3?=
 =?us-ascii?Q?8/qh7O4VDqWn68wz7umUjSXUDwEANYUJWCGngsUzo4npLZOmJhYaVqwbx72O?=
 =?us-ascii?Q?oB43qPXrnYhOcvDEnlWTQoeiXfx0kCpgxstun8UYevdC9Blla/IkwCGudy+v?=
 =?us-ascii?Q?fdwD+5lL4wTsLwSFDQNszFVyU//Qd678Mcogw6HAv72AMqcp8pb4gdtfBlig?=
 =?us-ascii?Q?+dScRA7mB3RCjBAjD6TMBNAzJFsrDtTWD20aepfEbWKjdKzHhKjEtSCvxOwB?=
 =?us-ascii?Q?DB/DE8nfKJ0SxrCkb4vK7+AYjpOhXU4ikJ1u+XdCK+dLLFDqlMnO78rBXpmO?=
 =?us-ascii?Q?AS+3XAD0BLp11fg1XhZohtTDtdOnmmdpnsD4XV436JsvwXucv4PcOLt+mbpF?=
 =?us-ascii?Q?8MkYQM7UpSR6NtvHNvVGI2zBiWGJuAKsLxu7ZQZdbemNsZbFkVGVIOySiSbc?=
 =?us-ascii?Q?L2bZdRxupvrbcOUlO88h0bqtH8joc9FrziF0uIOzEAuyB72Wrpc6I+O7OCXX?=
 =?us-ascii?Q?w2chGyfCWtlu5E+udyg4UQuulvz/oODoaq5NK2hdCVvjXmdqig/UwH1+tjdv?=
 =?us-ascii?Q?KYmjyp6mJ4bNhOw+cJn44YTG/8no2bRb/ZvkJPy5FQ7+saXZfHYTiZj8YKgZ?=
 =?us-ascii?Q?B5CBiPNXPxEhDZ2lviUL3Lbqt6vmwC6fr9BqMaI5NOemKdVZaB4mBBb4JcxU?=
 =?us-ascii?Q?c9zO9CHrKvT8QrtUcvne654vkkqNwoKYrxbtxDjWc15ZpMGG2K/ieSBxZdx8?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bae174a0-8f9e-4c15-e792-08ddbddd3f12
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 05:06:50.1833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cf8XyBRTZ+nY13O+7j4YlLpqrJl9ogzm68jrxsB6ucOk+nxBH0ixhS78+hnCKXBJUC/4JPIveKJ1ex7Vdv57Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6188
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

On Thu, Jul 03, 2025 at 03:41:14PM -0700, Lucas De Marchi wrote:
> There isn't anything to set for CTX_TIMESTAMP handling in the empty
> LRC, that is set on every LRC init since it should always start from 0
> rather than the value saved in the image after first submission.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 75f4678cb090a..2c735b3679f86 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -603,8 +603,6 @@ static void set_context_control(u32 *regs, struct xe_hw_engine *hwe)
>  	if (xe_gt_has_indirect_ring_state(hwe->gt))
>  		regs[CTX_CONTEXT_CONTROL] |=
>  			_MASKED_BIT_ENABLE(CTX_CTRL_INDIRECT_RING_STATE_ENABLE);
> -
> -	/* TODO: Timestamp */

While we are here, we can also remove this one:

1066         /*
1067          * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
1068          * via VM bind calls.
1069          */

This was from very early in Xe when we thought we'd maybe not pin kernel
BOs, I don't think we'd ever not pin them. Also the comment actually
doesn't make sense either, as GGTT mapping have nothing to do with VM
bind.

Anyways this patch LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com> 

>  }
>  
>  static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
> 
> -- 
> 2.49.0
> 
