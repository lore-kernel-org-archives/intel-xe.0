Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A16C001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 11:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C3710E464;
	Wed, 26 Jul 2023 11:39:00 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7021E10E464
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 11:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690371537; x=1721907537;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=x2OuvDgND8Jmc13fLn/dzgZ2G6b33QecV2nXQN4gY1g=;
 b=C4AV9DNw0vSRXbGRE1v3I0cvHPexbFzUtVa179lV0n9riJL6DwTexhkh
 h9HT/EhUdJ9ej+6bx0bDbVMsmU9ChZid3Ue+5FMcqQJs68ArEMFrU5C7E
 m7BMQC4h+eKp7qIXNPQPJquce924Os/tNKlC+FRe5ROe0jxsL6sABh9TH
 2ahmPIheiSqbyVYKdOjG4gTveCo3Mkc8G4QVMVZQhE0WmrjILZiEzWxR+
 +If+/8Jv/tvFs9UvxDZoOJb70HY+eAd/hCHxFA5ay1QvFvXX5U83fYU1G
 KGmMb8PESQCMe/ji095g9IBIeNYtmcDSnNdSqIh46zGtNPMwYz/m9iqpd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="454365657"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="454365657"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 04:38:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="840223367"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="840223367"
Received: from cmchugh-mobl.ger.corp.intel.com (HELO [10.252.31.174])
 ([10.252.31.174])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 04:38:55 -0700
Message-ID: <5041fe3d-2183-86fc-ce5a-db2537713eba@intel.com>
Date: Wed, 26 Jul 2023 12:38:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <2ed513ec-3a3f-1795-2761-ad1d39bb6a09@intel.com>
 <20230725201758.329342-1-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230725201758.329342-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix an invalid locking wait context
 bug
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

On 25/07/2023 21:17, Rodrigo Vivi wrote:
> We cannot have spin locks around xe_irq_reset, since it will
> call the intel_display_power_is_enabled() function, and
> that needs a mutex lock. Hence causing the undesired
> "[ BUG: Invalid wait context ]"
> 
> We cannot convert i915's power domain lock to spin lock
> due to the nested dependency of non-atomic context waits.
> 
> So, let's move the xe_irq_reset functions from the
> critical area, while still ensuring that we are protecting
> the irq.enabled and ensuring the right serialization
> in the irq handlers.
> 
> v2: On the first version, I had missed the fact that
> irq.enabled is checked on the xe/display glue layer,
> and that i915 display code is actually using the irq
> spin lock properly. So, this got changed to a version
> suggested by Matthew Auld, along with introducing
> the lockdep_assert_held at the display glue code.
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/display/ext/i915_irq.c |  1 +
>   drivers/gpu/drm/xe/xe_irq.c               | 32 ++++++++++++++++++-----
>   2 files changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
> index fbb0e99143f6..ac435f7f854b 100644
> --- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
> +++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
> @@ -107,6 +107,7 @@ void intel_display_irq_uninstall(struct drm_i915_private *dev_priv)
>   
>   bool intel_irqs_enabled(struct xe_device *xe)
>   {
> +	lockdep_assert_held(&xe->irq.lock);
>   	return xe->irq.enabled;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index eae190cb0969..d6b001f6a3c5 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -309,6 +309,13 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
>   	unsigned long intr_dw[2];
>   	u32 identity[32];
>   
> +	spin_lock_irq(&xe->irq.lock);
> +	if (!xe->irq.enabled) {
> +		spin_unlock_irq(&xe->irq.lock);
> +		return IRQ_NONE;
> +	}
> +	spin_unlock_irq(&xe->irq.lock);

I guess spin_lock() or spin_lock_irq_save() here and below, since this 
is inside hard irq?

> +
>   	master_ctl = xelp_intr_disable(xe);
>   	if (!master_ctl) {
>   		xelp_intr_enable(xe, false);
> @@ -371,6 +378,13 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>   
>   	/* TODO: This really shouldn't be copied+pasted */
>   
> +	spin_lock_irq(&xe->irq.lock);
> +	if (!xe->irq.enabled) {
> +		spin_unlock_irq(&xe->irq.lock);
> +		return IRQ_NONE;
> +	}
> +	spin_unlock_irq(&xe->irq.lock);
> +
>   	master_tile_ctl = dg1_intr_disable(xe);
>   	if (!master_tile_ctl) {
>   		dg1_intr_enable(xe, false);
> @@ -574,10 +588,14 @@ void xe_irq_shutdown(struct xe_device *xe)
>   
>   void xe_irq_suspend(struct xe_device *xe)
>   {
> +	int irq = to_pci_dev(xe->drm.dev)->irq;
> +
>   	spin_lock_irq(&xe->irq.lock);
> -	xe->irq.enabled = false;
> -	xe_irq_reset(xe);
> +	xe->irq.enabled = false; /* no new irqs */
>   	spin_unlock_irq(&xe->irq.lock);
> +
> +	synchronize_irq(irq); /* flush irqs */
> +	xe_irq_reset(xe); /* turn irqs off */
>   }
>   
>   void xe_irq_resume(struct xe_device *xe)
> @@ -585,13 +603,15 @@ void xe_irq_resume(struct xe_device *xe)
>   	struct xe_gt *gt;
>   	int id;
>   
> -	spin_lock_irq(&xe->irq.lock);
> +	/*
> +	 * lock not needed:
> +	 * 1. no irq will arrive before the postinstall
> +	 * 2. display is not yet resumed
> +	 */
>   	xe->irq.enabled = true;
>   	xe_irq_reset(xe);
> -	xe_irq_postinstall(xe);
> +	xe_irq_postinstall(xe); /* turn irqs on */
>   
>   	for_each_gt(gt, xe, id)
>   		xe_irq_enable_hwe(gt);
> -
> -	spin_unlock_irq(&xe->irq.lock);
>   }
