Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEC5C48295
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 12:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEBE10F695;
	Mon,  5 Feb 2024 12:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cBD6Pvd1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093AD10F695
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 12:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707135827; x=1738671827;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xpfbPMeHsB9qAqtvHb2rbLoS03enbYCcPoGe6NblRYs=;
 b=cBD6Pvd1tEHnsmXnGRUoJ0dEF+lLoBsGP7IJBW2a/Cq9I6fkz0k1R6t7
 HMKHcubm6kh8rpF5s2XILPqGHzy9Fwo2Xid0xzbaDGIr7E/5ntg9dGl67
 v1gZMR1vdvSPUEMimXphjihjri8bKgQ3enZsZkFEtvvgVb7vaJaDsvPKY
 QzCZBiHbq14iqQ9NrAhkQ/g3BB5HnDqVUZhtYIZXX2I73fPXXJnmguLUd
 kkWfn3sJQukZnH7haZktgXOpSL4lOgU8/4XcpOnKpm/HNNXDBm7Py0N0A
 bAxcalojVaYDpa3CDGQ3sR5UH3pd9OLOYvqwHeoOSc5JfAtCs4u1L59k/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="401502"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="401502"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 04:23:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="5346751"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 04:23:44 -0800
Message-ID: <1460e9d5-fb69-43a1-8be7-ae08152bb15b@intel.com>
Date: Mon, 5 Feb 2024 12:23:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 21/34] drm/xe: Convert GuC CT paths from mem_access to
 xe_pm_runtime
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-22-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-22-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 26/01/2024 20:30, Rodrigo Vivi wrote:
> For the G2H and TLB invalidation cases, the outer bounds
> protection of the pm_runtime are not going to work. So
> we need to have the inner side protections here.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c      |  3 ++
>   drivers/gpu/drm/xe/xe_guc_ct.c       | 79 +++++++++++++---------------
>   drivers/gpu/drm/xe/xe_guc_ct_types.h |  2 +
>   3 files changed, 41 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 8abdf3c17e1d..b3669eac23c9 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -64,6 +64,9 @@ static int info(struct seq_file *m, void *data)
>   			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
>   		drm_printf(&p, "gt%d engine_mask 0x%llx\n", id,
>   			   gt->info.engine_mask);
> +		drm_printf(&p, "gt%d g2h_outstanding %d g2h_pm_refs %d\n", id,
> +			   gt->uc.guc.ct.g2h_outstanding,
> +			   gt->uc.guc.ct.g2h_pm_refs);
>   	}
>   
>   	xe_pm_runtime_put(xe);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index f3d356383ced..139cfe733661 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -287,16 +287,49 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
>   	return ret > 0 ? -EPROTO : ret;
>   }
>   
> +static void guc_ct_g2h_outstanding_clear(struct xe_guc_ct *ct)
> +{
> +	int i;
> +
> +	for (i = 0; i < ct->g2h_pm_refs; i++)
> +		xe_pm_runtime_put(ct_to_xe(ct));
> +	ct->g2h_outstanding = 0;
> +	ct->g2h_pm_refs = 0;
> +}
> +
> +static void guc_ct_g2h_outstanding_dec(struct xe_guc_ct *ct)
> +{
> +	if (ct->g2h_pm_refs > 0)
> +		xe_pm_runtime_put(ct_to_xe(ct));
> +	ct->g2h_pm_refs--;
> +	ct->g2h_outstanding--;
> +}
> +
> +static void guc_ct_g2h_outstanding_add(struct xe_guc_ct *ct, int num_g2h)
> +{
> +	struct xe_device *xe = ct_to_xe(ct);
> +	int i;
> +
> +	for (i = 0; i < num_g2h; i++) {
> +		if (xe_pm_runtime_get_if_in_use(xe))
> +			ct->g2h_pm_refs++;
> +		else
> +			drm_err(&xe->drm, "Failed to grab RPM ref for outstanding g2h\n");
> +	}

I guess we could maybe drop the g2h_pm_refs, and rather just track 
single rpm ref for entire ct when g2h_outstanding 0 -> 1, and likewise 
drop the rpm ref when g2h_outstanding reaches zero?

> +	ct->g2h_outstanding += num_g2h;
> +}
> +
>   static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
>   				enum xe_guc_ct_state state)
>   {
>   	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
>   	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
>   
> +
>   	xe_gt_assert(ct_to_gt(ct), ct->g2h_outstanding == 0 ||
>   		     state == XE_GUC_CT_STATE_STOPPED);
>   
> -	ct->g2h_outstanding = 0;
> +	guc_ct_g2h_outstanding_clear(ct);
>   	ct->state = state;
>   
>   	spin_unlock_irq(&ct->fast_lock);
> @@ -428,7 +461,7 @@ static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
>   		lockdep_assert_held(&ct->fast_lock);
>   
>   		ct->ctbs.g2h.info.space -= g2h_len;
> -		ct->g2h_outstanding += num_g2h;
> +		guc_ct_g2h_outstanding_add(ct, num_g2h);
>   	}
>   }
>   
> @@ -439,7 +472,7 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>   		  ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
>   
>   	ct->ctbs.g2h.info.space += g2h_len;
> -	--ct->g2h_outstanding;
> +	guc_ct_g2h_outstanding_dec(ct);
>   }
>   
>   static void g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
> @@ -1199,14 +1232,8 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>    */
>   void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
>   {
> -	struct xe_device *xe = ct_to_xe(ct);
> -	bool ongoing;
>   	int len;
>   
> -	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
> -	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
> -		return;
> -
>   	spin_lock(&ct->fast_lock);
>   	do {
>   		len = g2h_read(ct, ct->fast_msg, true);
> @@ -1214,9 +1241,6 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
>   			g2h_fast_path(ct, ct->fast_msg, len);
>   	} while (len > 0);
>   	spin_unlock(&ct->fast_lock);
> -
> -	if (ongoing)
> -		xe_device_mem_access_put(xe);
>   }
>   
>   /* Returns less than zero on error, 0 on done, 1 on more available */
> @@ -1247,36 +1271,8 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
>   static void g2h_worker_func(struct work_struct *w)
>   {
>   	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, g2h_worker);
> -	bool ongoing;
>   	int ret;
>   
> -	/*
> -	 * Normal users must always hold mem_access.ref around CT calls. However
> -	 * during the runtime pm callbacks we rely on CT to talk to the GuC, but
> -	 * at this stage we can't rely on mem_access.ref and even the
> -	 * callback_task will be different than current.  For such cases we just
> -	 * need to ensure we always process the responses from any blocking
> -	 * ct_send requests or where we otherwise expect some response when
> -	 * initiated from those callbacks (which will need to wait for the below
> -	 * dequeue_one_g2h()).  The dequeue_one_g2h() will gracefully fail if
> -	 * the device has suspended to the point that the CT communication has
> -	 * been disabled.
> -	 *
> -	 * If we are inside the runtime pm callback, we can be the only task
> -	 * still issuing CT requests (since that requires having the
> -	 * mem_access.ref).  It seems like it might in theory be possible to
> -	 * receive unsolicited events from the GuC just as we are
> -	 * suspending-resuming, but those will currently anyway be lost when
> -	 * eventually exiting from suspend, hence no need to wake up the device
> -	 * here. If we ever need something stronger than get_if_ongoing() then
> -	 * we need to be careful with blocking the pm callbacks from getting CT
> -	 * responses, if the worker here is blocked on those callbacks
> -	 * completing, creating a deadlock.
> -	 */
> -	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
> -	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
> -		return;
> -
>   	do {
>   		mutex_lock(&ct->lock);
>   		ret = dequeue_one_g2h(ct);
> @@ -1290,9 +1286,6 @@ static void g2h_worker_func(struct work_struct *w)
>   			kick_reset(ct);
>   		}
>   	} while (ret == 1);
> -
> -	if (ongoing)
> -		xe_device_mem_access_put(ct_to_xe(ct));
>   }
>   
>   static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index d29144c9f20b..4220230e7be4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -108,6 +108,8 @@ struct xe_guc_ct {
>   	} ctbs;
>   	/** @g2h_outstanding: number of outstanding G2H */
>   	u32 g2h_outstanding;
> +	/** @g2h_pm_refs: number of pm_refs for pending G2H */
> +	u32 g2h_pm_refs;
>   	/** @g2h_worker: worker to process G2H messages */
>   	struct work_struct g2h_worker;
>   	/** @state: CT state */
