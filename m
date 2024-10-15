Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD00D216A9
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 13:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17DC10E297;
	Tue, 15 Oct 2024 13:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQTeKaRw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA46110E297
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 13:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729000640; x=1760536640;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lzb4jzYlh/HwgbOSX+zYJVVfgdBpQpsb+EhqsiTWxYs=;
 b=nQTeKaRwqoVhVFcqCSnipPTQyVi3/50ySvo4JNp40hW1ZPK+4PytJbvG
 RmVYQmW2AjrSEbP7GMDVhXzeB/R7Mv8PsSPeAmMwTRbLrRtcyHZ+azftP
 zbXsgR4QeJSi0qh+Av01lpkbuxu4W50FA3i8yTAB5otZMAHac7ZXRuI2m
 T+NafTnbTwTHcBkxIRzWqJOqRWcJ53Ag3BO6qd9dCBG+YRMmLP+Uq00HA
 3uDLS9XP1C1oQkoOlyRCrIO/tUwsB9krs7FbRHYsbtcKYLMxweiZjnj5/
 ILoZ5VZNKZOvysVvow23mVxsN7BTTC9ZnudxjCx+xvxkaA+QKNrMMjFrI g==;
X-CSE-ConnectionGUID: jSSb0bFRRnS8c7xSEbJpWQ==
X-CSE-MsgGUID: TV/a+14oSlunzP/+DZvp3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="45895688"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="45895688"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 06:57:19 -0700
X-CSE-ConnectionGUID: zT6QKEQrQn2ZT2pCRfo6Hg==
X-CSE-MsgGUID: G4RoTA9tS7qYJ7vegq/QRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="78261782"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.177.104])
 ([10.245.177.104])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 06:57:05 -0700
Message-ID: <b85714ba-5c13-40ad-beff-338061b8879c@linux.intel.com>
Date: Tue, 15 Oct 2024 15:57:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 08/26] drm/xe/gsc: Update handling of xe_force_wake_get
 return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-9-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014075601.2324382-9-himal.prasad.ghimiray@intel.com>
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


On 10/14/2024 9:55 AM, Himal Prasad Ghimiray wrote:
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Update the return handling of xe_force_wake_get()
> to reflect this behavior, and ensure that the return value is passed as
> input to xe_force_wake_put().
>
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
>
> v5
> - return unsigned int for xe_force_wake_get()
> - No need to WARN from caller in case of forcewake get failure.
>
> v7
> - Fix commit message
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gsc.c       | 23 +++++++++++------------
>  drivers/gpu/drm/xe/xe_gsc_proxy.c |  9 ++++-----
>  2 files changed, 15 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 783b09bf3681..1eb791ddc375 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -261,19 +261,17 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
>  {
>  	struct xe_gt *gt = gsc_to_gt(gsc);
>  	struct xe_tile *tile = gt_to_tile(gt);
> +	unsigned int fw_ref;
>  	int ret;
>  
>  	if (XE_WA(tile->primary_gt, 14018094691)) {
> -		ret = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
> +		fw_ref = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
>  
>  		/*
>  		 * If the forcewake fails we want to keep going, because the worst
>  		 * case outcome in failing to apply the WA is that PXP won't work,
> -		 * which is not fatal. We still throw a warning so the issue is
> -		 * seen if it happens.
> +		 * which is not fatal. Forcewake get warns implicitly in case of failure
>  		 */
> -		xe_gt_WARN_ON(tile->primary_gt, ret);
> -
>  		xe_gt_mcr_multicast_write(tile->primary_gt,
>  					  EU_SYSTOLIC_LIC_THROTTLE_CTL_WITH_LOCK,
>  					  EU_SYSTOLIC_LIC_THROTTLE_CTL_LOCK_BIT);
> @@ -282,7 +280,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
>  	ret = gsc_upload(gsc);
>  
>  	if (XE_WA(tile->primary_gt, 14018094691))
> -		xe_force_wake_put(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
> +		xe_force_wake_put(gt_to_fw(tile->primary_gt), fw_ref);
>  
>  	if (ret)
>  		return ret;
> @@ -352,6 +350,7 @@ static void gsc_work(struct work_struct *work)
>  	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
>  	struct xe_gt *gt = gsc_to_gt(gsc);
>  	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int fw_ref;
>  	u32 actions;
>  	int ret;
>  
> @@ -361,7 +360,7 @@ static void gsc_work(struct work_struct *work)
>  	spin_unlock_irq(&gsc->lock);
>  
>  	xe_pm_runtime_get(xe);
> -	xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC));
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
>  
>  	if (actions & GSC_ACTION_ER_COMPLETE) {
>  		ret = gsc_er_complete(gt);
> @@ -381,7 +380,7 @@ static void gsc_work(struct work_struct *work)
>  		xe_gsc_proxy_request_handler(gsc);
>  
>  out:
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	xe_pm_runtime_put(xe);
>  }
>  
> @@ -601,7 +600,7 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
>  {
>  	struct xe_gt *gt = gsc_to_gt(gsc);
>  	struct xe_mmio *mmio = &gt->mmio;
> -	int err;
> +	unsigned int fw_ref;
>  
>  	xe_uc_fw_print(&gsc->fw, p);
>  
> @@ -610,8 +609,8 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
>  	if (!xe_uc_fw_is_enabled(&gsc->fw))
>  		return;
>  
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> +	if (!fw_ref)
>  		return;
>  
>  	drm_printf(p, "\nHECI1 FWSTS: 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x\n",
> @@ -622,5 +621,5 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
>  			xe_mmio_read32(mmio, HECI_FWSTS5(MTL_GSC_HECI1_BASE)),
>  			xe_mmio_read32(mmio, HECI_FWSTS6(MTL_GSC_HECI1_BASE)));
>  
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> index 6d89c22ae811..fc64b45d324b 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> @@ -450,22 +450,21 @@ void xe_gsc_proxy_remove(struct xe_gsc *gsc)
>  {
>  	struct xe_gt *gt = gsc_to_gt(gsc);
>  	struct xe_device *xe = gt_to_xe(gt);
> -	int err = 0;
> +	unsigned int fw_ref = 0;

nit: harmless init but not really needed

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

>  
>  	if (!gsc->proxy.component_added)
>  		return;
>  
>  	/* disable HECI2 IRQs */
>  	xe_pm_runtime_get(xe);
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> +	if (!fw_ref)
>  		xe_gt_err(gt, "failed to get forcewake to disable GSC interrupts\n");
>  
>  	/* try do disable irq even if forcewake failed */
>  	gsc_proxy_irq_toggle(gsc, false);
>  
> -	if (!err)
> -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	xe_pm_runtime_put(xe);
>  
>  	xe_gsc_wait_for_worker_completion(gsc);
