Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F16CDB47E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 10:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED8510E4A3;
	Thu, 12 Oct 2023 10:24:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5221910E4A2
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 10:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697106242; x=1728642242;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=phdqgaAHMIegfD6YVwNlU+/K6ulPy2pK/OmLJX0/cDU=;
 b=hE/NGRVWgpDyngqm+8SH3J3vTTYkToqr4oy36l0gZIvwgJCArRaAfIGf
 CzUXF7vGw+osJvvXJFrpnuVODdvg9Zpc+xCXa5Fc/n2PRvIThyPaPAo62
 89uypsT381y8O3jvg5L2HZoC25hYBJL7LU6PglaWZRBKVVIEiL1xF+WCG
 iAI+Jul9q4Nwdxl6RRySK8fwbul7th2f3MR7kBOObE/LwIdUCE0Xxbnvj
 WoiScvie9+BG8E4aJsXDhi/ZCTQcQ5NNavWbcBWCFErvYDH49il8tjbT6
 yzIdoJgrLy0MdNmQlSvs36MsA/zLCmISWZFXeH2o4f9ICsfuG2PceUoHJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451373383"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="451373383"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 03:24:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="757968214"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="757968214"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga007.fm.intel.com with ESMTP; 12 Oct 2023 03:23:59 -0700
Received: from [10.249.135.71] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.135.71])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 073172877A;
 Thu, 12 Oct 2023 11:23:58 +0100 (IST)
Message-ID: <0ad719c2-7308-43b7-a856-7553934eec6a@intel.com>
Date: Thu, 12 Oct 2023 12:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
References: <20231012063209.56824-1-riana.tauro@intel.com>
 <20231012063209.56824-2-riana.tauro@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231012063209.56824-2-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe: Add helper functions to
 toggle CT communication
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 12.10.2023 08:32, Riana Tauro wrote:
> During Runtime suspend/resume, GuC is reloaded for both
> D3hot/D3Cold-> D0 transistions. It is not necessary for GuC to be
> loaded everytime for D3hot->D0, only enable/disable ctb communication.
> 
> Add helper functions to toggle CT communication. Modify existing
> guc communication function

s/guc/GuC
s/ctb/CTB

typo transistions

> 
> v2: do not register/unregister ctb, toggle the enabled variable
>     instead.
>     enable irqs while toggling CT (Daniele)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c    | 36 ++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_guc.h    |  3 ++-
>  drivers/gpu/drm/xe/xe_guc_ct.c | 15 ++++++++++++--
>  drivers/gpu/drm/xe/xe_guc_ct.h |  1 +
>  drivers/gpu/drm/xe/xe_uc.c     |  2 +-
>  5 files changed, 49 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 84f0b5488783..40c7bf0c50c5 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -507,7 +507,7 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_enable_communication(guc);
> +	ret = xe_guc_enable_communication(guc, true);
>  	if (ret)
>  		return ret;
>  
> @@ -560,16 +560,31 @@ static void guc_enable_irq(struct xe_guc *guc)
>  	xe_mmio_rmw32(gt, GUC_SG_INTR_MASK, events, 0);
>  }
>  
> -int xe_guc_enable_communication(struct xe_guc *guc)
> +/**
> + * xe_guc_enable_communication - Enable GuC communication
> + * @guc: The GuC object
> + * @ctb_register: boolean to indicate if ctb registration needs to be done
> + *		  or toggling of the value.
> + *
> + * This function enables guc interrupts, toggles or registers CT communication
> + * and handles mmio messages.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_guc_enable_communication(struct xe_guc *guc, bool ctb_register)

I'm not super happy with the naming here...
maybe there should be separate functions like:

	xe_guc_enable_communication(guc)  { ct_enable(); irq(on) }
	xe_guc_suspend_communication(guc) { irq(off); ct_toggle(off) }
	xe_guc_resume_communication(guc)  { ct_toggle(on); irq(on) }
	xe_guc_disable_communication(guc) { irq(off); ct_disable() }

>  {
> -	int err;
> +	int err = 0;
>  
>  	guc_enable_irq(guc);
>  
>  	xe_mmio_rmw32(guc_to_gt(guc), PMINTRMSK,
>  		      ARAT_EXPIRED_INTRMSK, 0);
>  
> -	err = xe_guc_ct_enable(&guc->ct);
> +	if (ctb_register)
> +		err = xe_guc_ct_enable(&guc->ct);
> +	else
> +		xe_guc_ct_toggle(&guc->ct, true);
> +
>  	if (err)
>  		return err;
>  
> @@ -578,6 +593,19 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>  	return 0;
>  }
>  
> +/**
> + * xe_guc_disable_communication - disables GuC communication
> + * @guc: The GuC object
> + *
> + * This function disables CT communication

maybe: "This function disables all communication channels with the GuC."

> + */
> +void xe_guc_disable_communication(struct xe_guc *guc)
> +{
> +	xe_guc_ct_toggle(&guc->ct, false);
> +
> +	guc_handle_mmio_msg(guc);

do we need to handle that here?

note that if we just toggle CTB flag in the driver, GuC will still
believe that CTB is available and will send any G2H over CTB, not MMIO

> +}
> +
>  int xe_guc_suspend(struct xe_guc *guc)
>  {
>  	int ret;
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 3addd8fc674a..71dac0673e61 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -18,7 +18,8 @@ int xe_guc_post_load_init(struct xe_guc *guc);
>  int xe_guc_reset(struct xe_guc *guc);
>  int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> -int xe_guc_enable_communication(struct xe_guc *guc);
> +void xe_guc_disable_communication(struct xe_guc *guc);
> +int xe_guc_enable_communication(struct xe_guc *guc, bool ctb_register);
>  int xe_guc_suspend(struct xe_guc *guc);
>  void xe_guc_notify(struct xe_guc *guc);
>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 8b686c8b3339..ff89a1a09f1f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -319,14 +319,25 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	return err;
>  }
>  
> -void xe_guc_ct_disable(struct xe_guc_ct *ct)
> +/**
> + * xe_guc_ct_toggle - Toggle GuC CT
> + * @ct: GuC CT
> + * @toggle: 0-disable, 1-enable

maybe this should be named just as @enable ?

> + *
> + * This function enables or disables CT communication

to be precise this function just toggles a flag whether CTB is enabled
(aka ready for use by other layers) but does not enable it with the GuC

> + */
> +void xe_guc_ct_toggle(struct xe_guc_ct *ct, bool toggle)
>  {
>  	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
>  	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
> -	ct->enabled = false; /* Finally disable CT communication */
> +	ct->enabled = toggle; /* Toggle CT communication */
>  	spin_unlock_irq(&ct->fast_lock);
>  	mutex_unlock(&ct->lock);
> +}
>  
> +void xe_guc_ct_disable(struct xe_guc_ct *ct)
> +{
> +	xe_guc_ct_toggle(ct, false);
>  	xa_destroy(&ct->fence_lookup);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index f15f8a4857e0..11166a7ce958 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -14,6 +14,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct);
>  int xe_guc_ct_enable(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> +void xe_guc_ct_toggle(struct xe_guc_ct *ct, bool toggle);
>  
>  struct xe_guc_ct_snapshot *
>  xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 784f53c5f282..bf75c39d929d 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -148,7 +148,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_enable_communication(&uc->guc);
> +	ret = xe_guc_enable_communication(&uc->guc, true);
>  	if (ret)
>  		return ret;
>  
