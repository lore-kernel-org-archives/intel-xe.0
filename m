Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F12ECDB465
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 08:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E70710E1DB;
	Thu, 19 Oct 2023 08:24:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCA510E1DB
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 08:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697703848; x=1729239848;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=09c4JeeFH7mRakH8HkJUEWDnrtc9L5rMVg5s1ijDpAI=;
 b=Xq0n83fxKIrMccvjz4MggeV1ani6UuJQ080tt0lTF3r5wr6y8oRLYT56
 TlBI10ftBTeaIG704lUj84ER7DT9W1eGXAz/4UA8YdnoVOIwv38+KYLLe
 2wnCSNKI24dHlewA82BGY6FnJ8LnEX7DUDjW2v2WBIn41BFC1y34doyAo
 XDnw/yWUiK9hxd/769AvGRkWb0VpE/ZrYnJeejedeQ/L3AZtPs06ZRwnh
 8iVtFf7LG8Vf4jdDRGG46xZunxfHYhq1xb+dXrXWFfrW5vVeN/LY8ySgj
 51Pu5oHY8Tzt7bjeAeXt/pewMiCbzoPCgdIPid/V4524P1FWITVuqPTm0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="376574588"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="376574588"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 01:24:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="873384125"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="873384125"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 01:24:06 -0700
Message-ID: <d2f85565-7a73-a841-27c1-f137e68ac0b6@linux.intel.com>
Date: Thu, 19 Oct 2023 13:56:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231018040033.1227494-1-himal.prasad.ghimiray@intel.com>
 <20231018040033.1227494-11-himal.prasad.ghimiray@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20231018040033.1227494-11-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v4 10/10] drm/xe: Clear all SoC errors post
 warm reset.
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


On 18/10/23 09:30, Himal Prasad Ghimiray wrote:
> There are scenarios where there are errors being reported from the SoC
> uncore to IEH and not propagated to SG unit. Since these errors are not
> propagated to SG unit, driver won't be able to clean them as part of
> xe_process_hw_error. Hence clear all SoC register post xe_process_hw_error
> during the driver load.
>
> v2
> - Fix commit message.
>
> v3
> - Limit check to PVC.
>
> v4
> - Fix check
>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_error.c | 40 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_error.h |  1 +
>  drivers/gpu/drm/xe/xe_irq.c      |  1 +
>  3 files changed, 42 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 5700f708425f..381bd7180b80 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -519,6 +519,46 @@ xe_gt_hw_error_log_vector_reg(struct xe_gt *gt, const enum hardware_error hw_err
>  	}
>  }
>  
> +void xe_clear_all_soc_errors(struct xe_device *xe)
> +{
> +	enum hardware_error hw_err;
> +	u32 base, slave_base;
> +	struct xe_tile *tile;
> +	struct xe_gt *gt;
> +	unsigned int i;
> +
> +	if (xe->info.platform != XE_PVC)
> +		return;
> +
> +	base = SOC_PVC_BASE;
> +	slave_base = SOC_PVC_SLAVE_BASE;
> +
> +	hw_err = HARDWARE_ERROR_CORRECTABLE;
nit: can be assigned when it is defined.
> +
> +	for_each_tile(tile, xe, i) {
> +		gt = tile->primary_gt;
> +
> +		while (hw_err < HARDWARE_ERROR_MAX) {
> +			for (i = 0; i < XE_SOC_NUM_IEH; i++)
> +				xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
> +						~REG_BIT(hw_err));
> +
> +			xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
> +					REG_GENMASK(31, 0));
> +			xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err),
> +					REG_GENMASK(31, 0));
> +			xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
> +					REG_GENMASK(31, 0));
> +			xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
> +					REG_GENMASK(31, 0));
> +			hw_err++;
> +		}
> +		for (i = 0; i < XE_SOC_NUM_IEH; i++)
> +			xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
> +					(HARDWARE_ERROR_MAX << 1) + 1);
> +	}
> +}
> +
>  static void
>  xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
> index 59b331f52783..f27c166455da 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.h
> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> @@ -206,4 +206,5 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
>  void xe_assign_hw_err_regs(struct xe_device *xe);
>  void xe_process_hw_errors(struct xe_device *xe);
>  void xe_gsc_hw_error_work(struct work_struct *work);
> +void xe_clear_all_soc_errors(struct xe_device *xe);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index bc0f01a2abc1..93cb948de516 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -626,6 +626,7 @@ int xe_irq_install(struct xe_device *xe)
>  
>  	xe_assign_hw_err_regs(xe);
>  	xe_process_hw_errors(xe);
> +	xe_clear_all_soc_errors(xe);
>  
>  	xe_irq_reset(xe);

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

Thanks,
Aravind.
>  
