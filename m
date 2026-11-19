Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2109E60A261E
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 15:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D9GPXgOX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D630E10E07C;
	Thu, 19 Nov 2026 15:38:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F6C10E07C;
 Thu, 19 Nov 2026 15:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795102692; x=1826638692;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2GPYDQQZ9xh/NH8FT5GkmaeLqAlbyDasu+M8clPEnL0=;
 b=D9GPXgOXgbKmTf3aKrYk1qweX8SlXeFHFlq0nFGFTDdyAC757fKOgq4P
 ndUHKywSX+2Ho4toWOLn5rU0N6FbTjAXw7NuX7f0Cw4VELkA/kuvl7SjY
 UMQ5vXlgbsxgen8keKe9Wp+WinWdfdjc1DMpvHNT2KlnNY4WLqFHPyQYj
 zyVQS3mZ0TO6JbwIjp7UJvhCBwQPjiNUOIOkB/Ycksj0XP38Wu+igzLYn
 KBk5iIfSUyIjywIQQ/6/QFYV3FYMXgJxNiBLymdIzpplpqOAniX4FbLQJ
 lKnw/XXNgT5BFsxCje4kpTVja/jtH2ujfcWx0eXmNXE0sqs9D6vic22ii A==;
X-CSE-ConnectionGUID: h/1E/7+5S1Wszq3tqBw8RA==
X-CSE-MsgGUID: Wm4doDwOTFK9YeHPRM6Z4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3855389"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3855389"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 07:38:11 -0800
X-CSE-ConnectionGUID: TltDiO3oQsyKe/h1T3F0fQ==
X-CSE-MsgGUID: kURr5kkLQliBiLzuPLtkXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10362765"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 07:38:10 -0800
Date: Thu, 19 Nov 2026 17:38:06 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915: move FBC_RT_BASE register macros to
 intel_gt_regs.h
Message-ID: <av8X3kGJ99JEAT0u@intel.com>
References: <20261119151644.4097956-1-jani.nikula@intel.com>
 <20261119151644.4097956-2-jani.nikula@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261119151644.4097956-2-jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 05:16:44PM +0200, Jani Nikula wrote:
> The FBC_RT_BASE registers are in the SVL unit, not display. Move them to
> intel_gt_regs.h, and reducing display includes from i915 core in the
> process.

Yeah, we don't use the FBC hardware render tracking so we have no
need for these in the display code. I was worried we might still be
writing them anyway, but looks like I removed all that in
commit b339088d81c8 ("drm/i915: Don't write IVB_FBC_RT_BASE") and
commit 644398586f00 ("drm/i915/fbc: Remove the FBC_RT_BASE setup for
ILK/SNB")

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fbc_regs.h | 7 -------
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 7 +++++++
>  drivers/gpu/drm/i915/gt/intel_workarounds.c   | 2 --
>  3 files changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc_regs.h b/drivers/gpu/drm/i915/display/intel_fbc_regs.h
> index 4178e602d7d7..3ce018ebb27c 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_fbc_regs.h
> @@ -111,19 +111,12 @@
>  #define XE3_FBC_DIRTY_CTL(fbc_id)	_MMIO_PIPE((fbc_id), 0x43234, 0x43274)
>  #define   FBC_DIRTY_RECT_EN		REG_BIT(31)
>  
> -#define ILK_FBC_RT_BASE		_MMIO(0x2128)
> -#define   ILK_FBC_RT_VALID	REG_BIT(0)
> -#define   SNB_FBC_FRONT_BUFFER	REG_BIT(1)
> -
>  #define SNB_DPFC_CTL_SA		_MMIO(0x100100)
>  #define   SNB_DPFC_FENCE_EN		REG_BIT(29)
>  #define   SNB_DPFC_FENCENO_MASK		REG_GENMASK(4, 0)
>  #define   SNB_DPFC_FENCENO(fence)	REG_FIELD_PREP(SNB_DPFC_FENCENO_MASK, (fence))
>  #define SNB_DPFC_CPU_FENCE_OFFSET	_MMIO(0x100104)
>  
> -#define IVB_FBC_RT_BASE			_MMIO(0x7020)
> -#define IVB_FBC_RT_BASE_UPPER		_MMIO(0x7024)
> -
>  #define MSG_FBC_REND_STATE(fbc_id)	_MMIO_PIPE((fbc_id), 0x50380, 0x50384)
>  #define   FBC_REND_NUKE			REG_BIT(2)
>  #define   FBC_REND_CACHE_CLEAN		REG_BIT(1)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 3ba9b2206b79..7b892fa50088 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -202,6 +202,10 @@
>  #define   CM0_DEPTH_WRITE_DISABLE		(1 << 1)
>  #define   CM0_RC_OP_FLUSH_DISABLE		(1 << 0)
>  
> +#define ILK_FBC_RT_BASE				_MMIO(0x2128)
> +#define   ILK_FBC_RT_VALID			REG_BIT(0)
> +#define   SNB_FBC_FRONT_BUFFER			REG_BIT(1)
> +
>  #define GFX_FLSH_CNTL				_MMIO(0x2170) /* 915+ only */
>  
>  /*
> @@ -471,6 +475,9 @@
>  #define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE	REG_BIT(13)
>  #define   BDW_HIZ_POWER_COMPILER_CLOCK_GATING_DISABLE	REG_BIT(3)
>  
> +#define IVB_FBC_RT_BASE				_MMIO(0x7020)
> +#define IVB_FBC_RT_BASE_UPPER			_MMIO(0x7024)
> +
>  #define XEHP_CULLBIT2				MCR_REG(0x7030)
>  
>  #define GEN8_L3CNTLREG				_MMIO(0x7034)
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 24ea5d8d529c..a2f00fc8589d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -20,8 +20,6 @@
>  #include "intel_ring.h"
>  #include "intel_workarounds.h"
>  
> -#include "display/intel_fbc_regs.h"
> -
>  /**
>   * DOC: Hardware workarounds
>   *
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
