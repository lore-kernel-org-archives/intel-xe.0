Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60D6C47DAF
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 22:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653B510E1BF;
	Thu, 18 Jan 2024 22:22:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB40010E1BF
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 22:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705616534; x=1737152534;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=goDH5v/ilRBM5whIyA629M4jZc+NRSgec9x5Fl++B8Q=;
 b=dBJI+8H5QYI1qBtr5dEv5f5sxEKHxBfAkmfGzUafiQ8xiPBmbBrtVTqu
 ee/ng4mZOgm9k7mhpdKZqhqyBg8y4KHwxAO/8Jm3ob9TzO1UiGhpXprYK
 0OtjH6db7aoechGvOol5XeqvycKMf1CT5AIbhel1lnO7yUmNrCpDjI1/P
 Bk8NDu9ybwYi0/MR9uAkZ780pHt88KOr2PLewykJ5f+0SucmIuSDIofra
 DhnEhtaC/z9bSdcBntK99xjRvRfmqo2ivHen9Ix42mo7Z72MjR8x1gy7R
 oZ/6gQ8nDTs1X+BSpxR2FB5MD6JmlH14zdiE/UeIHddk9fAArusx5R/nE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="13949669"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="13949669"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 14:22:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="734389602"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="734389602"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga003.jf.intel.com with ESMTP; 18 Jan 2024 14:22:13 -0800
Received: from [10.246.50.177] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.50.177])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id BA6A136C0C;
 Thu, 18 Jan 2024 22:22:09 +0000 (GMT)
Message-ID: <eac30fee-2c78-4366-bba9-8e66688c60d6@intel.com>
Date: Thu, 18 Jan 2024 23:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/xe/guc: Add more GuC CT states
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com
References: <20240118192442.1480073-1-matthew.brost@intel.com>
 <20240118192442.1480073-2-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240118192442.1480073-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 18.01.2024 20:24, Matthew Brost wrote:
