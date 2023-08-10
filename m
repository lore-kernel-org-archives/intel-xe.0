Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813B7C001B0
	for <intel-xe@archiver.kernel.org>; Thu, 10 Aug 2023 07:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585A510E4EB;
	Thu, 10 Aug 2023 07:58:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EC810E4EB
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Aug 2023 07:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691654333; x=1723190333;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=PFDp0HmM8BuMvlMM55gifVAr64+iyV1mWfUXMVI0I4o=;
 b=IIz4gtQkSXRzm+Sqh9ORr3mmFoBjKPUXIRvdSMo1Bd8FS98rS+TKKAOw
 podIspCg2MD8TNzAndk32b0sBaCacK+zu+cLO/acJlUSAmVa0qFUGjT9F
 kLEbOeylKZTxXDBVoPMU18VHMLTBvU3ErBK5788wnapPQ2ZEtxJE8itnq
 P/zSDGDdlFlytULzBfZsFiB63ricusVeGAIgygeFVxr8ITfqkrWxd4jj+
 wshRCuTvUzVnKDm7/AsCNG/GjQmQKaFZCqs7RWgPI6RZsrHdZdHfL+L8x
 Wt53RAABQJAwVGlED7SRo9N89SV7oIYKAjeqvvuwALZO9kF8aOATOdDRN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="375046923"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="375046923"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 00:55:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="822145255"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="822145255"
Received: from haijindi-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.49.164])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 00:54:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230810050755.715775-2-himal.prasad.ghimiray@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230810050755.715775-1-himal.prasad.ghimiray@intel.com>
 <20230810050755.715775-2-himal.prasad.ghimiray@intel.com>
Date: Thu, 10 Aug 2023 10:54:56 +0300
Message-ID: <877cq3s567.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v2 1/4] drm/xe: Handle errors from various
 components.
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 10 Aug 2023, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com=
> wrote:
> The GFX device can generate numbers of classes of error under the new
> infrastructure: correctable, non-fatal, and fatal errors.
>
> The non-fatal and fatal error classes distinguish between levels of
> severity for uncorrectable errors. Driver will only handle logging
> of errors and updating counters from various components within the
> graphics device. Anything more will be handled at system level.
>
> For errors that will route as interrupts, three bits in the Master
> Interrupt Register will be used to convey the class of error.
>
> For each class of error: Determine source of error (IP block) by reading
> the Device Error Source Register (RW1C) that
> corresponds to the class of error being serviced.
>
> Bspec: 50875, 53073, 53074, 53075
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h            |   7 +
>  drivers/gpu/drm/xe/regs/xe_tile_error_regs.h | 108 +++++++++
>  drivers/gpu/drm/xe/xe_device_types.h         |   6 +
>  drivers/gpu/drm/xe/xe_irq.c                  | 220 +++++++++++++++++++
>  4 files changed, 341 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/=
xe_regs.h
> index ec45b1ba9db1..9901e55fc89c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -87,7 +87,14 @@
>  #define   GU_MISC_IRQ				REG_BIT(29)
>  #define   DISPLAY_IRQ				REG_BIT(16)
>  #define   GT_DW_IRQ(x)				REG_BIT(x)
> +#define   XE_ERROR_IRQ(x)			REG_BIT(26 + (x))
>=20=20
>  #define PVC_RP_STATE_CAP			XE_REG(0x281014)
>=20=20
> +enum hardware_error {
> +	HARDWARE_ERROR_CORRECTABLE =3D 0,
> +	HARDWARE_ERROR_NONFATAL =3D 1,
> +	HARDWARE_ERROR_FATAL =3D 2,
> +	HARDWARE_ERROR_MAX,
> +};

This file is about registers. IMO enums belong somewhere else. Define
hardware registers using macros.

