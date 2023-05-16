Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24034C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 20:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED55610E0E5;
	Tue, 16 May 2023 20:59:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF84310E0E5
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 20:59:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F06BA63F79;
 Tue, 16 May 2023 20:59:50 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 19013C4339B;
 Tue, 16 May 2023 20:59:48 +0000 (UTC)
Date: Tue, 16 May 2023 16:59:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZGPuwpv4tg03730V@rdvivi-mobl4>
References: <20230511092828.833211-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511092828.833211-1-jani.nikula@intel.com>
Subject: Re: [Intel-xe] [PATCH] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 11, 2023 at 12:28:28PM +0300, Jani Nikula wrote:
> The dsparb_lock may be coming back with [1] later, but adding it here is
> probably just a rebase leftover. Drop it.
> 
> [1] https://patchwork.freedesktop.org/patch/msgid/20230327161223.406573-1-rodrigo.vivi@intel.com

ouch...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_core.h | 3 ---
>  drivers/gpu/drm/i915/i915_driver.c                | 1 -
>  2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
> index 437f623337e3..e36f88a39b86 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
> @@ -264,9 +264,6 @@ struct intel_wm {
>  	 */
>  	struct mutex wm_mutex;
>  
> -	/* protects DSPARB registers on pre-g4x/vlv/chv */
> -	spinlock_t dsparb_lock;
> -
>  	bool ipc_enabled;
>  };
>  
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 5d302602793c..12ba7cf78b1e 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -215,7 +215,6 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>  	spin_lock_init(&dev_priv->irq_lock);
>  	spin_lock_init(&dev_priv->gpu_error.lock);
>  	spin_lock_init(&dev_priv->display.fb_tracking.lock);
> -	spin_lock_init(&dev_priv->display.wm.dsparb_lock);
>  	mutex_init(&dev_priv->display.backlight.lock);
>  
>  	mutex_init(&dev_priv->sb_lock);
> -- 
> 2.39.2
> 
