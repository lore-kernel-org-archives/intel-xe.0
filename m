Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575FFC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 16:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED6A10E144;
	Tue, 28 Nov 2023 16:28:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1599910E144
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 16:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701188920; x=1732724920;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=y5aDpaaaELqnLYfQxS+jd5ndKBoFYaU5tAjBw2c5WYg=;
 b=G7AXN3VxU+4FFlwh/50yuszVw0ZElp4I+Y/wS+EBXR3ERHMkVmj3zq/+
 eSWvVSjuiypmjzaOfJbiErvTnhKCkZAU5rRztyBg9Ihy5hxPRrCnTBonS
 RVvvyQb4GIdToxXaKz/itTtKwkwPf/EFhmiOXZpj0IeyEOwnkeTlzGqVY
 tOum4ZZAvtO5zshpiqC1VDdI0BMsvOigGjaWksXCaELqiopyuTV4VEbvA
 3bX+OrNrpE3aRiX75yI3YtEEXvIYpX0DHb3BsoFtyNV5FxM1e0yy92HFk
 09YD28+PWbTQA6VJRsKVCHGuENiJkcS2RdHdABPyXqk1kTbKxKINAZC8b A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="395774685"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="395774685"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 08:28:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="16660635"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 28 Nov 2023 08:28:29 -0800
Received: from [10.249.140.124] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.140.124])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 5820B34973;
 Tue, 28 Nov 2023 16:28:28 +0000 (GMT)
Message-ID: <2ef76845-9012-4e91-9473-808f867f163a@intel.com>
Date: Tue, 28 Nov 2023 17:28:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
References: <20231128151333.4068550-1-tejas.upadhyay@intel.com>
 <20231128151333.4068550-4-tejas.upadhyay@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231128151333.4068550-4-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH V3 3/3] drm/xe: Move device sysfs init out of
 xe_pm_init
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



On 28.11.2023 16:13, Tejas Upadhyay wrote:
> Device sysfs needs to happen right after device probe.

.. sysfs _setup_ needs ...

> Currently it is under xe_pm_init() which does not look
> correct now as we add more sysfs entries which are not
> specific to PM.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

can you send this patch separately from rest of UID changes ?
it doesn't seem to be connected to them

> ---
>  drivers/gpu/drm/xe/xe_device.c | 3 +++
>  drivers/gpu/drm/xe/xe_pm.c     | 5 +----
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b54635d512d6..c8b592acb5b2 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -18,6 +18,7 @@
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_debugfs.h"
> +#include "xe_device_sysfs.h"
>  #include "xe_display.h"
>  #include "xe_dma_buf.h"
>  #include "xe_drm_client.h"
> @@ -463,6 +464,8 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_hwmon_register(xe);
>  
> +	xe_device_sysfs_init(xe);

shouldn't we register generic xe sysfs little earlier?

OTOH it looks that today order is random:

	drm_dev_register(&xe->drm, 0);
	xe_display_register(xe);
	xe_debugfs_register(xe);
	xe_pmu_register(&xe->pmu);
	xe_hwmon_register(xe);

> +
>  	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index e31a91cf311c..32009da9bfeb 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -13,7 +13,6 @@
>  #include "xe_bo.h"
>  #include "xe_bo_evict.h"
>  #include "xe_device.h"
> -#include "xe_device_sysfs.h"
>  #include "xe_display.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> @@ -175,10 +174,8 @@ void xe_pm_init(struct xe_device *xe)
>  
>  	xe->d3cold.capable = xe_pm_pci_d3cold_capable(pdev);
>  
> -	if (xe->d3cold.capable) {
> -		xe_device_sysfs_init(xe);
> +	if (xe->d3cold.capable)
>  		xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
> -	}
>  
>  	xe_pm_runtime_init(xe);
>  }