>  #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/d=
rm/xe/regs/xe_tile_error_regs.h
> new file mode 100644
> index 000000000000..fbb794b2f183
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
> @@ -0,0 +1,108 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +#ifndef XE_TILE_ERROR_REGS_H_
> +#define XE_TILE_ERROR_REGS_H_
> +
> +#include <linux/stddef.h>
> +
> +#define _DEV_ERR_STAT_NONFATAL                         0x100178
> +#define _DEV_ERR_STAT_CORRECTABLE                      0x10017c
> +#define DEV_ERR_STAT_REG(x)                            XE_REG(_PICK_EVEN=
((x), \
> +								_DEV_ERR_STAT_CORRECTABLE, \
> +								_DEV_ERR_STAT_NONFATAL))
> +
> +#define  DEV_ERR_STAT_MAX_ERROR_BIT         (21)
> +
> +/* Count of  Correctable and Uncorrectable errors reported on tile */
> +enum xe_tile_hw_errors {g
> +	XE_TILE_HW_ERR_GT_FATAL =3D 0,
> +	XE_TILE_HW_ERR_SGGI_FATAL,
> +	XE_TILE_HW_ERR_DISPLAY_FATAL,
> +	XE_TILE_HW_ERR_SGDI_FATAL,
> +	XE_TILE_HW_ERR_SGLI_FATAL,
> +	XE_TILE_HW_ERR_SGUNIT_FATAL,
> +	XE_TILE_HW_ERR_SGCI_FATAL,
> +	XE_TILE_HW_ERR_GSC_FATAL,
> +	XE_TILE_HW_ERR_SOC_FATAL,
> +	XE_TILE_HW_ERR_MERT_FATAL,
> +	XE_TILE_HW_ERR_SGMI_FATAL,
> +	XE_TILE_HW_ERR_UNKNOWN_FATAL,
> +	XE_TILE_HW_ERR_SGGI_NONFATAL,
> +	XE_TILE_HW_ERR_DISPLAY_NONFATAL,
> +	XE_TILE_HW_ERR_SGDI_NONFATAL,
> +	XE_TILE_HW_ERR_SGLI_NONFATAL,
> +	XE_TILE_HW_ERR_GT_NONFATAL,
> +	XE_TILE_HW_ERR_SGUNIT_NONFATAL,
> +	XE_TILE_HW_ERR_SGCI_NONFATAL,
> +	XE_TILE_HW_ERR_GSC_NONFATAL,
> +	XE_TILE_HW_ERR_SOC_NONFATAL,
> +	XE_TILE_HW_ERR_MERT_NONFATAL,
> +	XE_TILE_HW_ERR_SGMI_NONFATAL,
> +	XE_TILE_HW_ERR_UNKNOWN_NONFATAL,
> +	XE_TILE_HW_ERR_GT_CORR,
> +	XE_TILE_HW_ERR_DISPLAY_CORR,
> +	XE_TILE_HW_ERR_SGUNIT_CORR,
> +	XE_TILE_HW_ERR_GSC_CORR,
> +	XE_TILE_HW_ERR_SOC_CORR,
> +	XE_TILE_HW_ERR_UNKNOWN_CORR,
> +};

Ditto about enums and regs.

> +
> +#define XE_TILE_HW_ERROR_MAX (XE_TILE_HW_ERR_UNKNOWN_CORR + 1)

If it's an enum, adding that last in the enum does the trick.

> +
> +#define PVC_DEV_ERR_STAT_FATAL_MASK \
> +		(REG_BIT(0) | \
> +		 REG_BIT(1) | \
> +		 REG_BIT(8) | \
> +		 REG_BIT(9) | \
> +		 REG_BIT(13) | \
> +		 REG_BIT(16) | \
> +		 REG_BIT(20))
> +
> +#define PVC_DEV_ERR_STAT_NONFATAL_MASK \
> +		(REG_BIT(0) | \
> +		 REG_BIT(1) | \
> +		 REG_BIT(8) | \
> +		 REG_BIT(9) | \
> +		 REG_BIT(13) | \
> +		 REG_BIT(16) | \
> +		 REG_BIT(20))
> +
> +#define PVC_DEV_ERR_STAT_CORRECTABLE_MASK \
> +		(REG_BIT(0) | \
> +		 REG_BIT(8))
> +
> +#define DG2_DEV_ERR_STAT_FATAL_MASK \
> +		(REG_BIT(0) | \
> +		 REG_BIT(4) | \
> +		 REG_BIT(8) | \
> +		 REG_BIT(12) | \
> +		 REG_BIT(16))
> +
> +#define DG2_DEV_ERR_STAT_NONFATAL_MASK \
> +		(REG_BIT(0) | \
> +		 REG_BIT(4) | \
> +		 REG_BIT(8) | \
> +		 REG_BIT(12) | \
> +		 REG_BIT(16) | \
> +		 REG_BIT(20))
> +
> +#define DG2_DEV_ERR_STAT_CORRECTABLE_MASK \
> +		(REG_BIT(0) | \
> +		 REG_BIT(4) | \
> +		 REG_BIT(8) | \
> +		 REG_BIT(12) | \
> +		 REG_BIT(16))

Are the above supposed to match what's in xe_tile_hw_errors? Seems
rather unmaintainable.

