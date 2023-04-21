Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20623C77B61
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 23:47:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F0310E107;
	Fri, 21 Apr 2023 23:47:14 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C683110E107
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 23:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682120833; x=1713656833;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zDOzaq5CvOUflAU4ao7sMek/vQoNgku6uWs0tP6H7Ak=;
 b=Snhp1AA3nxVslAVdBNMKqcaH+ov8J3YiRuSfs1EXtk0NC4DI+Rsf+tHA
 1CCkTlGxC8zNEg0AnLn6hjGJAWm22wg7XYeHAp8ISh/suYMzmGeV/VEbP
 XJTy2PtRJNGj4py06I8OySuC3W+uZguu2dvOa+uGxxqd79/JgUujHHLSK
 ONaPDNcO31t+zKtcswKek4/r8Bzy0Lifhtgrr9zd+N3+rijp+m6TSAqGk
 gkf5m/HdD4yNdVoSddtei6lM9jzDO8Ah1O2cQJbbj88Xb5HWUfB0Tpeix
 +6r2v+sw8/1Zb+icoffQcU59PheJeK4G1NctAthQicXFGy2HXFGOHAjFv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="326434246"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="326434246"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 16:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="695105888"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="695105888"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 21 Apr 2023 16:47:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 16:47:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 16:47:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 16:47:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqJ6URKGL538jYAxAS8fizXbEbE6tHrF+BAfvWLOa8LPBIl65pu7L6wm6a5etBfbkbzexJHHb4ZwQ2Xlmu0spsX+dvBfGivwpP7lsALUJymW1BWK/K76EMWixWFRN59Qya18S5XH6kv3c3SZHootmS09cF9NQnqObfXTeN0ARmId0uWYADiEONYXmF6qMgIDqTfUTYVIzIlXRTsFujeZChNXjnbE4ymtJiXNEppjm//ifQjcR1EQuxyaluwMTQz4IXgUn9oOKr1PqC1Zxu82ppjBAEVsilIhKljZe5QMnbWgnQ1SikZfu5Q8VQUtYRTTAzBpYj4p0fFbexyF5uQ00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTXFlEpuo9NGV5mH06WPZw8hwv33yBVKySquebdwZN0=;
 b=eC9Bn8k6KvYzgO24waBPYsHfJw6MkfBBXydgpA/PKMGsVR4tlbmtihOBYkm5TCrb6nmJQ5tk84DUrCuKUT53dsxz1rX2eLYK3uiWi1EXxZDloUfh3D4q1UsnjWGceKWVqHMucqbIA9sxAZ9gWoIu9snK5R1Tjw5g1WEVpHfvjv1/hytqQJs9KCvBr8bkfr/c951wAR5DJKvZNuE2/lFBlzYBdkIk4ihBm6LCmmU+FTwvVfEfhjse18fkd1tHQrIm5UmdkzapKobeK9wHUnHdQN3YqU1jJ7mfzw7qTRCG/y8WtQzJ8RhMNaZ/lIt+qETrFA7YkLPDNZioVBLppBVlqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB4797.namprd11.prod.outlook.com (2603:10b6:a03:2d4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 23:47:05 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Fri, 21 Apr 2023
 23:47:05 +0000
Date: Fri, 21 Apr 2023 16:47:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230421234701.GR2825255@mdroper-desk1.amr.corp.intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230421223258.128781-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::12) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB4797:EE_
X-MS-Office365-Filtering-Correlation-Id: e552ac9b-c489-465c-c59f-08db42c2b5df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UZDbqkImYxT5390Yi3sxzY/WPlafTx/YFjoLN2b0h2Fib5gvUkD13p83piZTZAkqRooiIt6XYuP2vSP/UIPp+MZWnEsoDSzNfSbikHogkIQZ5N2UoDvdgCLtTrJWUbqn2Wt/Jtz3Mw35WvRZKFGpsnh3/j4aDoQXoLKtkqxxSMtQCoqghAimeZGHoRjNtcX6s7AIPleY23F6uhw7QU/ZfGC93SKL1ewXGTRYcxumuNPxZdYgwx1h+F/ub0ec7nzBiz7ufoWQEQSuI8UDnVEQvQ+ChWViG+gqwAA8wHkTCMTQtKhlC+tDLW3HO6q2AARBKuI6QTW6akDfczv+CPojcZKhOscA/6UbUIYbZxBuJvAzPaptOOQdQ5/LafjKIDMGjJn/RPmTMXa+hIwtvpRvMsjIF42oPlyh/VvX1DqfNShRIcYegVmDl+PrUvoWXR07bST/A18atgwLMspZvP6HoVlGS4ygnYrGam/rPq7nubAZdUG/K+IqexlofyK9ROYDsyHctTFsTYjYr/iP5J5TC3i+vRDwTgDNqFggyx3p15tfSZ0blFTQfb1FONdgp0WK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199021)(2906002)(8936002)(8676002)(38100700002)(6862004)(5660300002)(33656002)(86362001)(6506007)(6486002)(6666004)(6512007)(1076003)(26005)(54906003)(6636002)(83380400001)(478600001)(4326008)(186003)(316002)(82960400001)(66556008)(66476007)(66946007)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SgnqRXI1JKWF6xBErLylm5Q2hexjHwfKNYxUnd6j7sfDIqHX88zcfUVGVk?=
 =?iso-8859-1?Q?+Mj+BG6a/SrnGb9nie/b83OOuhdaaSPrxeTw1nhYonsLzIyr1VnlKSGqIN?=
 =?iso-8859-1?Q?d/D+9EByyniUFmg5umIlmQusTSds0tCFZz2IkPH894nWCekY5BBo0N/1oV?=
 =?iso-8859-1?Q?4aFi4khxTSBRybWCo8Ctki+EPeTJ8haVoN6a2JR90PTR6yonFThoMSd0VJ?=
 =?iso-8859-1?Q?zjsX2kr7JJ+9tpE0LyadHqKYA2X9qkTfBBNtZeoA16SodAxTMdol84ke/V?=
 =?iso-8859-1?Q?cJcckpsS+OFlToJU/Zm2WlzXU98dgU834QFYX51j+B2USfX8sRMlCSK02T?=
 =?iso-8859-1?Q?dZynsNKte2J3Hgr4GdcFamMY49Fvx3upjFRq+OB0e0pDoCHB2zi8qwLSbV?=
 =?iso-8859-1?Q?IawpP7jTMQsJatCaDjQePKzQPEF+CRI9cG8ePNimTaiioG8zSgEQ+FLBmE?=
 =?iso-8859-1?Q?LoxCBZlVNocIHCHjyRUHbVsT/+lvIxEi4xDD+mfJ4O0VEI9yMfCRpcFxdW?=
 =?iso-8859-1?Q?OW4bABCaGoN/kqRuUBfW7mbprvCI7MmjeC7jJXxGdnW19EM4d6bhRxDUY3?=
 =?iso-8859-1?Q?a+thEMHZW9s7PeAq0vzO1e8JDxURJYwUnndcwCRsWzvBvaMkJI3NUrvDHn?=
 =?iso-8859-1?Q?oP8wF8doNf6dvJbyYWtZ27wgxzppL19CiS467kifWM4j035U/VMCuMvkKF?=
 =?iso-8859-1?Q?NgIe++b2KFJcfzCaLKYpo+gvFWFDJt87/69emX3j177INB2IcL2RFUSjXk?=
 =?iso-8859-1?Q?/OSsvznVQYmaOBj0TB7OqiCRWLM4c+8u2ikY2R0g7Pst4EeIUcxYsL1rX4?=
 =?iso-8859-1?Q?rRTgaFDwCaLu8Dl26eI6tNPGd24OJ48aW7MHcitw8vyaX0Us/I85DjH27n?=
 =?iso-8859-1?Q?/8rxBnPMOypy0iSYxKScOVZalx38nGj1JXs9Q36ObMWG7ZXeYYJBBxU68/?=
 =?iso-8859-1?Q?3G51g0QZMQosZeasMYA7A6F/YLvn6NYo0s0+6zzAGgh3DXcovtJFOljfOy?=
 =?iso-8859-1?Q?JHAPH0b3cn+qzCsiHNVE1tuUiFs10g/SXzHSAEpssq9P1DrmaHeVDtTCqD?=
 =?iso-8859-1?Q?py850X2iK5n1tjqLxHAEK9QQB51CNAgoo87pbPE3niQfE1+JM/of8Y4HlH?=
 =?iso-8859-1?Q?QUwEfb8NjvSofZAByQU9xuav/fnl2moFnTr8zQigck2u2ediI+ttWEM7pF?=
 =?iso-8859-1?Q?x313a1PnSKC4CsijoGtYnzT5poNVGxCojVSPDHHaSDMzv2QktO6OWu+Zv9?=
 =?iso-8859-1?Q?FG7KLlTIrVB+RBCp+jz5eBmhF/Rj4VDGd0/yPztsA47ahJQ617hCjU8XOu?=
 =?iso-8859-1?Q?K/wGbITvGnvHu8ZxafnPgrsywROOwzY7bRPkO33eUvyaImGJVefDXs9yqO?=
 =?iso-8859-1?Q?2tzlR57UPjv197B8emtUsOEVZgaxEIN8Y0FWAsnU6MPrYBwqfVve3UF5Ph?=
 =?iso-8859-1?Q?+rRDINmh856/YQj44ZlYJNH/1QVQ/Nq/Nvomev9kOoj/vy1d3DLA2+8zYR?=
 =?iso-8859-1?Q?3pB7ovUDu2l0OiQ4bfyvaZMq6qWap0qLWatvprp4rynmiWlbnsaavflN3C?=
 =?iso-8859-1?Q?rCwtW8GcoTk5LxPZURbKB1+VYKjbKIPtioD+8tBb2numlblN2ShPfAL59b?=
 =?iso-8859-1?Q?1dEf1s6dK2jSpGLtZdKeiVcqKJLSNwM9k8DIZDyddbvNg84ihWQm5iSA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e552ac9b-c489-465c-c59f-08db42c2b5df
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 23:47:04.8532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tkhLDw+0YeUS08dzEfJpMfv96WryHEfXrqy/DZUgwD8gtfIsqyUNR5SAm8E7qeWdxNOgzKN/EIfAWah0EK6DftY9zoAU5sqk2AzaU7tBaxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4797
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 07/17] drm/xe/guc: Move GuC registers to
 regs/
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 03:32:48PM -0700, Lucas De Marchi wrote:
> There's no good reason to keep the GuC registers outside the regs/
> directory: move the header with GuC registers under that.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/{xe_guc_reg.h => regs/xe_guc_regs.h} | 4 ++--
>  drivers/gpu/drm/xe/xe_guc.c                             | 2 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c                         | 2 +-
>  drivers/gpu/drm/xe/xe_huc.c                             | 2 +-
>  drivers/gpu/drm/xe/xe_uc_fw.c                           | 2 +-
>  drivers/gpu/drm/xe/xe_wopcm.c                           | 2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)
>  rename drivers/gpu/drm/xe/{xe_guc_reg.h => regs/xe_guc_regs.h} (99%)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_reg.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> similarity index 99%
> rename from drivers/gpu/drm/xe/xe_guc_reg.h
> rename to drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 0cd38d51cc60..011868ff38aa 100644
> --- a/drivers/gpu/drm/xe/xe_guc_reg.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -3,8 +3,8 @@
>   * Copyright © 2022 Intel Corporation
>   */
>  
> -#ifndef _XE_GUC_REG_H_
> -#define _XE_GUC_REG_H_
> +#ifndef _XE_GUC_REGS_H_
> +#define _XE_GUC_REGS_H_
>  
>  #include <linux/compiler.h>
>  #include <linux/types.h>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index ff2df4f30e97..e00177f4d294 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -6,6 +6,7 @@
>  #include "xe_guc.h"
>  
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_guc_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
> @@ -15,7 +16,6 @@
>  #include "xe_guc_hwconfig.h"
>  #include "xe_guc_log.h"
>  #include "xe_guc_pc.h"
> -#include "xe_guc_reg.h"
>  #include "xe_guc_submit.h"
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index fd9911ffeae4..fe1d5be1241e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -9,10 +9,10 @@
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_guc_regs.h"
>  #include "xe_bo.h"
>  #include "xe_gt.h"
>  #include "xe_guc.h"
> -#include "xe_guc_reg.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
>  #include "xe_map.h"
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index a9448c6f6418..a1c3e54faa6e 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -5,12 +5,12 @@
>  
>  #include "xe_huc.h"
>  
> +#include "regs/xe_guc_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_guc.h"
> -#include "xe_guc_reg.h"
>  #include "xe_mmio.h"
>  #include "xe_uc_fw.h"
>  
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 97328e441f0f..cd5433b5c970 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -8,11 +8,11 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_guc_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device_types.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> -#include "xe_guc_reg.h"
>  #include "xe_map.h"
>  #include "xe_mmio.h"
>  #include "xe_uc_fw.h"
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> index c8cc3f5e6154..7b5014aea9c8 100644
> --- a/drivers/gpu/drm/xe/xe_wopcm.c
> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> @@ -5,10 +5,10 @@
>  
>  #include "xe_wopcm.h"
>  
> +#include "regs/xe_guc_regs.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> -#include "xe_guc_reg.h"
>  #include "xe_mmio.h"
>  #include "xe_uc_fw.h"
>  
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
