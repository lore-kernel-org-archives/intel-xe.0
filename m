Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F63BC369BD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 02:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D283A10EA0F;
	Thu, 17 Apr 2025 02:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qnv8QzGk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D33010EA0F
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 02:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744858614; x=1776394614;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bg9LwwP/RId9m8BPMIMaUnU3uCyhl3QMQiJL5KHlw+g=;
 b=Qnv8QzGkLU8FHdWnngt/3MIyUKbk0pImfMrGLj2EarEo/ZWsSa/6K/AY
 4Wo6sjUURo5I7KBIb7xJ/GehOycDXLwRKObfo49LYcIUc1/+djrueBr22
 Wr9yvWYpu3vkn3dHaCTU6tiP3cgBQG/Qb3pnYj/lkBjwPkeGx82wfFYFq
 7DAwNeHmoH6de11+xqapDpTv3ovlqmu/XOcqDeN4BzJgdjWGlMjn78gaB
 L9Iqxi5E7hqw2DSrRxysNKsevfcHDNTzZU99NY+bY2UjLU4SzokaridjI
 XxvYTwkqYnwxhMCwyFk+G/zCrUXd5AmrvoJV1qdiB3L1VOOV/1k8zQZQu A==;
X-CSE-ConnectionGUID: gHNBsC8NQ76oXHvvILl5mA==
X-CSE-MsgGUID: Q3pSgF6YRGKkjujrv/bzyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46314421"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="46314421"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 19:56:53 -0700
X-CSE-ConnectionGUID: NEqKa/HvS6yTk05trssnCg==
X-CSE-MsgGUID: cQJZRi4FRzavYfTL3yh7Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="131570826"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 19:56:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 19:56:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 19:56:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 19:56:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+YUuMLXiRgYrVnogbW+SeNl5JPgnSYz1sSXWkfHjvoMiihxsyItxLchx5AKGlRb7oEtl7z62d/ljBAabhWzPX0YF7c/DxNVNeoOa68OpqbBVM8hTFhYmS6NgooFJ27X3ApZIwm/bgvL67x2k98Mo0lEJvUM+H9W4gfqvBUf6cefEFGDzwjZg2l5sSj/nP7KGohWXmiBUoOiCFO0eobPW1lxyrK5+l/eVR6OWj6+RttHkrfOAkzK26U9MU2tArJxP/g6xhkEiPv+T+kTfyOejd0L7cely2G1w5mwM0+q8V/c8Y89eb1RD9pqOztCSIujciTJ6qbJpWfygTJak8VsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCmoK8NH5+qOxQjaKR5z1sudlWmOeczws743HvQxB7Q=;
 b=Dbc+iQuQRWd6BmWust3wgxt+Xwbw2bPWsLfHQkT05CtMwRRB7hxhotoSHTyAgRni+wE2wSfJD39+HHuwEJyphMaVGjAZPx7bNZl0bfKwkwoXKv1Ycq9rCzg4ppzlLyE/62sSRtIAVfbVxiyZRVijiMlKeQ7t2TJy9Dc4dNQMKu7DTr/jYaI//v88+2tt/wImcnQ2icsDuiBookKqoUzMXZGpRmf5qfHGaUvYeoIm4tgkbI0kR47LXzNAy/+EY9pmwOiYmy3pw4+MiXcR20RP4b8KjAkB3bapZ5qXwKYQrb3cgN8MQYSjpnNBT8lt+mQpb6Rf2H+gSh7bA9E9l8nWvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5304.namprd11.prod.outlook.com (2603:10b6:208:316::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 02:56:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Thu, 17 Apr 2025
 02:56:22 +0000
Date: Wed, 16 Apr 2025 19:57:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 10/32] drm/xe/svm: Refactor usage of drm_gpusvm*
 function in xe_svm
