Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9A7EB64DD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 03:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B5610E0EB;
	Wed,  9 Aug 2023 03:20:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAFC10E0EB
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 03:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691551249; x=1723087249;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fyjoG4xtAV1J8vmZDjsxCG51SSt3ZCuLd8ZF142wKqg=;
 b=CAspJFHlrho7WAp/ZU6+w8N73E7VjncPyrVwRo96kkyOTaZINeDYSg0X
 /L5dk//CIjb8Me8mE/DrZn3VEY0exAgZWAJmVCwPNJ/MODJd46ML3sWjh
 f2Nq2ZBCZAvvvlmk+MD8ZQB23GIM/reGysRnLC8BQrXcLYWrdeFPtuPZr
 N1csKHK+epWUuSvvdomYCACJYqphL+S4Z6hgfUliC9af4jqzQ0WlkygJ7
 g8OlxLo5l+CWhcDZu2uCK8EyCy1wwk89gkq6YAAqgdf7EX/AebLcWIde1
 h2+9LfPNTFn6KRxTTFj8WYYjLzGJ1KyjSgxDctuHwAzcwQPVy9xgSHSxw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401974481"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; d="scan'208";a="401974481"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 20:20:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="766641901"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; d="scan'208";a="766641901"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 08 Aug 2023 20:20:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 20:20:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 20:20:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 20:20:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjUozuOa00dkgO3H2zu8TG9PmfItfzFPo+1ImuVE0x7kdRmtD3n56Qx2HHzygd7enTAQymk0RLL04u6ihtfLWHXEYMK2Wz6XRR67OM5a6nyjmOylJx7IfxVavFCSjwk6zLi7bED/lFocy/P4zf2j4SRGupskE0E1NEK7TJHnVT18Pew2ow6DdleMyDyNQszy1F199n6Vqwez7GhbkS0u7dbypJKyBQVitbliUKRD0p5v8Hw0WNVVIcsTxYNWd6HuRsN9QOfvuluSZNB0i2Zpk5zBKu1zIDLLnfK8MmM/WLaud44r90cWvlbnc466Bu0z+KDni051YwW8wpmE3yKSAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qusBImiXyejEmc8La1+C8xDVS23DfIB0sEVjspct3s=;
 b=n4lVrBqjXNr6VbA/uD86b/URwhgsslX8rG4X/aC7AuUcMFkRzsdJqOP6Z22TD9r0J/FphDamPIkfUkm8fXm+lbw6bfN06Y2aEUhiHuHzovViGq5gRT3V1Lh85/hvgamHg7Qmd7COhPd6TtmCTyyU5bnB/pS0Qk6xeTIaXPANQGkeXTwhi2qcIneNIVYVqaKyxRqqoaD7UsCzv7M5N9iWy9H363baZRd5Xq3sH9XbKbOb1+98smtb0SD05kHqwK2V4RU9Rycx6WjeMo5QswakZ2ppB3v8D91pSGSCtdN8Qdw1B7+pSsDm/O22Xf4LJ9QvadmTvXK5X5VE2p6utEsZig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7833.namprd11.prod.outlook.com (2603:10b6:8:ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Wed, 9 Aug
 2023 03:20:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6652.026; Wed, 9 Aug 2023
 03:20:46 +0000
Date: Wed, 9 Aug 2023 03:19:34 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: David Kershner <david.kershner@intel.com>
Message-ID: <ZNMFxiwk0gYBI0Zn@DUT025-TGLU.fm.intel.com>
References: <20230808164534.1027552-1-david.kershner@intel.com>
 <20230808164534.1027552-2-david.kershner@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230808164534.1027552-2-david.kershner@intel.com>
X-ClientProxiedBy: SJ0PR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:a03:333::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 66687d80-3447-4f42-2670-08db98879f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CvJkQRIEEpDujgCOLsaYtUnIyvXPENJ0sRrqSQlLZj4njOsxPDrDG40HOSq8/oUMvOqY3cyYd77AfFTaNgdJm0Aq38ZwvxX8LrnGv/oh9Q/ht6QxL98BS1c+z8fi3PK5rywKBQwX5MVtxSlvMTtBFXuQc6htgtiCYL6H1J2DwBMUDEfUXK/vTHEe1QCVLzaWgW3vChlQRFB0dta/9g/VsQETc7FjQPMCtWyAQp79HsV7KOLlorOln0LwUYHOCzAAhXKcqcOdxLFpu/7t+yZQUQJ1gcPxmUcl6r2Anq0vasqsLiVHhIsQRgf922zYiw5WSTDN/YL1q+Vl/jfdBFsFonUKFzwAqXyLk8h1DtfIa5tDU19swG4NfOALh+ZUzZtpjKvCnXAxC1doAFbPUDyc96x88SwXxFfdZ3uFzmU2xpSmAXjeSTQlK+TxotPFTS8KJR26m7n+GPwbgT/CxgiBKWEpfRQJ6IALZ/ut5dqoC/+EVBDx+6bL7XXDVMItGzNSxgm5R3bU7ewUZJIExZGVCh4fPAlZ1FJFh4c/cK3QriMk/f44q6lZjk+Js/HEtIvu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(6029001)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199021)(1800799006)(186006)(6666004)(6486002)(86362001)(82960400001)(478600001)(6512007)(26005)(6506007)(107886003)(316002)(5660300002)(44832011)(8676002)(8936002)(38100700002)(6636002)(4326008)(2906002)(6862004)(66476007)(41300700001)(66556008)(66946007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ld3wHkpm0WUkmnwhMnRdaaaSIqYoi+w75ORzkvfQ/pjb5ObEKrHzKPEO9q?=
 =?iso-8859-1?Q?w5C+BGxlDZSoNJRok5M38+RgNvB7g7dNQIQbZA4SCOrTidHRUlKAvoqZbP?=
 =?iso-8859-1?Q?l9p7DbiGdqrjMCEtD/Nj8N45CRunMq3NCOEhAyoieg1OF2DZO3Uzzmu/N6?=
 =?iso-8859-1?Q?q8hNfwqQvsPTRe+7ylt5VgZCCwKXJ2HsubVhPf3wXNGjMFDVAkbJSs0o3S?=
 =?iso-8859-1?Q?zs4Gnx596AZnmWFual+e9QJqMr0P4sB9x6cx91Gk9PFdXNVvqnvd4+AdRz?=
 =?iso-8859-1?Q?uhJp2psXmDGd9R91UZoKOLgHHMQS7wnSyQjhjJ8EjJwNbG+r4BSgrNoNYg?=
 =?iso-8859-1?Q?XPBUF+mHuK8xsftWJSPx7SyTdHIMViltvZoAVxbMoAmSqauziUAnXHTa6D?=
 =?iso-8859-1?Q?nekShV8HIN7TQ/wlVQh49kkOf1LXqZ1ezJHf8qdE3jq6DSEqZ2SNCY6tA/?=
 =?iso-8859-1?Q?anqDGAsdpt3O+FwT0AOi0Ex+r9ocbQGuuHSnfG8+lZpRTxjeK75lVIHBZo?=
 =?iso-8859-1?Q?XWyGu0cUbw5sPNqglALYpb6z6cVd0Mhz8SWnZabD6++ykUIE6JNhH2NKcr?=
 =?iso-8859-1?Q?5uw8Sxt9+CjiZBCor0m3RuQmWAKzfqzlgJadSnRV9MnaknSlAMB4mF+AT0?=
 =?iso-8859-1?Q?8k70wnVSxdLP93ZzcOUtqB9OoIDsj+3UYFMUBF6LRvf5FYyrUVKAxmW1ff?=
 =?iso-8859-1?Q?yDoUknsm1gtzh9kBGpkUEWNwQ3ogDUK8Y2oFD4SEQx0eONexdmQWB26pDj?=
 =?iso-8859-1?Q?FEuqsfAeAlnVWuL944HTA9RHWd0BVW8iCeERMS6f1Jn5W9nYH91xZP3UOO?=
 =?iso-8859-1?Q?JMEpW5wOy9Yu/IUccqV/lfPq1YDu9ZCMB7a2VmXv9+2UIoJ7aE56JBwmpL?=
 =?iso-8859-1?Q?gxTMOeMbHKBpEdWA8ANe7Sydl50PvnNcxGrI6NAB4bcqdg74Cbj+etR/su?=
 =?iso-8859-1?Q?DCC2CtgpFIZJ/Cm7vGODa3ZHJRdZ4z2G3Bk/Kpd9ceWoAfUA+hqFdUaiMw?=
 =?iso-8859-1?Q?9erW6m0wKFLMygHb4NePmR+xOrKYv9crM+BIX2ZebMhSpyfom0fUYFRQwi?=
 =?iso-8859-1?Q?yoOVS//kthHrGoDDcU6RH6/XhVE5GCwNvcJLMqyFr33KUNyqrhouQ5hBqS?=
 =?iso-8859-1?Q?/e8unG5XKP8KCgZgq9e/e8M/UG2MMChx+lunL6Q3fmwv7Emuq7qx12JbhY?=
 =?iso-8859-1?Q?cM187Rz2uiAvU4dAcLfmoA/8QdJKpLQfalxFASqEyfR2Mh3DJgrl93QZW8?=
 =?iso-8859-1?Q?H6q9QYTzLRIzTUTAQEnBPX1BDMN4QqAz7uCKo8TLqw8Es6dk1m6+hZxHJJ?=
 =?iso-8859-1?Q?9I53Zasl7cL4OrxHhEvCVXhA8YYTL0Cn6OoMJFC9ckGkmjDgf39vQaV2qy?=
 =?iso-8859-1?Q?yeYIy3rplB1zK55/pb/Mt6yaNebYCqClLmq4kq1D2Be5PLMeKr5TuGkj9J?=
 =?iso-8859-1?Q?LMLrEJ2lnN4EKbCi4RDsNtM3PmziZ4vlyFWFszNVLe/1CnVSkLmSt0Efv/?=
 =?iso-8859-1?Q?JXGuDtfp0fyjHrNFOmTrpidLn7zV0e6IHzi8F767CMeRbpHtdtZ9sATqC3?=
 =?iso-8859-1?Q?/iXrbHg2ZvyxQLJ45xkcbeYs4WV3KbHZENO3h2IvfwG7AKb+sAyBKPQYYa?=
 =?iso-8859-1?Q?l0gt4nFJWrnhfUQAZTyzCHeGFO4O8oSv2/CW1Z2nSPdsFkCpraOk0l8Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66687d80-3447-4f42-2670-08db98879f04
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 03:20:46.0163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/eHhEDLgnlG9c0gKeuB8APDmMoHUnCKq9V1tdwSWScNX8E+dXLHJ8bBvDWgmrWAN0H3RlWNK1NO71EZosJf2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7833
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Introduce a module parameter to
 control XeLink
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
Cc: lucas.demarchi@intel.com, john.fleck@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 08, 2023 at 12:45:32PM -0400, David Kershner wrote:
> Add a new module parameter to control enable/disable of the XeLink
> feature.
> 
> Signed-off-by: David Kershner <david.kershner@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile    |  3 ++-
>  drivers/gpu/drm/xe/xe_xelink.c | 17 +++++++++++++++++

I find the name 'xe_xelink' kinda offensive. This is just an opinion but
can we find a better name?

xe_fabric_link?
xe_link?

Open to other ideas.

Matt

>  2 files changed, 19 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_xelink.c
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1b59702cd9f9..d46558cf12a9 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -115,7 +115,8 @@ xe-y += xe_bb.o \
>  	xe_vm_madvise.o \
>  	xe_wait_user_fence.o \
>  	xe_wa.o \
> -	xe_wopcm.o
> +	xe_wopcm.o \
> +	xe_xelink.o
>  
>  # i915 Display compat #defines and #includes
>  subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
> diff --git a/drivers/gpu/drm/xe/xe_xelink.c b/drivers/gpu/drm/xe/xe_xelink.c
> new file mode 100644
> index 000000000000..51a31f6a4740
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_xelink.c
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/moduleparam.h>
> +
> +/*
> + * This module parameter is needed because SRIOV PF and XeLink are mutually
> + * exclusive. The driver needs to be able to enable/disable the XeLink
> + * infrastructure (specifically Device Physical Addressing).  Since there
> + * will be no enable/disable for the SRIOV PF path, this parameter is
> + * needed to explicitly disable XeLink when SRIOV PF is required.
> + */
> +static bool xe_enable_xelink = true;
> +module_param_named(enable_xelink, xe_enable_xelink, bool, 0400);
> +MODULE_PARM_DESC(enable_xelink, "Enable XeLink feature (default: true)");
> -- 
> 2.35.1
> 
