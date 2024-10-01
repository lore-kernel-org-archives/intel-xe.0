Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487CBCE7CF8
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 09:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBF710E00E;
	Tue,  1 Oct 2024 09:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNzPz0ud";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B384810E10B
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 09:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727774200; x=1759310200;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=+A5Aix1KbuRMEpDVO+Eaf/LjoD+U1Rsghy9GA9FIb0w=;
 b=BNzPz0ud1CBGk6/hvxU/mQySndXcR47j4M1ULp/CKzOtW5Sstl4PZQUi
 36T+lgtb1LqTXaSSwlEHIEEedwcJPaebZdV53SvBTR+zuAKFkwQ3sh17o
 uxD3P8h/ZMbD3L187EwSuHrXGl3WSlMWXH4KYc4PHJRcBmbrCabKA+XbM
 vXekxouLvGOG4Yvgmn4J4P+UwqrdqJuI4wza1TwJGV2EorbrVc401Akof
 Fdq+1aLz0tfHj3n/AKnjqV/ObuatnEJrItT2hmpjZFjdQ6eCCwJKThViX
 gTZU7jUxk/rSSgwX/kbvwNC7rc2aYOAhOkBgSyN8eEqo8e2xUjhiUj6sK A==;
X-CSE-ConnectionGUID: clz68968TlyqDdNXisd+2Q==
X-CSE-MsgGUID: 0GdJggjzTG+hSejcpIjSxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30691388"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="30691388"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 02:16:39 -0700
X-CSE-ConnectionGUID: YuEoU7dGRk+NS7KlV7v0WQ==
X-CSE-MsgGUID: vgVSgM9aTXKu05SLbsKHdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="78569165"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.194.118])
 ([10.245.194.118])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 02:16:39 -0700
Message-ID: <6b737bba-619c-4e5e-a245-94571defa95e@linux.intel.com>
Date: Tue, 1 Oct 2024 11:16:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/compat: remove unused i915_gpu_error.h
To: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
References: <20240930164052.3862911-1-jani.nikula@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240930164052.3862911-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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


On 9/30/2024 6:40 PM, Jani Nikula wrote:
> The last user of the compat header was removed in commit d6b933912df0
> ("drm/i915/dmc: convert intel_dmc_print_error_state() to drm_printer").
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


> ---
>  .../drm/xe/compat-i915-headers/i915_gpu_error.h | 17 -----------------
>  1 file changed, 17 deletions(-)
>  delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
>
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
> deleted file mode 100644
> index 98e9dd78f670..000000000000
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2023 Intel Corporation
> - */
> -
> -#ifndef _I915_GPU_ERROR_H_
> -#define _I915_GPU_ERROR_H_
> -
> -struct drm_i915_error_state_buf;
> -
> -__printf(2, 3)
> -static inline void
> -i915_error_printf(struct drm_i915_error_state_buf *e, const char *f, ...)
> -{
> -}
> -
> -#endif
