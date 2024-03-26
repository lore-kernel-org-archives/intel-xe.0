Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64464C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 19:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2203010F212;
	Tue, 26 Mar 2024 19:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmERq/U3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9903410F212
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 19:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711480998; x=1743016998;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tcr7cv1XkgV4nXFqJXMAEv5Dykxxv23zS7xVmJm90f0=;
 b=LmERq/U32ODOhFFxh2Ac3irCxcpZGFhrJAxXQe4hgG6WatHJjFLg0ULR
 vJ+OM0Xb42EPY4ZPymgSQUNtD/H36ozAOwz3Q33OvzZUMxIZoR2Z1FeW5
 OJXPlRYLfwRygVJLSvA3M0XaV0LFgSVvwVxMjo1Rrgcp/L6FZC434iecF
 lI0g/iopoYdJptSk8zN5mvdWVAbpBWDU61Ty7/nN8Z9MRLFw4sPPfIRry
 pc45WEpgAS3YAc+p9BBDa1Y53ullMVNV1cEZqvw6L/zl2G+BTzR93pdo6
 iv17SFjgZ1kcPiKajhGmDRqxzw4wn/ar9UXLWq0vTiDu2aNwyaXfCt+zP A==;
X-CSE-ConnectionGUID: XKQGNW7RT9ug/hEogDxADw==
X-CSE-MsgGUID: 4vDG1TYFRCOttHhNNtfzHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17186272"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17186272"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 12:23:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="16018100"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 12:23:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 12:23:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 12:23:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 12:23:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 12:23:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1nN5StJAkejr5Dk5o9dLSRP2viJBCocOGhppOXQrGlUQy/zYYk02lBzitr9BiZB6FYLVfBij4JXoYJqq672W5ISR27cTA/1Xb225TEskAlkHUadBix3HzgnpmOAMvMMscrAruuI4ZrnvJGoWc6mjaXBPaODObz74k0WPXV8rXE7Ab74trT4PSByHJpAwHug+hVinrBRmB1ux3x2StpY/Jb1CXljJcAIWWKHCt+Rn6Ck42ZFB2CDfSRKViSW7u1PObJ0fc8TPzVGmVppJV9Q2E2xxHeRc6tsgIpFpQBiuZqVRTuqLl462EQEdn2AwE8sPbLU8KwC+82sKDiMegOQrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvWtslosF7Axsau89IWLq6jQ+9rFYiBn6q3Zn8b0rRQ=;
 b=HooTWGvMrwaLSUVvWEdESOswrTUIF7b+71Kl6k9h5hdwHjhltTbaZXVJa5MAoN1dROI+ZSW1oGIRYZo2B6Yj/aXQnkIQ1CImN+AS/fIXYUNuv7yeQhMcGW13l1ZoPLEOn2JWCpLrjpwlxx/IuTHTAf/vgOtv02m+NmPjlj1lp8q40AWbZmewz/mR/VBc8UNF7BQrIHGpVPR4oYKpu18UUsfCvIDQh9sj1eNrM8PhN07Xg4sl7+DPhCMtUkFyjjjG6/ZwE6cn/oi1sWmW/w4OKm0JJOdLvLGCaxQkTmXuZjrLH714JSQBnApy3ElETCD0P5yOSSUxOV327uO5dhxQgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6514.namprd11.prod.outlook.com (2603:10b6:208:3a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Tue, 26 Mar
 2024 19:23:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 19:23:14 +0000
Date: Tue, 26 Mar 2024 19:22:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/4] drm/xe/guc: Use GuC ID Manager in submission code
Message-ID: <ZgMgXJHD7boQQ41f@DUT025-TGLU.fm.intel.com>
References: <20240313221112.1089-1-michal.wajdeczko@intel.com>
 <20240313221112.1089-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240313221112.1089-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0204.namprd05.prod.outlook.com
 (2603:10b6:a03:330::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6514:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VSmqaTd49kpS5Kzxp/uo11A8gpCJIX3luYkC+LTcPDym4nh0EwpS8WZpxY5S3GyHyRk8f8eibO++/TlL3vQodVo3lBuz9e/8yaqBVXSsbjnkkc2CEgOs+9cJ+Fzttu+xzL7C5VdH+YD403YqHbK9eIw4fregDUNTNz4jPtulBMkIJk5BCnf3Spa16rVDiVPSnLoqjoUUojsEoXn7AMqAHo9pwar1Z278JMXNARNNFA36ktfGSg+SInnk2tSoQ2ZbBs1YsebkX/AgZpiaf53kfVqNUTH1WZKe8o5OXeKdLPhL7TFoihJ/1/bExX4FvapTflo7/Z0ynSCGDcjb0UxiK0OaDr9/gGJAB4AMZdeZH24WUo9respiPs4t7azfHgFQgyK9Jzgt6OcsqivnB6JSQ4LspCWxYL4ftDwIW5flA+Umo/84+WtzcQPxZsP7z+UCiEqqVJVp8FnIcm2b32eqjQswZRIO2HAHsZ2F7j0k5r1u7hlOH+TBJxbMrWkaMOyctJ4L/BZLWKnA+jOv/adm7N3z7GWPXPowPCRU9OyAunPOylFSpjrdHZUwHW2NWv5VO3B3Vsr8LxWVkMFV4i9mqkLsiwmSuVzGaHhmBw82qht6TI4BQgmcnIcj/XYSvjk5zRYeSxcK7Z0sWzO1eayUkuFVUeKEBT4/WKZFCFT18fo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s2Q1oNmOms6Fbfdu1fwFFwNYzhe52F5eRgT+Jj4xQiSkDsxsgkFDJy/qe5bX?=
 =?us-ascii?Q?Z4jHEYvFti4KinCSRIAJJQMRjbreOcKfM/KGhV5lkaEMNANSseTqJB4S/aG3?=
 =?us-ascii?Q?sEUgabvQzub2xkL3s8+r3UYCstJV/Nasd89+JT0LOzJrkx5kPfMngaiwn6YV?=
 =?us-ascii?Q?bdYGHhMXB6LV1yNWAvQ0VyQQLRJ7+vBlm+ViZ5dvXBGhDfY6+LQNimev88q6?=
 =?us-ascii?Q?6pqMZihW0E7GvHSguKeIHZ86FaSQoViMjcuA3o7zrTrJxF5g8LgFMEh3ZkwU?=
 =?us-ascii?Q?l1ARzro3sCFttyu0yvvu4vTla2x6H7iIxBFdFcxQylz8CINyBvf3N0wSYMgj?=
 =?us-ascii?Q?OgKcU+GQ76r3TACI8d9itynhoLnZ68rRrIOF+gD3U6vI+bDYgSL+W16WKbHq?=
 =?us-ascii?Q?XyNM5Z2Aar3FmwAoBjFCBwnjbeYhLtDzwwSGq2yIpqC3XaPBs1mN4BkBQyUn?=
 =?us-ascii?Q?1EogWTiBNqOt4RWHU2RV2jniZ8cggFB5QbbzgzQQYfltBAl0G1uhJ2iw/w7p?=
 =?us-ascii?Q?qr25ffHb8FlEhb4NatojQKgVNGhWEwjvmZYFZcLOHT7CFgMy8o5fJLrUq93J?=
 =?us-ascii?Q?z2e+Whl8/wl6U7O4/yJdqD2fAZoPLge5ZfmfhY/0H9vnSM/8gGwEjDAsAVdq?=
 =?us-ascii?Q?Us5VtAtpH/I1gofoygURNV78zLaODlV/u+yQ3r2AfuAiO6TMydR84VM5BJNw?=
 =?us-ascii?Q?rtvSo4M0bNM3AXzJa8a2sHzsThC/UIO+MnIAgaDa5AcfaUcdB/NOubbreqQc?=
 =?us-ascii?Q?oOGupyjdCfRKxILNyId+wjt5wf6IJrNaqRb6Yhohjf/VMZMJvQaHMvuVZzQ4?=
 =?us-ascii?Q?x2bDz6i7h0jGovTW9d78cbDbibaNURByTb4eX/6EZphUZ9VonD12vUJnWN0Q?=
 =?us-ascii?Q?aw2XFTL7D3SNs0DfwHphDORMhfAOHo4iQ/LUrKEbFKBMfXV0CThJLHdbwcdP?=
 =?us-ascii?Q?0/YJw3J8Q4AlPqQ2WlFK9EKinA+fkIQML59zfXqndAXK7rvV2Q8szjFqzqQo?=
 =?us-ascii?Q?uIgp07ffHKcMGoKWihALvmEjbchBZpDqDEPjtCdvCV7tImi+60QNQlvlxcj4?=
 =?us-ascii?Q?i25QmHtl4WqmQAEukU0AOc1cEfgNX3LdpWOMRjFNnbQY3lLotg5E7E4jyA/d?=
 =?us-ascii?Q?d1lQdAAGd1yJ57UKszd2jKSO6QZc+JEwyqB1tH5dBZHyG4p4rdXBBvdesyWw?=
 =?us-ascii?Q?djN2SxooJtp0av3SobtGINYbZc2iCo8ugV5QNZaIGF3Kot5b1a79l4dmmz+E?=
 =?us-ascii?Q?2cirUssmK2OBVBiu8g4oyEHwLgsdbHTiMLHbsf/0t1saFRUD29tItZARGszi?=
 =?us-ascii?Q?wxR+5G+hl8CwDKQqeJPKao70bsja33a6GyvTy1r63uodECVSjUiaG988qEI2?=
 =?us-ascii?Q?BRQJMvQy762eThSMMWV3bngmIG96qLGqONPBzRoKm4vOIhadQeDsqREYZstZ?=
 =?us-ascii?Q?rDG0yIQlASWHmVNIJBp4S/A0QPKBySMcuBhx8Nlu+Zde1Nuk3heGTAZdiYCn?=
 =?us-ascii?Q?H7lmtoZjVeuwncCEnDjYKLfZXoz6stRyf4Rr7uERk7bgLvJsmdFMsgTABXYz?=
 =?us-ascii?Q?m5aH86aTBr1gfCVGosDvovyDq6OwFIV5E5GKI1ZTBBT87juFzWw7q7Ckw9G9?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ddcd8bf-92ef-4100-cf5a-08dc4dca2e7d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 19:23:13.9857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0VX5EtFx45AnolgHwnry9BhkJQY9cfZX+CbmxaQDo35NN2ecXCzhsWARmgV4/PrtFVTF36NXWjdE6geL0fjDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6514
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

On Wed, Mar 13, 2024 at 11:11:12PM +0100, Michal Wajdeczko wrote:
> We are ready to replace private guc_ids management code with
> separate GuC ID Manager that can be shared with upcoming SR-IOV
> PF provisioning code.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 42 +++++++-----------------------
>  drivers/gpu/drm/xe/xe_guc_types.h  |  4 ---
>  2 files changed, 10 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9f8ce2d1f6a0..78b471636470 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -27,6 +27,7 @@
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_exec_queue_types.h"
> +#include "xe_guc_id_mgr.h"
>  #include "xe_guc_submit_types.h"
>  #include "xe_hw_engine.h"
>  #include "xe_hw_fence.h"
> @@ -236,16 +237,10 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
>  	struct xe_guc *guc = arg;
>  
>  	xa_destroy(&guc->submission_state.exec_queue_lookup);
> -	ida_destroy(&guc->submission_state.guc_ids);
> -	bitmap_free(guc->submission_state.guc_ids_bitmap);
>  	free_submit_wq(guc);
>  	mutex_destroy(&guc->submission_state.lock);
>  }
>  
> -#define GUC_ID_NUMBER_MLRC	4096
> -#define GUC_ID_NUMBER_SLRC	(GUC_ID_MAX - GUC_ID_NUMBER_MLRC)
> -#define GUC_ID_START_MLRC	GUC_ID_NUMBER_SLRC
> -
>  static const struct xe_exec_queue_ops guc_exec_queue_ops;
>  
>  static void primelockdep(struct xe_guc *guc)
> @@ -268,22 +263,14 @@ int xe_guc_submit_init(struct xe_guc *guc)
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	int err;
>  
> -	guc->submission_state.guc_ids_bitmap =
> -		bitmap_zalloc(GUC_ID_NUMBER_MLRC, GFP_KERNEL);
> -	if (!guc->submission_state.guc_ids_bitmap)
> -		return -ENOMEM;
> -
>  	err = alloc_submit_wq(guc);
> -	if (err) {
> -		bitmap_free(guc->submission_state.guc_ids_bitmap);
> +	if (err)
>  		return err;
> -	}
>  
>  	gt->exec_queue_ops = &guc_exec_queue_ops;
>  
>  	mutex_init(&guc->submission_state.lock);
>  	xa_init(&guc->submission_state.exec_queue_lookup);
> -	ida_init(&guc->submission_state.guc_ids);
>  
>  	spin_lock_init(&guc->submission_state.suspend.lock);
>  	guc->submission_state.suspend.context = dma_fence_context_alloc(1);
> @@ -294,6 +281,10 @@ int xe_guc_submit_init(struct xe_guc *guc)
>  	if (err)
>  		return err;
>  
> +	err = xe_guc_id_mgr_init(&guc->submission_state.idm, ~0);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  
> @@ -306,12 +297,8 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa
>  	for (i = 0; i < xa_count; ++i)
>  		xa_erase(&guc->submission_state.exec_queue_lookup, q->guc->id + i);
>  
> -	if (xe_exec_queue_is_parallel(q))
> -		bitmap_release_region(guc->submission_state.guc_ids_bitmap,
> -				      q->guc->id - GUC_ID_START_MLRC,
> -				      order_base_2(q->width));
> -	else
> -		ida_free(&guc->submission_state.guc_ids, q->guc->id);
> +	xe_guc_id_mgr_release_locked(&guc->submission_state.idm,
> +				     q->guc->id, q->width);
>  }
>  
>  static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
> @@ -329,21 +316,12 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
>  	 */
>  	lockdep_assert_held(&guc->submission_state.lock);
>  
> -	if (xe_exec_queue_is_parallel(q)) {
> -		void *bitmap = guc->submission_state.guc_ids_bitmap;
> -
> -		ret = bitmap_find_free_region(bitmap, GUC_ID_NUMBER_MLRC,
> -					      order_base_2(q->width));
> -	} else {
> -		ret = ida_alloc_max(&guc->submission_state.guc_ids,
> -				    GUC_ID_NUMBER_SLRC - 1, GFP_NOWAIT);
> -	}
> +	ret = xe_guc_id_mgr_reserve_locked(&guc->submission_state.idm,
> +					   q->width);
>  	if (ret < 0)
>  		return ret;
>  
>  	q->guc->id = ret;
> -	if (xe_exec_queue_is_parallel(q))
> -		q->guc->id += GUC_ID_START_MLRC;
>  
>  	for (i = 0; i < q->width; ++i) {
>  		ptr = xa_store(&guc->submission_state.exec_queue_lookup,
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index 69be1fb83047..82bd93f7867d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -68,10 +68,6 @@ struct xe_guc {
>  		struct xe_guc_id_mgr idm;
>  		/** @submission_state.exec_queue_lookup: Lookup an xe_engine from guc_id */
>  		struct xarray exec_queue_lookup;
> -		/** @submission_state.guc_ids: used to allocate new guc_ids, single-lrc */
> -		struct ida guc_ids;
> -		/** @submission_state.guc_ids_bitmap: used to allocate new guc_ids, multi-lrc */
> -		unsigned long *guc_ids_bitmap;
>  		/** @submission_state.stopped: submissions are stopped */
>  		atomic_t stopped;
>  		/** @submission_state.lock: protects submission state */
> -- 
> 2.43.0
> 
