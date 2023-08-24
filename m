Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A40C3DA6F
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 16:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163CE10E592;
	Thu, 24 Aug 2023 16:23:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3E410E592
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 16:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692894218; x=1724430218;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3qidL8qbARZlTzuXvA4KOaWFuCiJTKNnup0Qs0/a7cw=;
 b=EtGSRm3l1l4/oUJTMcSVqhr7tfhaR4kKm5dk4/A5cU753AXfFYwJMsCk
 RMBJDWrXxvedBPJPzqUzErvXEdPFUeyI/7oA4W0tiRuNh4akX7ioe56/i
 Zu3Yk3iwHnTfmSSa1n+JCmlPRJl1gGyDJweTHHlTUa5LQkiZIsOhfdq35
 ghIdjAovRuqSlAMD7GDKzjzZ78p/yhdomBQ76mqH0uCVAolZqw1qRghuG
 jmI6jo5y1fD/swZLGPmkzx1tpPSINjPHGyADzUyE0Mz+cU4Q+TCB9m0EE
 eSDaRvxtBxOIEoyPLBhj9/UdJopydYQWlIiEE4CT5WgHXZa+9XrbupyEs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="364682613"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="364682613"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 09:23:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="880857782"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2023 09:23:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 09:23:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 09:23:35 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 09:23:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PT1nMkexvm2zFqfummTjyX6tdZrzNIlosedfXcV3b2Jr5Pt8kdhrkxGwUac72FguLVgrKYMlxjmpi27sFtJv1nTseirFkN3rSiWxTp4nDjd9D4S6ycb6z7ia64FyC6n5oNsg5QHxT+il0lMH9KVWitN2yWqWObygZg+lX/8y8upijvKX6pz+UUJTPZ+rXirJnBgPcsEIuBO8tPrVuL8YDlRCSamszImhVZZiKmicRP2XaL0tXBj+3g6cjb1jV965beLfgDIYeFX/0K6qT8VWtfTjqFQINZvIuV8+X9+nVmjFHu2XgTb3Y6CL293oCx6kB946vI12RrZKe8vQmqS99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vj7oDRQH/ekgmJi47ZKgUTSkBTJ6ToLDdsGVqBmIjHQ=;
 b=h6cEBkyD3isviiijGdCkppIZmoFiH1rw1gMxlSlGAelmJoPS05DyERRWQzknyH1Bo6XItAL48S6/E/qhZFjBVZmXd4h6diiUZpKReLfE2R9jJJgTJiSUP3XpL4GOaJWww9R6fzyGxvzukKvxgN9ZfIpX+a8w+3hasqcFYYufcLEuF7slyTxBQncz+jUilxNEemKC4PI7aIwfT/FP5TAD/3YUTsCvs/23KxYY8mHCaAhxjvf/MTfsnw9NdzDljXt5GyDI4OJIY5R6UGFFc78uJTtji3Bvw3fxuwSmza7WTlcObim9jjqkC+/els7QQPbT/9qQePqDWL5nrnTDyPTUcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7854.namprd11.prod.outlook.com (2603:10b6:208:3f6::5)
 by IA1PR11MB6265.namprd11.prod.outlook.com (2603:10b6:208:3e7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 16:23:32 +0000
Received: from IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::c66d:c5f1:1ea6:74b7]) by IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::c66d:c5f1:1ea6:74b7%5]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 16:23:32 +0000
Date: Thu, 24 Aug 2023 09:23:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20230824162328.GW1529860@mdroper-desk1.amr.corp.intel.com>
References: <20230823114040.31769-1-niranjana.vishwanathapura@intel.com>
 <20230823114040.31769-4-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230823114040.31769-4-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR05CA0159.namprd05.prod.outlook.com
 (2603:10b6:a03:339::14) To IA1PR11MB7854.namprd11.prod.outlook.com
 (2603:10b6:208:3f6::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7854:EE_|IA1PR11MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: 707e4c36-e3e6-4173-bc56-08dba4be7524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xinspmp0lQSSpMT3k+OPWLOIwN7Km+K9OhJRoPg7VTzwRFL/Vzk7i1vIrEgjMklDmmjxvytqUeAzA1jkNVyX0TFOFnWaUp0WFFucrObtfZM7FueMVvQK2GsIXT8yCu0/R9mkVl/OMJqCjuiDe+5DEAnwQnCQqGTvF9NQU81doCesrSIas84lNtm8FudN1mMj3MYCXhtt+x0E4mhuL1KU1R5Nk14zASQwL5lD1D+mIa9qmz4+u+v1kib2uhWkVv6cmSB9N5MTYGiI7HCmD6hCoX+g3tLiNND7439sC77SoX5vH3ti5Nw67SdGTEUxROScihR3OXKSb/Wj7gt8dKDLrEI6rzlpStvcsrCPxRBQhlDU50fo7EQXsaP4lOoB0vKUujWDuO0MC0TuAFsRbumyMSTBpPGPH81V6vNX/xlodya+meLMm1IOabVWNNIgufBl3z+kl8xUpbe0LXApTe7T5xQzmarBvRgpil4VkAltB/z+w0IYjt0jO4CECNoDYeKaMFXZh9MyfBN5R0jnO3sYxSp+uBtH4kxPo80/oPffgEuRLsBaYwV3ZQsCB1L+QAvn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(366004)(136003)(346002)(186009)(1800799009)(451199024)(1076003)(5660300002)(107886003)(8936002)(4326008)(8676002)(6862004)(83380400001)(33656002)(26005)(38100700002)(6666004)(82960400001)(66556008)(66946007)(66476007)(6506007)(6636002)(316002)(478600001)(41300700001)(2906002)(6512007)(86362001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IiL6Qp4CUvnl+ilwBRTOZcn1dr2hbuNhEMlMg2tc2N7HxYnH0XqlutA4Et3+?=
 =?us-ascii?Q?QyYDTU7PwsRpIzvNiq9PwwWtxLxGeT/RftbniBUbW3tUn8mnOu3YKn8p2zvq?=
 =?us-ascii?Q?yAuy0MWvz2aAkqC0f3+Y8tv5XV4YeDf3E1yKb/lXWcK0F0c/Q6BxKeryDyfY?=
 =?us-ascii?Q?4ePZ5f3m7nP/YHudUi5EzHKCQlb7Ci7U6rRPsfi1CImFfZUbfO+V4u2aYoXI?=
 =?us-ascii?Q?/GjuIBqcRM4zAEWDqRowHiB+TdwyElV9DKQ27gDJReP3pWXwzrs7Pfc5D6GC?=
 =?us-ascii?Q?VE1p2u25G1FNkbl36WJkGOjlAOhfJCqycELsAmv9Bt5yqGcGGOmydKRnHMNa?=
 =?us-ascii?Q?ppfb8i35n9W2omZ25aC0nun+z1tCDy8dIYIsome9HK1JWrUpVxdbM2kdJ1lr?=
 =?us-ascii?Q?0NzMbg9yLzq5UUWBnuQ/ZKjH5H91jMxTv55Tf05AH1PZtVWmi5a8dkMhuidz?=
 =?us-ascii?Q?in8lyUE8Sb6azp6P4zGduXKtR1CncG2Y98n8YyiWx1CPyYoTr+vunIgp+ba5?=
 =?us-ascii?Q?bz0zzzGYaKdc9vFzkVuZUHpKx+7ltkZ90HI67oKyFdxf3mSWbBjLGHqqBWmV?=
 =?us-ascii?Q?g5iXbPczJq2zHpQC6UYxfJj6SP6t0IN00HBJg29VrFUV+vXXZQGhNd68tCo7?=
 =?us-ascii?Q?vUtLzn9zTdooExCxQpYJXxkhjJq4oTaMtSMxErVcp3HzWBmT7iNTX5xUQ22J?=
 =?us-ascii?Q?8IeI1AhyJVqzU3RLtBy+aYJaSNuDXtLo3LbqmSDWo55PLtHEH19DzMUyFs+6?=
 =?us-ascii?Q?xrswUsxCLwl14KHYBr57oxtNMNPqggfjOpnmgyEoHlivw29NDLlSqrCl8Idt?=
 =?us-ascii?Q?ED8Ieru1yv6SYQPt/Lx/DWnbtlhYZOyyNFmgiLbdHb+mvF851SzBwmVBrOjJ?=
 =?us-ascii?Q?rKHhIVPUUDflGoiXfSsg9mZCo4xlkccGHHNbrcH+fHHulDdY30D9xte+dJgA?=
 =?us-ascii?Q?j9DRKkElhN4AdPD2QkhZWTY9xlyvBbMBuUjNPpWWK+ZdA1X79etKAwMBAbW5?=
 =?us-ascii?Q?QQcxeAdGcOzY9eER6SSkvzAyGcqhiSVTd0kzGZ1+9+Vb7/32TEejzhcwJ9Y/?=
 =?us-ascii?Q?pGtlhO/P/Wvdy2U4rPICCAi8g1bp97Jwg/ZChCzu1lkFWiVm1ox8R2J6XNvF?=
 =?us-ascii?Q?9aVQCzyNU5sSr+Cb20PxBgvCf0D7PSC6jdH762mB8xbWgpF0AqhP6ZDOEqsS?=
 =?us-ascii?Q?yoOFmdZ4yYmZkqHnTPM+UtAxE0NuVnOCU8LT8bn5lEhyaUuok7dGV4tBaKUK?=
 =?us-ascii?Q?fO/2L9PE/g6NXPZ9/3wGUfruNORh72jV4vmftJLOj9h/5DHRu3VkZNg/dlnt?=
 =?us-ascii?Q?FeexsJ3LOlZdYgsEQgdZRGnQ7GIF7BMiqAd04Ml0/3XgVNYhdUJP5hXT4SZn?=
 =?us-ascii?Q?UP9ckOJ3ck2aUuHXS7pGla5gfEVFRoj7ZkP+G5B/t5+h5sD8kVrzUHQ+QaAB?=
 =?us-ascii?Q?QtpA2csKoOT5nLK07CY3bv/gn7TUn8ycoHp8mpadPSsjrjoa6bNuifhl9j6o?=
 =?us-ascii?Q?HWIDXdUG538cC/Lqv9L74VybQOWX2X0/8dLwRm/miB/z1IXycJVlYPu2vR/y?=
 =?us-ascii?Q?VDUp6WI6LKW8dSiOmSPUZJIRHx/WOrjpT7NcVYlM520egjqEy+sLlHfhAfML?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 707e4c36-e3e6-4173-bc56-08dba4be7524
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 16:23:32.1457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIoCLLQaXta9/MhsHdszKlROHMYDuwK4mm9LZYrTgp+lqQxSdS37Vzmz5pCgcCcPH0LP2yNiHlP2j0p/zZBWmfJnLboHw45NVDbi668YeFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6265
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 3/3] drm/xe/pvc: Use fast copy engines as
 migrate engine on PVC
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

On Wed, Aug 23, 2023 at 04:40:40AM -0700, Niranjana Vishwanathapura wrote:
> Some copy hardware engine instances are faster than others on PVC.
> Use a virtual engine of these plus the reserved instance for the migrate
> engine on PVC. The idea being if a fast instance is available it will be
> used and the throughput of kernel copies, clears, and pagefault
> servicing will be higher.
> 
> v2: Use OOB WA, use all copy engines if no WA is required
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c    | 39 +++++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
>  2 files changed, 37 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 956a96b38346..60f4e0a60b71 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -12,6 +12,7 @@
>  #include <drm/ttm/ttm_tt.h>
>  #include <drm/xe_drm.h>
>  
> +#include "generated/xe_wa_oob.h"
>  #include "regs/xe_gpu_commands.h"
>  #include "tests/xe_test.h"
>  #include "xe_bb.h"
> @@ -29,6 +30,7 @@
>  #include "xe_sync.h"
>  #include "xe_trace.h"
>  #include "xe_vm.h"
> +#include "xe_wa.h"
>  
>  /**
>   * struct xe_migrate - migrate context.
> @@ -298,6 +300,36 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	return 0;
>  }
>  
> +/**
> + * xe_migrate_usm_logical_mask - Return logical mask for usm migrate engine.

When you make this a static function in the next version, you can also
demote this to a regular comment.  We generally don't use formal
kerneldoc on static functions.

You already noted that the pr_info needs to be removed and this function
needs to be made static, so aside from those changes,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


As a follow-up should consider changing the logic used to pick a
reserved engine instance?  Should we try to always pick a "slow" engine
as our reserved engine (which is basically just a backup for when the
faster engines are all in use by userspace)?  Right now it looks like
the reserved engine is always the last one that isn't fused off, so it
might either be a fast engine or a slow engine depending on platform
fusing.  If we have to take an engine away from userspace, it might be
best to make sure it's always one of the slow ones?


Matt

> + * @gt: gt instance
> + *
> + * Due to workaround 16017236439, odd instance hardware copy engines are
> + * faster than even instance ones.
> + * This function returns the mask involving all faster copy engines and the
> + * reserved copy engine to be used as logical mask for migrate engine.
> + * Including the reserved copy engine is required to avoid deadlocks due to
> + * migrate jobs servicing the faults gets stuck behind the job that faulted.
> + */
> +u32 xe_migrate_usm_logical_mask(struct xe_gt *gt)
> +{
> +	u32 logical_mask = 0;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		if (hwe->class != XE_ENGINE_CLASS_COPY)
> +			continue;
> +
> +		if (!XE_WA(gt, 16017236439) ||
> +		    xe_gt_is_usm_hwe(gt, hwe) || hwe->instance & 1)
> +			logical_mask |= BIT(hwe->logical_instance);
> +	}
> +
> +	pr_info("NNV %s logical_mask 0x%x\n", __func__, logical_mask);
> +	return logical_mask;
> +}
> +
>  /**
>   * xe_migrate_init() - Initialize a migrate context
>   * @tile: Back-pointer to the tile we're initializing for.
> @@ -338,11 +370,12 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  							   XE_ENGINE_CLASS_COPY,
>  							   primary_gt->usm.reserved_bcs_instance,
>  							   false);
> -		if (!hwe)
> +		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
> +
> +		if (!hwe || !logical_mask)
>  			return ERR_PTR(-EINVAL);
>  
> -		m->q = xe_exec_queue_create(xe, vm,
> -					    BIT(hwe->logical_instance), 1,
> +		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1,
>  					    hwe, EXEC_QUEUE_FLAG_KERNEL);
>  	} else {
>  		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index ea90dcc933b5..599e67169dae 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -17,3 +17,4 @@
>  1409600907	GRAPHICS_VERSION_RANGE(1200, 1250)
>  14016763929	SUBPLATFORM(DG2, G10)
>  		SUBPLATFORM(DG2, G12)
> +16017236439	PLATFORM(PVC)
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
