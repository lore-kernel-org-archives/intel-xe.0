Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221B2CDB465
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 14:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93EA10E4DD;
	Thu, 19 Oct 2023 14:11:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAB310E4DD
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 14:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697724703; x=1729260703;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=t8P9g8BVPVJ2M1sAh0zGXc6A1MSIwWNfIsRNbQ69ZCQ=;
 b=eo9DvVu47w5slDk9QQ6Rrkzc2Js45zjYa26cxCJ2UeJ5EuMQCME62Ghr
 cjTh1lDXroJiYKqi6TnE6WSlDFcWeFLLeS2kkr7bd08LAFdo3LeaQtt8Q
 TR0/n6zRuVx4b4HTdc4+lDYSh3iBBcKZII0deQzxWNgsc0+PrOOtOJZcW
 WDE1BwOCKhHkapAkBjrEwek1Yfwc7hRd07sHxFsFWX5GE2LuI+Ea2TPXS
 DeeHC0duA6V3zHP4oYCAw+0T/g8VjCjjdsqQ5bGKQq2eyzQDaq78w23CA
 wIbAhlf/PUuLY5lzVbaSYM65mKpEyhKROU8ftIKqyPAnf7a4o+zZV+kMy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="4865802"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="4865802"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 07:11:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="1088368571"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="1088368571"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 07:11:40 -0700
Message-ID: <66c3b9b2-1450-4fd6-b943-cea72f4d123e@linux.intel.com>
Date: Thu, 19 Oct 2023 19:44:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231019132534.1374903-1-himal.prasad.ghimiray@intel.com>
 <20231019132534.1374903-3-himal.prasad.ghimiray@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20231019132534.1374903-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v1 02/11] drm/xe: Add new helpers to log
 hardware errrors.
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


On 19/10/23 18:55, Himal Prasad Ghimiray wrote:
> Introducing xe_gt_log_hw_err and xe_gt_log_hw_err helper to
> report gt specific hardware errors.
>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_printk.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
> index 5991bcadd47e..10e5c4a23c34 100644
> --- a/drivers/gpu/drm/xe/xe_gt_printk.h
> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
> @@ -43,4 +43,11 @@
>  #define xe_gt_WARN_ON_ONCE(_gt, _condition) \
>  	xe_gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
>  
> +#define xe_gt_log_hw_err(gt, fmt, ...) \
use _gt, _fmt like how the other defines are there and (gt)->
> +	drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "GT%d reported " fmt, \
> +			    gt->info.id, ##__VA_ARGS__)
> +
> +#define xe_gt_log_hw_warn(gt, fmt, ...) \
> +	drm_warn(&gt_to_xe(gt)->drm, HW_ERR "GT%d detected " fmt, gt->info.id, ##__VA_ARGS__)

why the messages need to be different, both can be reported.

with the above addressed:

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

Thanks,
Aravind.
> +
>  #endif
