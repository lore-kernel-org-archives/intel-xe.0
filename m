Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045B5CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 10:44:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9814710E03E;
	Thu, 12 Oct 2023 10:44:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744FA10E03E
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 10:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697107484; x=1728643484;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AMuA7kVliGYVrm4IUjykuNX94Cx+aCPg4k/z55GH80Q=;
 b=UeZrZU1l9HkUOBF0HaVBngSx4Xb0uxHtsiNvOmQlfYQ4x+QeAOj9Ki9g
 MmvwkuLh0xveA0cOuLD+tpsfLNWr3V21uOXhB+EvrQGd2cSxQX6yWbVks
 2uqfjARp9oM4PHJHzzRMfv+BxoDIaBKyBsNf0ofpcNEobAIBpPgiMS9tl
 GBeFgWTI81kSbVnIrMgAKM4udUWKu7SXbGkTiSUPnc2/MXgbqjrDkgcIa
 e4ZeUiGjgB7dgrwsx9wAm5OVtybTTS5Ae9T4RVwekMGzZYFNiEohoQ3Rf
 WdcxWDfn7E4ViYM4ez6PAeWtxk1OtS/7pcmQpn0APQ5nvI1G2bm1nE8vK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451376633"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="451376633"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 03:44:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="747839428"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="747839428"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga007.jf.intel.com with ESMTP; 12 Oct 2023 03:44:41 -0700
Received: from [10.249.135.71] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.135.71])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C1C86332CB;
 Thu, 12 Oct 2023 11:44:40 +0100 (IST)
Message-ID: <7375cb31-7e13-89a8-665e-a38b9286c6d6@intel.com>
Date: Thu, 12 Oct 2023 12:44:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
References: <20231012063209.56824-1-riana.tauro@intel.com>
 <20231012063209.56824-3-riana.tauro@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231012063209.56824-3-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Toggle GuC CT communication
 for D3Hot Transition
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
> Add a function that toggles CT communication when d3cold
> is not allowed.
> 
> v2: simplify code (Bala)
>     handle pmu suspend in runtime suspend (Rodrigo)
>     change function names
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 62 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h |  2 ++
>  drivers/gpu/drm/xe/xe_pm.c |  4 +--
>  drivers/gpu/drm/xe/xe_uc.c | 21 +++++++++++++
>  drivers/gpu/drm/xe/xe_uc.h |  2 +-
>  5 files changed, 88 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index c63e2e4750b1..2c507d67291b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -709,6 +709,68 @@ int xe_gt_resume(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/**
> + * xe_gt_runtime_suspend - Helper for GT related Runtime PM suspend actions
> + * @xe: xe gt instance
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_gt_runtime_suspend(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int ret = 0;
> +
> +	if (xe->d3cold.allowed)
> +		return xe_gt_suspend(gt);
> +
> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (ret)
> +		return ret;

silent exit, without err() message, is it ok?

> +
> +	xe_pmu_suspend(gt);
> +
> +	ret = xe_uc_toggle_communication(&gt->uc, false);
> +
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));

isn't XE_WARN_ON deprecated ?

> +
> +	if (ret)
> +		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(ret));
> +	else
> +		xe_gt_info(gt, "suspended\n");
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_gt_runtime_resume - Helper for GT related Runtime PM resume actions
> + * @xe: xe gt instance
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_gt_runtime_resume(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int ret = 0;
> +
> +	if (xe->d3cold.allowed)
> +		return xe_gt_resume(gt);
> +
> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (ret)
> +		return ret;

ditto

> +
> +	ret = xe_uc_toggle_communication(&gt->uc, true);
> +
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));

ditto

> +
> +	if (ret)
> +		xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(ret));
> +	else
> +		xe_gt_info(gt, "resumed\n");
> +
> +	return ret;
> +}
> +
>  struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>  				     enum xe_engine_class class,
>  				     u16 instance, bool logical)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index caded203a8a0..e6574e51004f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -37,6 +37,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
>  void xe_gt_suspend_prepare(struct xe_gt *gt);
>  int xe_gt_suspend(struct xe_gt *gt);
>  int xe_gt_resume(struct xe_gt *gt);
> +int xe_gt_runtime_suspend(struct xe_gt *gt);
> +int xe_gt_runtime_resume(struct xe_gt *gt);
>  void xe_gt_reset_async(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index e31a91cf311c..1cd46ab804fe 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -254,7 +254,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	}
>  
>  	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> +		err = xe_gt_runtime_suspend(gt);
>  		if (err)
>  			goto out;
>  	}
> @@ -304,7 +304,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	xe_irq_resume(xe);
>  
>  	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +		xe_gt_runtime_resume(gt);
>  
>  	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>  		err = xe_bo_restore_user(xe);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index bf75c39d929d..62a5fa6e5362 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -225,6 +225,27 @@ static void uc_reset_wait(struct xe_uc *uc)
>  		goto again;
>  }
>  
> +/**
> + * xe_uc_toggle_communication - enable or disable uc communication
> + * @uc: The UC object

s/uc/uC
s/UC/uC

best if we can link that to some `uC`_ documentation (I hope there is
some already, right ?)

> + * @toggle: 0-disable, 1-enable

maybe @enable

also for bool we use true/false, not 1/0

> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_uc_toggle_communication(struct xe_uc *uc, bool toggle)

there seems to be some inconsistency in the naming:

level:	function:	next:

uc	toggle_communication -> guc_enable(false) | guc_disable()
guc	enable|disable_communication -> ct_enable(reg) | ct_toggle(off)
guc_ct	enable|disable|toggle -> ct_control_toggle(on) | ct_toggle(off)

> +{
> +	/* GuC submission not enabled, nothing to do */
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return 0;
> +
> +	if (toggle)
> +		return xe_guc_enable_communication(&uc->guc, false);
> +
> +	xe_guc_disable_communication(&uc->guc);
> +
> +	return 0;
> +}
> +
>  int xe_uc_suspend(struct xe_uc *uc)
>  {
>  	int ret;
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 4109ae7028af..69d7dff0900e 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -20,5 +20,5 @@ int xe_uc_stop(struct xe_uc *uc);
>  int xe_uc_start(struct xe_uc *uc);
>  int xe_uc_suspend(struct xe_uc *uc);
>  void xe_uc_sanitize(struct xe_uc *uc);
> -
> +int xe_uc_toggle_communication(struct xe_uc *uc, bool toggle);

please keep empty separation line

>  #endif
