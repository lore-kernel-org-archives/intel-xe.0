Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63272606A31F
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 20:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kHEhdrhQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAB110E0D7;
	Wed, 28 Oct 2026 20:54:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584FC10E0D7
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 20:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793220868; x=1824756868;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v11bd4W1MK14JwWt6jrJ5XYZgqfeIIjE7jysGzlTYZ8=;
 b=kHEhdrhQMnX8V5F1Vqokm3fPKMRrtDxPTvKsEQ/Ko0+l4cG0nWuGjcmI
 1VO1xifHovhFwhRxqFiMKcRf89afDyEQMR0TGHQepS5gZ0VSDZKtqZz+S
 iWBDy9kg4eXouI9RYh8fZRTP/TFLhCjimq29z3RUL26+Bg16iGrnVaqjh
 IRbG4g6Rl9Mw7Q9O6lj6kF5yxfjGFdFdt9PYzX3BrNS+OEMFKPIQgHijO
 g361Z5npdG9fggqvXCNgQa4qK27YKPi6Aq9ioofKcVtnjkV8CCDSDCys7
 OBl/LuRp28Pk+2b6dIog5zbn9pexLAuP/VRyfpiAnl9U79qBM/Hu+qI8N A==;
X-CSE-ConnectionGUID: Sf7dKWEQTA6TyjD+X0VGHQ==
X-CSE-MsgGUID: 4XLwqGBhSb2YfGIAFSedRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1842706"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1842706"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 13:54:28 -0700
X-CSE-ConnectionGUID: ZuFcXhrgRfGmDAP/momR9A==
X-CSE-MsgGUID: TPUdzpJJRfmN5nt00RkLJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4878457"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 13:54:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 13:54:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 13:54:27 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 13:54:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fEYr66IUMBPav/ZTFKb2ex1/H9tCZVeYosOPH7MgKzBNTHDpawoz3IgwAlhFSa9Ulrz0lI+7zNwOliZgv1Yx8V8xvUReMzQHxjXZlY8YkEOaubB5J0FulMyzrGgozm5AFDU05eLJTjUJZ7FTPM3tL6skOckeplY2lCSD3AUcDFkkQs+nwcreX3Ihszn6W1jvqJy1vZa9IQAT/tjSEkso+BJ7cRwr0yoTrHbLLYd0v0s96UZdU+QRDPTp3wLmvMeHPv27NO+GEdslyfsThl5jCXb9wpVlYXdNqyMZb0e7QUHRai9yMtZ42Un1LXZAggDcSt/f6AVa1jVw1AaJwiAX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoJVGOfS/T5BSjklfZYVQzCH7AkXLIG0KBKWzl8bB50=;
 b=gQ29A84Bw7agBHWfgknD9mA/bLzeQMNfnp0TRvso9Emtwo54FYxzaJD8SUh0VauLfNtkhgV7oI6Du/+a/ied8zrcASimO3faC30SjwlKdFXXEA8fd75qlQ0o8m+6uTjMaaMeENyj5v/uxypeKSod6yG+tIXWMuUglmkX9X1l9yKy4RgA79wu8R/HjKn6LAFC7MdgkyJMzNfa9nmjU7cOT+jAR1JQryxmg6g7Ab+ytKZfb0cmSKk1KRVVHILXmVtOzhY4Qu05mjbHfpm6N1vI3qjAjHhZxuqjsbQbD/ErWwkkpUKI2XfBFfmSdqBeBq+lGPCJg3WFo53/s1JN/hW4rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by PH8PR11MB7047.namprd11.prod.outlook.com (2603:10b6:510:215::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 20:54:24 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 20:54:24 +0000
Date: Wed, 28 Oct 2026 13:54:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Chen, Junjia" <junjia.chen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe: Unwrap sync fences before adding them as job
 dependencies
Message-ID: <auJg/jz1WsqDyf9z@gsse-cloud1.jf.intel.com>
References: <20261028161358.1917359-1-junjia.chen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261028161358.1917359-1-junjia.chen@intel.com>
X-ClientProxiedBy: MW4PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:303:8f::13) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|PH8PR11MB7047:EE_
X-MS-Office365-Filtering-Correlation-Id: f538d54d-b7c5-4997-c1bb-08df3535a5d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|261026121527099003|11063799006|56012099006|261022075727099003|10067099003|261021121427099003|261022105027099003|261021123027099003|261009223027099003|22082099003|18002099003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: ClSxyn/Je9vx+2bVSTkyNGGTC1MuSGUd4EBZEV3J16l25Gd3mpkI6C75JVVTcPl5EFpTCu/Bdwpzp3TzuH3AJf/fMYtq2/d+61BGAQ4PfQB0wsZkHpMof7MgiSrGuctuN3w/kfs7Hahfpc09FNZ/eZ8WaUXnWRgsWHldUvWcRC+DbCa6j2MpS6J/Cx5IUAAi9OwX/ULzeZImcCZzTNBOzJeH1a6p/GQmIzBzIFLxQtCtqfK1sj4pRgcmCOcYl7cQBQ5vPJbcPaThwpCSbnecBzp/R2ddHmbIvfmQgSJGS6+Kbj1qWn5lmH/Oen4SscvsMyYCZQEXEFBeClHgLh56yHu+9fNp9+7l7PJEsYnzl0XUwOGmbfXkJOvdc3RsXfcwt5Texk+V9xFY6/G+Go7/AJYPpBzrkS9T8WxFbmQflyb7awt2kZSQOh0zpt4K9A7oAkzxCZg6klW2RypLo9H6P5CXyRNJGb/VU1eE/0kG6IFnzi0uX23DhHiUG/EMoKJciQ/ARwan3+yVNSi01XN+dCPcdETIjQOwFXFzFPCEIO4HqxPx+2vByAg5NqiIw3Ct36oKRX95e8Z7Nk1VnQ6wyeCoJMrk/xZypUIqAefZ8PTPte8EZZ9d1JF4aPzIFUTy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(261026121527099003)(11063799006)(56012099006)(261022075727099003)(10067099003)(261021121427099003)(261022105027099003)(261021123027099003)(261009223027099003)(22082099003)(18002099003)(261028144727099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qwPzhEE5OGvY/UWZT2FRY8VHWU2c6Y4Fy3IYpbS6OBLCHJGcVRienVmB1fkD?=
 =?us-ascii?Q?nhw6meimoWZ0K5Y24x9zRwVsUJ1OYMaNF52L9vodGhccFja8+i+V8Y15nLyu?=
 =?us-ascii?Q?6Uh4Xacw+WU394Rnr43D5X8mrQjgWvLSlY5FmMVfQqM3suSCpE7VBAab3Y3x?=
 =?us-ascii?Q?mxD490ZHcvIArNFt8ykgbDBaiKgde5M6Sd1uR5xZPgwpnON5ZWWAQHXvliMu?=
 =?us-ascii?Q?VnCue4uHfcR2mP8xZzm6XFEf4jtKfYuL3wix9w26AKvVWtErPUVaSVkhgWUR?=
 =?us-ascii?Q?DLNBWkHYgLPFkCltFU20hmnDtM40t5tKlZBwGySODdygCKuyNUn99ZRHRisX?=
 =?us-ascii?Q?6k80fX61B65UQTphBxVBbnw9cg0JDpIYVuho8lghxt0PUvy+icKSz7ZAR4d/?=
 =?us-ascii?Q?2bIuNQOwMJ/fhkJu5s6kJPPOD2eWXUuS3M9q97ztJ14/j4W0JeFBRHti1Q/C?=
 =?us-ascii?Q?7IGrv4P8NZvIe6dW4t9rVTHu6etAGYg1MlTZWmQ38E9XxIz6mlx1x2BOvbjF?=
 =?us-ascii?Q?YvQuSwXaPehxOk0BiSchWiJZIisLMv4ibXIjvgLGcGerK2uXpU9zAu0vRL02?=
 =?us-ascii?Q?o+2Q/NZznUDewCyCCXUsjcY0qLdfuQ/vGSBYFH6JEgFHDrSZcMukmlCcMTGx?=
 =?us-ascii?Q?EjRxKLXGgljO3s1EieOM4vABhM8PExvnGsFkMfZFEHckqjrmSstYOgaVLZc1?=
 =?us-ascii?Q?Yao83/QGQtvIQ0w9Fs/U47PCVh74+py1W49mmZq2pBsYPPFeOXcQmjUG0Nn/?=
 =?us-ascii?Q?vhnUyZF0objc4vGeb4S99duHezlOQ9DeMvTl4RyuOMVEfG7mgLmbVBjsrnqd?=
 =?us-ascii?Q?YTtXMpA8XdWqyDgWROzht3DX/jJ5OU31SGU/5+VthQE4Hw5fr9ysvtyM5Ipn?=
 =?us-ascii?Q?IpKp73V1oH1KjGWVfOVe1PPJ4aaoUiMJNySgOM+m+gVy327Zl/Bv+uGZOSLv?=
 =?us-ascii?Q?aUXnQIXH6cU1QMjRaCWxaVO2rl2DZiCWDxYghTWXDRS9Lx4nlQnlCRNQjhUP?=
 =?us-ascii?Q?KSVziSD9aOnN/VzlluykH1eaZuGNWseX6y5V2Tje/flPKWAaBt8LI0gqg0cX?=
 =?us-ascii?Q?Dv/0ykBHqPLMUrgGmtH+zUbiXbqQlbkRWzn7DZ6i6GQEXLXjmoF1NGqBCCni?=
 =?us-ascii?Q?2gFyLKSSqzx9NaKVfsReqHDVY9I+G6OJJbPt6DYngBB5tPowzQwloMDIH/EK?=
 =?us-ascii?Q?Hc6ujVZXBTs6XfdKjye1khkdiKjq4E3x+RpCnnvvGVCBth0bs1nzwNT+N/Ml?=
 =?us-ascii?Q?21ZzDS5LayxND96WvfBeHnWgtWomuQyOjYPWx9B9pEt15votDla2ucq4hVFp?=
 =?us-ascii?Q?yuJHjhQkMMvFmyQOLbdzhAffbjs6Hccoeve4KRj2B7OCBX3S4ugZLD2rwq7W?=
 =?us-ascii?Q?WMtdyls5iV42k/qLqoYBjCUcd5Z5iZdWrl/NJNb89vMRJ1AXUxOEJmAcLyNx?=
 =?us-ascii?Q?eEaIss3D7fq3FURyzPd7VF40yqsYdwMkvdntrqL1SAopI2c6H74mgOa8hefE?=
 =?us-ascii?Q?0Ra38U/5pCD1nFGooJcfPV9K3NYMle9jXR9F9SE6d1bPg/CxGWaKuercDQLs?=
 =?us-ascii?Q?idEvyBBuVav+hJT2zLySDV0fAtKb+xJM0RD3CBiw5Z1KJaySN/yPDW3RJg8O?=
 =?us-ascii?Q?ve1dxLQutZHNnXxgfOYWrY1pPQj0jIzIRE3ONvUAu5CWIgj+8W5qBY8x1VZi?=
 =?us-ascii?Q?RK0AIsSbbYf6+AwkdeFxwZruPJUmhQAbDFHnCZ88IEr9qatiZ+LgFlvKqRjw?=
 =?us-ascii?Q?vUKHWOXkiA=3D=3D?=
X-Exchange-RoutingPolicyChecked: slp5VAumEwy43KzwWFfs1SBh5bqE1auEt3sbNQ+YWAokqxd3PyTQFJXFjrjcCGZBIVGX5hr/e9Yl0tDrlfZmVtGOmdzdiUgvMOCz+OiS8i+988QC/ivGDEOi2wsKzIjCdzBKHepeYRbkZQ80suVEuqSiFEOL8WuB2C097RtcL6Yfn19TG/QVeDJOhwORqppwEv9nBrgwV+9jn+hVWN66Eq617in6fTFwxKZUcdzZbP3dDotvir/6Pm2Al72vt1IenqtpuqBn8gHVW09EG+eH6ld0ow98atvBdnEuQ6U//2pV+3ny7sJzNR2ssiZPxUcme/rmMcRZlq2BiVvqF5Z1YQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f538d54d-b7c5-4997-c1bb-08df3535a5d2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 20:54:24.3598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qy4Mf/kA3OZjqeZDugF3693QxN2Nud1oBIxfQADoHZECoSTdgbRSAtlYA2dNzRRhnRL2aULm9Z82qyJbswL4fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7047
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 12:13:58AM +0800, Chen, Junjia wrote:
> A timeline syncobj point is a dma_fence_chain node that carries its own
> fence context, separate from the contexts of the fences it wraps.
> xe_sync_entry_add_deps() passed that container straight to
> drm_sched_job_add_dependency().
> 
> drm_sched_entity_add_dependency_cb() only drops a dependency when the
> fence context is one of the entity's own (fence_context or
> fence_context + 1). A chain node never matches, so a wait on a point
> whose inner fence is the finished fence of an earlier job on the same
> exec queue is treated like a cross-queue dependency: the job is held
> until the previous job has completed on the GPU. Every job queued
> behind it waits too, and the ring drains before the next batch of jobs
> is released.
> 
> Unwrap the fence with dma_fence_unwrap_for_each() and add each
> unsignaled underlying fence as a dependency, so drm_sched sees the real
> fence contexts and ignores same-entity fences. Dependencies on other
> exec queues still wait for completion. drm_sched_job_add_dependency()
> keeps only the latest fence per context, so the dependency array does
> not grow with the length of the chain.
> 
> Signed-off-by: Chen, Junjia <junjia.chen@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Question for the Mesa team - would you like this backported? If so, I
can add a fixes when I merge this. 

