Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0796AE9DE60
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 07:59:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B436F10E75B;
	Thu,  9 Apr 2026 07:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/ch2Y7F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9BE10E75B
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 07:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775721563; x=1807257563;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=c3f3GQlpfYlaxwk6wxwLIxoZW5JrZN+1KMWthyNLOvg=;
 b=G/ch2Y7FfRYOEuhKH8BpbetNpOypHEQXeKSWuObIpQUaYtU5ZS4yqFUP
 Z362wwQvPWsG2NwzVltpdRkTHkqA+eLhdKZmPcOOvBvLWp9KaYch752xg
 42WKFUUmpsuhF9JUqg3ckbb6y7HUZxpecZiLTIwXXPco1argIF7D/67LO
 wRQcuSU9B0/KJa3W1HhvkqksWd3VSrunBqf/bdmgLsGFLCMoTAZQ5+Fai
 c+grw9jbeUxH1GU+y4+nOESRfZhoKZvjQuer59wFNyOodghIHN6c0kRCP
 CEKgpz1gxZ4Rz8ZfDxB57c38ZWVWQnMVnXhz4LOa7DHbqHl2FNapL/NgX A==;
X-CSE-ConnectionGUID: RUFj/Q3xSuCnwfGLSYT0ZA==
X-CSE-MsgGUID: 0qbWYI/XReqjbv6LVOb4Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76598809"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="76598809"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 00:59:22 -0700
X-CSE-ConnectionGUID: mc3btS1xRdCMoEZ4A3JawA==
X-CSE-MsgGUID: Jo3lvXjgRxC0RFsYaGoi+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="259143866"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 00:59:19 -0700
Date: Thu, 9 Apr 2026 09:59:15 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, soham.purkait@intel.com,
 anoop.c.vijay@intel.com, aravind.iddamsetty@linux.intel.com,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v5 3/3] drm/xe/ras: Introduce correctable error handling
Message-ID: <addcU5zQdatlPM4S@black.igk.intel.com>
References: <20260407110629.198158-1-raag.jadav@intel.com>
 <20260407110629.198158-4-raag.jadav@intel.com>
 <9f054c64-07a1-4f29-b4e8-dfacd52a619f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f054c64-07a1-4f29-b4e8-dfacd52a619f@intel.com>
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

On Wed, Apr 08, 2026 at 05:55:17PM +0530, Mallesh, Koujalagi wrote:
> On 07-04-2026 04:36 pm, Raag Jadav wrote:
> > Add initial support for correctable error handling which is serviced
> > using system controller event. Currently we only log the errors in
> > dmesg but this serves as a foundation for RAS infrastructure and will
> > be further extended to facilitate other RAS features.
> > 
> > Signed-off-by: Raag Jadav<raag.jadav@intel.com>
> > ---
> > v4: Fix Severity/Component logging (Mallesh)
> >      s/xe_ras_error/xe_ras_error_class (Riana)
> > v5: Handle unexpected counter threshold crossed (Mallesh)
> > ---
> >   drivers/gpu/drm/xe/Makefile           |  1 +
> >   drivers/gpu/drm/xe/xe_ras.c           | 96 +++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_ras.h           | 14 ++++
> >   drivers/gpu/drm/xe/xe_ras_types.h     | 73 ++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_sysctrl_event.c |  3 +-
> >   5 files changed, 186 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
> >   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
> >   create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index c0e820eeea30..f66561977a45 100644
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
> > index 000000000000..6f84ade02057
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_ras.c
> > @@ -0,0 +1,96 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
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
> Unused xe parameter, remove it

Sure.

> > +	if (sev >= XE_RAS_SEV_MAX)
> > +		sev = XE_RAS_SEV_NOT_SUPPORTED;
> > +
> > +	return xe_ras_severities[sev];
> > +}
> > +
> > +static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
> > +{
> ditto
> > +	if (comp >= XE_RAS_COMP_MAX)
> > +		comp = XE_RAS_COMP_NOT_SUPPORTED;
> > +
> > +	return xe_ras_components[comp];
> > +}
> > +
> > +void xe_ras_threshold_crossed(struct xe_sysctrl *sc, struct xe_sysctrl_event_response *response)
> > +{
> > +	struct xe_ras_threshold_crossed_data *pending = (void *)&response->data;
> > +	struct xe_ras_error_class *errors = pending->counters;
> > +	struct xe_device *xe = sc_to_xe(sc);
> > +	u32 ncounters = pending->ncounters;
> > +	u32 cid, sev, comp, inst, cause;
> > +	u8 tile;
> > +
> > +	if (!ncounters || ncounters >= XE_RAS_NUM_COUNTERS) {
> 
> if ncounters are 16, then it's logged in error, however for (cid = 0; cid <
> ncounters; cid++)
> 
> safely accesses up to ncounters - 1. So check should be
> 
> if (!ncounters || ncounters > XE_RAS_NUM_COUNTERS) right?

Good catch.

> > +		xe_err(xe, "sysctrl: unexpected counter threshold crossed %u\n", ncounters);
> 
> Use "[RAS]: ", since code is RAS owned.

Agree, but this'll be misleading because it gives the impression of RAS
error, which it is not.

Raag

> > +		return;
> > +	}
> > +
> > +	BUILD_BUG_ON(sizeof(response->data) < sizeof(*pending));
> > +	xe_warn(xe, "[RAS]: counter threshold crossed, %u new errors\n", ncounters);
> > +
> > +	for (cid = 0; cid < ncounters; cid++) {
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
> > index 8a2e44f4f5e0..139ecd4aafcd 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> > @@ -6,6 +6,7 @@
> >   #include "xe_device.h"
> >   #include "xe_irq.h"
> >   #include "xe_printk.h"
> > +#include "xe_ras.h"
> >   #include "xe_sysctrl.h"
> >   #include "xe_sysctrl_event_types.h"
> >   #include "xe_sysctrl_mailbox.h" @@ -38,7 +39,7 @@ static void
> > xe_sysctrl_get_pending_event(struct xe_sysctrl *sc, } if (response.event
> > == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED) { - xe_warn(xe, "[RAS]: counter
> > threshold crossed\n");
> > +			xe_ras_threshold_crossed(sc, &response);
> >   		} else {
> >   			xe_err(xe, "sysctrl: unexpected event %#x\n", response.event);
> >   			return;
