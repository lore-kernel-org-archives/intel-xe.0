Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44028C71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 15:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068FB10EA2A;
	Fri, 13 Jun 2025 15:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rs2Owyus";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600FF10EA2A
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 15:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749830126; x=1781366126;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=JosDdZFMfnF1LDZicOLoWAQFCO7/VE8sj6iS2r1qh7s=;
 b=Rs2OwyusNeolENKBxTWFzL2IR9Mke8W32NCM9HqUHh9dv6V3+ncXqTN0
 EoGTLNKUFuJsWBg+rCgNCmEemRSy27EqEaE/ogqzx8y87AcbNqil9C6wL
 lBOjlHlGAe7Z0hyvTRMFV/B3W0AFPsuvBo0n/6FX33mlWc1w6ZcF98r1e
 PL5wZCye5i0fRpWPrlvyPgJkaVmyrCjTShnER9FKyk6tHob0QPswokYWs
 uOahisRDPg/zSG18MFbStW2/j6kTL/sUa0AiYtrwVP3okUg4Z9iK+Fi/5
 otL/Zefq8RViVmApjoltv4KsBdwbJNXrzVhMXyEWcZ1cdfIvNLF+iuH6Y g==;
X-CSE-ConnectionGUID: +VWivduMRtqHuBuWSKyJYg==
X-CSE-MsgGUID: yIIbCJpDQBqd2YNoQ65KzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="77441413"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="77441413"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 08:55:26 -0700
X-CSE-ConnectionGUID: QyuPSJxDS0Wi3YIQQQoy5w==
X-CSE-MsgGUID: dGcCmTp3Ss6OcnUEfuvO2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="152751007"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 13 Jun 2025 08:52:54 -0700
Received: from [10.245.96.176] (unknown [10.245.96.176])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2FCE73430D;
 Fri, 13 Jun 2025 16:52:53 +0100 (IST)
Message-ID: <4bc609fa-168a-4601-864e-1b078ecb89f5@intel.com>
Date: Fri, 13 Jun 2025 17:52:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/xe: Export xe_step_name for kunit tests
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20250613001438.678728-7-matthew.d.roper@intel.com>
 <20250613001438.678728-8-matthew.d.roper@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250613001438.678728-8-matthew.d.roper@intel.com>
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



On 13.06.2025 02:14, Matt Roper wrote:
> xe_step_name() is used by xe_assert(), so adding assertions to functions
> like xe_device_get_gt() will result in
> 
>   ERROR: modpost: "xe_step_name" [drivers/gpu/drm/xe/tests/xe_test.ko] undefined!
> 
> while building the kunit tests.  Export xe_step_name to avoid these
> build failures when adding assertions.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

this looks exactly as my patch from Feb [1] so it must be good ;)

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

[1] https://patchwork.freedesktop.org/patch/638883/?series=145269&rev=1

> ---
>  drivers/gpu/drm/xe/xe_step.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
> index c77b5c317fa0..10e88f2c9615 100644
> --- a/drivers/gpu/drm/xe/xe_step.c
> +++ b/drivers/gpu/drm/xe/xe_step.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_step.h"
>  
> +#include <kunit/visibility.h>
>  #include <linux/bitfield.h>
>  
>  #include "xe_device.h"
> @@ -255,3 +256,4 @@ const char *xe_step_name(enum xe_step step)
>  		return "**";
>  	}
>  }
> +EXPORT_SYMBOL_IF_KUNIT(xe_step_name);

