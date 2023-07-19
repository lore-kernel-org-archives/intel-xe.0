Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1517C001DE
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 15:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F8C10E4D6;
	Wed, 19 Jul 2023 15:26:09 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830E410E4D9
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 15:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689780366; x=1721316366;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MD5tIWiIrHg9gRBP+4THRzSuM3A1tkiYIgeJrc9AP6w=;
 b=buroOIdn2fQuIc0f0jYtMYSh6boL7qTovhTMfUgUmKSAA5KmHYyvjeWU
 cKNtLLT0m3vYMZReGpNpIXL0ENC99ZRKswSbBJYdTuk4jbw5CjrUKLSpF
 hSSj22zWPg1sAxmMHfLK5O3z1k6j4LJXCEeGaBvdnbFp9iFxk/9SxxjdD
 Sw0xPof2pvUttRvopMNl725jF9iW5bc1JNRIxKmsfqGxyQ3d7zZG5gKEV
 zlQU3BUxBZM+2GltdGVs0rTl+b0VQCRuVDNYR+fhK4Cvx9wLth/5W7PQ1
 AJ3jYk1rzxiW6+mM3KmuojQh8+XKZgKF8tmnYPdhHx/umDi2EE9y56kPU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="366538437"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="366538437"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 08:26:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="727337157"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="727337157"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 19 Jul 2023 08:26:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 08:26:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 08:26:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 19 Jul 2023 08:26:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 19 Jul 2023 08:26:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvUYdWDcqs5ZAUWgsElu4XleOhcDMD+vry6LXp7DnH8tJ76Crydw/uyazWAteU3oAiHOOK8zNzgzeTA6amI17UCtFYQXflwu65E2HihPTp3dMA/DGSw1mLiYEmNwUz31XA856SB5dyIyUsjZp2amFqwUd8Bnc4gm9bnxNVIBxKjia+v3PntB31PMCS2L8HVTnJ++m2R5LK2CrUkFWs9ZyIsxG2wZdXT8KNpHoBDxvolzWhkfYuQe86HWfOaT/5F52JIEN0CEiFMRWVUyIvyJwd2FFre6lYeJevnl5IjBYj1TFXNU2NRhZVcC/mlpBzElqCgzODBUw+7qbBk0GLUNXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFtv3sJ2l8FE3dbcADOtL5Io4SI4PFYd+rgICMTyjZ8=;
 b=k7bHHdUjWbxnkxq8L2Jro6/qEQPPKZ5o9AaLzJbuQlRHse97D2SnWKEajvpKLMwnWZo6OVtM9aqxvVZDpOKqtlCa41Nf/+K6N9IU9/HLe6PjV1CJrAycULwG8INMKgpiC21hOKFLSOOKXBtQ2sPu7WZ8maiEedzEILmpu7K8qm+KrYVMuclalxslNGsDv8G+6oWsDhe/2DOFvSx5I8Dd01EA2aPsNdPjUILp02ATnBwPkhSwfVSFFEaCYJ+AignPR8aiS63/QnkwTDV66otHg1pd8imWHh0n9YI6sNYca9Ky27LjXxCIUfBgwgmhnoz2P0I46UPaomgX/xMc867llg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 15:25:57 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9fed:e45:5a2a:6932]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9fed:e45:5a2a:6932%4]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 15:25:57 +0000
Date: Wed, 19 Jul 2023 11:25:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZLgAgdqe9X5fuFUL@intel.com>
References: <20230719135108.7-1-francois.dugast@intel.com>
 <20230719135108.7-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230719135108.7-3-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0109.namprd05.prod.outlook.com
 (2603:10b6:a03:334::24) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|SA1PR11MB7014:EE_
