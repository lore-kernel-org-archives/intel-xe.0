Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93970C77B7F
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 19:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB9110E138;
	Wed,  3 May 2023 19:43:53 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D007410E138
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 19:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683143030; x=1714679030;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=v8LFu6rNAKS+AeC1ni10A4AYP0l6XLnWeD9CH9saq6o=;
 b=go5WChgaQ5P5W+IrM9Qv06fzX7jcYJM8rzKSSNRSLB4uVLTHJ/pz6h4a
 otSY2ieX99MOAFUxiH5Wewcc4lN7KpiZR/XXNPg0TS1ICj4KZg1lkD8/x
 NMQ1Qz/Gdtgx7FkRE8aSTKRhZBOIE6C8jZqgjDTTSQn2kS4Ji/vJ2oWY3
 +XH3SzCW8T7gl0S3Fo2O9eYWmwtHMLY+id9K3Y03LuPyEeuBXWjnW9Nxs
 zJdJuudj1xxmhrbb4Mu/R6v2SQ3UkL/hXKLiynCrjXSJAtUf0+w6Wfo62
 HH5Zi3pKDW1YrQl3OD2nZLSzdFMCv7EPzlVLdDI56Upvj+YuMr0E0k4a2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="348794625"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; d="scan'208";a="348794625"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 12:43:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="727273419"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; d="scan'208";a="727273419"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 03 May 2023 12:43:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 12:43:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 12:43:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 3 May 2023 12:43:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKmRnqjz/lCbsxfYZ/WRg9a/fWOblvtwSDnbqSP2iBPqItm1AVd/7fRNsE0lf13815UhW+u/gCHE7uX36gFOpBJROeM/56r3MS5Qd/Leluva8w0fKWNGl2vqZqa+ssKh3oYOHrkD1wSGncN3/Iu9fFTOi0B5fgxuHp7ikba5BJgGWJBkfipRM1HJKO57moIA4tf8XhYaQ+T+GiaGYfmUP/RBYa+AW50CVytPQEvHNQgnNrgkuI+E52/jcLpqo1z/9L8S6xTXFJyYXmv9MPRHj2NAB4GyVqOTbJPT+T2yBi9bZRcp9Km9yyKUcv3kuedHFyomgZob6RITctUxUDXsPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUUyReeYNLjSo4Lk3eP4XJ139AGO/JaISHl5Q9wU+SU=;
 b=AWH6zvph2FG97gsU6uG4vUVrZJB9xQmMDAG6fr32sZWsCBtsuYBNRpsJwu215GmADLAPWahU+lLt8lwShgkMwch+A7lUPASSnjBFN36iJVrTG3WlkaQELARmwuymaMMVUFtYmmEgV9pMbgJKkkeo2TLOXdoaBuLq86TyGgjuSv6vucQ9etHKm1fEf7j1ViLOL2zrIHFkebaX7fvLaR3zkDTO3434mbp1RmC7UIB+WESA+mrLB6648+UgQ30a7sHMYUnFoOEUGC8tDZH7Ck8HnUiwyjgtOLgQECZTSVS/m8BYCIpHRH/R2s7PoyIGnjvMnmshAQrhMiYC1mL8E5N7Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB5798.namprd11.prod.outlook.com (2603:10b6:303:185::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 19:43:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 19:43:46 +0000
Date: Wed, 3 May 2023 15:43:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <ZFK5bjV/Md3/eHaP@intel.com>
References: <20230425192624.168640-1-jose.souza@intel.com>
 <20230425192624.168640-13-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230425192624.168640-13-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR13CA0222.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: 708f1f8c-65e3-426d-ae35-08db4c0eb5a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RiX3lFcp1XA8b55xwf131bmM52d0+MfPNeQTTNXQ0BVZdEMc4XKe0tA34h4D0W9x85yMZJFcIp4WxHTc6X27dYMK2Lh7cfWutW/KS24WNKE9lcr/fNlUgpqWpuduHnuwcAtmEydj+LzadyIXnPjStAKwQel7jSPOVzPhvNwPj0dXuk6xGiu5jNuk+wyPw3C808aY9prjNZfME00j1QAZt5QAK2pUd9MoBrM5CSxcvoD64oO9XObaxALGzmpCzY4koG4M4xCHsRIsLjNetcV7bVyinSd31zWd88OG1egtVlS+MSUWko5dDHgFow/0D6qitab+CqhMchZ9KhUKtXR+S1xAbxIBFb453l36Njmw64tiq1k/pNGKeOmRrGYVp6AoBoXedBmDFrQI/IMqgZMCHy5J76ULCX9GX9tnVXvDhF869TeBeSWYNJqOH1sCYNA+nKj+qp5TlUSu0ZSE2glEc1tVylb4eQ69RjaDv4Yb0GsBNjj9V8ciCuyFpFDyOPKjMr6Z2H0F64RewDj94+3e1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199021)(6486002)(66556008)(4326008)(966005)(66946007)(66476007)(6636002)(478600001)(316002)(37006003)(86362001)(36756003)(6666004)(83380400001)(6512007)(6506007)(26005)(8936002)(6862004)(8676002)(5660300002)(44832011)(2906002)(41300700001)(38100700002)(82960400001)(186003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?F5wqJXvb8jKfnzRmzRl755qkdzWkqV5ZbQGEHjkJjIfsckHf7a6TPgtjyr?=
 =?iso-8859-1?Q?A6W1PYleK8sjMpRruyvdyDEtUlSiYpMdlDjWEX9fB0AxJ20dYrjJ8+IGyB?=
 =?iso-8859-1?Q?kTbbtvckWJkD4FutPZGbs8vlu4ToUvY18rKKW6h27yLJNokQGiQTvu1/UZ?=
 =?iso-8859-1?Q?Wypk+Ha1dU+gmso6oWOOEmruGmL9b0AbSVQjn8Vmy91ipbm6Ml2C55pvCU?=
 =?iso-8859-1?Q?UhyJo8Bzbij7caA1fQvNAA79pzX3GfXGWKHDnKdDSuJOAZDSg/w0xRM9Iv?=
 =?iso-8859-1?Q?ZxLGo0Cf/f5C3EOqXwDXRwu5F5HXjRgdANpIXPRUGrHljuGWLtCgEtQ2rZ?=
 =?iso-8859-1?Q?aVe/h0wg/7frowyL/p61/3x5BlXBozZlGbE0HM628reINv9m7d6+lXMwh8?=
 =?iso-8859-1?Q?qT+2R+jUBjI9/RGmTGe4C1KaDy3Q/GhQD7YN2m1rMiRAZsNQv2O02K7rrU?=
 =?iso-8859-1?Q?26PwEIf/CWxIEswoKkCSgDeWREgj7HLUd+hW/qAV2iLzM0VeyMHn55dYPd?=
 =?iso-8859-1?Q?R2ckt3WML85QgHD0a/XAc8I39UJv6ZG6txHBxAWMdpPdEs8dc+KXlmOkuT?=
 =?iso-8859-1?Q?iD3lZRELhalu2VovPS8KRn9hOylMNZu++h94f/Bba+Dq89BZrQSxCUleN3?=
 =?iso-8859-1?Q?pNvs3SIt0Ig7kmFKAos6Qlzv7D3JSm6b/jjMn/MA0PyxkwOP73MQZVkX7T?=
 =?iso-8859-1?Q?izF0BfRtGVNR6KCDA7SBhqe6J6daubtfMPjTbbdVAAO2VMrLuKmCyINwyL?=
 =?iso-8859-1?Q?WPpDqJDckIF6kEEVQA2NCk52f8BjM04eBYhcIg1DodTTddM6YHckM8bj48?=
 =?iso-8859-1?Q?q1SHAwtKp3CmA9lY85b8oOIA6E6dDPUMks+ZZOCZt7TpRtvQxrQqYLBs/g?=
 =?iso-8859-1?Q?GARj4rpTgrK/TpvxLJZuQCRCVP1NoDioqjnrSZ1kaUt0CQ7IrIge1vAR1T?=
 =?iso-8859-1?Q?9d0DFysaiyjOquXHrrfyZpKcW9FdYuuXSS3+0ArNqSZhLnhUtws2KZIXGt?=
 =?iso-8859-1?Q?EpOMHzgC8eF44NHlZsuyWsxxoceHut5m+quJVzbSE4cns73zFgOheHZ7xV?=
 =?iso-8859-1?Q?SXiC09YITThrPdKvPwz5mq9gmzSAu5MC7cVyCWI6XmmWMTztfMiRbp9Pc1?=
 =?iso-8859-1?Q?ay1ZxtABEPhzPZBIsplw6rn1CQk1hnkeS5YGZXXEV27CvVradty7dNVVDQ?=
 =?iso-8859-1?Q?n3vkL+dl5ET1l6BKZiNhI00gm+Nuni4cUSV3+1vicapfi3a1TZpVfs6IsB?=
 =?iso-8859-1?Q?Syout4w6sSe7OBv6qcVp0LOW4Ey5OlC7QfwCcZez36ezqkHFIbHQL4XhG7?=
 =?iso-8859-1?Q?mriXNmVI78XcsA9fYHHIkPt5WcjwZFun0yeJVjkjnhabdAD2A+CDgQO4ie?=
 =?iso-8859-1?Q?vHxWfQWyaChPu/kyCsyquOHgCXM4Q1dhNPCyEtmOGqlvjwac0zc1XlrLMv?=
 =?iso-8859-1?Q?AGWk1QfhLblTbiYkfHJ4+mB7LDVMbOdNeMFCGjHcTMDUVZoEnBwKoqIMCg?=
 =?iso-8859-1?Q?NSYPVg+1vs7vX0lXABseE6/EWrassycOAOLfAnULHvNadIuauwuILQRhjp?=
 =?iso-8859-1?Q?btTex7VQJJq1DLEqe0D10bdaGRLL6wFDbn9RXLVRU5abcmFF9bvG8HAkGN?=
 =?iso-8859-1?Q?TV/nJZd5ILNlbA0NwCRrT6dwObJnew5cNvVEFzEkNtlFXXm1KJtIXW5Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 708f1f8c-65e3-426d-ae35-08db4c0eb5a8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 19:43:46.7028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xdOv31uoQZA7YgjeHBpP/EirlFkazEHGegPkkJx/gLQKZZe2bEu1LO7NGg4kKoRWcLMIq4BxsezrVsrZK0P8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5798
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 12/15] squash! drm/xe/display: Implement
 display support
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 12:26:21PM -0700, José Roberto de Souza wrote:
> Rename functions after backport https://patchwork.freedesktop.org/series/116431/
> and add intel_display_driver_early_probe() call.

