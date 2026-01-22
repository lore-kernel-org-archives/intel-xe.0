Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBF1D62618
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 11:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFB410E992;
	Thu, 22 Jan 2026 11:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aikdFeg5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53BA10E994;
 Thu, 22 Jan 2026 11:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769082375; x=1800618375;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MaIly3zrxEuGXqDaNnXgI72++kAVGjJ9v4/UGvCkqxs=;
 b=aikdFeg5tZwWQWEMqLRgEo4Lp6QdIRuXnG+30W2GkJQb19io8Rsa7TK7
 z2hNEU115YhWDThbFbS47X2ApV1XpuxWTrjQ8tlr5RkCuctMBS7sHNbWz
 Bll7MdxW4BC4dK0Y2oahDMv4YqrD6H86deH9wjMi9gZ2GZ26kp/nH4y6j
 42vRJfCmR6hpKZqJmBzD8QeZu9lfhhVq4krW0/GDaHETHgax48zrV9qba
 1zI6YBbK1B0ItEt4qOdjiMiomw7XE7I3Ju4porTHhfHyQMplzjr3/oYVj
 kS1kTZ+o0U1WsagHIL6y8D5hYPObgK0mDREqL0Fg0/zNdKHqq4rUiB6pw Q==;
X-CSE-ConnectionGUID: sn+3zEASTFqC98cTn6vlxQ==
X-CSE-MsgGUID: feYCwOtYQWKQZ/q+LpbrGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70223046"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="70223046"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:46:14 -0800
X-CSE-ConnectionGUID: fuJy8bsPTxKxdRaM1G2Dxw==
X-CSE-MsgGUID: fF4MpNLLQICjHz5E1s6P6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="210857163"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:46:12 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v2 05/19] drm/{i915, xe}: Extract pcode definitions to common
 header
In-Reply-To: <20260121232414.707192-6-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260121232414.707192-1-uma.shankar@intel.com>
 <20260121232414.707192-6-uma.shankar@intel.com>
Date: Thu, 22 Jan 2026 13:46:09 +0200
Message-ID: <fa1c7427e6374b2ed22312e5886c6b6755e1d5a2@intel.com>
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

On Thu, 22 Jan 2026, Uma Shankar <uma.shankar@intel.com> wrote:
> There are certain register definitions which are commonly shared
> by i915, xe and display. Extract the same to a common header to
> avoid duplication.
>
> Move GEN6_PCODE_MAILBOX to common header to make intel_cdclk.c
> free from including i915_reg.h
>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c |   2 +-
>  drivers/gpu/drm/i915/i915_reg.h            | 101 +------------------
>  include/drm/intel/intel_gmd_common_regs.h  | 108 +++++++++++++++++++++
>  3 files changed, 110 insertions(+), 101 deletions(-)
>  create mode 100644 include/drm/intel/intel_gmd_common_regs.h
>
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> index 9bfbfbf34dc0..531db1b452d1 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -27,9 +27,9 @@
>  
>  #include <drm/drm_fixed.h>
>  #include <drm/drm_print.h>
> +#include <drm/intel/intel_gmd_common_regs.h>
>  
>  #include "hsw_ips.h"
> -#include "i915_reg.h"
>  #include "intel_atomic.h"
>  #include "intel_audio.h"
>  #include "intel_cdclk.h"
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index dc13f9eb4cd7..35122c997b8a 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -25,6 +25,7 @@
>  #ifndef _I915_REG_H_
>  #define _I915_REG_H_
>  
> +#include <drm/intel/intel_gmd_common_regs.h>

Oh, I also dislike this, because it becomes unclear what needs them. The
benefit from more granular headers is that only the places that need
them can include them, and we can actually quickly check what includes
what instead of these indirect dependencies.

BR,
Jani.


-- 
Jani Nikula, Intel