X-MS-Office365-Filtering-Correlation-Id: 76b80e92-d75e-4951-dcda-08db886c72be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q/6OaVpQ+YXb4Z5STDwtKbY2A7klHzEBLGnubr/zmqGKYEJjfWcymCyW93rHf4gszkeLCQ9Gy/4xMlfS+GGukRAE0Trv2neAIyFg3TSjT2FK+VBPZcIQ5x/XMjMI2wEvfE8hYQrNn+S72+5ZPiPn/K+uyHjqW9pF8GSwJRRDyr5LmCTwGPUmGvEmpFcy5H8UOqF1TJECZKFdqj4vxMXXf2wmjB8qpSF4XGJtRLOSu+jgR/7a8DNSur5rvswXfXU9X2bwYxMWmpamFZ9Ek4usdEf/wyXxVB66cjgtWmFdAJw3uZhVlG2HPGjSPQNhelfzowkfQDrvLxOK267Ik9FgisSC4+QV1mtoo/3VeOCCYqKuadve25yPbBFvrbJ50RCyp8wVVzlhLMsoYVKkOmhPFds6q48XB1vQ8qNN2tx2KMtKqgRsYtboFxnwaST8LrTj7C5EcMe6ic8gb3rpmKmx801lmKPRt/k+Hs/BM08XYblBbQ0yvWNacVnYvKuDOwsvfg4PPShxksFtViY0/1vPkaE7XnKwma/o9zMDH/HW6VzGwZQm9Kk98yVuRX9TGSfV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199021)(6506007)(26005)(186003)(2906002)(6512007)(107886003)(6666004)(6486002)(37006003)(36756003)(44832011)(38100700002)(83380400001)(41300700001)(8936002)(8676002)(6862004)(5660300002)(316002)(66476007)(66556008)(66946007)(6636002)(4326008)(2616005)(86362001)(478600001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QW9K0LfF7IE/sy/fuMnOmjJ1autzVFOjEPl4+X59rj/FZNcz8vumpGIRQ2?=
 =?iso-8859-1?Q?Mu2dGNhQynKcdfqriD40kO8o8rDdbaKeQOhnnvmOfQeg7gFxEhcpGMZPJf?=
 =?iso-8859-1?Q?WljInhogfh9SHDlCRzNFmEXxOrOg7mvzKLr9dL4Qu1fRGMEwiklz75jScg?=
 =?iso-8859-1?Q?OA4az65e5yudj6TLWkbO1s770cY9tSZVWuU0vJOXNKei3Tien4NSbNS46O?=
 =?iso-8859-1?Q?Mw5cjuygrmAI1vbC5pN5k2bznGQaVFhrPyhKwkxcSwAPjyVocx/P+HKEeE?=
 =?iso-8859-1?Q?TOYfuTxiiiBZJBA3QMU+7cZFeteil4t5q9F4fjJztITsIgHts1M1QPfydq?=
 =?iso-8859-1?Q?UEr2gr2Tsx11TP3Ajt5N6GZOXV+Obe8roGpP64tWN4QHXGhwhDINkrjs8w?=
 =?iso-8859-1?Q?6/TFrv87ukNGblMOZVit0nUr0Fm1spwHaYweYhDgALmNoILbsIbMT0EmW7?=
 =?iso-8859-1?Q?A6DlllWePXXIsb1e+aG1Ds/WupstsKntgGIdoDTzyg6vr7rqA1hRJ6wwZH?=
 =?iso-8859-1?Q?XQH1rUtMyPBdcTaDsJbHmfvy9J3snv8DpxJjU8QAxwHZWN88O+K07qjgFy?=
 =?iso-8859-1?Q?stNPpAQm3p6sHJqQfwetWUkZW0nsIay1R8LoXDVpAzTa4XQzp/0gG4ozBK?=
 =?iso-8859-1?Q?PoL1I0uzaN17RcUIqjcal9A5PfXQgbgoz6LsZJ4za8gqh2cmqwsyqg+8Dv?=
 =?iso-8859-1?Q?a4/0pt4+6eH4k7I6/5j/eTzt9tcSjb3OvGDXtrUZA/vXWBkIhhdtmX8D5c?=
 =?iso-8859-1?Q?f1N1czfRx3enVZ48R3Mdlfqb9CSisF8XWJg6GUruAEH5obj3fV/uRyuL0k?=
 =?iso-8859-1?Q?aHwaZZjmVal1a82ydSoHxugngO+cr0lR86p/8gyanW7XXbD9e/nT514fGp?=
 =?iso-8859-1?Q?NptnI+8rboFJF80Z4u9qJ3psn5JhGO14PsDZCLLoKNDIbwf+GKxf2D89G/?=
 =?iso-8859-1?Q?lNujLKtCLvlF0VGVJYhJUmApzzDrvEqynXHyFdLABGk/Al+7xYvpH5x/yz?=
 =?iso-8859-1?Q?NVgjLQNq3Z+B8PTASsR5Gdn0biKMZzw3n2eAsCYqP0WlbrqiskMGS/rwMW?=
 =?iso-8859-1?Q?QpXD804npqzaCRca18dt/AY4AAIoOQ8UQ3RmmrLqvt13rOD8/vTTX2I/k/?=
 =?iso-8859-1?Q?NkAK9as0iThvM4LJ8Nhv9Eyg4evEPej/QVDF/V1RckV3HCstZ/ArdbghXJ?=
 =?iso-8859-1?Q?eES2SVkz1h02cPa2nZ7xBJ0phwQX+jl6k027BVlFtxA/OLEe50WbFe19uB?=
 =?iso-8859-1?Q?oKBj5ZQqZpsjFHNphqAMynMxnFSt2EPGY1baq3G2UyOaKdJMlbi5whd7ke?=
 =?iso-8859-1?Q?VRxTcK1T/T7yH9f4RLans4MAFdFsSBcR6MYvg2iMBFk6Ti+qfK9ZJQ9ncA?=
 =?iso-8859-1?Q?rXkw1cW6cOlm2kAlYaOksnMncI3TyGyLcsWLTACorElhQ/ePImR14F6hb0?=
 =?iso-8859-1?Q?wxMvF7hLZiwIASj+A1f5U+diTvjzj28RN1snqZ8uoQQIaCan0AU53rnTVt?=
 =?iso-8859-1?Q?9WRdjgyehT3H3+WNEbtU+hgKct991RbVGd2DJgv/U0fc/b0vuiolX/THN0?=
 =?iso-8859-1?Q?4tYwJpuToB+9/0qx3yOf50ZCIIJ6tSyv7BAkRwDDRw5K6fWEoKf4YKYfWb?=
 =?iso-8859-1?Q?6cy33o16qZuFuouHJxt9aJrhrEm1FRFlklLtNKsZLXraz0PW3xKMAr4w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b80e92-d75e-4951-dcda-08db886c72be
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 15:25:56.9786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldrebkRFopmYUofqphBLRWS4OqUWaUT1SBy1L6K9bfjlytRATD1/CyGJd4KohalWgRoXX0UhlrRqsarw+pnyjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7014
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Cleanup style warnings and
 errors
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 01:51:08PM +0000, Francois Dugast wrote:
> Fix 6 errors and 20 warnings reported by checkpatch.pl.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  .../xe/compat-i915-headers/soc/intel_dram.h   |  5 ++++
>  .../xe/compat-i915-headers/soc/intel_pch.h    |  5 ++++
>  drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 --
>  drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
>  drivers/gpu/drm/xe/xe_gt_mcr.c                |  2 +-
>  drivers/gpu/drm/xe/xe_gt_sysfs.c              |  4 +---
>  drivers/gpu/drm/xe/xe_guc.c                   | 14 +++++------
>  drivers/gpu/drm/xe/xe_hw_engine_types.h       |  2 +-
>  drivers/gpu/drm/xe/xe_map.h                   |  2 +-
>  drivers/gpu/drm/xe/xe_migrate.c               |  2 +-
>  drivers/gpu/drm/xe/xe_reg_whitelist.c         | 24 ++++++++++++++-----
>  drivers/gpu/drm/xe/xe_res_cursor.h            | 11 ++++-----
>  drivers/gpu/drm/xe/xe_wopcm.c                 | 10 ++++----
>  13 files changed, 49 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
> index 1532ca7e0af6..65707e20c557 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
> @@ -1 +1,6 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
>  #include "../../../i915/soc/intel_dram.h"
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
> index 823803f7e853..9c46556d33a4 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/soc/intel_pch.h
> @@ -1 +1,6 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
>  #include "../../../i915/soc/intel_pch.h"
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index fad4c66a8226..37cba91be10d 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -250,8 +250,6 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
>  	 * pretend the BIOS never had it enabled.
>  	 */
>  	intel_plane_disable_noatomic(crtc, plane);
> -
> -	return;
>  }
>  
>  static void plane_config_fini(struct intel_initial_plane_config *plane_config)
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8e086c9bd309..828a9fea420b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1821,7 +1821,7 @@ int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
>  	XE_BUG_ON(!ww);
>  
>  	tv_bo.num_shared = num_resv;
> -	tv_bo.bo = &bo->ttm;;
> +	tv_bo.bo = &bo->ttm;
>  	list_add_tail(&tv_bo.head, &objs);
>  
>  	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index ff4075387564..c56815af0686 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -273,7 +273,7 @@ static void init_steering_inst0(struct xe_gt *gt)
>  
>  static const struct {
>  	const char *name;
> -	void (*init)(struct xe_gt *);
> +	void (*init)(struct xe_gt *gt);
>  } xe_steering_types[] = {
>  	[L3BANK] =	{ "L3BANK",	init_steering_l3bank },
>  	[MSLICE] =	{ "MSLICE",	init_steering_mslice },
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index b955940e8dc6..c69d2e8a0fe1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -37,10 +37,8 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>  	int err;
>  
>  	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
> -	if (!kg) {
> -		drm_warn(&xe->drm, "Allocating kobject failed.\n");

why is this getting removed?

I know, it should probably be replaced by a drm_err instead of
warn, but what's the checkpatch complain here?

> +	if (!kg)
>  		return;
> -	}
>  
>  	kobject_init(&kg->base, &xe_gt_sysfs_kobj_type);
>  	kg->gt = gt;
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index ed90d738d673..8ae026838702 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -396,14 +396,12 @@ static int guc_wait_ucode(struct xe_guc *guc)
>  		struct drm_printer p = drm_info_printer(drm->dev);
>  
>  		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
> -		drm_info(drm, "GuC load failed: status: Reset = %d, "
> -			"BootROM = 0x%02X, UKernel = 0x%02X, "
> -			"MIA = 0x%02X, Auth = 0x%02X\n",
> -			REG_FIELD_GET(GS_MIA_IN_RESET, status),
> -			REG_FIELD_GET(GS_BOOTROM_MASK, status),
> -			REG_FIELD_GET(GS_UKERNEL_MASK, status),
> -			REG_FIELD_GET(GS_MIA_MASK, status),
> -			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
> +		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
> +			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
> +			 REG_FIELD_GET(GS_BOOTROM_MASK, status),
> +			 REG_FIELD_GET(GS_UKERNEL_MASK, status),
> +			 REG_FIELD_GET(GS_MIA_MASK, status),
> +			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>  
>  		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
>  			drm_info(drm, "GuC firmware signature verification failed\n");
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index d788e67312b9..803d557cf5aa 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -104,7 +104,7 @@ struct xe_hw_engine {
>  	/** @fence_irq: fence IRQ to run when a hw engine IRQ is received */
>  	struct xe_hw_fence_irq *fence_irq;
>  	/** @irq_handler: IRQ handler to run when hw engine IRQ is received */
> -	void (*irq_handler)(struct xe_hw_engine *, u16);
> +	void (*irq_handler)(struct xe_hw_engine *hwe, u16 intr_vec);
>  	/** @engine_id: id  for this hw engine */
>  	enum xe_hw_engine_id engine_id;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
> index 032c2e8b5438..f62e0c8b67ab 100644
> --- a/drivers/gpu/drm/xe/xe_map.h
> +++ b/drivers/gpu/drm/xe/xe_map.h
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: MIT
> +/* SPDX-License-Identifier: MIT */
>  /*
>   * Copyright © 2022 Intel Corporation
>   */
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 2bb7d524af24..4c6f299fd024 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -475,7 +475,7 @@ static void emit_pte(struct xe_migrate *m,
>  			bb->cs[bb->len++] = lower_32_bits(addr);
>  			bb->cs[bb->len++] = upper_32_bits(addr);
>  
> -			xe_res_next(cur, min(size, (u32)PAGE_SIZE));
> +			xe_res_next(cur, min_t(u32, size, PAGE_SIZE));
>  			cur_ofs += 8;
>  		}
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index ea6dd7d71b59..e83781f9a516 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -89,18 +89,30 @@ void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
>  	deny = val & RING_FORCE_TO_NONPRIV_DENY;
>  
>  	switch (val & RING_FORCE_TO_NONPRIV_RANGE_MASK) {
> -	case RING_FORCE_TO_NONPRIV_RANGE_4: range_bit = 4; break;
> -	case RING_FORCE_TO_NONPRIV_RANGE_16: range_bit = 6; break;
> -	case RING_FORCE_TO_NONPRIV_RANGE_64: range_bit = 8; break;
> +	case RING_FORCE_TO_NONPRIV_RANGE_4:
> +		range_bit = 4;
> +		break;
> +	case RING_FORCE_TO_NONPRIV_RANGE_16:
> +		range_bit = 6;
> +		break;
> +	case RING_FORCE_TO_NONPRIV_RANGE_64:
> +		range_bit = 8;
> +		break;
>  	}
>  
>  	range_start = reg & REG_GENMASK(25, range_bit);
>  	range_end = range_start | REG_GENMASK(range_bit, 0);
>  
>  	switch (val & RING_FORCE_TO_NONPRIV_ACCESS_MASK) {
> -	case RING_FORCE_TO_NONPRIV_ACCESS_RW: access_str = "rw"; break;
> -	case RING_FORCE_TO_NONPRIV_ACCESS_RD: access_str = "read"; break;
> -	case RING_FORCE_TO_NONPRIV_ACCESS_WR: access_str = "write"; break;
> +	case RING_FORCE_TO_NONPRIV_ACCESS_RW:
> +		access_str = "rw";
> +		break;
> +	case RING_FORCE_TO_NONPRIV_ACCESS_RD:
> +		access_str = "read";
> +		break;
> +	case RING_FORCE_TO_NONPRIV_ACCESS_WR:
> +		access_str = "write";
> +		break;
>  	}
>  
>  	drm_printf_indent(p, indent, "REG[0x%x-0x%x]: %s %s access\n",
> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> index 2a6fdd284395..dda963fe3300 100644
> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> @@ -51,15 +51,14 @@ struct xe_res_cursor {
>  static struct drm_buddy *xe_res_get_buddy(struct ttm_resource *res)
>  {
>  	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
> +	struct ttm_resource_manager *mgr;
>  
> -	if (res->mem_type != XE_PL_STOLEN) {
> +	if (res->mem_type != XE_PL_STOLEN)
>  		return &xe->tiles[res->mem_type - XE_PL_VRAM0].mem.vram_mgr->mm;
> -	} else {
> -		struct ttm_resource_manager *mgr =
> -			ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
>  
> -		return &to_xe_ttm_vram_mgr(mgr)->mm;
> -	}
> +	mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> +
> +	return &to_xe_ttm_vram_mgr(mgr)->mm;
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> index 35fde8965bca..d9acf8783b83 100644
> --- a/drivers/gpu/drm/xe/xe_wopcm.c
> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> @@ -47,12 +47,10 @@
>   */
>  
>  /* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
> -#define DGFX_WOPCM_SIZE			SZ_4M	/* FIXME: Larger size require
> -						   for 2 tile PVC, do a proper
> -						   probe sooner or later */
> -#define MTL_WOPCM_SIZE			SZ_4M	/* FIXME: Larger size require
> -						   for MTL, do a proper probe
> -						   sooner or later */
> +/* FIXME: Larger size require for 2 tile PVC, do a proper probe sooner or later */
> +#define DGFX_WOPCM_SIZE			SZ_4M
> +/* FIXME: Larger size require for MTL, do a proper probe sooner or later */
> +#define MTL_WOPCM_SIZE			SZ_4M
>  #define GEN11_WOPCM_SIZE		SZ_2M
>  
>  #define GEN12_MAX_WOPCM_SIZE            SZ_8M
> -- 
> 2.34.1
> 