> ---
> v2:
> - Do not return from inside dma_fence_unwrap_for_each(). The iterator
>   holds a reference on the current chain node that is only dropped when
>   the walk reaches the end, so returning early when
>   drm_sched_job_add_dependency() failed leaked it. Keep iterating and
>   skip the remaining fences once an error has been seen, as
>   pvr_sync_add_dep_to_job() does, since there is no
>   dma_fence_unwrap_stop() helper. Reported by the Sashiko AI review.
> - No other changes.
> 
> v1: https://lore.kernel.org/intel-xe/20261026020721.973291-1-junjia.chen@intel.com/
> 
>  drivers/gpu/drm/xe/xe_sync.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 06b1c913588a..766ec96c9df1 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -6,6 +6,7 @@
>  #include "xe_sync.h"
>  
>  #include <linux/dma-fence-array.h>
> +#include <linux/dma-fence-unwrap.h>
>  #include <linux/kthread.h>
>  #include <linux/sched/mm.h>
>  #include <linux/uaccess.h>
> @@ -233,11 +234,35 @@ ALLOW_ERROR_INJECTION(xe_sync_entry_parse, ERRNO);
>  
>  int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
>  {
> -	if (sync->fence)
> -		return  drm_sched_job_add_dependency(&job->drm,
> -						     dma_fence_get(sync->fence));
> +	struct dma_fence_unwrap iter;
> +	struct dma_fence *fence;
> +	int err = 0;
>  
> -	return 0;
> +	if (!sync->fence)
> +		return 0;
> +
> +	/*
> +	 * Unwrap fence containers (e.g. dma_fence_chain from a timeline
> +	 * syncobj) so the scheduler sees the underlying fences. That lets it
> +	 * drop dependencies on jobs from the same entity and only wait for
> +	 * jobs on the same scheduler to be scheduled, rather than waiting for
> +	 * the container, which forces a full GPU completion wait and drains
> +	 * the queue.
> +	 */
> +	dma_fence_unwrap_for_each(fence, &iter, sync->fence) {
> +		/*
> +		 * There is no dma_fence_unwrap_stop() helper to drop the
> +		 * reference the iterator holds, so keep iterating without
> +		 * doing anything once an error has occurred.
> +		 */
> +		if (err || dma_fence_is_signaled(fence))
> +			continue;
> +
> +		err = drm_sched_job_add_dependency(&job->drm,
> +						   dma_fence_get(fence));
> +	}
> +
> +	return err;
>  }
>  
>  /**
> -- 
> 2.51.0
> 
