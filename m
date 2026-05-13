Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE48CD37B6
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 08:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E198810E5B6;
	Wed, 13 May 2026 08:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z6xGpqhq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A0C10E5B6
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 08:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778662596; x=1810198596;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DJeanjm1HAvAJUWgpDYVkqfELmffTgH7KhvqN43xMxI=;
 b=Z6xGpqhqCW/g2AiAjeWsKwAwNPrnEzJJ7nHijnrcYbOL0v7o5MpLr1mi
 HGfUBVc93J8xYWe7hIpB9GQ4x7wZlSlQJXDici+hAbaJE+P+Emc+KYEph
 OtUBPGbJDIsMHi5h8d2O0m+4hIjfYzgPH0Gy/yl11skkDCwgT+Kv6CazQ
 9hSNXrWDZJcajQj0ndb1i7V9M79bInFywkXtNetQQ8b44dyGK9T/4hQlv
 zwjA9pkXChm4EcfDTs96vu2DpuTjHjEokOAm8wndQ2XrXOENUFQQ/6MWc
 8oPp5u5OVWMbwB8LCJnhDMgg+L8C7CdNdVp5SJL7cGY7AoSJArqwIyCP3 w==;
X-CSE-ConnectionGUID: UEULea6AQGSyhhSS1bNATw==
X-CSE-MsgGUID: 8rIhYrqFSni12XfLvFHcMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="67112594"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="67112594"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:56:36 -0700
X-CSE-ConnectionGUID: eCwsfA4qSCS95ZJKSFeEJg==
X-CSE-MsgGUID: 9PensOTTRdu+5ggR8NnPsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="276138406"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.102])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:56:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/7] drm/xe: Drop unused drm/drm_atomic_helper.h include
In-Reply-To: <20260512183342.3374-2-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260512183342.3374-1-michal.wajdeczko@intel.com>
 <20260512183342.3374-2-michal.wajdeczko@intel.com>
Date: Wed, 13 May 2026 11:56:24 +0300
Message-ID: <0db920f1e413b017eee08e6808b2a940acab1a2d@intel.com>
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

On Tue, 12 May 2026, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> We don't need this header in xe_device.c file.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4b45b617a039..6512f1dfe691 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -10,7 +10,6 @@
>  #include <linux/fault-inject.h>
>  #include <linux/units.h>
>  
> -#include <drm/drm_atomic_helper.h>
>  #include <drm/drm_client.h>
>  #include <drm/drm_gem_ttm_helper.h>
>  #include <drm/drm_ioctl.h>

-- 
Jani Nikula, Intel
