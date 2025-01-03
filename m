Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34183E77188
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jan 2025 01:03:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF77810E7CB;
	Fri,  3 Jan 2025 01:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LeO7BTrq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48E110E7CB
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jan 2025 01:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735866200; x=1767402200;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pvhBaThP8RQlZ22q/EUcVt79rn6/zRSN8nltcBP+IbY=;
 b=LeO7BTrq5tDeoxGcgOLlfxIosUxoep9kjmpWPRcErlxn3TXQUXFhBI5w
 UcWw8lymwL3bA6o5IZmZ7uQQohX/3RAcXZajOkV5Qu7SfPRhKFx48FNBH
 JPlcXtd4m3hn7w+cXliEn3QE0ChpF/GfYZAyQjZmG0CvzhnnmS/xvvpnn
 3L2pNHRe28rVfsP9uLwt2ImmhatFmCO5DCQg9YKGuxFJmdK+fyD8qgbQR
 A8+Ut2qnYKdXUF5B8t1EMwbE3+ys+HUEhqwv5Q8lU1tw46bNfcpNUIVaj
 VNTdlMF9hhvvBaEwrmRF1m2yGJzLUC2UZFwNtF7ccqp9qljtBKikZCGHA A==;
X-CSE-ConnectionGUID: j5fTGc9oTWWETqbGsjIzxQ==
X-CSE-MsgGUID: TU0JO0a/RXmqbH6jBxjRLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="38941784"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="38941784"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 17:03:19 -0800
X-CSE-ConnectionGUID: Dm2BaP6iTfuyGmP/TkouQg==
X-CSE-MsgGUID: S//peOfaTJm/hkjiY1UUlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="106691917"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2025 17:03:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 2 Jan 2025 17:03:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 2 Jan 2025 17:03:17 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 2 Jan 2025 17:03:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4CLZ4qS5aUya3mU+LKcY28pvJBTkNreRIl8TJYHI6Cp/DvFqCHg0p1l1EvqXHi6wpwke76zydGO8Tev8Ul0UicXJWhTkzEly87bG5qTuDD1uK3wFez571RXG0ivEdamk8eVYGVjJZsoWetkNM2/EqhqOQGIIulLOZ9kk7wzDd6m05LaEEGV7YQVkRSHCmAniRxzfK2+qmc8mumHr/mL78puH62Bhu/bSIDiuvm8FDlearZBa5pMGlqBdEsCi2lrzj4eQkiVP9cBnhjX2ry41ZoI8A+vw2dMWvIrllQH+JRBbwz5k4hBBBHiPdCRICr0vDCLx1dlWUxoGwy5fbz+4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOoaQAIM5lP2ETHNxgAJJf7N84H98IyrKGQOIvONFgY=;
 b=o0YqC0Rgvr0lQ+xmj0b7PQ0Tn1jzaB/wsM/RKPUrcA2uOIrMQVct3g6Jg9URWU9A5esMcBNaURe5D5DUXWEiXrwJzaEwi/T/hQEv9QhY80byTYz1sstSpXN9Y1uUx2xcwmP7bRq+tQeOFNPDcEYuCCTiHqPDft/9rgIsZK3yKVjriBZYKUAzrCqnnujMLFbauL9Fq6MmAdDtPE+ntO41zGW5doxBhJLjsHJq1z0sokClJovbefYKY68wIKgFU+EUTnhyGrf2YlDOG/CI2pyvztyR8sTkDlT7yqLL/BR9YTtXJ++WNuqqTqQ8JsyrEnNQUOWN/rzm3StPmEnLUfHDCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8405.namprd11.prod.outlook.com (2603:10b6:930:c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 01:02:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8293.021; Fri, 3 Jan 2025
 01:02:31 +0000
Date: Thu, 2 Jan 2025 17:03:19 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Remove "graphics tile" from kernel doc
Message-ID: <Z3c3V5xeqsFoIfTy@lstrano-desk.jf.intel.com>
References: <20250103001111.331684-1-lucas.demarchi@intel.com>
 <20250103001111.331684-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250103001111.331684-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:303:b6::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8405:EE_
X-MS-Office365-Filtering-Correlation-Id: 400d9d64-1341-44c4-06ae-08dd2b924d26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xEju40UJnTRKzNxTO02nAhZbuH3omtQTibOn6isXi64EYjCsfiDSMdjGoy/D?=
 =?us-ascii?Q?SOpAxP/8mG1IBv5X0rbnuErO6+tmLS0eWbTcOE6ft35PlRV3dK29xE3wBGlz?=
 =?us-ascii?Q?43Piod/9pfkUtg+o3uTErfeURjTkbFmAyv3iiO1KeG81AeWHzjoawGcr1+V0?=
 =?us-ascii?Q?xajzbDG0l6D5r4lUS3eXoSydQtJ+ocwOAoQdzm39AkPUzG4BcSYDqoOgmNyW?=
 =?us-ascii?Q?++qEJiIJSW621Jea2QlZHWzBRgk5NJQKu11c931WmquUnVn8jIVzs1RCRqOP?=
 =?us-ascii?Q?+a3wsZumOfrvGBqzw7FLJO5Iv/k2Eexn1SIKxkG6OR+RM5Gvu7ly48pFiF/D?=
 =?us-ascii?Q?nWz7dBzF3uc7CMEKwOKoAJm2Bsvk18ITVrzl/r/pKIxWNRTBolBdXOjSLDIz?=
 =?us-ascii?Q?o0ex9+hYP/sZbj6IxNgc0/b8y6bfe2AEctEYsBMLmDEfOR3/qoxfCdl/XFFG?=
 =?us-ascii?Q?Vcm9v7eXmALrYtAi2LRXZ9ut+Eni1VjQEbj/rCIVneWrVEvEjGxZUC/wu//K?=
 =?us-ascii?Q?tNfj2M+50tvOpB1QZTPulNxs/aO6IyFC4c86CSA9t47W9M6ZJAqREZ44PXBY?=
 =?us-ascii?Q?0AFGwsir0fOE06h9YBsNkXeCmgDC9wR9xWz3v7YfweLHk9X77t1JhOGQHc2B?=
 =?us-ascii?Q?SZiPXF/g0HaApuIzZnW8jKV29+ZUDqMfsoF2Wx9ejjnR0l9IpahdmeWuygN1?=
 =?us-ascii?Q?Q93N18I9eVxhXYyBovuRFX9Jesfpch3g940ESKxw3lmaLCtyWDV4MKLb4/SQ?=
 =?us-ascii?Q?urIz5YVEIKjpkehlE+zenuzizDgAMkiNNZUlQ+C+qjMBDBuwRoPaJc7uRMFa?=
 =?us-ascii?Q?5xvpKqxvvBdjLZK7zd7sEP8otiOVv5QcyWTlYVIqSALNlHqGC+EuvKn8jz8S?=
 =?us-ascii?Q?U56LP9Mfk2rQFMiFfAn+fNdWht8DBZcESfPa5KE/3U8FI81HE9qUlteGGlxZ?=
 =?us-ascii?Q?CYYkVbRZ4RBLMJpzQdgyrdlRDEpDhaQqDcYGl+wG4wHwfh/efhDFdjdOZIWg?=
 =?us-ascii?Q?WtEx4VYjRU62RPUDU+DyvX3mMn00pghPH4nBXQ8seSGxgDOWjXHl10oH3AST?=
 =?us-ascii?Q?RLHGbXS6c7ioqPCy71esPpMK1JhWs5jR1V7/mPpwm32NGkG/bUxLVy3xUPJ/?=
 =?us-ascii?Q?VlTXCMqdz2ahcupsXEd8ORmG0Ekz4rIPXZoKELiBtb51v7tVSjjc2CDsf2JH?=
 =?us-ascii?Q?bSGVe8dMGfl9r/0GM2tKuBXFm4TfrrOCBWdFjACJG2MF2K62bLkqNuHxWQia?=
 =?us-ascii?Q?Nx1twVxZmQHIphfDv2+UmgToTTUhX7pQHFFRjf5gpnJvN05LM4MWss1I3j9N?=
 =?us-ascii?Q?bAvFnrv3KgigOh3btKUtE1gua8t+UQUc6Tfpwb2Ye6ATHEKhkFhwlcVGWM50?=
 =?us-ascii?Q?eEzrPE9J9wLCVfahvTofh3TqsGZL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RIIUiGrmK1aNdQj+QTe6vWAtAFLdTJ2mftjPXZYXMFwEjrA2LRiGB+E92eaG?=
 =?us-ascii?Q?gJi8ipupn5Z1JEtXX0QpNuTMQy673YJ4TjcBns9sfOd+paYnbFdF5qd6TbhE?=
 =?us-ascii?Q?K4NeVNCuoRMg7Ua7WVxEeHhjbAsLS3ohzVhxjXYhzhHb9zUvxUf3+TplD7eH?=
 =?us-ascii?Q?MsvUAucQIntIm/y+dDnAUlLXH7OGVFjjay6TVJZqGyrlhg5xEutnwASes4ou?=
 =?us-ascii?Q?Pd/ZOauaTeivW5nn1RbIu5tq9nePJLLFNxIix8so0vlY1ai6E3rm4pNV/vh9?=
 =?us-ascii?Q?iDuv3VdwDXSV4QEB+IQm5bIvgjpvCexyvpPLY50Qfc+sUX36RFwZEj9wZBgX?=
 =?us-ascii?Q?EI/rNx8l1AzNvPThSgKRs2Sa/A6w/obFrDcBIyIWRf8v8TLwYQG5qeBwZnsQ?=
 =?us-ascii?Q?44rJf/OjYX+lspJnaJi0+dJf7P6chEojGUCo93bildRhmxmdvRvNuxLWPZUu?=
 =?us-ascii?Q?8L303N+8jlZJy3GtjFpt4ergodJEj89wuTybOwZtQzYs+WpUSm8o5t1D8oDU?=
 =?us-ascii?Q?VJ8cxgCCBZKeU194E7NiVlKc9ldbbqlve7GZQ0GcGPc7CP5YRSB8cNUDE82f?=
 =?us-ascii?Q?nR21UgQZ4lhPuSxMINhIa0g4Umd+EtHjsYC7RttvYWF/cCf190PZKkYdWmNG?=
 =?us-ascii?Q?pyiuIoTX5jBqFYYj8gx9MRwPK0nWshNvB0aWJJqyK8+bMcTh6FLE21Jwr774?=
 =?us-ascii?Q?5rxPhm+aAx99PjjGzrY6a6fS9Lk29EilppGoDehQe+7ne+SNv2dJWcj9hbR5?=
 =?us-ascii?Q?rg6Y/4INCCNmO3S2MOK3K8EyuDk4zVajPtnEbWl+QgftYE8gX6LZm7JdTvED?=
 =?us-ascii?Q?Jav8DujuyA3tXuK5+V0PZROZmzrPP6tu3XaL7YrsfcMVm4GLFBm7c6l7fd9/?=
 =?us-ascii?Q?PHoSqxX/I7XlUl0alwnQZx22gdNIv9MaXDPnTik/mDXCaNDgS8wLJ3VN1GPG?=
 =?us-ascii?Q?Lih8tCmrVujoqv5ZORYdjAKLM158Nnm5uutIkZ4DOnSS1c21ij/+PmgeThr7?=
 =?us-ascii?Q?Cu+mi2YdHOX7FHJm5OnDCXfuhdW50JChkDsTQNMIOKcLlELgkwCFThyJ0M4d?=
 =?us-ascii?Q?9El4EbVgMU9NwXKH4PjuM8nZUzIWllz7AU3mLJUXsQ6dAh+t9WUepAJns2uf?=
 =?us-ascii?Q?uwsN0uL59V4XtuJvbeUSt5tXi+d8c6YT1tZkNLK6rkfeqvNPeP+i+SWWNVEf?=
 =?us-ascii?Q?TKIgR1xzNVuykK551YrsQ0KlGyzZCIPlqUROIcHjzFHfcYQJnsE4wa+Q/dzU?=
 =?us-ascii?Q?doLlXkj8UdqDYIB2S78xS8Y2SuhR2yJknAQxCKUiTwYpcmip/icrW1RIdtsF?=
 =?us-ascii?Q?ADrvtIIkZWWf5vLUKufsfyHfOyfMV7c7Gy8NWdisTLKaCH8VBIjvSzHAjcVj?=
 =?us-ascii?Q?oRJy5WlD5pkiW0ovYn1Gt1E1SIb5uIJ5rithRc2tiQ5IC5jlvjtEbLNAaXuy?=
 =?us-ascii?Q?97IU9+owsOK3KA/5VJ83ZLHwWbfvMLQGeEfP5o+nnP7mNRe8o/kwKKU8wjxE?=
 =?us-ascii?Q?vvut4Z7N7Yt/V+YBs+B9OXv8BplSWQgRQB8318LQ8OZHJLjFD5U9Jim6PU1T?=
 =?us-ascii?Q?IR0idAtNlMcRsfXL4nfZUS2zV/uChHvDZNQn0mDaUakD+S7IQRcsq3VnCF/N?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 400d9d64-1341-44c4-06ae-08dd2b924d26
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 01:02:31.8169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgTwoa84rOGI/YESXYKR8i4L70ZjlBtBamjKo9IYsrYI9Vj0ckkHauF/RDYsgDCZQdV+p+hgO/jfbDNSwZ0Rfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8405
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

On Thu, Jan 02, 2025 at 04:11:11PM -0800, Lucas De Marchi wrote:
> Avoid using "graphics tile" to refer to GT since it's ambiguous: it's
> **part** of a tile and there's also "media gt". In several places it's
> documented as "GT structure", so just follow it.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h    |  2 +-
>  drivers/gpu/drm/xe/xe_gt_stats.c            |  4 ++--
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 12 ++++++------
>  drivers/gpu/drm/xe/xe_hw_engine_types.h     |  2 +-
>  drivers/gpu/drm/xe/xe_hw_fence_types.h      |  2 +-
>  5 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index eec8f9935a58e..5af5419cec7a6 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -41,7 +41,7 @@ struct xe_exec_queue {
>  	/** @xef: Back pointer to xe file if this is user created exec queue */
>  	struct xe_file *xef;
>  
> -	/** @gt: graphics tile this exec queue can submit to */
> +	/** @gt: GT structure this exec queue can submit to */
>  	struct xe_gt *gt;
>  	/**
>  	 * @hwe: A hardware of the same class. May (physical engine) or may not
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index c7364a5aef8fa..7a6c1d808e419 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -12,7 +12,7 @@
>  
>  /**
>   * xe_gt_stats_incr - Increments the specified stats counter
> - * @gt: graphics tile
> + * @gt: GT structure
>   * @id: xe_gt_stats_id type id that needs to be incremented
>   * @incr: value to be incremented with
>   *
> @@ -32,7 +32,7 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>  
>  /**
>   * xe_gt_stats_print_info - Print the GT stats
> - * @gt: graphics tile
> + * @gt: GT structure
>   * @p: drm_printer where it will be printed out.
>   *
>   * This prints out all the available GT stats.
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 257b500e17037..0a93831c0a025 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -107,7 +107,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  
>  /**
>   * xe_gt_tlb_invalidation_init_early - Initialize GT TLB invalidation state
> - * @gt: graphics tile
> + * @gt: GT structure
>   *
>   * Initialize GT TLB invalidation state, purely software initialization, should
>   * be called once during driver load.
> @@ -128,7 +128,7 @@ int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt)
>  
>  /**
>   * xe_gt_tlb_invalidation_reset - Initialize GT TLB invalidation reset
> - * @gt: graphics tile
> + * @gt: GT structure
>   *
>   * Signal any pending invalidation fences, should be called during a GT reset
>   */
> @@ -244,7 +244,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  
>  /**
>   * xe_gt_tlb_invalidation_guc - Issue a TLB invalidation on this GT for the GuC
> - * @gt: graphics tile
> + * @gt: GT structure
>   * @fence: invalidation fence which will be signal on TLB invalidation
>   * completion
>   *
> @@ -277,7 +277,7 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
>  
>  /**
>   * xe_gt_tlb_invalidation_ggtt - Issue a TLB invalidation on this GT for the GGTT
> - * @gt: graphics tile
> + * @gt: GT structure
>   *
>   * Issue a TLB invalidation for the GGTT. Completion of TLB invalidation is
>   * synchronous.
> @@ -326,7 +326,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>   * xe_gt_tlb_invalidation_range - Issue a TLB invalidation on this GT for an
>   * address range
>   *
> - * @gt: graphics tile
> + * @gt: GT structure
>   * @fence: invalidation fence which will be signal on TLB invalidation
>   * completion
>   * @start: start address
> @@ -412,7 +412,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
>  
>  /**
>   * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
> - * @gt: graphics tile
> + * @gt: GT structure
>   * @fence: invalidation fence which will be signal on TLB invalidation
>   * completion, can be NULL
>   * @vma: VMA to invalidate
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index e14bee95e3643..e4191a7a2c318 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -106,7 +106,7 @@ struct xe_hw_engine_class_intf {
>   * Contains all the hardware engine state for physical instances.
>   */
>  struct xe_hw_engine {
> -	/** @gt: graphics tile this hw engine belongs to */
> +	/** @gt: GT structure this hw engine belongs to */
>  	struct xe_gt *gt;
>  	/** @name: name of this hw engine */
>  	const char *name;
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence_types.h b/drivers/gpu/drm/xe/xe_hw_fence_types.h
> index 364a61f4bfda9..58a8d09afe5ca 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_fence_types.h
> @@ -41,7 +41,7 @@ struct xe_hw_fence_irq {
>   * to a xe_hw_fence_irq, maintains serial seqno.
>   */
>  struct xe_hw_fence_ctx {
> -	/** @gt: graphics tile of hardware fence context */
> +	/** @gt: GT structure of hardware fence context */
>  	struct xe_gt *gt;
>  	/** @irq: fence irq handler */
>  	struct xe_hw_fence_irq *irq;
> -- 
> 2.47.0
> 
