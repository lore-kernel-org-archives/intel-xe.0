Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC5EC47DA2
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 12:28:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6587210E51B;
	Tue, 16 Jan 2024 12:28:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30F910E51B
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 12:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705408111; x=1736944111;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=St5Y+L0PzQ7QqIWYw6a/TXpEjqQy/eT1h9EEqAhZu7g=;
 b=ns9pdSyxhpSXgLRumdahku1wX02xqA3wOLEUM+N7W9/kV7PHejjqoUil
 7HwkoGORJ4yoEVqHKNqY0jKDUTuygBfOHcvRwUjiKeC+CLnhziNqxcWxa
 XZLEXXMk0mqtMi4u+9Ob2RvPO1rGbcoR3rg7a2Fcz1lOPgW9niADCL+6y
 TcLP4LbktQIxGPdeP93Z9VuxSiCyCodluxGkUHtEISc85dxxRnUSXzUnl
 eVKAvlaHvsa2U3+Bu3hFxvCV7SxkiUMxJq3h1/jzM2jVnOBvLhGgVTT4b
 Sm3bpcjYH9yNAf/oR1J8NSyhR7QO6TlJhO9k4CSy7RVw5rJUTj/pRVatJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="431013034"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="431013034"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 04:28:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="784114299"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="784114299"
Received: from jfunnell-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.52])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 04:28:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [RFC v2 1/4] drm/i915/display: add support for DMC wakelocks
In-Reply-To: <20240111091622.1110799-2-luciano.coelho@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240111091622.1110799-1-luciano.coelho@intel.com>
 <20240111091622.1110799-2-luciano.coelho@intel.com>
Date: Tue, 16 Jan 2024 14:28:22 +0200
Message-ID: <875xztsbrt.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 11 Jan 2024, Luca Coelho <luciano.coelho@intel.com> wrote:
> diff --git a/drivers/gpu/drm/i915/display/intel_wakelock.h b/drivers/gpu/drm/i915/display/intel_wakelock.h
> new file mode 100644
> index 000000000000..a47205e1ea32
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_wakelock.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (C) 2023 Intel Corporation
> + */
> +
> +#ifndef __INTEL_WAKELOCK_H__
> +#define __INTEL_WAKELOCK_H__
> +
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +#include <linux/refcount.h>
> +
> +#include "i915_reg_defs.h"
> +
> +struct drm_i915_private;
> +
> +struct intel_display_wl {
> +	spinlock_t lock;
> +	bool enabled;
> +	refcount_t refcount;
> +	struct delayed_work work;
> +};
> +
> +struct intel_display_wl_range {
> +	u32 start;
> +	u32 end;
> +};
> +
> +void intel_display_wl_init(struct drm_i915_private *i915);
> +void intel_display_wl_enable(struct drm_i915_private *i915);
> +void intel_display_wl_get(struct drm_i915_private *i915, i915_reg_t reg);
> +void intel_display_wl_put(struct drm_i915_private *i915, i915_reg_t reg);

Nitpick, I'll want the name prefix to match the filename,
i.e. intel_foo.[ch] have functions named intel_foo_*.

BR,
Jani.

> +
> +#endif /* __INTEL_WAKELOCK_H__ */
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 0292b79852a0..387eccab28ae 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -279,6 +279,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	i915-display/intel_vdsc.o \
>  	i915-display/intel_vga.o \
>  	i915-display/intel_vrr.o \
> +	i915-display/intel_wakelock.o \
>  	i915-display/intel_wm.o \
>  	i915-display/skl_scaler.o \
>  	i915-display/skl_universal_plane.o \

-- 
Jani Nikula, Intel
