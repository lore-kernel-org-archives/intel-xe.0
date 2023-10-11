Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7B6CD98F3
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 06:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32B110E46E;
	Wed, 11 Oct 2023 06:53:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700A710E471
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 06:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697007207; x=1728543207;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=DSO6DkiLqXSvVHZptGrSeOKcTxXDHRrn2vOOss9odX8=;
 b=Tc62JZ/9gE6cDZbYvkVoESSjGzl0mZkzQ0FnFEHYiNTzZqKuLtQo7ozs
 FR4YrLtLKJsZA/9po+4KRc7Y7z+b0e+XtevVwoslSmkBGsE0rXZEdt5kL
 LxGgqoshCsa2eWoHeXugF9+fRA1jb4o5+s38KQE5SxofZqWf8EDgdCxyy
 +KGrtwQ37q5zxKIEVP7YuLygyO7ci4Hx0Z4o9AVz3WDyZqyg8EjIOAhA9
 0wAtr9D0M53W3Kel9IsADpukL7NuKBHMySmSbVY9dQ2y6Zu+LUbYC2h04
 ibLAy+7dL1WVL+xPxkGzolyiocsI+KalQErPmb7wBLR9PBwzyxZy5fLjR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="388464901"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="388464901"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 23:53:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="1000997441"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="1000997441"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 23:53:25 -0700
Message-ID: <afffc88e-6c18-75b7-a968-67574573fe9b@linux.intel.com>
Date: Wed, 11 Oct 2023 12:26:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
 <20230927114627.136925-12-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20230927114627.136925-12-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 11/11] drm/xe: Clear all SoC errors post warm
 reset.
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


On 27/09/23 17:16, Himal Prasad Ghimiray wrote:
> There are scenarios where there are no fatal errors reported
> but Non-fatal/correctable errors being reported from the SoC
> uncore to IEH and not propogated to SG unit. Clear all previous
> SoC errors post warm reset.

the commit msg is not very clear, how fatal error reporting is related to other errors.

Thanks,
Aravind.
>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_error.c | 37 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_error.h |  1 +
>  drivers/gpu/drm/xe/xe_irq.c      |  1 +
>  3 files changed, 39 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 0bcb1bea7ffb..a777c887a7be 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -366,6 +366,43 @@ static void xe_assign_hw_err_regs(struct xe_device *xe)
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
> +	base = SOC_PVC_BASE;
> +	slave_base = SOC_PVC_SLAVE_BASE;
> +
> +	hw_err = HARDWARE_ERROR_CORRECTABLE;
> +
> +	for_each_tile(tile, xe, i) {
> +		gt = tile->primary_gt;
> +
> +		while (hw_err < HARDWARE_ERROR_MAX) {
> +			for (i = 0; i < PVC_NUM_IEH; i++)
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
> +		for (i = 0; i < PVC_NUM_IEH; i++)
> +			xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
> +					(HARDWARE_ERROR_MAX << 1) + 1);
> +	}
> +}
> +
>  static void
>  xe_gt_hw_error_status_reg_handler(struct xe_gt *gt, const enum hardware_error hw_err)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
> index a458a90b34a2..7ada7c97c939 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.h
> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> @@ -219,4 +219,5 @@ struct xe_tile;
>  void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
>  void xe_process_hw_errors(struct xe_device *xe);
>  void xe_gsc_hw_error_work(struct work_struct *work);
> +void xe_clear_all_soc_errors(struct xe_device *xe);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 285c657cc789..42a6bb45acba 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -597,6 +597,7 @@ int xe_irq_install(struct xe_device *xe)
>  	}
>  
>  	xe_process_hw_errors(xe);
> +	xe_clear_all_soc_errors(xe);
>  
>  	xe->irq.enabled = true;
>  
