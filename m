Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19416D216A3
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 13:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE23210E588;
	Tue, 15 Oct 2024 13:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nf3G5AMu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC57E10E588
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 13:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728998935; x=1760534935;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7niVj8Hjz0eGF2znqyDQ7AJ/wmpJQEPWtHVWRNoBmnY=;
 b=Nf3G5AMugTqlQKsQ3FrQ+gdzPDYclwWbMH97ncX2szMnx/ctQ9nCbvpW
 kg/WTU7DA5jXGKsECXwdMX1XdC+W/W2OO2Umofxc9DIJnRQVmyugvY/41
 lo2Gp2U16HuSLXQUMzQOpBS5Uj/fVXwETIhrMualNCLcWAZomSLgGkU2G
 Ytjgt/fDuOk5FawlYDqN/JhoxIEdD/lfPXbteqHBptV3mGgi1WP/tUmSa
 ZycWoovALIBHREapOU3MkH6hAv+WisdnmQY6gmZc28Ut171MO7X7tfM1p
 /pr8gMQbNu59eKIe/QmLIfiH92Pp34mq/DJY27G9+Vycb9b3ofHWh7x9H w==;
X-CSE-ConnectionGUID: 45FakWZERvWqlgqfAfVDyQ==
X-CSE-MsgGUID: SspHWJAASxSfXZ/MKjV2Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28480865"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28480865"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 06:28:53 -0700
X-CSE-ConnectionGUID: SdRX1ieUTVWyIbWqn+tipA==
X-CSE-MsgGUID: +Us/66NASdKFQksxfdLT9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="77853153"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.166.105])
 ([10.245.166.105])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 06:28:51 -0700
Message-ID: <0359989d-6e62-4175-ae72-541a44c1047f@linux.intel.com>
Date: Tue, 15 Oct 2024 15:28:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/26] drm/xe/device: Update handling of
 xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-7-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014075601.2324382-7-himal.prasad.ghimiray@intel.com>
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
> - xe_force_wake_put() error doesn't need to be escalated/considered as
> probing error. It internally WARNS on domain ack failure.
>
> v5
> - return unsigned int xe_force_wake_get()
>
> v7
> - Fix commit message(Badal)
>
> v9
> - s/uint/unsigned int (Nikula)
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 962751c966d1..16b10bbccc6b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -604,8 +604,8 @@ int xe_device_probe_early(struct xe_device *xe)
>  static int probe_has_flat_ccs(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
> +	unsigned int fw_ref;
>  	u32 reg;
> -	int err;
>  
>  	/* Always enabled/disabled, no runtime check to do */
>  	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
> @@ -613,9 +613,9 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>  
>  	gt = xe_root_mmio_gt(xe);
>  
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		return err;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return -ETIMEDOUT;
>  
>  	reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
>  	xe->info.has_flat_ccs = (reg & XE2_FLAT_CCS_ENABLE);
> @@ -624,7 +624,8 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>  		drm_dbg(&xe->drm,
>  			"Flat CCS has been disabled in bios, May lead to performance impact");
>  
> -	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return 0;
>  }
>  
>  int xe_device_probe(struct xe_device *xe)
> @@ -875,6 +876,7 @@ void xe_device_wmb(struct xe_device *xe)
>  void xe_device_td_flush(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
> +	unsigned int fw_ref;
>  	u8 id;
>  
>  	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
> @@ -889,7 +891,8 @@ void xe_device_td_flush(struct xe_device *xe)
>  		if (xe_gt_is_media_type(gt))
>  			continue;
>  
> -		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
> +		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		if (!fw_ref)
>  			return;
>  
>  		xe_mmio_write32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST);
> @@ -904,22 +907,22 @@ void xe_device_td_flush(struct xe_device *xe)
>  				   150, NULL, false))
>  			xe_gt_err_once(gt, "TD flush timeout\n");
>  
> -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	}
>  }
>  
>  void xe_device_l2_flush(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
> -	int err;
> +	unsigned int fw_ref;
>  
>  	gt = xe_root_mmio_gt(xe);
>  
>  	if (!XE_WA(gt, 16023588340))
>  		return;
>  
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
>  		return;
>  
>  	spin_lock(&gt->global_invl_lock);
> @@ -929,7 +932,7 @@ void xe_device_l2_flush(struct xe_device *xe)
>  		xe_gt_err_once(gt, "Global invalidation timeout\n");
>  	spin_unlock(&gt->global_invl_lock);
>  
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  }
>  
>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
