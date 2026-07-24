Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B17CC531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 11:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DDB10E046;
	Fri, 24 Jul 2026 11:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDqSpJX1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F67D10F37D
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 11:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784893784; x=1816429784;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=G3R9l9+mOE91PqjAqEUZkOEGflti3vwaMDbehENfZ2E=;
 b=DDqSpJX1tzwc7St8p9bSHr3s/+5QTjbN2VTtjD6Rc7sB8tt4mmMOAtbV
 zmI02JsEh+9+wo6RcVWPhuATRwzVLXJUbyKxwTqNbhtc1RhiOLVGyeqIr
 J1xEfWc2fG4JN0qj9y6Cr/E6bDKMRiaB/m21T1CW/H1JCNnYIahGwQm62
 w5bc48gJ+5qymPRFPKPeWaXCGw/enj/SCTEmWZqciYx7JBVjHwJGBA/ce
 P2b9BGKdrdMvemP9FmBI3gyTzzifEdlFViDDrk3rMuaeT7JrHYNF9FvbW
 2zktQhSx7t/7EQKnX6p/Knu/V9wMg6/sOJD4bJjPHQKiBRwOioNO6Prox Q==;
X-CSE-ConnectionGUID: /47UIvZtRF+WpmepGWitKA==
X-CSE-MsgGUID: U8d8CUoITR2Ekm4qCPr0Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85751300"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="85751300"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 04:49:44 -0700
X-CSE-ConnectionGUID: 51BS97v8RkWqI2qhUmN3sg==
X-CSE-MsgGUID: n1VC8cfkQSu/Axmx/hmrWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="252360121"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.191.14])
 ([10.247.191.14])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 04:49:41 -0700
Message-ID: <91c76e0f-073c-416c-969e-5cf81c0a330c@linux.intel.com>
Date: Fri, 24 Jul 2026 17:19:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/19] drm/xe/log: Extend components list with hardware
 items
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Yoni Levitt <yoni.levitt@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
 <20260723203754.3782-11-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20260723203754.3782-11-michal.wajdeczko@intel.com>
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


On 24-07-2026 02:07, Michal Wajdeczko wrote:
> Update our super macro with new top level hardware components.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/xe_log_abi.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> index cde86c6c08f2..edf4dc13377d 100644
> --- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
> +++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
> @@ -124,6 +124,10 @@ enum xe_log_location_bits {
>   *     @SIGID is the default xe_sigid for the component (without the XE_SIGID_ prefix)
>   */
>  #define DEFINE_XE_LOG_COMPONENTS(define) \
> +	DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
> +	DEFINE_XE_LOG_HARDWARE_COMPONENTS(define)
> +
> +#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
>  	/* */									\
>  	define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")			\
>  	define(SYSTEM, 2, DRM, SW, "DRM")					\
> @@ -151,6 +155,13 @@ enum xe_log_location_bits {
>  	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
>  	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
>  	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
> +
> +#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
> +	define(HARDWARE, 1, PCIE, PCIE, "PCIe Interface")			\
> +	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
> +	define(HARDWARE, 3, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
> +	define(HARDWARE, 4, FABRIC, FABRIC, "Fabric")				\
> +	define(HARDWARE, 5, SOC, SOC_INTERNAL, "SoC Internal")			\
>  	/* eod */
>  

For HW errors FW already reports the components, we already have
definition of component "enum xe_ras_component" that matches how FW
reports the errors we shall reuse it not redefine again.

Thanks,
Aravind.
>  /**
