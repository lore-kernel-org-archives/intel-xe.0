Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F25C77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 13:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A0810E23E;
	Tue,  9 May 2023 13:52:36 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C846A10E23E
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 13:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683640354; x=1715176354;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IkMS5qihpyzsQXhVXufFaQd2N6UWBXUHxKl7d5tKlJs=;
 b=Lfdu5X30512aWu5u3pWt0x5cfsKP0IBf+397xVUv+NZ0O/o/IYs236Kf
 Xb/BzmEhZ58B2nFGKacI59hgDhSP3zuv2ONKVz5wEfck4yIYcZt4Kf1RP
 /pTZxoYXrRo1UmSrIhd9PHutDfcBpiY9nzmC6BoSp1wFVo/p5D4AKEOVd
 lWfJcuuyPBs1uGVIwPmqqkVapvGngB4sYAWljgGYleKtryG/PWq2bCo5R
 7SfNCHKRSuUDX4+moSLa351T3NK8oC9pGL4nGVqrdyeEBxHrMqRyo3PSp
 wy0JAxw6J2IyOfQU9rMY/SykOCaLagb1LZHucXe++1aTo+ivw4g3xiCbI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="339159014"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="339159014"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 06:52:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="701858986"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="701858986"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 09 May 2023 06:52:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 06:52:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 06:52:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 06:52:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 06:52:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGtnitE9fSUFVGDyLJhji6sZlO5cUOdACfNE+fWrw/MoXpdxSd+Z1MqPFWOqjvV/iPDvAZ9psmxl/FpKrYCyV7XIOOPhK1YJ498Rz/DG/qVMcfbfKNAUAFPtMJvoHD2cvlbsK5NGwQ97VPLsnUcsop4FHToKIMakcPWzqJoEV3+WwOUor7S/CRSvgkYHBSjoSS2I2BORGjiVkVmHqAUP21jGh8ny5xutLNrzUgemwNpMTqsMA4fj7ficUYHJTaxSxf41a9v+par7s0w4hDPhKF5wVmd8YO4s1pF6FT5TeUt4lsUgXzNkUglViSchmnuWfiUCyS6qtQtFbCF7RxbWNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=An3axvJ6tqIyWvpuI5br+dbtCBzDfF80FHCG9VlK/kQ=;
 b=fJ1GzrXwQfg8KqLzLEtz/Cne2017aTtHCwtr6KRxY7zWkyNQyoFZJoEggiioscl8IALcZHmOwocXLEbeT8AfoFE3jcSWICwmht2TaWaFL56hvsrgPHuUgHTQfLY43GgHzPdTQNLhT+89lLJBi+IZ6P8sc4g8lHLt8obATq//x47MErhNi1rW5nfV3CZqzYoaxAiJe4NuuN54Xr7CCyafvBWhXy9KPi7rdZmvrN0RYhTG7HbgoDvc/pJHpDNUP0I070Hb6pCvf+OHMX5VdbVzmfH9JaPzEfApcSUScgBaNj6QFIhWvarRgfy0iokrpS/vS9LHfu9omj5aqqOXTcuOXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8220.namprd11.prod.outlook.com (2603:10b6:208:478::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 13:52:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 13:52:27 +0000
