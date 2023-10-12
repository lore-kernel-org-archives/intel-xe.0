Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53740CDB47E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 09:48:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EA010E483;
	Thu, 12 Oct 2023 09:48:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8F810E481
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 09:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697104101; x=1728640101;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=PC5iu0Jt1Te73PXm4H04X8QIbuzSOY+EZ000pNejgns=;
 b=NxZDSdvzEAvUVCMLzo0yF3iiL8VWE72Kv7EBqodJcInzfi7KxfDNBxTJ
 mI7V39lQWH++45FmbHZJ74Om4qfIDLm0bNQsGD3dY5B6YcAzswpVhGs4H
 3Lbbj+t/4wGcKv3shUU+couCT5YpAiaFRd08V01LESHMX2WJp6LQztAqK
 L41ar4dS77ILKbMO6gTe9JMTV5B0bZhhrQryiFkaynpeXMCV5znzZkB3H
 tSVyp5n2JGCgxw1uJjINyfuBGWko8v13IB2oU2etG2qEDoJzKXgfmzhD9
 lzYcgavizjmWG6AqgtNFCS/DXEeJJ++6TnRTaK1/rmbTc5BVX4qdHm8PQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="369946995"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="369946995"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 02:48:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1001491256"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="1001491256"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 02:48:17 -0700
Received: from [10.249.135.71] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.135.71])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0D03C332B5;
 Thu, 12 Oct 2023 10:48:16 +0100 (IST)
Message-ID: <4809fe8a-7c75-aa4f-8a7b-21e0dcfa437c@intel.com>
Date: Thu, 12 Oct 2023 11:48:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
References: <20230823050955.1226024-1-riana.tauro@intel.com>
 <20230823050955.1226024-3-riana.tauro@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230823050955.1226024-3-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 2/2] RFC drm/xe: Disable GuC CT communication
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 23.08.2023 07:09, Riana Tauro wrote:
> During Runtime suspend, GuC is reset for both D0->D3hot/D3Cold
> transistions. It is not necessary for GuC to reset for D0 -> D3hot,

typo

> only enable/disable ctb communication.

s/ctb/CTB

> 
> Add a function that enables/disables CT communication when d3cold
> is not allowed.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 56 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h |  2 ++
>  drivers/gpu/drm/xe/xe_pm.c | 10 +++++--
>  drivers/gpu/drm/xe/xe_uc.c | 18 ++++++++++++
>  drivers/gpu/drm/xe/xe_uc.h |  2 ++
>  5 files changed, 85 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 13320af4ddd3..0d52621ce64d 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -676,6 +676,62 @@ int xe_gt_resume(struct xe_gt *gt)
>  	return err;
>  }
>  
> +int xe_gt_runtime_suspend(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	if (xe->d3cold.allowed)
> +		return xe_gt_suspend(gt);
> +
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		return err;

unlike other error conditions, this will exit silently
is this by design ?

> +
> +	err = xe_uc_disable_communication(&gt->uc);
> +	if (err)
> +		goto err_force_wake;
> +
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));

aren't we deprecating XE_WARN() ?

what's our strategy for handling such fw_put() errors ?
maybe notice() messages inside fw_put() are sufficient ?

> +	xe_gt_info(gt, "suspended\n");
> +
> +	return 0;
> +
> +err_force_wake:
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
> +
> +	return err;
> +}
> +
> +int xe_gt_runtime_resume(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	if (xe->d3cold.allowed)
> +		return xe_gt_resume(gt);
> +
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		return err;

as above

> +
> +	err = xe_uc_resume(&gt->uc);
> +	if (err)
> +		goto err_force_wake;
> +
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +	xe_gt_info(gt, "resumed\n");
> +
> +	return 0;
> +
> +err_force_wake:
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
> +
> +	return err;
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
> index 0f06d8304e17..6bc01bb45fc2 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -245,7 +245,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	}
>  
>  	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> +		err = xe_gt_runtime_suspend(gt);
>  		if (err)
>  			goto out;
>  	}
> @@ -294,14 +294,18 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  
>  	xe_irq_resume(xe);
>  
> -	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_runtime_resume(gt);
> +		if (err)
> +			goto out;
> +	}
>  
>  	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>  		err = xe_bo_restore_user(xe);
>  		if (err)
>  			goto out;
>  	}
> +
>  out:
>  	lock_map_release(&xe_device_mem_access_lockdep_map);
>  	xe_pm_write_callback_task(xe, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index addd6f2681b9..b5b53c8c3edb 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -216,6 +216,15 @@ static void uc_reset_wait(struct xe_uc *uc)
>  		goto again;
>  }
>  
> +int xe_uc_disable_communication(struct xe_uc *uc)
> +{
> +	/* GuC submission not enabled, nothing to do */
> +	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))

nit: do we need to go to xe_device level function for this?
also, isn't GuC submission a POR for all platforms on xe.ko?

> +		return 0;
> +
> +	return xe_guc_disable_communication(&uc->guc);
> +}
> +
>  int xe_uc_suspend(struct xe_uc *uc)
>  {
>  	int ret;
> @@ -232,3 +241,12 @@ int xe_uc_suspend(struct xe_uc *uc)
>  
>  	return xe_guc_suspend(&uc->guc);
>  }
> +
> +int xe_uc_resume(struct xe_uc *uc)
> +{
> +	/* GuC submission not enabled, nothing to do */
> +	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
> +		return 0;
> +
> +	return xe_guc_enable_communication(&uc->guc);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 42219b361df5..29bd692d8800 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -12,8 +12,10 @@ int xe_uc_init(struct xe_uc *uc);
>  int xe_uc_init_hwconfig(struct xe_uc *uc);
>  int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>  int xe_uc_init_hw(struct xe_uc *uc);
> +int xe_uc_disable_communication(struct xe_uc *uc);
>  void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
> +int xe_uc_resume(struct xe_uc *uc);
>  void xe_uc_stop_prepare(struct xe_uc *uc);
>  int xe_uc_stop(struct xe_uc *uc);
>  int xe_uc_start(struct xe_uc *uc);
