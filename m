Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9367C64ED6
	for <intel-xe@archiver.kernel.org>; Thu, 16 Feb 2023 13:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C26E10ED62;
	Thu, 16 Feb 2023 13:06:32 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019B910ED68
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Feb 2023 13:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676552789; x=1708088789;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=3iI1E0yBW1jrYpi6pjxKIWF3nBvk9rNzZzgf2MFKgD0=;
 b=BpE6wM4UFr2/YN2ONqNRcmaUxgtFWhm/Prg3U7pq4PNm0pNOosiQej7k
 KxarTmkqofz0GFOaDH4+DXvxRqGy3LrSTFwmcgBFytkmInFuPCDz3qF/3
 aarzOmejAyLgtiANRENTJVMdJ3Hj66CfDgHeypY5xXdOO8H3IXP8j0zdK
 vshFy6AgCNxnDLmnW8XWSmLnqwh4aurHXN285Z80RsLt4yrcTuhrRrJzs
 BLx2wCi+JN8WKeziHba9MNITvGJbx42a9ZPdCDOrcpJ8nEGR796y4KNCA
 dZyHEHdNDh1j8uR0t8+kn8UW6M1pwRFnJhpnArUaaLKN6M+xramwI2cD5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331707658"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="331707658"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 05:06:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="672145438"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="672145438"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.155])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 05:06:28 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230214083320.2199178-3-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230214083320.2199178-1-lucas.demarchi@intel.com>
 <20230214083320.2199178-3-lucas.demarchi@intel.com>
Date: Thu, 16 Feb 2023 15:06:25 +0200
Message-ID: <87fsb5220e.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Remove dependency on
 intel_engine_regs.h
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 14 Feb 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Create xe_regs/xe_engine_regs.h file with all the registers and bit
> definitions used by the xe driver. Eventually the registers may be
> defined in a different way and since xe doesn't supported below gen12,
> the number of registers touched is much smaller, so create a new header.
>
> The definitions themselves are direct copy from the
> gt/intel_engine_regs.h file, just sorting the registers by address.
> Cleaning those up and adhering to a common coding style is left for
> later.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_execlist.c            |  5 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c             |  6 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c           |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.c                 |  3 +-
>  drivers/gpu/drm/xe/xe_mmio.c                |  2 +-
>  drivers/gpu/drm/xe/xe_reg_sr.c              |  2 +-
>  drivers/gpu/drm/xe/xe_reg_whitelist.c       |  3 +-
>  drivers/gpu/drm/xe/xe_regs/xe_engine_regs.h | 81 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa.c                  |  2 +-
>  9 files changed, 96 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_regs/xe_engine_regs.h
>
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_exe=
clist.c
> index d555d77cbf49..254e1a6688c2 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -3,9 +3,11 @@
>   * Copyright =C2=A9 2021 Intel Corporation
>   */
>=20=20
> +#include "xe_execlist.h"
> +
>  #include <drm/drm_managed.h>
>=20=20
> -#include "xe_execlist.h"
> +#include <xe_regs/xe_engine_regs.h>

Why the system include <> instead of ""?

BR,
Jani.


