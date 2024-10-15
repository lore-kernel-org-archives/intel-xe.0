Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD069D2169D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 15:21:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A92E10E598;
	Tue, 15 Oct 2024 15:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mbInu9Kp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FA110E598
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 15:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729005666; x=1760541666;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FpZrQaz+4SXXU/p89WZ0iwsEyZ1ecXUAfgD6ELNmERs=;
 b=mbInu9Kp84P0kqiR5XTfyORPoCgMJUD8XM6FdurWTPqj3iJo1yKfwH6H
 JZ07yoh1KESGRY7drjKDqFhFrDm4tWCKksneoQ4vrwnyal9cE3lbQtnC3
 xZvDWL7dihuCH6aY+ZtgEqe736BPrcL1+OC5rvx4KwV6brqZUT3U0bUsn
 GkcYxD3KgS7Ed4MwkJtzyze6heMQggd82KA2j3JZr+dEcfBzPII/8Uaeo
 bzOQba9d2ArWmr5C+xHSYWWFBKKarsc9w/crXVm41mw1R2gxLBP9Wo73D
 kHFUYvz3jdQQd4wswtCGSfX0zKvdmYMLcPtsOqzbVFW2nJ5XBW1jNIzVV w==;
X-CSE-ConnectionGUID: cPll3enfTA+ZeBaqZYjNtA==
X-CSE-MsgGUID: 3yMTAe2WTMaRnyg1HuzyUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28198531"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28198531"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:21:06 -0700
X-CSE-ConnectionGUID: 4C3f1ziVTfezglDZsIBiYA==
X-CSE-MsgGUID: VYJVDxFYTraA2zc0mMsL+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="77549755"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.177.104])
 ([10.245.177.104])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:21:03 -0700
Message-ID: <b7aad862-4415-4a91-9d30-dc70194e4c6f@linux.intel.com>
Date: Tue, 15 Oct 2024 17:21:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 17/26] drm/xe/huc: Update handling of xe_force_wake_get
 return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-18-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014075601.2324382-18-himal.prasad.ghimiray@intel.com>
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
> - return unsigned int from xe_force_wake_get()
>
> v7
> - Fix commit message
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_huc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> index 77c5830309cf..6a846e4cb221 100644
> --- a/drivers/gpu/drm/xe/xe_huc.c
> +++ b/drivers/gpu/drm/xe/xe_huc.c
> @@ -296,19 +296,19 @@ void xe_huc_sanitize(struct xe_huc *huc)
>  void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
>  {
>  	struct xe_gt *gt = huc_to_gt(huc);
> -	int err;
> +	unsigned int fw_ref;
>  
>  	xe_uc_fw_print(&huc->fw, p);
>  
>  	if (!xe_uc_fw_is_enabled(&huc->fw))
>  		return;
>  
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
>  		return;
>  
>  	drm_printf(p, "\nHuC status: 0x%08x\n",
>  		   xe_mmio_read32(&gt->mmio, HUC_KERNEL_LOAD_INFO));
>  
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  }
