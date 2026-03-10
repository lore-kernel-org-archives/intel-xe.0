Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20346FD2D63
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 12:12:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D216310E279;
	Tue, 10 Mar 2026 12:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TvNceBrh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7407410E279
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 12:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773144727; x=1804680727;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qSppQWVMyTzxtgBwzTSxBbHOtCmiZmPObvaokbrHlhI=;
 b=TvNceBrhU+yMt0ndtKtxt/c2Ift6sZ8h8YfcaUw12Rja2xlqxmJCC7q7
 Ao51cuxlVlRcqZCkH/G3U216A70NU9WeQXzpJk2vlzCAWt+ri7dgsZfRI
 5c401BXMtDKDrL9PreMZcuGnmtmWgYi68UaeeYI7ytK3s0pCVwSPs29w0
 ZswGIVHeMxFnIp/w8KxmiAgSL0Hgm2P12ix92gsJcZkp0Gwaovek7u4Eu
 611gz122G5RUgqc3G5ESlYonAKe1yLIlEe6m5evcfAvC+NVwLEs6HYAM6
 hV+ggvmUtIdvf/dKrWvjVNufmopCrmWYYjLSdz2Wf53uGCTTjQ+3t0CeE Q==;
X-CSE-ConnectionGUID: L15rutcQTBC/QM58g5E2WQ==
X-CSE-MsgGUID: kbbSfyBLQL2C/+ErHH2+Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84900031"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="84900031"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 05:12:07 -0700
X-CSE-ConnectionGUID: Ow4eLBYfQAadWErALANtVA==
X-CSE-MsgGUID: RrcAng/WR0SS9B9k+cC8Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="243106646"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 05:12:05 -0700
Date: Tue, 10 Mar 2026 13:12:02 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, soham.purkait@intel.com,
 anoop.c.vijay@intel.com
Subject: Re: [PATCH v2 4/4] drm/xe/ras: Introduce correctable error handling
Message-ID: <abAKkvGtfxeAjvcX@black.igk.intel.com>
References: <20260213081644.2085314-1-raag.jadav@intel.com>
 <20260213081644.2085314-5-raag.jadav@intel.com>
 <69bc7fd7-b1ca-4949-8eaa-15208ae1d38b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69bc7fd7-b1ca-4949-8eaa-15208ae1d38b@intel.com>
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