>=20=20
>  #include "xe_bo.h"
>  #include "xe_device.h"
> @@ -23,7 +25,6 @@
>  #include "gt/intel_gpu_commands.h"
>  #include "gt/intel_gt_regs.h"
>  #include "gt/intel_lrc_reg.h"
> -#include "gt/intel_engine_regs.h"
>=20=20
>  #define XE_EXECLIST_HANG_LIMIT 1
>=20=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_=
ads.c
> index 0c08cecaca40..51d383e97ce2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -3,12 +3,14 @@
>   * Copyright =C2=A9 2022 Intel Corporation
>   */
>=20=20
> +#include "xe_guc_ads.h"
> +
>  #include <drm/drm_managed.h>
> +#include <xe_regs/xe_engine_regs.h>
>=20=20
>  #include "xe_bo.h"
>  #include "xe_gt.h"
>  #include "xe_guc.h"
> -#include "xe_guc_ads.h"
>  #include "xe_guc_reg.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
> @@ -16,7 +18,7 @@
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
>  #include "gt/intel_gt_regs.h"
> -#include "gt/intel_engine_regs.h"
> +
>=20=20
>  /* Slack of a few additional entries per engine */
>  #define ADS_REGSET_EXTRA_MAX	8
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw=
_engine.c
> index fd89dd90131c..85eda0cdc29c 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -6,6 +6,7 @@
>  #include "xe_hw_engine.h"
>=20=20
>  #include <drm/drm_managed.h>
> +#include <xe_regs/xe_engine_regs.h>
>=20=20
>  #include "xe_bo.h"
>  #include "xe_device.h"
> @@ -21,7 +22,6 @@
>  #include "xe_sched_job.h"
>  #include "xe_wa.h"
>=20=20
> -#include "gt/intel_engine_regs.h"
>  #include "i915_reg.h"
>  #include "gt/intel_gt_regs.h"
>=20=20
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 347ff9b34494..0cd6e0b72101 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -5,6 +5,8 @@
>=20=20
>  #include "xe_lrc.h"
>=20=20
> +#include <xe_regs/xe_engine_regs.h>
> +
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_engine_types.h"
> @@ -17,7 +19,6 @@
>  #include "gt/intel_gpu_commands.h"
>  #include "gt/intel_gt_regs.h"
>  #include "gt/intel_lrc_reg.h"
> -#include "gt/intel_engine_regs.h"
>=20=20
>  #define GEN8_CTX_VALID				(1 << 0)
>  #define GEN8_CTX_L3LLC_COHERENT			(1 << 5)
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 8a953df2b468..ced757ba9ccb 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -7,6 +7,7 @@
>=20=20
>  #include <drm/drm_managed.h>
>  #include <drm/xe_drm.h>
> +#include <xe_regs/xe_engine_regs.h>
>=20=20
>  #include "xe_device.h"
>  #include "xe_gt.h"
> @@ -15,7 +16,6 @@
>  #include "xe_module.h"
>=20=20
>  #include "i915_reg.h"
> -#include "gt/intel_engine_regs.h"
>  #include "gt/intel_gt_regs.h"
>=20=20
>  #define XEHP_MTCFG_ADDR		_MMIO(0x101800)
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_s=
r.c
> index f7eceb84e647..5d53379341b8 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -11,6 +11,7 @@
>=20=20
>  #include <drm/drm_print.h>
>  #include <drm/drm_managed.h>
> +#include <xe_regs/xe_engine_regs.h>
>=20=20
>  #include "xe_rtp_types.h"
>  #include "xe_device_types.h"
> @@ -20,7 +21,6 @@
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>=20=20
> -#include "gt/intel_engine_regs.h"
>  #include "gt/intel_gt_regs.h"
>=20=20
>  #define XE_REG_SR_GROW_STEP_DEFAULT	16
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/x=
e_reg_whitelist.c
> index a34617a642ec..42554870f3ba 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -5,11 +5,12 @@
>=20=20
>  #include "xe_reg_whitelist.h"
>=20=20
> +#include <xe_regs/xe_engine_regs.h>
> +
>  #include "xe_platform_types.h"
>  #include "xe_gt_types.h"
>  #include "xe_rtp.h"
>=20=20
> -#include "../i915/gt/intel_engine_regs.h"
>  #include "../i915/gt/intel_gt_regs.h"
>=20=20
>  #undef _MMIO
> diff --git a/drivers/gpu/drm/xe/xe_regs/xe_engine_regs.h b/drivers/gpu/dr=
m/xe/xe_regs/xe_engine_regs.h
> new file mode 100644
> index 000000000000..70796c8b117d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_regs/xe_engine_regs.h
> @@ -0,0 +1,81 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_ENGINE_REGS_H_
> +#define _XE_ENGINE_REGS_H_
> +
> +#include <asm/page.h>
> +
> +#include "i915_reg_defs.h"
> +
> +#define RING_TAIL(base)				_MMIO((base) + 0x30)
> +#define RING_HEAD(base)				_MMIO((base) + 0x34)
> +#define   HEAD_ADDR				0x001FFFFC
> +#define RING_START(base)			_MMIO((base) + 0x38)
> +#define RING_CTL(base)				_MMIO((base) + 0x3c)
> +#define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> page=
s */
> +#define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> page=
s */
> +#define RING_PSMI_CTL(base)			_MMIO((base) + 0x50)
> +#define   GEN8_RC_SEMA_IDLE_MSG_DISABLE			REG_BIT(12)
> +#define   GEN12_WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
> +#define RING_ACTHD_UDW(base)			_MMIO((base) + 0x5c)
> +#define RING_DMA_FADD_UDW(base)			_MMIO((base) + 0x60) /* gen8+ */
> +#define RING_IPEIR(base)			_MMIO((base) + 0x64)
> +#define RING_IPEHR(base)			_MMIO((base) + 0x68)
> +#define RING_ACTHD(base)			_MMIO((base) + 0x74)
> +#define RING_DMA_FADD(base)			_MMIO((base) + 0x78)
> +#define RING_HWS_PGA(base)			_MMIO((base) + 0x80)
> +#define IPEIR(base)				_MMIO((base) + 0x88)
> +#define IPEHR(base)				_MMIO((base) + 0x8c)
> +#define RING_HWSTAM(base)			_MMIO((base) + 0x98)
> +#define RING_MI_MODE(base)			_MMIO((base) + 0x9c)
> +#define RING_NOPID(base)			_MMIO((base) + 0x94)
> +#define RING_IMR(base)				_MMIO((base) + 0xa8)
> +#define   RING_MAX_NONPRIV_SLOTS  12
> +#define RING_EIR(base)				_MMIO((base) + 0xb0)
> +#define RING_EMR(base)				_MMIO((base) + 0xb4)
> +#define RING_ESR(base)				_MMIO((base) + 0xb8)
> +#define RING_BBADDR(base)			_MMIO((base) + 0x140)
> +#define RING_BBADDR_UDW(base)			_MMIO((base) + 0x168) /* gen8+ */
> +#define RING_EXECLIST_STATUS_LO(base)		_MMIO((base) + 0x234)
> +#define RING_EXECLIST_STATUS_HI(base)		_MMIO((base) + 0x234 + 4)
> +#define RING_CONTEXT_CONTROL(base)		_MMIO((base) + 0x244)
> +#define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
> +#define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
> +#define RING_MODE_GEN7(base)			_MMIO((base) + 0x29c)
> +#define   GEN11_GFX_DISABLE_LEGACY_MODE		(1 << 3)
> +#define RING_TIMESTAMP(base)			_MMIO((base) + 0x358)
> +#define RING_TIMESTAMP_UDW(base)		_MMIO((base) + 0x358 + 4)
> +#define   RING_VALID_MASK			0x00000001
> +#define   RING_VALID				0x00000001
> +#define   STOP_RING				REG_BIT(8)
> +#define   TAIL_ADDR				0x001FFFF8
> +#define RING_CTX_TIMESTAMP(base)		_MMIO((base) + 0x3a8) /* gen8+ */
> +#define RING_FORCE_TO_NONPRIV(base, i)		_MMIO(((base) + 0x4d0) + (i) * 4)
> +#define   RING_FORCE_TO_NONPRIV_DENY		REG_BIT(30)
> +#define   RING_FORCE_TO_NONPRIV_ADDRESS_MASK	REG_GENMASK(25, 2)
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_RW	(0 << 28)    /* CFL+ & Gen11+ =
*/
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_RD	(1 << 28)
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_WR	(2 << 28)
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_INVALID	(3 << 28)
> +#define   RING_FORCE_TO_NONPRIV_ACCESS_MASK	(3 << 28)
> +#define   RING_FORCE_TO_NONPRIV_RANGE_1		(0 << 0)     /* CFL+ & Gen11+ */
> +#define   RING_FORCE_TO_NONPRIV_RANGE_4		(1 << 0)
> +#define   RING_FORCE_TO_NONPRIV_RANGE_16	(2 << 0)
> +#define   RING_FORCE_TO_NONPRIV_RANGE_64	(3 << 0)
> +#define   RING_FORCE_TO_NONPRIV_RANGE_MASK	(3 << 0)
> +#define   RING_FORCE_TO_NONPRIV_MASK_VALID	(RING_FORCE_TO_NONPRIV_RANGE_=
MASK | \
> +						 RING_FORCE_TO_NONPRIV_ACCESS_MASK | \
> +						 RING_FORCE_TO_NONPRIV_DENY)
> +#define   RING_MAX_NONPRIV_SLOTS  12
> +#define RING_EXECLIST_SQ_CONTENTS(base)		_MMIO((base) + 0x510)
> +#define RING_EXECLIST_CONTROL(base)		_MMIO((base) + 0x550)
> +#define	  EL_CTRL_LOAD				REG_BIT(0)
> +#define VDBOX_CGCTL3F10(base)			_MMIO((base) + 0x3f10)
> +#define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
> +#define VDBOX_CGCTL3F18(base)			_MMIO((base) + 0x3f18)
> +#define   ALNUNIT_CLKGATE_DIS			REG_BIT(13)
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 9d2e4555091c..915b670d31fc 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -6,6 +6,7 @@
>  #include "xe_wa.h"
>=20=20
>  #include <linux/compiler_types.h>
> +#include <xe_regs/xe_engine_regs.h>
>=20=20
>  #include "xe_device_types.h"
>  #include "xe_force_wake.h"
> @@ -16,7 +17,6 @@
>  #include "xe_rtp.h"
>  #include "xe_step.h"
>=20=20
> -#include "gt/intel_engine_regs.h"
>  #include "gt/intel_gt_regs.h"
>  #include "i915_reg.h"

--=20
Jani Nikula, Intel Open Source Graphics Center
