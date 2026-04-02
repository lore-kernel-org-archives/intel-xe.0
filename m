Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1F4CC6B35
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 08:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D614410F0F2;
	Thu,  2 Apr 2026 08:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+BHXhWA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4458E10F0F2
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 08:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775119391; x=1806655391;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=N7ysPoFZLfH/s6oaAYcOj2EK73/nMWiSs7b/f9wh/mw=;
 b=M+BHXhWALE6AnGYwF/L9KACrL+5wB2gjZT0GzE1pbMdLiHDB5L4No+VI
 SdNwyZarRENgAxkr/n9eIZbrPtY4AfkxM+9R1mYUrAJ+scra7nuzvvrUK
 W4E2O0LbekPGQJxd/bGVRrsdIwdXq1flEayLHtBhAgC+1bRHZh/6qSQgl
 lrSmNvBWEKKOx+sl/jHQLd3+vYGnBbLMihtKCPeT4i7ifdE9pAs1C13e/
 vY2RqIl1j5BJmrHLPqO/jYyeol4Fd5LW7ocAiUK3/S1YSC41R1fSy/TeP
 20OlpcxVIqM7aLrM0RKiRA5iouxlrkcbmnsyq+un9avkstg/qF8fLO7oB w==;
X-CSE-ConnectionGUID: CDd30WONQbWPOVMRQZWN4A==
X-CSE-MsgGUID: p9GgYNvPQrm7zYLSXW01cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87633769"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="87633769"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 01:43:10 -0700
X-CSE-ConnectionGUID: jwnXhLqNTXWZRPLr1A/y8w==
X-CSE-MsgGUID: 8LHKpgM5TQ2cnJ/zji3eBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="249983837"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 01:43:08 -0700
Date: Thu, 2 Apr 2026 10:43:05 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, soham.purkait@intel.com,
 anoop.c.vijay@intel.com, aravind.iddamsetty@linux.intel.com,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v4 3/3] drm/xe/ras: Introduce correctable error handling
Message-ID: <ac4sGWNus4QPhUXh@black.igk.intel.com>
References: <20260331102346.1034100-1-raag.jadav@intel.com>
 <20260331102346.1034100-4-raag.jadav@intel.com>
 <31d8faec-78f8-4740-ad6a-19ccb8677fb4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31d8faec-78f8-4740-ad6a-19ccb8677fb4@intel.com>
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

On Wed, Apr 01, 2026 at 03:01:56PM +0530, Mallesh, Koujalagi wrote:
> On 31-03-2026 03:53 pm, Raag Jadav wrote:
> > Add initial support for correctable error handling which is serviced
> > using system controller event. Currently we only log the errors in
> > dmesg but this serves as a foundation for RAS infrastructure and will
> > be further extended to facilitate other RAS features.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> > v4: Fix Severity/Component logging (Mallesh)
> > v4: s/xe_ras_error/xe_ras_error_class (Riana)
> > ---
> >   drivers/gpu/drm/xe/Makefile           |  1 +
> >   drivers/gpu/drm/xe/xe_ras.c           | 90 +++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_ras.h           | 14 +++++
> >   drivers/gpu/drm/xe/xe_ras_types.h     | 73 ++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_sysctrl_event.c |  3 +-
> >   5 files changed, 180 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
> >   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
> >   create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 593b359bbaca..1ecafb854355 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -113,6 +113,7 @@ xe-y += xe_bb.o \
> >   	xe_pxp_submit.o \
> >   	xe_query.o \
> >   	xe_range_fence.o \
> > +	xe_ras.o \
> >   	xe_reg_sr.o \
> >   	xe_reg_whitelist.o \
> >   	xe_ring_ops.o \
> > diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> > new file mode 100644
> > index 000000000000..4048350def97
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_ras.c
> > @@ -0,0 +1,90 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#include "xe_assert.h"
> > +#include "xe_printk.h"
> > +#include "xe_ras.h"
> > +#include "xe_ras_types.h"
> > +#include "xe_sysctrl.h"
> > +#include "xe_sysctrl_event_types.h"
> > +
> > +/* Severity of detected errors  */
> > +enum xe_ras_severity {
> > +	XE_RAS_SEV_NOT_SUPPORTED = 0,
> > +	XE_RAS_SEV_CORRECTABLE,
> > +	XE_RAS_SEV_UNCORRECTABLE,
> > +	XE_RAS_SEV_INFORMATIONAL,
> > +	XE_RAS_SEV_MAX
> > +};
> > +
> > +/* Major IP blocks/components where errors can originate */
> > +enum xe_ras_component {
> > +	XE_RAS_COMP_NOT_SUPPORTED = 0,
> > +	XE_RAS_COMP_DEVICE_MEMORY,
> > +	XE_RAS_COMP_CORE_COMPUTE,
> > +	XE_RAS_COMP_RESERVED,
> > +	XE_RAS_COMP_PCIE,
> > +	XE_RAS_COMP_FABRIC,
> > +	XE_RAS_COMP_SOC_INTERNAL,
> > +	XE_RAS_COMP_MAX
> > +};
> > +
> > +static const char *const xe_ras_severities[] = {
> > +	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
> > +	[XE_RAS_SEV_CORRECTABLE]		= "Correctable",
> > +	[XE_RAS_SEV_UNCORRECTABLE]		= "Uncorrectable",
> > +	[XE_RAS_SEV_INFORMATIONAL]		= "Informational",
> > +};
> Please use a blank line after structure declaration

