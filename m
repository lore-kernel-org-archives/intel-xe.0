Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5170CE98E13
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 10:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28E010E2E5;
	Mon, 23 Feb 2026 10:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7ZZl7bj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C78110E2E5;
 Mon, 23 Feb 2026 10:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771843110; x=1803379110;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=df9M1p6o2MLDn+dJSXnK2dUWUQTNDkYIqegagaEIsFU=;
 b=G7ZZl7bjkzQllKRBfIyXb9seCI42dBa/G/TPysDU+ZaRGj3vTA64UM/k
 ud6LgnDyP5AmUSA8SCj+8IQiydHiGxKuqTkKFy3hc8rH2YbtjKLM03rzY
 LdC5ONrL+2D6j3YJYm2w5qBZ1JrsD951bjsSdIqGW6tyPZNH8rav8Outr
 A1vG+Tv3x1L7myzQ1NFp0qPWOZH/CddjObwy6VOdh5L1rbyrE/1/FFnL0
 +oVGQrWmtrgO0JfgSpHXTLv4H9yi/QXCCtF3Wb3RDT7Q7TQghro+/qhmn
 EtK2Ya2TdRX8gStnOAFuPZygxhhA6SzUUwcdhbbdDI4MDIetQujtmnF5o A==;
X-CSE-ConnectionGUID: I5h84FidSeSqPDXtJDnaxQ==
X-CSE-MsgGUID: OQ4zZVmgSKOyXP/4oEm6sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="90419422"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="90419422"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 02:38:29 -0800
X-CSE-ConnectionGUID: 4f/4UZf+Rp+JIYnfvFklAQ==
X-CSE-MsgGUID: SpBuHqaaReOZ09akAbPBOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="212926938"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 02:38:26 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>, uma.shankar@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Arun R
 Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH v3 2/2] drm/i915/lt_phy_regs: Add SoC/OS turnaround time
In-Reply-To: <20260216-timeout-v3-2-055522c22560@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260216-timeout-v3-0-055522c22560@intel.com>
 <20260216-timeout-v3-2-055522c22560@intel.com>
Date: Mon, 23 Feb 2026 12:38:22 +0200
Message-ID: <533398a623295fccc3f1053d28b2357dbf7e6fb1@intel.com>
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

On Mon, 16 Feb 2026, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> On top the timeouts mentioned in the spec which includes only the PHY
> timeouts include the SoC and the OS turnaround time.
> The overhead value is based on the stress test results with multiple
> available panels.
>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_lt_phy_regs.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h b/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h
> index 37e46fb9abde4156ebd7ad1eb6cbbc12e7026b23..ff6d7829dbb9c50b2001d079b435b894faf9659e 100644
> --- a/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_lt_phy_regs.h
> @@ -6,12 +6,12 @@
>  #ifndef __INTEL_LT_PHY_REGS_H__
>  #define __INTEL_LT_PHY_REGS_H__
>  
> -#define XE3PLPD_MSGBUS_TIMEOUT_FAST_US	500
> +#define XE3PLPD_MSGBUS_TIMEOUT_FAST_US		500
>  #define XE3PLPD_MACCLK_TURNON_LATENCY_MS	2
> -#define XE3PLPD_MACCLK_TURNOFF_LATENCY_US	1
> +#define XE3PLPD_MACCLK_TURNOFF_LATENCY_US	10
>  #define XE3PLPD_RATE_CALIB_DONE_LATENCY_MS	1
> -#define XE3PLPD_RESET_START_LATENCY_US	10
> -#define XE3PLPD_PWRDN_TO_RDY_LATENCY_US	4
> +#define XE3PLPD_RESET_START_LATENCY_US		10
> +#define XE3PLPD_PWRDN_TO_RDY_LATENCY_US		10
>  #define XE3PLPD_RESET_END_LATENCY_MS		2

Side note, *none* of these belong in intel_lt_phy_regs.h. They should be
moved to intel_lt_phy.c instead.

The timeouts do not describe the register contents.

BR,
Jani.


>  
>  /* LT Phy MAC Register */

-- 
Jani Nikula, Intel