just for the record, since this is already in drm-xe-next:

the right notation here should be fixup! instead of squash!

the best way is to create that with git commit --fixup=<old-commit-hash>

> 
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile     |  1 +
>  drivers/gpu/drm/xe/xe_display.c | 23 +++++++++++++----------
>  2 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index ee4a95beec206..9dc6cf218fb01 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -144,6 +144,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	i915-display/intel_ddi.o \
>  	i915-display/intel_ddi_buf_trans.o \
>  	i915-display/intel_display.o \
> +	i915-display/intel_display_driver.o \
>  	i915-display/intel_display_debugfs.o \
>  	i915-display/intel_display_power.o \
>  	i915-display/intel_display_power_map.o \
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index a8af9eddb496a..408bd7c8d1c75 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -22,6 +22,7 @@
>  #include "intel_bw.h"
>  #include "intel_clock_gating.h"
>  #include "intel_display.h"
> +#include "intel_display_driver.h"
>  #include "intel_display_types.h"
>  #include "intel_dmc.h"
>  #include "intel_dp.h"
> @@ -54,7 +55,7 @@ int xe_display_set_driver_hooks(struct pci_dev *pdev, struct drm_driver *driver)
>  		return 0;
>  
>  	/* Detect if we need to wait for other drivers early on */
> -	if (intel_modeset_probe_defer(pdev))
> +	if (intel_display_driver_probe_defer(pdev))
>  		return -EPROBE_DEFER;
>  
>  	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
> @@ -159,7 +160,7 @@ void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
>  	if (!xe->info.enable_display)
>  		return;
>  
> -	intel_modeset_driver_remove_noirq(xe);
> +	intel_display_driver_remove_noirq(xe);
>  	intel_power_domains_driver_remove(xe);
>  }
>  
> @@ -170,6 +171,8 @@ int xe_display_init_noirq(struct xe_device *xe)
>  	if (!xe->info.enable_display)
>  		return 0;
>  
> +	intel_display_driver_early_probe(xe);
> +
>  	/* Early display init.. */
>  	intel_opregion_setup(xe);
>  
> @@ -188,7 +191,7 @@ int xe_display_init_noirq(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	err = intel_modeset_init_noirq(xe);
> +	err = intel_display_driver_probe_noirq(xe);
>  	if (err)
>  		return err;
>  
> @@ -202,7 +205,7 @@ void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
>  	if (!xe->info.enable_display)
>  		return;
>  
> -	intel_modeset_driver_remove_nogem(xe);
> +	intel_display_driver_remove_nogem(xe);
>  }
>  
>  int xe_display_init_noaccel(struct xe_device *xe)
> @@ -212,7 +215,7 @@ int xe_display_init_noaccel(struct xe_device *xe)
>  	if (!xe->info.enable_display)
>  		return 0;
>  
> -	err = intel_modeset_init_nogem(xe);
> +	err = intel_display_driver_probe_nogem(xe);
>  	if (err)
>  		return err;
>  
> @@ -224,7 +227,7 @@ int xe_display_init(struct xe_device *xe)
>  	if (!xe->info.enable_display)
>  		return 0;
>  
> -	return intel_modeset_init(xe);
> +	return intel_display_driver_probe(xe);
>  }
>  
>  void xe_display_unlink(struct xe_device *xe)
> @@ -265,7 +268,7 @@ void xe_display_modset_driver_remove(struct xe_device *xe)
>  	if (!xe->info.enable_display)
>  		return;
>  
> -	intel_modeset_driver_remove(xe);
> +	intel_display_driver_remove(xe);
>  }
>  
>  /* IRQ-related functions */
> @@ -333,7 +336,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
>  	if (xe->info.display.pipe_mask)
>  		drm_kms_helper_poll_disable(&xe->drm);
>  
> -	intel_display_suspend(&xe->drm);
> +	intel_display_driver_suspend(xe);
>  
>  	intel_dp_mst_suspend(xe);
>  
> @@ -378,13 +381,13 @@ void xe_display_pm_resume(struct xe_device *xe)
>  	if (xe->info.display.pipe_mask)
>  		drm_mode_config_reset(&xe->drm);
>  
> -	intel_modeset_init_hw(xe);
> +	intel_display_driver_init_hw(xe);
>  	intel_clock_gating_init(xe);
>  	intel_hpd_init(xe);
>  
>  	/* MST sideband requires HPD interrupts enabled */
>  	intel_dp_mst_resume(xe);
> -	intel_display_resume(&xe->drm);
> +	intel_display_driver_resume(xe);
>  
>  	intel_hpd_poll_disable(xe);
>  	if (xe->info.display.pipe_mask)
> -- 
> 2.40.0
> 