Date: Tue, 9 May 2023 13:51:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZFpP8rHzDdn5l6Gy@DUT025-TGLU.fm.intel.com>
References: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8220:EE_
X-MS-Office365-Filtering-Correlation-Id: c521b312-4f82-4d08-9f7f-08db50949fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Osn88K+LcpHwtdS/cEb5/L4sYs9NUtJoZU+W3qC1f1pFqRhxTtzux0+Ot381h3xEdBNPUHWDIGq4NddBGfkSR0GgP4UELoQaGseFqGGY45zfBOFt+4vm+vM0kbJbMKLb8m3UBxDOjdXrvmIxSzdrj/OpzoHw3TbI+mkQxJ0W//vgdQ51bt/C57esjw2bH+Ug4uHZgYHn7nv1rK8uw2OlrGAR/bHcPMSesqUFNcAmNtAunj7LS8I3PVHx71Rq61ksXqHJ6v57uK5yBBx3QCvWfURio2PPYk7VRazH3yOwRBRmqLcglzbGEXViB+2CJEJj6B084C3+oYMj1+fmlaMVBZWgtuBOX4ctz8E38fLE0Fjh/RnUDaPeWsOhBytgN4E0rTbNx4F/q4ATDi1a/KN6mD665xoL/ZkkYXFoq8YT705oFie43i24/oNPg2OG5htqhWabi6+gcKxnGD9MjBXHzlfUEsE6AJJoVh0UrzCjvgi7m7ajQY/RcgOVV2SttBEYM4OKn9NwmqsZVHsjoB0dd5SL8kUasifP3HnXDCGuJusFBr98MN8TUJlEPqUjTgQO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199021)(4326008)(316002)(478600001)(6636002)(66946007)(6486002)(66556008)(54906003)(86362001)(66476007)(66574015)(83380400001)(26005)(6506007)(6512007)(6666004)(2906002)(5660300002)(41300700001)(30864003)(8936002)(8676002)(6862004)(82960400001)(38100700002)(186003)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HkIoeHod5DM9IFPrNFHmIYgSy3Un97K7yzoBV1w4au20mNgtRvuH6aIbS6?=
 =?iso-8859-1?Q?DZTd13MvHA8OYfw7+wd1nNA/NP2T4LAxYsiM3euo2s5s7qgEvE6sQBL4EI?=
 =?iso-8859-1?Q?9B6l4dW76V8xjy1/452Y5KCKcL7yE7K/zn0zfYJWXRIpaTgaluqb8OZjDu?=
 =?iso-8859-1?Q?bEnpVRa6U1IChy1e75qov7ip21uyvF55PiPCZM0DtEbtq8KqREup/KjpW+?=
 =?iso-8859-1?Q?O/nkFhbX8iFW3xIXdj1oE5oVc3d091m2xKPAG9+qA0c2BDo+b42NWaWOmv?=
 =?iso-8859-1?Q?bHxiHz0PUfvlSXBZ3knSWKo9Bmd8uhP7uDcFlmZDkUfmuXm/6h0s7WV4IC?=
 =?iso-8859-1?Q?1nnLruXYDC7FOgQ9cb7iSMfRLgWRHwp8aT1dNJ5pJr8JgqxVbfNxpzABGt?=
 =?iso-8859-1?Q?wwMxokvRGSW7aBNwLA5Hs7hpOUUOWVYSawfML8XuBzQtDQ2Cdyo0rduVHt?=
 =?iso-8859-1?Q?HXeyOx+ETK2r+QBfcnxF0hyWQynU7npVHPYz0YTXMNA9goslpkOxWkC1Z2?=
 =?iso-8859-1?Q?BC7hR7K2ipdnpiazo3htgrFDsvCRT1OLZlXRh4vhD7kAWRxHqRVSsMOLFo?=
 =?iso-8859-1?Q?6x0Q9bT6IWrzeqFwImlZmof2Zn8T0hth1NRjsWDdLaeGuEwkgY+A/x88Nq?=
 =?iso-8859-1?Q?9cNxstdG8K0Bq72u9io7NROz1/nj+LZPeakZamaqhoQZjLBuJK9NwE+Wt7?=
 =?iso-8859-1?Q?7XzPf+fxG5HwMh9bLL6eSSorLLDYELoN8k+eFUVC77aCs6CKJ/aotYgvGK?=
 =?iso-8859-1?Q?Tar9/+70D8y6yRXXoPkx6y72i7kBZZjL5RLlf2PP6PeVWnWW+82vi9fXrc?=
 =?iso-8859-1?Q?1AdR0A766JBcjGEbNuEwJ/qqj44S/D4Mdr53q03j4K51Wq6vbS0t7B7nQF?=
 =?iso-8859-1?Q?a0z5Dhc0/Qyx2ugrpY6QC8Xl0eSTbGiRdD4Qd5/KUATiuuGhxtrdzLhXPr?=
 =?iso-8859-1?Q?pq5gYQPl64V+v0zV++mjwiX38p804lGpr1iJzgjGM9G0QZy2BSnULJyOhn?=
 =?iso-8859-1?Q?Q6CUwG0Tmf3Gi0Ijj/LjgpFmlKHZnYuUQkQNJMI2cRyYoeXav2R+LfdxNr?=
 =?iso-8859-1?Q?cVsqn6bu+6yWSaH+SNX9CQ7MyfMcI+uVNMYXgi0sbLVW3tT/V3oiZnbnMF?=
 =?iso-8859-1?Q?ZHDe9ZqIYhgIPtLu70GbJ4j5etMtJtEzi6p4qiMAOJ2mViwjWwzwMTOvn1?=
 =?iso-8859-1?Q?jgxaKEReVVK2MldbieYqeppMGbJeIik5tIZ4jSyWtRLVKozperpArznr5/?=
 =?iso-8859-1?Q?7iuFjo1ltgnCqyGWCNp7GlzxRHkv3tKqnjVxbqAFwnX9xcXxcT2cEsGG/S?=
 =?iso-8859-1?Q?4LkLxdFqjmtgd1u0Lrm7QzBr74hABMx6LIzEpberD7Wz0/k+DFcAEnmVVn?=
 =?iso-8859-1?Q?8wna3pb3W6hago6AasUzY7sf+RFR2lrKS7HtbVq1VicARfS8onzPaVY/oS?=
 =?iso-8859-1?Q?r9FD5GiJZYDzHa8zMFlSyPIQQFrbc8LPK8ta5wE0ACWR7059Im0m9BEVq4?=
 =?iso-8859-1?Q?OUA6HJyCVwkSXidhUyjm2dmR7XQTaxxmXOg+oOX7MRX3BjO91JW6gAzN+3?=
 =?iso-8859-1?Q?y9d9NqeT4PvAIrFsxOLshcd4VfSAxuE2XVqx3eQyxQlBE/T11TIM/UM+SR?=
 =?iso-8859-1?Q?D8+QvcKNO5iAkPdkQE3Fjc0iCHQoazlTF011yhHDOFzyk1Kq65CgbIqg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c521b312-4f82-4d08-9f7f-08db50949fb4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 13:52:26.9813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/bbS105u699Kxd+uhojI+DQ4cBzl49E4sdZLvyklI579Jz8Hx08uXGr+Wn/aWnsp/ZJYtxj9OPYpHjq0Ml08w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8220
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 01/11] drm/xe: Introduce the dev_coredump
 infrastructure.
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
Cc: intel-xe@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 08, 2023 at 05:08:15PM -0400, Rodrigo Vivi wrote:
> The goal is to use devcoredump infrastructure to report error states
> captured at the crash time.
> 
> The error state will contain useful information for GPU hang debug, such
> as INSTDONE registers and the current buffers getting executed, as well
> as any other information that helps user space and allow later replays of
> the error.
> 
> The proposal here is to avoid a Xe only error_state like i915 and use
> a standard dev_coredump infrastructure to expose the error state.
> 
> For our own case, the data is only useful if it is a snapshot of the
> time when the GPU crash has happened, since we reset the GPU immediately
> after and the registers might have changed. So the proposal here is to
> have an internal snapshot to be printed out later.
> 
> Also, usually a subsequent GPU hang can be only a cause of the initial
> one. So we only save the 'first' hang. The dev_coredump has a delayed
> work queue where it remove the coredump and free all the data within a
> few moments of the error. When that happens we also reset our capture
> state and allow further snapshots.
> 
> Right now this infra only print out the time of the hang. More information
> will be migrated here on subsequent work. Also, in order to organize the
> dump better, the goal is to propose dev_coredump changes itself to allow
> multiple files and different controls. But for now we start Xe usage of
> it without any dependency on dev_coredump core changes.
> 
> v2: Add dma_fence annotation for capture that might happen during long
>     running. (Thomas and Matt)
>     Use xe->drm.primary->index on drm_info msg. (Jani)
> v3: checkpatch fixes
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