> +
> +#define REG_SIZE 32
> +
> +#define xe_tile_log_hw_err(tile, fmt, ...) \
> +	drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR "TILE%d detected " f=
mt, \
> +			    tile->id, ##__VA_ARGS__)
> +
> +#define xe_tile_log_hw_warn(tile, fmt, ...) \
> +	drm_warn(&tile_to_xe(tile)->drm, HW_ERR "TILE%d detected " fmt, \
> +		 tile->id, ##__VA_ARGS__)

Do we really want to keep adding new macros for all possible scenarios
in the driver? This is getting out of hand.

Where's HW_ERR defined?

> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
> index f84ecb976f5d..1335ba74981a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -16,6 +16,7 @@
>  #include "xe_gt_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_step_types.h"
> +#include "regs/xe_tile_error_regs.h"
>=20=20
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  #include "ext/intel_device_info.h"
> @@ -166,6 +167,11 @@ struct xe_tile {
>=20=20
>  	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
>  	struct kobject *sysfs;
> +
> +	/** @tile_hw_errors: hardware errors reported for the tile */
> +	struct tile_hw_errors {
> +		unsigned long hw[XE_TILE_HW_ERROR_MAX];

Even with the documentation comment, I have to look up the source code
to realize this is the *number* of errors for each class.

Maybe "count" is more informative than "hw".

> +	} errors;
>  };
>=20=20
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 2022a5643e01..04a665faea23 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -362,6 +362,223 @@ static void dg1_intr_enable(struct xe_device *xe, b=
ool stall)
>  		xe_mmio_read32(mmio, DG1_MSTR_TILE_INTR);
>  }
>=20=20
> +static const char *
> +hardware_error_type_to_str(const enum hardware_error hw_err)
> +{
> +	switch (hw_err) {
> +	case HARDWARE_ERROR_CORRECTABLE:
> +		return "CORRECTABLE";
> +	case HARDWARE_ERROR_NONFATAL:
> +		return "NONFATAL";
> +	case HARDWARE_ERROR_FATAL:
> +		return "FATAL";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +struct error_msg_counter_pair {
> +	const char *errmsg;
> +	int errcounter;

Counter? Or type/class/whatever?

> +};
> +
> +struct error_msg_counter_pair dev_err_stat_fatal_reg[] =3D {
> +	{"GT",			XE_TILE_HW_ERR_GT_FATAL			/* Bit Pos 0 */},

Does this again tie the enums and the bit positions together, similar to
how the mask macros also do above?

There needs to be a single point of truth for all of this.

I think this needs a redesign.

BR,
Jani.

> +	{"SGGI Cmd Parity",	XE_TILE_HW_ERR_SGGI_FATAL		/* Bit Pos 1 */},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
> +	{"DISPLAY",		XE_TILE_HW_ERR_DISPLAY_FATAL		/* Bit Pos 4 */},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
> +	{"GSC error",		XE_TILE_HW_ERR_GSC_FATAL		/* Bit Pos 8 */},
> +	{"SGLI Cmd Parity",	XE_TILE_HW_ERR_SGLI_FATAL		/* Bit Pos 9 */},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
> +	{"SGUNIT",		XE_TILE_HW_ERR_SGUNIT_FATAL		/* Bit Pos 12 */},
> +	{"SGCI Cmd Parity",	XE_TILE_HW_ERR_SGCI_FATAL		/* Bit Pos 13 */},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
> +	{"SOC ERROR",		XE_TILE_HW_ERR_SOC_FATAL		/* Bit Pos 16 */},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_FATAL},
> +	{"MERT Cmd Parity",	XE_TILE_HW_ERR_MERT_FATAL		/* Bit Pos 20 */},
> +};
> +
> +struct error_msg_counter_pair dev_err_stat_nonfatal_reg[] =3D {
> +	{"GT",			XE_TILE_HW_ERR_GT_NONFATAL		/* Bit Pos 0 */},
> +	{"SGGI Data Parity",	XE_TILE_HW_ERR_SGGI_NONFATAL		/* Bit Pos 1 */},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
> +	{"DISPLAY",		XE_TILE_HW_ERR_DISPLAY_NONFATAL		/* Bit Pos 4 */},
> +	{"SGDI Data Parity",	XE_TILE_HW_ERR_SGDI_NONFATAL		/* Bit Pos 5 */},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
> +	{"GSC",			XE_TILE_HW_ERR_GSC_NONFATAL		/* Bit Pos 8 */},
> +	{"SGLI Data Parity",	XE_TILE_HW_ERR_SGLI_NONFATAL		/* Bit Pos 9 */},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
> +	{"SGUNIT",		XE_TILE_HW_ERR_SGUNIT_NONFATAL		/* Bit Pos 12 */},
> +	{"SGCI Data Parity",	XE_TILE_HW_ERR_SGCI_NONFATAL		/* Bit Pos 13 */},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
> +	{"SOC",			XE_TILE_HW_ERR_SOC_NONFATAL		/* Bit Pos 16 */},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL		/* Bit Pos 17 */},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_NONFATAL},
> +	{"MERT Data Parity",	XE_TILE_HW_ERR_MERT_NONFATAL		/* Bit Pos 20 */},
> +};
> +
> +struct error_msg_counter_pair dev_err_stat_correctable_reg[] =3D {
> +	{"GT",			XE_TILE_HW_ERR_GT_CORR			/* Bit Pos 0 */},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
> +	{"DISPLAY",		XE_TILE_HW_ERR_DISPLAY_CORR		/* Bit Pos 4 */},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
> +	{"GSC",			XE_TILE_HW_ERR_GSC_CORR			/* Bit Pos 8 */},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
> +	{"SGUNIT",		XE_TILE_HW_ERR_SGUNIT_CORR		/* Bit Pos 12 */},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
> +	{"SOC",			XE_TILE_HW_ERR_SOC_CORR			/* Bit Pos 16 */},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
> +	{"Undefined",		XE_TILE_HW_ERR_UNKNOWN_CORR},
> +};
> +
> +static void update_valid_error_regs(struct xe_device *xe)
> +{
> +	unsigned long mask =3D 0;
> +
> +	u32 i;
> +
> +	if (xe->info.platform =3D=3D XE_DG2) {
> +		mask =3D ~(0 | DG2_DEV_ERR_STAT_FATAL_MASK);
> +		for_each_set_bit(i, &mask, DEV_ERR_STAT_MAX_ERROR_BIT)
> +			dev_err_stat_fatal_reg[i] =3D (struct error_msg_counter_pair)
> +			{.errmsg =3D "Undefined", .errcounter =3D XE_TILE_HW_ERR_UNKNOWN_FATA=
L};

Nope. For one thing, the arrays really should be static const, placed in
rodata, and not mutable.

For another, if you have a platform with two or more different devices,
whichever gets probed last clobbers the data.

> +
> +		mask =3D ~(0 | DG2_DEV_ERR_STAT_NONFATAL_MASK);
> +		for_each_set_bit(i, &mask, DEV_ERR_STAT_MAX_ERROR_BIT)
> +			dev_err_stat_nonfatal_reg[i] =3D (struct error_msg_counter_pair)
> +			{.errmsg =3D "Undefined", .errcounter =3D XE_TILE_HW_ERR_UNKNOWN_NONF=
ATAL};
> +
> +		mask =3D ~(0 | DG2_DEV_ERR_STAT_CORRECTABLE_MASK);
> +		for_each_set_bit(i, &mask, DEV_ERR_STAT_MAX_ERROR_BIT)
> +			dev_err_stat_correctable_reg[i] =3D (struct error_msg_counter_pair)
> +			{.errmsg =3D "Undefined", .errcounter =3D XE_TILE_HW_ERR_UNKNOWN_CORR=
};
> +	} else if (xe->info.platform =3D=3D XE_PVC) {
> +		mask =3D ~(0 | PVC_DEV_ERR_STAT_FATAL_MASK);
> +		for_each_set_bit(i, &mask, DEV_ERR_STAT_MAX_ERROR_BIT)
> +			dev_err_stat_fatal_reg[i] =3D (struct error_msg_counter_pair)
> +			{.errmsg =3D "Undefined", .errcounter =3D XE_TILE_HW_ERR_UNKNOWN_FATA=
L};
> +
> +		mask =3D ~(0 | PVC_DEV_ERR_STAT_NONFATAL_MASK);
> +		for_each_set_bit(i, &mask, DEV_ERR_STAT_MAX_ERROR_BIT)
> +			dev_err_stat_nonfatal_reg[i] =3D (struct error_msg_counter_pair)
> +			{.errmsg =3D "Undefined", .errcounter =3D XE_TILE_HW_ERR_UNKNOWN_NONF=
ATAL};
> +
> +		mask =3D ~(0 | PVC_DEV_ERR_STAT_CORRECTABLE_MASK);
> +		for_each_set_bit(i, &mask, DEV_ERR_STAT_MAX_ERROR_BIT)
> +			dev_err_stat_correctable_reg[i] =3D (struct error_msg_counter_pair)
> +			{.errmsg =3D "Undefined", .errcounter =3D XE_TILE_HW_ERR_UNKNOWN_CORR=
};
> +	}
> +}
> +
> +static void
> +xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_err=
or hw_err)
> +{
> +	const char *hw_err_str =3D hardware_error_type_to_str(hw_err);
> +	struct error_msg_counter_pair *errstat;
> +	unsigned long errsrc;
> +	unsigned long flags;
> +	const char *errmsg;
> +	struct xe_gt *mmio;
> +	u32 counter;
> +	u32 errcntr;
> +	u32 errbit;
> +
> +	switch (hw_err) {
> +	case HARDWARE_ERROR_FATAL:
> +		errstat =3D (struct error_msg_counter_pair *)dev_err_stat_fatal_reg;

Why the casts?

> +		counter =3D XE_TILE_HW_ERR_UNKNOWN_FATAL;
> +		break;
> +	case HARDWARE_ERROR_NONFATAL:
> +		errstat =3D (struct error_msg_counter_pair *)dev_err_stat_nonfatal_reg;
> +		counter =3D XE_TILE_HW_ERR_UNKNOWN_NONFATAL;
> +		break;
> +	case HARDWARE_ERROR_CORRECTABLE:
> +		errstat =3D (struct error_msg_counter_pair *)dev_err_stat_correctable_=
reg;
> +		counter =3D XE_TILE_HW_ERR_UNKNOWN_CORR;
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	spin_lock_irqsave(&tile_to_xe(tile)->irq.lock, flags);
> +	mmio =3D tile->primary_gt;
> +	errsrc =3D xe_mmio_read32(mmio, DEV_ERR_STAT_REG(hw_err));
> +
> +	if (!errsrc) {
> +		xe_tile_log_hw_err(tile, "DEV_ERR_STAT_REG_%s blank!\n", hw_err_str);
> +		goto unlock;
> +	}
> +
> +	for_each_set_bit(errbit, &errsrc, REG_SIZE) {
> +		if (errbit < DEV_ERR_STAT_MAX_ERROR_BIT) {
> +			errmsg =3D errstat[errbit].errmsg;
> +			errcntr =3D errstat[errbit].errcounter;
> +		} else {
> +			errmsg =3D "Undefined";
> +			errcntr =3D counter;
> +		}
> +
> +		if (hw_err =3D=3D HARDWARE_ERROR_CORRECTABLE)
> +			xe_tile_log_hw_warn(tile, "%s %s error bit[%d] is set\n",
> +					    errmsg, hw_err_str, errbit);
> +		else
> +			xe_tile_log_hw_err(tile, "%s %s error bit[%d] is set\n",
> +					   errmsg, hw_err_str, errbit);
> +
> +		tile->errors.hw[errcntr]++;
> +	}
> +
> +	xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
> +unlock:
> +	spin_unlock_irqrestore(&tile_to_xe(tile)->irq.lock, flags);
> +}
> +
> +/*
> + * XE Platforms adds three Error bits to the Master Interrupt
> + * Register to support error handling. These three bits are
> + * used to convey the class of error:
> + * FATAL, NONFATAL, or CORRECTABLE.
> + *
> + * To process an interrupt:
> + *       Determine source of error (IP block) by reading
> + *	 the Device Error Source Register (RW1C) that
> + *	 corresponds to the class of error being serviced
> + *	 and log the error.
> + */
> +static void
> +xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
> +{
> +	enum hardware_error hw_err;
> +
> +	for (hw_err =3D 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
> +		if (master_ctl & XE_ERROR_IRQ(hw_err))
> +			xe_hw_error_source_handler(tile, hw_err);
> +	}
> +}
> +
>  /*
>   * Top-level interrupt handler for Xe_LP+ and beyond.  These platforms h=
ave
>   * a "master tile" interrupt register which must be consulted before the
> @@ -413,6 +630,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  		xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
>=20=20
>  		gt_irq_handler(tile, master_ctl, intr_dw, identity);
> +		xe_hw_error_irq_handler(tile, master_ctl);
>=20=20
>  		/*
>  		 * Display interrupts (including display backlight operations
> @@ -561,6 +779,8 @@ int xe_irq_install(struct xe_device *xe)
>  		return -EINVAL;
>  	}
>=20=20
> +	update_valid_error_regs(xe);
> +
>  	xe->irq.enabled =3D true;
>=20=20
>  	xe_irq_reset(xe);

--=20
Jani Nikula, Intel Open Source Graphics Center