Message-ID: <aABuJfAvTnFHbFGs@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-11-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-11-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0225.namprd04.prod.outlook.com
 (2603:10b6:303:87::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5304:EE_
X-MS-Office365-Filtering-Correlation-Id: 99222ff3-5667-4101-89a2-08dd7d5b6f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ve6xENMZ7NYaNx0yt9QvmuZx6q92XE325RdRaEc6SqxZCjkkHHgMhfN9lW3d?=
 =?us-ascii?Q?0njP2Fm+ZZBx13VnHqMnCP2XVgFQABaVSjwX9qpE5KOYMRG6/Pa9Nt39Y6hu?=
 =?us-ascii?Q?HXDJXGXWszF4TD5JWDoBMU0QDnzBEXhvChgYvFt7So7tvvH3fJAQY4MJYADH?=
 =?us-ascii?Q?XbfG4rCEzQc5E+XLtfLBi6hakBv1sov1DKGya+qR/KJuU9vvnFPSqfF2SNdk?=
 =?us-ascii?Q?Uy3Y7gLwuTR9DjIzMg4rQyQVEgE78Xoa450OCk6qCXTjIisCFB9arYbxs8/J?=
 =?us-ascii?Q?RRo8saymKHLR4Ti5p53M1GdLUrJGaG4P4FCdmZexyWO/0yMRMKoGxUhYcIlM?=
 =?us-ascii?Q?+Xbm+8zIPDTHt2Xh4CfgpKpxjgjVCcdtoD3rygWtHOnfX+W9D2HUA9/vZ2K7?=
 =?us-ascii?Q?Shy+bvJkG+6ebXr7sSDSaXKlhf5mv71sOKwy/PutOiGTx0hvCYHJnS3dMImY?=
 =?us-ascii?Q?fyvWjXnVuzgSvm4q6E/k4kHuGtUAOdeknBqIbab+65TVyMOV1miaij4BAeaM?=
 =?us-ascii?Q?pxjJ3oMl/r7TPXMAPUBeq5ES5tlqgR+I5jTPslWzbGGMCVdT/tsROL/67AlM?=
 =?us-ascii?Q?SMRtTLtNZdfwDDN6wxpjUAV/ytKqcYvaVfBn1mCDixlNQ5JJY5gXx7/WhG9f?=
 =?us-ascii?Q?c9AQ+ziVi8BvF3mr3Cr9H7prFms/xy0NheUN9daThE+Q9h9QVPTb0jucd0Ip?=
 =?us-ascii?Q?mtuamH5UeVqJ7dlHio7LK2eZ4Af2DQkGQwjbxR6UgezpQov9wt8hpxGDP2H4?=
 =?us-ascii?Q?j+A4LlECRqy0ZZkyxA1n2iWt34ChTb+otC4iZ9mkdu7x5gqnn+l+3Hs2Y86m?=
 =?us-ascii?Q?BnKzkLbCTTl4kz+EIMcHn9T+BDBnDMZXRQKtIVwtFW0fWv/LYUeOf0u4ZULm?=
 =?us-ascii?Q?WEEglk4gm63SQ/5aJufp/DVzS8mYCwRRBW5S3kmEiCZGYWT8NB1b7qDk2zyV?=
 =?us-ascii?Q?fVCzgAnBE9i8Yxj4g8SYp2YUBhBrFHMm1Zl4YZl84H13846wOEN/toy4IlDt?=
 =?us-ascii?Q?WrQivJzzBdZPtCtN97u4oK3WTH7GU566KHhUtYavRgYFQgYr9NLxmpDsnbZr?=
 =?us-ascii?Q?ivkRddvba0+GGyB45ZXbklVTAjQ5sZ+AJdX0Ve5tUy36J6VENJqts5+mXMYL?=
 =?us-ascii?Q?C92R5vH4JklkN6LNHdPHkKNGuHr2DNfJqqASrm1S6NgyS20MUrRarcNqKc0K?=
 =?us-ascii?Q?/an33OTeHU4RjIjtCmHTnox60QhaewepIr9uJMvJiNFEPp5sE5u7LkKlVv7U?=
 =?us-ascii?Q?SPTCtrv8pIsxrMOdnTQW07Zzr31jc/PQKfEubtgMpKtmXIlRwVpacHFpIWIV?=
 =?us-ascii?Q?D+qzkWxyV4hFvlaHsevT4Ctcha0NIGxGLGw3wc2OuZ2e3BWKC1r/FDkPAkYw?=
 =?us-ascii?Q?10zrdAVfXofuyVB4JFWMrrBPDxeWlXS7Qd+2LOfUaCat8axN8GxQs7xDo9Oj?=
 =?us-ascii?Q?s8OUqxoxw8g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DJhtjHfTna9GEq540085L2eiocU3cNixYyF0wkUy1V20j2Y0Hv4K1PAooENU?=
 =?us-ascii?Q?VbIn73rl31OvDSKaRTCUXE4AA7rFunMW+szbjHcsX+uiO5aikuex+EEEHKB9?=
 =?us-ascii?Q?wanVnlZNcgfrQ3sfI8efJOmxx4YJxKcmKbhE30rOjeREzy0LyHnNHRVU/wqI?=
 =?us-ascii?Q?i9CeGYWfXvn/k2F65XQCS1f5drjml7K3R0vDJ80LlqwoW/ZHGQJnBfvksvZb?=
 =?us-ascii?Q?SqeE13dB5FEvOF3pR7bVvuJjUYMqR6MLjbzn2xxjfmgfxylmMDwGrKuSiOXF?=
 =?us-ascii?Q?GiYzwWSG2lBDiLkp13B5alIgwBKfiPQauJeqTlT6MdXEmb4eV7OLZ1SuZZ0C?=
 =?us-ascii?Q?/q8K5/n9orJV+1Sw0wJk1a0pNPw7jjjagDaADjWYw4eTX/Gp822KJ87GZ4aA?=
 =?us-ascii?Q?yMj3pu2PXar5trCop1LgMxo9Qc1BlaBQ1CcV565k1Cw7NrQpmH2s2yFS195L?=
 =?us-ascii?Q?YUGFfy1RI2rzIAI0DKbTHiP1+mQXb0aO8Gr/VAXqNdO5d+/N/6ZZJTz2cqBy?=
 =?us-ascii?Q?fYXxqjrNIP8JDXFphpOaZIHNpwDiKgwqBp4A7+v0T3aKitVqn9DMhKRY6r2Z?=
 =?us-ascii?Q?pCRsd1VEnctMiQVAuwE+VM6cp/JMUTlgdCMxuESkXxVv4HowuOg/WAhy/E5D?=
 =?us-ascii?Q?luNENFH08B+P3Pcdlh+Lw6V/N6n8zPBpq/TcsXOVTFwxrorpM01A/FHOd2U6?=
 =?us-ascii?Q?0L/sCzS9PF/8mnDTpFHyQ8JOiw057ds5S8yRmvXuXknyv8a5bHw6JZ+7JNf0?=
 =?us-ascii?Q?1qbCfjK/N7XJQFXmpUwms9sFPEBJLsRGdacO9tyOUvCV8R8UBLE3GAWLWpW/?=
 =?us-ascii?Q?V65SQfm29DIDIdvX0G/Et7ZdynRKGy69NFBpo88ag7lo+hYl+jiGx9uP3DJv?=
 =?us-ascii?Q?bmOk8xJ6ZjfS3siHUyPK1ffZeQ1ti4ekH2upI6UKscuCmM2jV6LdigJg4y35?=
 =?us-ascii?Q?q0aHMbcwDGOiUi2ABv4kgzKHLv3m9YKZ9IOfDzdvkiBa0wWQ8Cov/a27IZ92?=
 =?us-ascii?Q?Gq7Uzf4+P3k2pC5+FLMuxeIE51fTfN75gB/6uDASE9rEpQZnLR+rNtBdsgnG?=
 =?us-ascii?Q?j7lWXcTLZnN4fcV3OXUh0QIp8i8Qtk5ND9b2h9EfQihgsRwMvQJKP7sP8HEf?=
 =?us-ascii?Q?MeXrcJcJBciv7FBAjJ6TZ8UFd1XNTzsSAxLP5HLiMk/HF87tNyUWycxjMR5t?=
 =?us-ascii?Q?FxUOjTAJjm/go4Dw3m67fSc8sKxkGJshMf//oW/VtELgHPe69AS3bExp0kEQ?=
 =?us-ascii?Q?CpRaZyDyF+AjxPfO83+LBDtnQ7sSWgPQzYxZaIo8bB2fE6Kw4hjz7TzXudr1?=
 =?us-ascii?Q?+KRgTOwIb5SbOesiRWuWIUXXKqzSFWy6w/R1xvN/aDsMvbhVYD/ZVKM3cucS?=
 =?us-ascii?Q?97B9s2bLXXmB/3j/60Fptchgum0RyRNo10Of/uAEu53ZHXNGMG6Sz+pCCSfK?=
 =?us-ascii?Q?AWvstKC30HwTM8+iPsueMzwEIiyY632+ue8A+VLHd8ynMhoREFlmJfeV8kzW?=
 =?us-ascii?Q?Y/PqL21Cl2/L852sdI8O/J9EE3GqJaDs/AGbbySfwDd1u83sRwXfMegc7JYh?=
 =?us-ascii?Q?5wtk5aDjEP+JuBirojpZ9bTV+xaqHgF422uVVTy9h0Lo2E7lzwDTbit8nQOr?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99222ff3-5667-4101-89a2-08dd7d5b6f44
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 02:56:22.0392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rCZXHc3kci07aSYObuLpmegyRQlZlMNwmCkHRwt/vZ+Q22BQqnG+Lk8gNJRXLYugDwuYNVQJ4YyB7ed9wfSMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5304
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

On Mon, Apr 07, 2025 at 03:46:57PM +0530, Himal Prasad Ghimiray wrote:
> Define xe_svm_range_find_or_insert function wrapping
> drm_gpusvm_range_find_or_insert for reusing in prefetch.
> 
> Define xe_svm_range_get_pages function wrapping
> drm_gpusvm_range_get_pages for reusing in prefetch.
> 
> -v2 pass pagefault defined  drm_gpu_svm context as parameter
> in xe_svm_range_find_or_insert(Matthew Brost)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 67 ++++++++++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_svm.h | 20 +++++++++++
>  2 files changed, 75 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 6648b4da0bca..8cd35553a927 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -735,7 +735,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
>  	};
>  	struct xe_svm_range *range;
> -	struct drm_gpusvm_range *r;
>  	struct drm_exec exec;
>  	struct dma_fence *fence;
>  	struct xe_tile *tile = gt_to_tile(gt);
> @@ -753,13 +752,11 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	if (err)
>  		return err;
>  
> -	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, fault_addr,
> -					    xe_vma_start(vma), xe_vma_end(vma),
> -					    &ctx);
> -	if (IS_ERR(r))
> -		return PTR_ERR(r);
> +	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
> +
> +	if (IS_ERR(range))
> +		return PTR_ERR(range);
>  
> -	range = to_xe_range(r);
>  	if (xe_svm_range_is_valid(range, tile))
>  		return 0;
>  
> @@ -781,13 +778,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	}
>  
>  	range_debug(range, "GET PAGES");
> -	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> +	err = xe_svm_range_get_pages(vm, range, &ctx);
>  	/* Corner where CPU mappings have changed */
>  	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
> -		if (err == -EOPNOTSUPP) {
> -			range_debug(range, "PAGE FAULT - EVICT PAGES");
> -			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
> -		}
>  		drm_dbg(&vm->xe->drm,
>  			"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
>  			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> @@ -866,6 +859,56 @@ int xe_svm_bo_evict(struct xe_bo *bo)
>  	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
>  }
>  
> +/**
> + * xe_svm_range_find_or_insert- Find or insert GPU SVM range
> + * @vm: xe_vm pointer
> + * @addr: address for which range needs to be found/inserted
> + * @vma:  Pointer to struct xe_vma which mirrors CPU
> + * @ctx: GPU SVM context
> + *
> + * This function finds or inserts a newly allocated a SVM range based on the
> + * address.
> + *
> + * Return: Pointer to the SVM range on success, ERR_PTR() on failure.
> + */
> +struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
> +						 struct xe_vma *vma, struct drm_gpusvm_ctx *ctx)
> +{
> +	struct drm_gpusvm_range *r;
> +
> +	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, max(addr, xe_vma_start(vma)),
> +					    xe_vma_start(vma), xe_vma_end(vma), ctx);
> +	if (IS_ERR(r))
> +		return ERR_PTR(PTR_ERR(r));
> +
> +	return to_xe_range(r);
> +}
> +
> +/**
> + * xe_svm_range_get_pages() - Get pages for a SVM range
> + * @vm: Pointer to the struct xe_vm
> + * @range: Pointer to the xe SVM range structure
> + * @ctx: GPU SVM context
> + *
> + * This function gets pages for a SVM range and ensures they are mapped for
> + * DMA access. In case of failure with -EOPNOTSUPP, it evicts the range.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
> +			   struct drm_gpusvm_ctx *ctx)
> +{
> +	int err = 0;
> +
> +	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, &range->base, ctx);
> +	if (err == -EOPNOTSUPP) {
> +		range_debug(range, "PAGE FAULT - EVICT PAGES");
> +		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
> +	}
> +
> +	return err;
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>  
>  static struct drm_pagemap_device_addr
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 1ec90d9bc749..9c4c3aeacc6c 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -89,6 +89,12 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>  }
>  #endif
>  
> +struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
> +						 struct xe_vma *vma, struct drm_gpusvm_ctx *ctx);

One nit, check on the alignment here, checkpatch should complain if this
is off, hard to tell if this wrong from the patch.

But patch LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +
> +int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
> +			   struct drm_gpusvm_ctx *ctx);
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -241,6 +247,20 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>  	return -EOPNOTSUPP;
>  }
>  
> +static inline
> +struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
> +						 struct xe_vma *vma, struct drm_gpusvm_ctx *ctx)
> +{
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static inline
> +int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
> +			   struct drm_gpusvm_ctx *ctx)
> +{
> +	return -EINVAL;
> +}
> +
>  static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
>  {
>  	return NULL;
> -- 
> 2.34.1
> 