LGTM giving a RB but thinking for the series an Ack from another
maintainer or core Xe team member would be a good idea before merge.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/Kconfig                |   1 +
>  drivers/gpu/drm/xe/Makefile               |   1 +
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 150 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_devcoredump.h       |  22 ++++
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  47 +++++++
>  drivers/gpu/drm/xe/xe_device_types.h      |   4 +
>  drivers/gpu/drm/xe/xe_guc_submit.c        |   2 +
>  drivers/gpu/drm/xe/xe_pci.c               |   2 +
>  8 files changed, 229 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.c
>  create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.h
>  create mode 100644 drivers/gpu/drm/xe/xe_devcoredump_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index f6f3b491d162..d44794f99338 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -35,6 +35,7 @@ config DRM_XE
>  	select DRM_TTM_HELPER
>  	select DRM_SCHED
>  	select MMU_NOTIFIER
> +	select WANT_DEV_COREDUMP
>  	help
>  	  Experimental driver for Intel Xe series GPUs
>  
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b6c41cd7dbe3..678c9d84e50e 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -34,6 +34,7 @@ xe-y += xe_bb.o \
>  	xe_bo.o \
>  	xe_bo_evict.o \
>  	xe_debugfs.o \
> +	xe_devcoredump.o \
>  	xe_device.o \
>  	xe_dma_buf.o \
>  	xe_engine.o \
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> new file mode 100644
> index 000000000000..b1b4d2f10c7a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "xe_devcoredump.h"
> +#include "xe_devcoredump_types.h"
> +
> +#include <linux/devcoredump.h>
> +#include <generated/utsrelease.h>
> +
> +#include "xe_engine.h"
> +#include "xe_gt.h"
> +
> +/**
> + * DOC: Xe device coredump
> + *
> + * Devices overview:
> + * Xe uses dev_coredump infrastructure for exposing the crash errors in a
> + * standardized way.
> + * devcoredump exposes a temporary device under /sys/class/devcoredump/
> + * which is linked with our card device directly.
> + * The core dump can be accessed either from
> + * /sys/class/drm/card<n>/device/devcoredump/ or from
> + * /sys/class/devcoredump/devcd<m> where
> + * /sys/class/devcoredump/devcd<m>/failing_device is a link to
> + * /sys/class/drm/card<n>/device/.
> + *
> + * Snapshot at hang:
> + * The 'data' file is printed with a drm_printer pointer at devcoredump read
> + * time. For this reason, we need to take snapshots from when the hang has
> + * happened, and not only when the user is reading the file. Otherwise the
> + * information is outdated since the resets might have happened in between.
> + *
> + * 'First' failure snapshot:
> + * In general, the first hang is the most critical one since the following hangs
> + * can be a consequence of the initial hang. For this reason we only take the
> + * snapshot of the 'first' failure and ignore subsequent calls of this function,
> + * at least while the coredump device is alive. Dev_coredump has a delayed work
> + * queue that will eventually delete the device and free all the dump
> + * information. At this time we also clear the faulty_engine and allow the next
> + * hang capture.
> + */
> +
> +static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> +				   size_t count, void *data, size_t datalen)
> +{
> +	struct xe_devcoredump *coredump = data;
> +	struct xe_devcoredump_snapshot *ss;
> +	struct drm_printer p;
> +	struct drm_print_iterator iter;
> +	struct timespec64 ts;
> +
> +	iter.data = buffer;
> +	iter.offset = 0;
> +	iter.start = offset;
> +	iter.remain = count;
> +
> +	mutex_lock(&coredump->lock);
> +
> +	ss = &coredump->snapshot;
> +	p = drm_coredump_printer(&iter);
> +
> +	drm_printf(&p, "**** Xe Device Coredump ****\n");
> +	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
> +	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> +
> +	ts = ktime_to_timespec64(ss->snapshot_time);
> +	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> +	ts = ktime_to_timespec64(ss->boot_time);
> +	drm_printf(&p, "Boot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> +	ts = ktime_to_timespec64(ktime_sub(ss->snapshot_time, ss->boot_time));
> +	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> +
> +	mutex_unlock(&coredump->lock);
> +
> +	return count - iter.remain;
> +}
> +
> +static void xe_devcoredump_free(void *data)
> +{
> +	struct xe_devcoredump *coredump = data;
> +	struct xe_device *xe = container_of(coredump, struct xe_device,
> +					    devcoredump);
> +	mutex_lock(&coredump->lock);
> +
> +	coredump->faulty_engine = NULL;
> +	drm_info(&xe->drm, "Xe device coredump has been deleted.\n");
> +
> +	mutex_unlock(&coredump->lock);
> +}
> +
> +static void devcoredump_snapshot(struct xe_devcoredump *coredump)
> +{
> +	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
> +
> +	lockdep_assert_held(&coredump->lock);
> +	ss->snapshot_time = ktime_get_real();
> +	ss->boot_time = ktime_get_boottime();
> +}
> +
> +/**
> + * xe_devcoredump - Take the required snapshots and initialize coredump device.
> + * @e: The faulty xe_engine, where the issue was detected.
> + *
> + * This function should be called at the crash time. It is skipped if we still
> + * have the core dump device available with the information of the 'first'
> + * snapshot.
> + */
> +void xe_devcoredump(struct xe_engine *e)
> +{
> +	struct xe_device *xe = gt_to_xe(e->gt);
> +	struct xe_devcoredump *coredump = &xe->devcoredump;
> +	bool cookie;
> +
> +	cookie = dma_fence_begin_signalling();
> +	mutex_lock(&coredump->lock);
> +
> +	if (coredump->faulty_engine) {
> +		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
> +		mutex_unlock(&coredump->lock);
> +		return;
> +	}
> +	coredump->faulty_engine = e;
> +	devcoredump_snapshot(coredump);
> +
> +	mutex_unlock(&coredump->lock);
> +	dma_fence_end_signalling(cookie);
> +
> +	drm_info(&xe->drm, "Xe device coredump has been created\n");
> +	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
> +		 xe->drm.primary->index);
> +
> +	dev_coredumpm(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
> +		      xe_devcoredump_read, xe_devcoredump_free);
> +}
> +
> +/**
> + * xe_devcoredump_init - Initialize xe_devcoredump.
> + * @xe: Xe device.
> + *
> + * This function should be called at the probe so the mutex lock can be
> + * initialized.
> + */
> +void xe_devcoredump_init(struct xe_device *xe)
> +{
> +	struct xe_devcoredump *coredump = &xe->devcoredump;
> +
> +	mutex_init(&coredump->lock);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
> new file mode 100644
> index 000000000000..30941d2e554b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_DEVCOREDUMP_H_
> +#define _XE_DEVCOREDUMP_H_
> +
> +struct xe_device;
> +struct xe_engine;
> +
> +void xe_devcoredump_init(struct xe_device *xe);
> +
> +#ifdef CONFIG_DEV_COREDUMP
> +void xe_devcoredump(struct xe_engine *e);
> +#else
> +static inline void xe_devcoredump(struct xe_engine *e)
> +{
> +}
> +#endif
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> new file mode 100644
> index 000000000000..3f395fa9104e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_DEVCOREDUMP_TYPES_H_
> +#define _XE_DEVCOREDUMP_TYPES_H_
> +
> +#include <linux/ktime.h>
> +#include <linux/mutex.h>
> +
> +struct xe_device;
> +
> +/**
> + * struct xe_devcoredump_snapshot - Crash snapshot
> + *
> + * This struct contains all the useful information quickly captured at the time
> + * of the crash. So, any subsequent reads of the coredump points to a data that
> + * shows the state of the GPU of when the issue has happened.
> + */
> +struct xe_devcoredump_snapshot {
> +	/** @snapshot_time:  Time of this capture. */
> +	ktime_t snapshot_time;
> +	/** @boot_time:  Relative boot time so the uptime can be calculated. */
> +	ktime_t boot_time;
> +};
> +
> +/**
> + * struct xe_devcoredump - Xe devcoredump main structure
> + *
> + * This struct represents the live and active dev_coredump node.
> + * It is created/populated at the time of a crash/error. Then it
> + * is read later when user access the device coredump data file
> + * for reading the information.
> + */
> +struct xe_devcoredump {
> +	/** @xe: Xe device. */
> +	struct xe_device *xe;
> +	/** @falty_engine: Engine where the crash/error happened. */
> +	struct xe_engine *faulty_engine;
> +	/** @lock: Protects data from races between capture and read out. */
> +	struct mutex lock;
> +	/** @snapshot: Snapshot is captured at time of the first crash */
> +	struct xe_devcoredump_snapshot snapshot;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 6490a04614ce..197ee4090fed 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -12,6 +12,7 @@
>  #include <drm/drm_file.h>
>  #include <drm/ttm/ttm_device.h>
>  
> +#include "xe_devcoredump_types.h"
>  #include "xe_gt_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_step_types.h"
> @@ -55,6 +56,9 @@ struct xe_device {
>  	/** @drm: drm device */
>  	struct drm_device drm;
>  
> +	/** @devcoredump: device coredump */
> +	struct xe_devcoredump devcoredump;
> +
>  	/** @info: device info */
>  	struct intel_device_info {
>  		/** @graphics_name: graphics IP name */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index e857013070b9..231fb4145297 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -14,6 +14,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_lrc_layout.h"
> +#include "xe_devcoredump.h"
>  #include "xe_device.h"
>  #include "xe_engine.h"
>  #include "xe_force_wake.h"
> @@ -800,6 +801,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
>  		drm_warn(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
>  			 xe_sched_job_seqno(job), e->guc->id, e->flags);
>  		simple_error_capture(e);
> +		xe_devcoredump(e);
>  	} else {
>  		drm_dbg(&xe->drm, "Timedout signaled job: seqno=%u, guc_id=%d, flags=0x%lx",
>  			 xe_sched_job_seqno(job), e->guc->id, e->flags);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 855cf8557056..dd8bc3490ef8 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -16,6 +16,7 @@
>  
>  #include "regs/xe_regs.h"
>  #include "regs/xe_gt_regs.h"
> +#include "xe_devcoredump.h"
>  #include "xe_device.h"
>  #include "xe_display.h"
>  #include "xe_drv.h"
> @@ -655,6 +656,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		return err;
>  	}
>  
> +	xe_devcoredump_init(xe);
>  	xe_pm_runtime_init(xe);
>  
>  	return 0;
> -- 
> 2.39.2
> 
