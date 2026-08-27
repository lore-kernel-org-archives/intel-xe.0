Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42794C61DC4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 07:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C6F10EEC1;
	Thu, 27 Aug 2026 07:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="flwS58vl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6B310EEC1;
 Thu, 27 Aug 2026 07:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787815740; x=1819351740;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ulQQXySMLCjS3/27QP9XNls457bI7Io8xSuP6LUglgg=;
 b=flwS58vl7vIBm7S35FMNbvbTZrVwBwEOoeJ6P6vKQrqw7bryifzcKi2L
 1Kk6UGebBkX4+fea3E3C72e3KgourNGE01OOYf9JaZinI76mCiZdPeRbp
 +8WLoGhVdqdMUOVOPtKly87/XXlAbKQ7BA4LVYrxNRNtrwlwebDi3kVCg
 3Z9eiqCsYF5EJZQKP1URaS3teh4ceZamWbJQ/fb/1VU+eQi4UIhil05dz
 K3LuoFsH20j/85R8NAndJr9Bbw5oRIsP/eYhhToia3N7LBf57KbTGxSHI
 ez0d8Pl2gHE0Ab0gIHDT3QzDig1KfJ+JkzJXyYSYjyCNT/LBDkFotyHRt g==;
X-CSE-ConnectionGUID: GoM8m/syTimGGsuPvNpuHA==
X-CSE-MsgGUID: 53BrSAGjQs24G4TOgoEASA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98907082"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="98907082"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 00:28:42 -0700
X-CSE-ConnectionGUID: 7YtHr0iSQgCAZSpKqKIl+A==
X-CSE-MsgGUID: BpX7Qek0RS+a60MsyJjhqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="264553515"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.153])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 00:28:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Coelho <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 3/5] drm/i915/display: remove unnecessary
 clock_gating include from intel_display.c
In-Reply-To: <20260817092911.342072-4-luciano.coelho@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260817092911.342072-1-luciano.coelho@intel.com>
 <20260817092911.342072-4-luciano.coelho@intel.com>
Date: Thu, 27 Aug 2026 10:28:39 +0300
Message-ID: <61b49de30e824a79667d39e018de18a98dea45c0@intel.com>
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

On Mon, 17 Aug 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> We don't use any of the functions inclued in intel_clock_gating.h in

inclued?

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> the intel_display.c code anymore.  Remove the respective include.
>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 553c60d452dd..fc30a455bed3 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -60,7 +60,6 @@
>  #include "intel_bo.h"
>  #include "intel_bw.h"
>  #include "intel_cdclk.h"
> -#include "intel_clock_gating.h"
>  #include "intel_cmtg.h"
>  #include "intel_color.h"
>  #include "intel_crt.h"

-- 
Jani Nikula, Intel
