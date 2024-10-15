Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57058CFC27C
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 15:30:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E2B10E5A9;
	Tue, 15 Oct 2024 15:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fSDEojb6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F108410E5A9
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729006228; x=1760542228;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0shoDvll5MkgGCrXOgeEy9hmL4UaqeMZoCJuA+m6b+E=;
 b=fSDEojb6tcKM67gpgJufNXvAG56ZVVGjV1y75MuvwpE1Ut/WoJ31fgFM
 ABNmIjIFnVv/0ogS6JCrMcWVHmzEyZI487un6ulZhWX65Bqjj6zQ0t2Zb
 mDVnukPJRkdYFXcACaCOgT9MU00Sq70vFfWLFayZZAhuvLha3UWTEvh1c
 +sPg1z7g93WFjV813emNUXlUOSNfoT7hde+fEAeCxLtHFGI6yklQCToQZ
 MqLF89n5JTWd7J9v8wmxzd6wduCoD6LMm94TD2PyGJ8QvnJNNheKtfXJ/
 39eGmzL862YqKxFPNU/kc1Ync0TsjvjPt3UYy6CNtwfND2JxPa81Tyt8v A==;
X-CSE-ConnectionGUID: pnD0duOmSbKXQ7JG3DYCbw==
X-CSE-MsgGUID: PdGPl3rdSnqPbwY3k90Z6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28296933"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28296933"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:30:27 -0700
X-CSE-ConnectionGUID: jWiV8FCYT+iqeCvAuZH6lg==
X-CSE-MsgGUID: ns5s9GVDSw2bVp/mExOI+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="101263022"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.177.104])
 ([10.245.177.104])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:30:26 -0700
Message-ID: <ec1dc333-8630-48ba-b729-6c7d8736c354@linux.intel.com>
Date: Tue, 15 Oct 2024 17:30:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 21/26] drm/xe/xe_reg_sr: Update handling of
 xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-22-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014075601.2324382-22-himal.prasad.ghimiray@intel.com>
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
> With xe_force_wake_get() now returning the refcount-incremented
> domain mask, a non-zero return value in the case of XE_FORCEWAKE_ALL does
> not necessarily indicate success. Use xe_force_wake_ref_has_domain()
> to determine the status of the call.
>
> Modify the return handling of xe_force_wake_get() accordingly and
> pass the return value to xe_force_wake_put().
>
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> - xe_force_wake_put() error doesn't need to be checked. It internally
> WARNS on domain ack failure.
>
> v5
> - return unsigned int from xe_force_wake_get()
>
> v6
> - use helper xe_force_wake_ref_has_domain()
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 191cb4121acd..e1a0e27cda14 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -188,27 +188,27 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>  {
>  	struct xe_reg_sr_entry *entry;
>  	unsigned long reg;
> -	int err;
> +	unsigned int fw_ref;
>  
>  	if (xa_empty(&sr->xa))
>  		return;
>  
>  	xe_gt_dbg(gt, "Applying %s save-restore MMIOs\n", sr->name);
>  
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>  		goto err_force_wake;
>  
>  	xa_for_each(&sr->xa, reg, entry)
>  		apply_one_mmio(gt, entry);
>  
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	XE_WARN_ON(err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  
>  	return;
>  
>  err_force_wake:
> -	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
>  }
>  
>  void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> @@ -221,15 +221,15 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>  	u32 mmio_base = hwe->mmio_base;
>  	unsigned long reg;
>  	unsigned int slot = 0;
> -	int err;
> +	unsigned int fw_ref;
>  
>  	if (xa_empty(&sr->xa))
>  		return;
>  
>  	drm_dbg(&xe->drm, "Whitelisting %s registers\n", sr->name);
>  
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>  		goto err_force_wake;
>  
>  	p = drm_dbg_printer(&xe->drm, DRM_UT_DRIVER, NULL);
> @@ -254,13 +254,13 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>  		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
>  	}
>  
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	XE_WARN_ON(err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  
>  	return;
>  
>  err_force_wake:
> -	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	drm_err(&xe->drm, "Failed to apply, err=-ETIMEDOUT\n");
>  }
>  
>  /**
