Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79794D31A0F
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 05:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADEB10E39B;
	Wed, 14 Jan 2026 05:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JelPKefp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F375A10E39B
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 05:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768367524; x=1799903524;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MKh8voHVXQcCbBf42bJeFF9du+eJMueZSM0GzpDr728=;
 b=JelPKefp3W9jTUvat2WtM1BOt599zclceQrWbIdwjBiZcJHSQmnNzcpZ
 Be1cEY8GbB9cBTyryh5oxeWbDKTE1vSpvxy+Dv1OQRCfi3dOi7dDLn5tc
 LLHJ7Hk2ns8hvBbyUJYNkA1ztuXrMFxgQxTq4MDIx+UT54lVsh8LCNu2z
 i5j3af6T9Gi0hnopdPzqhpaLBRuUZUFhV60FrHALElqM4fyIiUcmuh9CJ
 RJFKiWJsBorzm8QdeJqwn2SStWNdDZxtXxm/Kr9DR1gWKKsViLVaDLaVe
 ZxyLdezxWlqiutExUcnwfqzoTGayNbrOiPQpdupNN9weeee68euxoTY+I w==;
X-CSE-ConnectionGUID: 1kKDAHpgRBa4+K+8wqqdxg==
X-CSE-MsgGUID: xsqvMkvmQvCWWiMjxJ5ZTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="57217279"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="57217279"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 21:12:04 -0800
X-CSE-ConnectionGUID: 1A++To9TSLehbKPV/85AKw==
X-CSE-MsgGUID: td5cRLC9RSG5XGImkQEaKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204371586"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 21:12:03 -0800
Date: Wed, 14 Jan 2026 06:12:00 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 41/79] drm/xe: Cleanup headers in xe_i2c.c
Message-ID: <aWcloOfxYjg-XvFQ@black.igk.intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
 <20260113230315.3081153-122-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113230315.3081153-122-matthew.d.roper@intel.com>
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

On Tue, Jan 13, 2026 at 03:03:46PM -0800, Matt Roper wrote:
> xe_i2c.c doesn't use anything from xe_device.h or xe_platform_types.h.
> Drop the unnecessary includes.  However it does require xe_sriov.h which
> was being indirectly included; add an explicit include for that.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_i2c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index befc77e46eae..1e1fb72e49bf 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2025 Intel Corporation.
>   */
>  
> +#include <drm/drm_print.h>
>  #include <linux/array_size.h>
>  #include <linux/container_of.h>
>  #include <linux/device.h>
> @@ -26,11 +27,10 @@
>  #include "regs/xe_i2c_regs.h"
>  #include "regs/xe_irq_regs.h"
>  
> -#include "xe_device.h"
>  #include "xe_device_types.h"
>  #include "xe_i2c.h"
>  #include "xe_mmio.h"
> -#include "xe_platform_types.h"
> +#include "xe_sriov.h"

My guess is, with pci.h here you won't even need this. But I could be
wrong.

Raag

>  #include "xe_survivability_mode.h"
>  
>  /**
> -- 
> 2.52.0
> 
