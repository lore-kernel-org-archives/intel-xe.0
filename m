Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A06C46CD4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Dec 2023 23:36:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9639110E0B1;
	Fri, 29 Dec 2023 23:36:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F7610E0B1
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Dec 2023 23:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703892996; x=1735428996;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Uj3qg9DlZWsDtJUA99nTUVi7vNxllT5OIsCRtC5qMi8=;
 b=Qk6NXTjVwD4GnTF9okQQVO+MC8mW5iii9tZu040PJLsd7016W8h/7G6l
 in8hzZqi8ggxgxbS9CesvYhuY4Hp+cqR6+hczNj/KQQKwCNTqYeX/9Ebw
 GolYy/f38/sUAPcJT/CWKkIIX6zfYdKvmq594z3R+d7UzeYhe4kqaz0pj
 6bv83m4l6/imTm2ARQoDrHhFvBny68DeuW6CB5lCsPOYRqXBGcy2ftT9R
 dRw/JJhyaUGhJd8HVPFN5tTPt1vwz5AjJG+OFEZnt7vLGkeX+COdBO57a
 JSRp72Vsqp9jKylSjFIZJNqeGx4r8sJpeCsZp9MVpfaPQu/wHl3sjDbeQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="3765028"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="3765028"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 15:36:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="27269775"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 29 Dec 2023 15:36:34 -0800
Received: from [10.249.132.76] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.132.76])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A430C33AE1;
 Fri, 29 Dec 2023 23:36:32 +0000 (GMT)
Message-ID: <6c1429e3-5b0d-4aa9-b244-354dc9b780ac@intel.com>
Date: Sat, 30 Dec 2023 00:36:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe/guc: Add more GuC CT states
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20231229043507.1002411-1-matthew.brost@intel.com>
 <20231229043507.1002411-2-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231229043507.1002411-2-matthew.brost@intel.com>
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



On 29.12.2023 05:35, Matthew Brost wrote:
> The Guc CT has more than enabled / disables states rather it has 4. The
> 4 states are not initialized, disabled, drop messages, and enabled.

"drop messages" sounds strange as state name, maybe "stopped" ?