> The Guc CT has more than enabled / disables states rather it has 4. The
> 4 states are not initialized, disabled, stopped, and enabled. Change the
> code to reflect this. These states will enable proper return codes from
> functions and therefore enable proper error messages.
> 
> v2:
> - s/XE_GUC_CT_STATE_DROP_MESSAGES/XE_GUC_CT_STATE_STOPPED (Michal)
> - Add assert for CT being initialized (Michal)
> - Fix kernel for CT state enum (Michal)
> 
> v3:
> - Kernel doc (Michal)
> - s/reiecved/received (Michal)
> - assert CT state not initialized in xe_guc_ct_init (Michal)
> - add argument xe_guc_ct_set_state to clear g2h (Michal)
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c          |  4 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c       | 79 ++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_guc_ct.h       |  8 ++-
>  drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 ++++++-
>  4 files changed, 87 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 2891b0cc4f7f..c2a85117f3bf 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -687,7 +687,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  
>  	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
>  
> -	xe_assert(xe, !guc->ct.enabled);
> +	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
>  	xe_assert(xe, len);
>  	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
>  	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
> @@ -873,7 +873,7 @@ int xe_guc_stop(struct xe_guc *guc)
>  {
>  	int ret;
>  
> -	xe_guc_ct_disable(&guc->ct);
> +	xe_guc_ct_stop(&guc->ct);
>  
>  	ret = xe_guc_submit_stop(guc);
>  	if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index b2cc3f993eb6..41e9320914e9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -164,6 +164,8 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	if (err)
>  		return err;
>  
> +	xe_assert(xe, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
> +	ct->state = XE_GUC_CT_STATE_DISABLED;
>  	return 0;
>  }
>  
> @@ -283,12 +285,34 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
>  	return ret > 0 ? -EPROTO : ret;
>  }
>  
> +static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
> +				enum xe_guc_ct_state state,
> +				bool clear_g2h_outstanding)
> +{
> +	struct xe_device *xe = ct_to_xe(ct);
> +
> +	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
> +	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
> +
> +	if (clear_g2h_outstanding) {
> +		ct->g2h_outstanding = 0;
> +		xa_destroy(&ct->fence_lookup);
> +	} else {
> +		xe_assert(xe, ct->g2h_outstanding == 0);
> +	}

since it looks that now you always expect no outstanding g2h after any
state change, and that explicit clear is needed only when stopping, then
maybe we can drop this extra param and just always do:

	xe_gt_assert(ct_to_gt(ct),
		ct->g2h_outstanding == 0 ||
		state == XE_GUC_CT_STATE_STOPPED);

	ct->g2h_outstanding = 0;
	xa_destroy(&ct->fence_lookup);

everything else LGTM

> +
> +	ct->state = state;
> +
> +	spin_unlock_irq(&ct->fast_lock);
> +	mutex_unlock(&ct->lock);
> +}
> +
>  int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	int err;
>  
> -	xe_assert(xe, !ct->enabled);
> +	xe_assert(xe, !xe_guc_ct_enabled(ct));
>  
>  	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
>  	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> @@ -305,12 +329,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	if (err)
>  		goto err_out;
>  
> -	mutex_lock(&ct->lock);
> -	spin_lock_irq(&ct->fast_lock);
> -	ct->g2h_outstanding = 0;
> -	ct->enabled = true;
> -	spin_unlock_irq(&ct->fast_lock);
> -	mutex_unlock(&ct->lock);
> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED, false);
>  
>  	smp_mb();
>  	wake_up_all(&ct->wq);
> @@ -324,15 +343,26 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	return err;
>  }
>  
> +/**
> + * xe_guc_ct_disable - Set GuC to disabled state
> + * @ct: the &xe_guc_ct
> + *
> + * Set GuC CT to disabled state, no outstanding g2h expected in this transition
> + */
>  void xe_guc_ct_disable(struct xe_guc_ct *ct)
>  {
> -	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
> -	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
> -	ct->enabled = false; /* Finally disable CT communication */
> -	spin_unlock_irq(&ct->fast_lock);
> -	mutex_unlock(&ct->lock);
> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED, false);
> +}
>  
> -	xa_destroy(&ct->fence_lookup);
> +/**
> + * xe_guc_ct_stop - Set GuC to stopped state
> + * @ct: the &xe_guc_ct
> + *
> + * Set GuC CT to stopped state and clear any outstanding g2h
> + */
> +void xe_guc_ct_stop(struct xe_guc_ct *ct)
> +{
> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED, true);
>  }
>  
>  static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
> @@ -507,6 +537,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  	u16 seqno;
>  	int ret;
>  
> +	xe_assert(xe, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
>  	xe_assert(xe, !g2h_len || !g2h_fence);
>  	xe_assert(xe, !num_g2h || !g2h_fence);
>  	xe_assert(xe, !g2h_len || num_g2h);
> @@ -518,11 +549,18 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  		goto out;
>  	}
>  
> -	if (unlikely(!ct->enabled)) {
> +	if (ct->state == XE_GUC_CT_STATE_DISABLED) {
>  		ret = -ENODEV;
>  		goto out;
>  	}
>  
> +	if (ct->state == XE_GUC_CT_STATE_STOPPED) {
> +		ret = -ECANCELED;
> +		goto out;
> +	}
> +
> +	xe_assert(xe, xe_guc_ct_enabled(ct));
> +
>  	if (g2h_fence) {
>  		g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
>  		num_g2h = 1;
> @@ -710,7 +748,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
>  		return false;
>  
>  #define ct_alive(ct)	\
> -	(ct->enabled && !ct->ctbs.h2g.info.broken && !ct->ctbs.g2h.info.broken)
> +	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
> +	 !ct->ctbs.g2h.info.broken)
>  	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),  HZ * 5))
>  		return false;
>  #undef ct_alive
> @@ -1009,14 +1048,20 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  	u32 action;
>  	u32 *hxg;
>  
> +	xe_assert(xe, ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED);
>  	lockdep_assert_held(&ct->fast_lock);
>  
> -	if (!ct->enabled)
> +	if (ct->state == XE_GUC_CT_STATE_DISABLED)
>  		return -ENODEV;
>  
> +	if (ct->state == XE_GUC_CT_STATE_STOPPED)
> +		return -ECANCELED;
> +
>  	if (g2h->info.broken)
>  		return -EPIPE;
>  
> +	xe_assert(xe, xe_guc_ct_enabled(ct));
> +
>  	/* Calculate DW available to read */
>  	tail = desc_read(xe, g2h, tail);
>  	avail = tail - g2h->info.head;
> @@ -1318,7 +1363,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
>  		return NULL;
>  	}
>  
> -	if (ct->enabled) {
> +	if (xe_guc_ct_enabled(ct)) {
>  		snapshot->ct_enabled = true;
>  		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
>  		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 9ecb67db8ec4..5083e099064f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -13,6 +13,7 @@ struct drm_printer;
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
>  int xe_guc_ct_enable(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> +void xe_guc_ct_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
>  struct xe_guc_ct_snapshot *
> @@ -22,9 +23,14 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>  void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>  void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool atomic);
>  
> +static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
> +{
> +	return ct->state == XE_GUC_CT_STATE_ENABLED;
> +}
> +
>  static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>  {
> -	if (!ct->enabled)
> +	if (!xe_guc_ct_enabled(ct))
>  		return;
>  
>  	wake_up_all(&ct->wq);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index d814d4ee3fc6..b966506cae09 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -72,6 +72,20 @@ struct xe_guc_ct_snapshot {
>  	struct guc_ctb_snapshot h2g;
>  };
>  
> +/**
> + * enum xe_guc_ct_state - CT state
> + * @XE_GUC_CT_STATE_NOT_INITIALIZED: CT not initialized, messages not expected in this state
> + * @XE_GUC_CT_STATE_DISABLED: CT disabled, messages not expected in this state
> + * @XE_GUC_CT_STATE_STOPPED: CT stopped, drop messages without errors
> + * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / received in this state
> + */
> +enum xe_guc_ct_state {
> +	XE_GUC_CT_STATE_NOT_INITIALIZED = 0,
> +	XE_GUC_CT_STATE_DISABLED,
> +	XE_GUC_CT_STATE_STOPPED,
> +	XE_GUC_CT_STATE_ENABLED,
> +};
> +
>  /**
>   * struct xe_guc_ct - GuC command transport (CT) layer
>   *
> @@ -96,8 +110,8 @@ struct xe_guc_ct {
>  	u32 g2h_outstanding;
>  	/** @g2h_worker: worker to process G2H messages */
>  	struct work_struct g2h_worker;
> -	/** @enabled: CT enabled */
> -	bool enabled;
> +	/** @state: CT state */
> +	enum xe_guc_ct_state state;
>  	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
>  	u32 fence_seqno;
>  	/** @fence_lookup: G2H fence lookup */