On Tue, Mar 10, 2026 at 03:48:35PM +0530, Mallesh, Koujalagi wrote:
> On 13-02-2026 01:46 pm, Raag Jadav wrote:
> > Add initial support for correctable error handling which is serviced
> > using system controller event. Currently we only log the errors in
> > dmesg but this serves as a foundation for RAS infrastructure and will
> > be further extended to facilitate other RAS features.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >   drivers/gpu/drm/xe/Makefile           |  1 +
> >   drivers/gpu/drm/xe/xe_ras.c           | 87 +++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_ras.h           | 14 +++++
> >   drivers/gpu/drm/xe/xe_ras_types.h     | 79 ++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_sysctrl_event.c |  3 +-
> >   5 files changed, 183 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
> >   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
> >   create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 59e083f90d7e..7fc67c320086 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -111,6 +111,7 @@ xe-y += xe_bb.o \
> >   	xe_pxp_submit.o \
> >   	xe_query.o \
> >   	xe_range_fence.o \
> > +	xe_ras.o \
> >   	xe_reg_sr.o \
> >   	xe_reg_whitelist.o \
> >   	xe_ring_ops.o \
> > diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> > new file mode 100644
> > index 000000000000..413c6e62cd50
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_ras.c
> > @@ -0,0 +1,87 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#include "xe_assert.h"
> > +#include "xe_printk.h"
> > +#include "xe_ras.h"
> > +#include "xe_ras_types.h"
> > +#include "xe_sysctrl_event_types.h"
> > +
> > +/* Severity of detected errors  */
> > +enum xe_ras_severity {
> > +	XE_RAS_SEV_NOT_SUPPORTED		= 0x00,
> > +	XE_RAS_SEV_CORRECTABLE			= 0x01,
> > +	XE_RAS_SEV_UNCORRECTABLE		= 0x02,
> > +	XE_RAS_SEV_INFORMATIONAL		= 0x03,
> > +	XE_RAS_SEV_MAX
> > +};
> > +
> > +/* Major IP blocks/components where errors can originate */
> > +enum xe_ras_component {
> > +	XE_RAS_COMP_NOT_SUPPORTED		= 0x00,
> > +	XE_RAS_COMP_DEVICE_MEMORY		= 0x01,
> > +	XE_RAS_COMP_CORE_COMPUTE		= 0x02,
> > +	XE_RAS_COMP_RESERVED			= 0x03,
> > +	XE_RAS_COMP_PCIE			= 0x04,
> > +	XE_RAS_COMP_FABRIC			= 0x05,
> > +	XE_RAS_COMP_SOC_INTERNAL		= 0x06,
> > +	XE_RAS_COMP_MAX
> > +};
> > +
> > +static const char *const xe_ras_severities[] = {
> > +	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
> > +	[XE_RAS_SEV_CORRECTABLE]		= "Correctable",
> > +	[XE_RAS_SEV_UNCORRECTABLE]		= "Uncorrectable",
> > +	[XE_RAS_SEV_INFORMATIONAL]		= "Informational",
> > +};
> > +static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEV_MAX);
> > +
> > +static const char *const xe_ras_components[] = {
> > +	[XE_RAS_COMP_NOT_SUPPORTED]		= "Not Supported",
> > +	[XE_RAS_COMP_DEVICE_MEMORY]		= "Device Memory",
> > +	[XE_RAS_COMP_CORE_COMPUTE]		= "Core Compute",
> > +	[XE_RAS_COMP_RESERVED]			= "Reserved",
> > +	[XE_RAS_COMP_PCIE]			= "PCIe",
> > +	[XE_RAS_COMP_FABRIC]			= "Fabric",
> > +	[XE_RAS_COMP_SOC_INTERNAL]		= "SoC Internal",
> > +};
> > +static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
> > +
> > +static inline const char *sev_to_str(struct xe_device *xe, u32 sev)
> > +{
> > +	xe_assert(xe, sev < XE_RAS_SEV_MAX);
> > +
> > +	return xe_ras_severities[sev];
> > +}
> > +
> > +static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
> > +{
> > +	xe_assert(xe, comp < XE_RAS_COMP_MAX);
> > +
> > +	return xe_ras_components[comp];
> > +}
> > +
> > +void xe_ras_event_log(struct xe_device *xe, struct xe_sysctrl_event_response *response)
> > +{
> > +	struct xe_ras_event_threshold_crossed *pending = (void *)&response->data;
> > +	struct xe_ras_error *errors = pending->counters;
> > +	u32 cid, sev, comp, inst, cause;
> > +	u8 tile;
> > +
> > +	xe_warn(xe, "[RAS]: error counter threshold crossed\n");
> > +	xe_assert(xe, pending->ncounters < XE_RAS_NUM_COUNTERS);
> > +
> > +	for (cid = 0; cid < pending->ncounters; cid++) {
> > +		sev = errors[cid].common.severity;
> > +		comp = errors[cid].common.component;
> > +
> > +		tile = errors[cid].product.unit.tile;
> > +		inst = errors[cid].product.unit.instance;
> > +		cause = errors[cid].product.cause.cause;
> > +
> Unaligned access of member cause penalty, we need to check.

I'm okay with aligning but not sure if the firmware will accept it.
Let's check with arch.

> > +		xe_warn(xe, "[RAS]: Error:%s Tile:%u Component:%s Instance:%u Cause:%#x\n",
> > +			sev_to_str(xe, sev), tile, comp_to_str(xe, comp), inst, cause);
> 
> Spam kernel Log, we can use rate limit right?

Yep.

Raag

> > +	}
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> > new file mode 100644
> > index 000000000000..fdefe0e2fe98
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_ras.h
> > @@ -0,0 +1,14 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_RAS_H_
> > +#define _XE_RAS_H_
> > +
> > +struct xe_device;
> > +struct xe_sysctrl_event_response;
> > +
> > +void xe_ras_event_log(struct xe_device *xe, struct xe_sysctrl_event_response *response);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> > new file mode 100644
> > index 000000000000..0afcf8bf982d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> > @@ -0,0 +1,79 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_RAS_TYPES_H_
> > +#define _XE_RAS_TYPES_H_
> > +
> > +#include <linux/types.h>
> > +
> > +#define XE_RAS_NUM_COUNTERS			21
> > +
> > +/**
> > + * struct xe_ras_error_common - Error fields that are common across all products
> > + */
> > +struct xe_ras_error_common {
> > +	/** @severity: Error severity */
> > +	u8 severity;
> > +	/** @component: IP block where error originated */
> > +	u8 component;
> > +} __packed;
> > +
> > +/**
> > + * struct xe_ras_error_unit - Error unit information
> > + */
> > +struct xe_ras_error_unit {
> > +	/** @tile: Tile identifier */
> > +	u8 tile;
> > +	/** @instance: Instance identifier specific to IP */
> > +	u32 instance;
> > +} __packed;
> > +
> > +/**
> > + * struct xe_ras_error_cause - Error cause information
> > + */
> > +struct xe_ras_error_cause {
> > +	/** @cause: Cause/checker */
> > +	u32 cause;
> > +	/** @reserved: For future use */
> > +	u8 reserved;
> > +} __packed;
> > +
> > +/**
> > + * struct xe_ras_error_product - Error fields that are specific to the product
> > + */
> > +struct xe_ras_error_product {
> > +	/** @unit: Unit within IP block */
> > +	struct xe_ras_error_unit unit;
> > +	/** @cause: Cause/checker */
> > +	struct xe_ras_error_cause cause;
> > +} __packed;
> > +
> > +/**
> > + * struct xe_ras_error - Combines common and product-specific parts
> > + */
> > +struct xe_ras_error {
> > +	/** @common: Common error type and component */
> > +	struct xe_ras_error_common common;
> > +	/** @product: Product-specific unit and cause */
> > +	struct xe_ras_error_product product;
> > +} __packed;
> > +
> > +/**
> > + * struct xe_ras_event_threshold_crossed - Event data for counter threshold crossed event
> > + */
> > +struct xe_ras_event_threshold_crossed {
> > +	/** @ncounters: Number of counters that crossed thresholds */
> > +	u32 ncounters;
> > +	/** @ts_high: Higher 32 bits of event timestamp */
> > +	u32 ts_high;
> > +	/** @ts_low: Lower 32 bits of event timestamp */
> > +	u32 ts_low;
> > +	/** @reason: Threshold cross reason */
> > +	u32 reason;
> > +	/** @counters: Array of error counters that crossed threshold */
> > +	struct xe_ras_error counters[XE_RAS_NUM_COUNTERS];
> > +} __packed;
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> > index 7c3041f4196a..876754f9fe35 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> > @@ -7,6 +7,7 @@
> >   #include "xe_device.h"
> >   #include "xe_irq.h"
> >   #include "xe_printk.h"
> > +#include "xe_ras.h"
> >   #include "xe_sysctrl.h"
> >   #include "xe_sysctrl_event_types.h"
> >   #include "xe_sysctrl_mailbox.h"
> > @@ -37,7 +38,7 @@ static void xe_sysctrl_get_pending_event(struct xe_device *xe,
> >   		}
> >   		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED) {
> > -			xe_warn(xe, "[RAS]: error counter threshold crossed\n");
> > +			xe_ras_event_log(xe, &response);
> >   		} else {
> >   			xe_err(xe, "sysctrl: unexpected event %#x\n", response.event);
> >   			return;