> Change the code to reflect this. These states will enable proper return
> codes from functions and therefore enable proper error messages.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c          |  4 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c       | 55 ++++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_guc_ct.h       |  8 +++-
>  drivers/gpu/drm/xe/xe_guc_ct_types.h | 18 ++++++++-
>  4 files changed, 64 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 811e8b201270..088f7b01d761 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -651,7 +651,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  
>  	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
>  
> -	xe_assert(xe, !guc->ct.enabled);
> +	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
>  	xe_assert(xe, len);
>  	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
>  	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
> @@ -833,7 +833,7 @@ int xe_guc_stop(struct xe_guc *guc)
>  {
>  	int ret;
>  
> -	xe_guc_ct_disable(&guc->ct);
> +	xe_guc_ct_drop_messages(&guc->ct);
>  
>  	ret = xe_guc_submit_stop(guc);
>  	if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 4cde93c18a2d..8c91d189d859 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -279,12 +279,25 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
>  	return ret > 0 ? -EPROTO : ret;
>  }
>  
> +static void xe_guc_ct_set_state(struct xe_guc_ct *ct,

nit: for static functions this "xe_" prefix is not needed

> +				enum xe_guc_ct_state state)
> +{
> +	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
> +	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */

maybe instead of putting ad-hoc comments we should add bigger
documentation for lock/fast_lock usage and dependencies?

> +
> +	ct->g2h_outstanding = 0;
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
> @@ -301,12 +314,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	if (err)
>  		goto err_out;
>  
> -	mutex_lock(&ct->lock);
> -	spin_lock_irq(&ct->fast_lock);
> -	ct->g2h_outstanding = 0;
> -	ct->enabled = true;
> -	spin_unlock_irq(&ct->fast_lock);
> -	mutex_unlock(&ct->lock);
> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
>  
>  	smp_mb();
>  	wake_up_all(&ct->wq);
> @@ -322,12 +330,12 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  
>  void xe_guc_ct_disable(struct xe_guc_ct *ct)
>  {
> -	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
> -	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
> -	ct->enabled = false; /* Finally disable CT communication */
> -	spin_unlock_irq(&ct->fast_lock);
> -	mutex_unlock(&ct->lock);
> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
> +}
>  
> +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct)
> +{
> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DROP_MESSAGES);
>  	xa_destroy(&ct->fence_lookup);
>  }
>  
> @@ -514,11 +522,19 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  		goto out;
>  	}
>  
> -	if (unlikely(!ct->enabled)) {
> +	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
> +	    ct->state == XE_GUC_CT_STATE_DISABLED) {
>  		ret = -ENODEV;
>  		goto out;
>  	}
>  
> +	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES) {
> +		ret = -ECANCELED;
> +		goto out;
> +	}
> +
> +	xe_assert(xe, xe_guc_ct_enabled(ct));
> +
>  	if (g2h_fence) {
>  		g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
>  		num_g2h = 1;
> @@ -706,7 +722,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
>  		return false;
>  
>  #define ct_alive(ct)	\
> -	(ct->enabled && !ct->ctbs.h2g.info.broken && !ct->ctbs.g2h.info.broken)
> +	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
> +	 !ct->ctbs.g2h.info.broken)
>  	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct),  HZ * 5))
>  		return false;
>  #undef ct_alive
> @@ -987,12 +1004,18 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>  
>  	lockdep_assert_held(&ct->fast_lock);
>  
> -	if (!ct->enabled)
> +	if (ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED ||
> +	    ct->state == XE_GUC_CT_STATE_DISABLED)
>  		return -ENODEV;
>  
> +	if (ct->state == XE_GUC_CT_STATE_DROP_MESSAGES)
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
> @@ -1291,7 +1314,7 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct,
>  		return NULL;
>  	}
>  
> -	if (ct->enabled) {
> +	if (xe_guc_ct_enabled(ct)) {
>  		snapshot->ct_enabled = true;
>  		snapshot->g2h_outstanding = READ_ONCE(ct->g2h_outstanding);
>  		guc_ctb_snapshot_capture(xe, &ct->ctbs.h2g,
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index f15f8a4857e0..214a6a357519 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -13,6 +13,7 @@ struct drm_printer;
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
>  int xe_guc_ct_enable(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> +void xe_guc_ct_drop_messages(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
>  struct xe_guc_ct_snapshot *
> @@ -22,10 +23,15 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
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
>  	wake_up_all(&ct->wq);
> -	if (ct->enabled)
> +	if (xe_guc_ct_enabled(ct))
>  		queue_work(system_unbound_wq, &ct->g2h_worker);
>  	xe_guc_ct_fast_path(ct);

if we are not-enabled, shouldn't we treat all G2H messages in the same
way? why do we continue with fast_path here?

>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index d814d4ee3fc6..f74d38c8f9df 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -72,6 +72,20 @@ struct xe_guc_ct_snapshot {
>  	struct guc_ctb_snapshot h2g;
>  };
>  
> +/**
> + * enum xe_guc_ct_state - CT state
> + * @XE_GUC_CT_STATE_NOT_INITIALIZED: CT suspended, messages not expected in this state

"suspended" seems wrong.

IIUC this is a default implicit state where CT was not yet initialized,
not a state where CT was _temporary_ suspended.

> + * @XE_GUC_CT_STATE_DISABLED: CT disabled, messages not expected in this state
> + * @XE_GUC_CT_STATE_DROP_MESSAGES: CT drops messages without errors

maybe I'm missing something, but shouldn't we just stop processing any
incoming messages and reject sending new one in this state ?

"drops messages" suggests that we are reading G2H CTB *and* then
dropping them without proper processing

> + * @XE_GUC_CT_STATE_ENABLED: CT enabled, messages sent / recieved in this state

typo

> + */
> +enum xe_guc_ct_state {
> +	XE_GUC_CT_STATE_NOT_INITIALIZED = 0,

hmm, maybe we don't need this state at all, since CT initialization
failure is fatal and we will abort driver probe

maybe all we need is to explicitly set XE_GUC_CT_STATE_DISABLED(1) in
xe_guc_ct_init() and use xe_assert(ct.state) to catch missing
initialization ?

> +	XE_GUC_CT_STATE_DISABLED,
> +	XE_GUC_CT_STATE_DROP_MESSAGES,
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
