Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E10606A88B
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 15:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=njXnPQ3b
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B5C10EC3D;
	Fri, 13 Nov 2026 15:20:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB8310EC3D
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 15:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794583216; x=1826119216;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HNUWa3fneXCTKRor+g2LbVkSqNvDulUBD2h6P3MHO2I=;
 b=njXnPQ3byXAbbGb//F1tmTEU5IdP+AbxPSL504N9RozxIomLl9F39eca
 Q1UrAp0DrPKoO4UcmIhTYCuo2pR0liH3bNn2TWzVurO7ZZaxXo+iv1VAK
 GLOMarnSYuR/KE7VyIdbulKWPMmlam8GtY+6y4WJEvDc+cs2ajN0QbWTU
 Rnlu/9Tbrpj6SeXB88VnBs0cNPHxUjuogcEtS5KfzEcZyuHJYwzu11JkP
 6oLlis6CgCAfeEI9vqui9jxcpBiUr0oji0QAu+VRJ7KIp1z+dJx75hNT0
 YesHYSbnl64irdO26gksZR4FX+jb8tTkbk3zbtKCWAkaQXxPblN5acIp5 g==;
X-CSE-ConnectionGUID: GyFmPPuaQa+QQl4igX5pmg==
X-CSE-MsgGUID: 3jxPaa/ZQ52kWAgNznSzxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3426574"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3426574"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 07:20:15 -0800
X-CSE-ConnectionGUID: 74+oLjNmSGiITNTbhqpGOA==
X-CSE-MsgGUID: J9yrfHUHRpy5xd9ve8mJmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8855235"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 07:20:14 -0800
Date: Fri, 13 Nov 2026 16:20:11 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 matthew.brost@intel.com, arvind.yadav@intel.com
Subject: Re: [PATCH] drm/xe: fix UAF race between exec-queue teardown and GuC
 CT pause-abort
Message-ID: <avcqq9J7MHnVKlWv@black.igk.intel.com>
References: <20261113132149.2989667-2-tejas.upadhyay@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113132149.2989667-2-tejas.upadhyay@intel.com>
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

On Fri, Nov 13, 2026 at 06:51:50PM +0530, Tejas Upadhyay wrote:
> xe_guc_submit_pause_abort() walks guc->submission_state.exec_queue_lookup
> and unconditionally calls guc_exec_queue_kill() on every entry found,
> without verifying the queue hasn't already begun/finished its own
> independent teardown. guc_exec_queue_fini() (run once a queue's own
> refcount drops to zero via the normal close path) only erases its xarray
> entry partway through its body, via release_guc_id() -- so there is a
> window where a queue's refcount is already 0 but its xarray entry is
> still present.
> 
> This was caught as a debug assertion firing on both BMG and CRI:
> 
> 	xe 0000:00:03.0: [drm] Assertion `kref_read(&q->refcount)` failed!
> 	WARNING: drivers/gpu/drm/xe/xe_guc_submit.c:2242 at guc_exec_queue_kill+0x2e2/0x360 [xe]
> 	Call Trace:
> 	 guc_exec_queue_kill+0x2e2/0x360 [xe]
> 	 xe_guc_submit_pause_abort+0x8e/0xf0 [xe]
> 	 guc_submit_fini+0x11f/0x180 [xe]
> 	 devm_action_release+0x15/0x30
> 	 ...
> 	 device_release_driver_internal+0x230/0x270
> 	 unbind_store+0xac/0xc0                          [BMG: igt@xe_configfs, sysfs unbind]
> 	 pci_iov_remove_virtfn+0xd1/0x140
> 	 sriov_disable+0x42/0x100
> 	 pci_disable_sriov+0x23/0x40
> 	 xe_pci_sriov_configure+0x2b9/0x1350 [xe]
> 	 sriov_numvfs_store+0x136/0x1f0           [CRI: igt@xe_pmu, SR-IOV VF disable]
> 
> Pin the queue with kref_get_unless_zero() before touching it, skipping entries
> that have already independently reached a zero refcount instead of operating on
> an object that's already being torn down elsewhere.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index d76f125f9c3a..7a3bd698f217 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3306,12 +3306,18 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
>  	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>  		struct xe_gpu_scheduler *sched = &q->guc->sched;
>  
> -		/* Prevent redundant attempts to stop parallel queues */
> -		if (q->guc->id != index)
> +		/*
> +		 * Prevent redundant attempts to stop parallel queues, and skip
> +		 * queues already dropped to a zero refcount via their own
> +		 * independent teardown (guc_exec_queue_fini(), xarray entry
> +		 * not yet erased)
> +		 */
> +		if (q->guc->id != index || !kref_get_unless_zero(&q->refcount))
>  			continue;
>  
>  		xe_sched_submission_start(sched);
>  		guc_exec_queue_kill(q);
> +		xe_exec_queue_put(q);

Please make sure this doesn't regress FLR flow, where we need to keep
the exec queues around to reinit them later.

Raag

>  	}
>  	mutex_unlock(&guc->submission_state.lock);
>  }
> -- 
> 2.52.0
> 