Most likely it'll be redundant, so unless there are readability concerns
I'd like to keep this way.

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
> Same here
> > +static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
> > +
> > +static inline const char *sev_to_str(struct xe_device *xe, u32 sev)
> > +{
> > +	xe_assert(xe, sev < XE_RAS_SEV_MAX);
> > +
> > +	return sev < XE_RAS_SEV_MAX ? xe_ras_severities[sev] : "Unknown";
> > +}
> > +
> > +static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
> > +{
> > +	xe_assert(xe, comp < XE_RAS_COMP_MAX);
> > +
> > +	return comp < XE_RAS_COMP_MAX ? xe_ras_components[comp] : "Unknown";
> > +}
> > +
> > +void xe_ras_threshold_crossed(struct xe_sysctrl *sc, struct xe_sysctrl_event_response *response)
> > +{
> > +	struct xe_ras_threshold_crossed_data *pending = (void *)&response->data;
> > +	struct xe_ras_error_class *errors = pending->counters;
> > +	struct xe_device *xe = sc_to_xe(sc);
> > +	u32 cid, sev, comp, inst, cause;
> > +	u8 tile;
> > +
> > +	BUILD_BUG_ON(sizeof(response->data) < sizeof(*pending));
> > +	xe_assert(xe, pending->ncounters < XE_RAS_NUM_COUNTERS);
> 
> Boundary check is required, in production line xe_assert as no_op.

We already do, but I can a separate xe_err() if it helps.

Raag

> > +	xe_warn(xe, "[RAS]: counter threshold crossed, %u new errors\n", pending->ncounters);
> > +
> > +	for (cid = 0; cid < pending->ncounters && cid < XE_RAS_NUM_COUNTERS; cid++) {
> > +		sev = errors[cid].common.severity;
> > +		comp = errors[cid].common.component;
> > +
> > +		tile = errors[cid].product.unit.tile;
> > +		inst = errors[cid].product.unit.instance;
> > +		cause = errors[cid].product.cause.cause;
> > +
> > +		xe_warn(xe, "[RAS]: Tile:%u Instance:%u Component:%s Error:%s Cause:%#x\n",
> > +			tile, inst, comp_to_str(xe, comp), sev_to_str(xe, sev), cause);
> > +	}
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> > new file mode 100644
> > index 000000000000..92ee93d4e877
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
> > +struct xe_sysctrl;
> > +struct xe_sysctrl_event_response;
> > +
> > +void xe_ras_threshold_crossed(struct xe_sysctrl *sc, struct xe_sysctrl_event_response *response);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> > new file mode 100644
> > index 000000000000..0e3ba9e81538
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> > @@ -0,0 +1,73 @@
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
> > +#define XE_RAS_NUM_COUNTERS			16
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
> > + * struct xe_ras_error_class - Combines common and product-specific parts
> > + */
> > +struct xe_ras_error_class {
> > +	/** @common: Common error type and component */
> > +	struct xe_ras_error_common common;
> > +	/** @product: Product-specific unit and cause */
> > +	struct xe_ras_error_product product;
> > +} __packed;
> > +
> > +/**
> > + * struct xe_ras_threshold_crossed_data - Data for threshold crossed event
> > + */
> > +struct xe_ras_threshold_crossed_data {
> > +	/** @ncounters: Number of error counters that crossed thresholds */
> > +	u32 ncounters;
> > +	/** @counters: Array of error counters that crossed threshold */
> > +	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
> > +} __packed;
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> > index 800d100f09c5..139ecd4aafcd 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> > @@ -6,6 +6,7 @@
> >   #include "xe_device.h"
> >   #include "xe_irq.h"
> >   #include "xe_printk.h"
> > +#include "xe_ras.h"
> >   #include "xe_sysctrl.h"
> >   #include "xe_sysctrl_event_types.h"
> >   #include "xe_sysctrl_mailbox.h"
> > @@ -38,7 +39,7 @@ static void xe_sysctrl_get_pending_event(struct xe_sysctrl *sc,
> >   		}
> >   		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED) {
> > -			xe_warn(xe, "[RAS]: error counter threshold crossed\n");
> > +			xe_ras_threshold_crossed(sc, &response);
> >   		} else {
> >   			xe_err(xe, "sysctrl: unexpected event %#x\n", response.event);
> >   			return;
