Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91AEF532D0
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 04:43:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C3510E01F;
	Tue, 24 Mar 2026 04:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2WVt2Ti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5C610E01F
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 04:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774327436; x=1805863436;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Z4EQlgG4utdiVQ7+j8umuXkej2bq2p9UqnQWSw2F6eY=;
 b=U2WVt2Ti1Pao8alHsKKbTilVUe6+Q8whChVLR3xsOt9XMVUq8Up8BXQI
 S7bRFsb+D+F7rjUzCV82052igHeE5i1pX7k6YbdAW4p7tcLLZiDs4OFze
 HXWAyxumyhAy7Io72SJbm31AAToiblRNrDlztQp0ChzJH9Pw22hnIGdJK
 fhTvGYjye4yqHdfQqb/m8nrgTlBXawAuzTRLgAShsfD8pPeaBmk9+lj08
 0Ti5ASZlsMIP6lz+qPlUWtWvMLMzy8ErwFsBmaeUSVglSanxYVzbgbVEb
 ly6S5Q8YU5U6TvC3NUjajraBvmOAo9AyKZHxgmx7CQIVgdSlkcSoBRpbS A==;
X-CSE-ConnectionGUID: 1qeRGPzcTG6w9kmvwnLBrw==
X-CSE-MsgGUID: NcnASoIkTZCdUZa0nmGmHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="79193934"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="79193934"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 21:43:55 -0700
X-CSE-ConnectionGUID: y+itUTnvTqmVfi8SOpYWSg==
X-CSE-MsgGUID: UymUlduFRSmURvSvSWI/iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="224208573"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 21:43:52 -0700
Date: Tue, 24 Mar 2026 05:43:49 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, umesh.nerlige.ramappa@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 aravind.iddamsetty@linux.intel.com, Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v3 4/4] drm/xe/ras: Introduce correctable error handling
Message-ID: <acIWhfiaL3nLZ6Ic@black.igk.intel.com>
References: <20260312090657.4026013-1-raag.jadav@intel.com>
 <20260312090657.4026013-5-raag.jadav@intel.com>
 <3aa996d4-1ae2-4bdf-9a07-0c6c345e9328@intel.com>
 <acEn7YTv53VZL6Jj@black.igk.intel.com>
 <760c7a68-2755-449a-b1ca-8e9ef3bd9886@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <760c7a68-2755-449a-b1ca-8e9ef3bd9886@intel.com>
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

On Mon, Mar 23, 2026 at 08:16:23PM +0530, Mallesh, Koujalagi wrote:
> On 23-03-2026 05:15 pm, Raag Jadav wrote:
> > On Thu, Mar 19, 2026 at 07:30:06PM +0530, Tauro, Riana wrote:
> > > On 3/12/2026 2:36 PM, Raag Jadav wrote:
> > > > Add initial support for correctable error handling which is serviced
> > > > using system controller event. Currently we only log the errors in
> > > > dmesg but this serves as a foundation for RAS infrastructure and will
> > > > be further extended to facilitate other RAS features.
> > > > 
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/Makefile           |  1 +
> > > >    drivers/gpu/drm/xe/xe_ras.c           | 89 +++++++++++++++++++++++++++
> > > >    drivers/gpu/drm/xe/xe_ras.h           | 14 +++++
> > > >    drivers/gpu/drm/xe/xe_ras_types.h     | 73 ++++++++++++++++++++++
> > > >    drivers/gpu/drm/xe/xe_sysctrl_event.c |  3 +-
> > > >    5 files changed, 179 insertions(+), 1 deletion(-)
> > > >    create mode 100644 drivers/gpu/drm/xe/xe_ras.c
> > > >    create mode 100644 drivers/gpu/drm/xe/xe_ras.h
> > > >    create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > > index 373adb20afb2..9811cf732260 100644
> > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > @@ -113,6 +113,7 @@ xe-y += xe_bb.o \
> > > >    	xe_pxp_submit.o \
> > > >    	xe_query.o \
> > > >    	xe_range_fence.o \
> > > > +	xe_ras.o \
> > > >    	xe_reg_sr.o \
> > > >    	xe_reg_whitelist.o \
> > > >    	xe_ring_ops.o \
> > > > diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> > > > new file mode 100644
> > > > index 000000000000..37a996a6abf8
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_ras.c
> > > > @@ -0,0 +1,89 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright © 2026 Intel Corporation
> > > > + */
> > > > +
> > > > +#include "xe_assert.h"
> > > > +#include "xe_printk.h"
> > > > +#include "xe_ras.h"
> > > > +#include "xe_ras_types.h"
> > > > +#include "xe_sysctrl.h"
> > > > +#include "xe_sysctrl_event_types.h"
> > > > +
> > > > +/* Severity of detected errors  */
> > > > +enum xe_ras_severity {
> > > > +	XE_RAS_SEV_NOT_SUPPORTED = 0,
> > > > +	XE_RAS_SEV_CORRECTABLE,
> > > > +	XE_RAS_SEV_UNCORRECTABLE,
> > > > +	XE_RAS_SEV_INFORMATIONAL,
> > > > +	XE_RAS_SEV_MAX
> > > > +};
> > > > +
> > > > +/* Major IP blocks/components where errors can originate */
> > > > +enum xe_ras_component {
> > > > +	XE_RAS_COMP_NOT_SUPPORTED = 0,
> > > > +	XE_RAS_COMP_DEVICE_MEMORY,
> > > > +	XE_RAS_COMP_CORE_COMPUTE,
> > > > +	XE_RAS_COMP_RESERVED,
> > > > +	XE_RAS_COMP_PCIE,
> > > > +	XE_RAS_COMP_FABRIC,
> > > > +	XE_RAS_COMP_SOC_INTERNAL,
> > > > +	XE_RAS_COMP_MAX
> > > > +};
> > > > +
> > > > +static const char *const xe_ras_severities[] = {
> > > > +	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
> > > > +	[XE_RAS_SEV_CORRECTABLE]		= "Correctable",
> > > > +	[XE_RAS_SEV_UNCORRECTABLE]		= "Uncorrectable",
> > > > +	[XE_RAS_SEV_INFORMATIONAL]		= "Informational",
> > > > +};
> > > > +static_assert(ARRAY_SIZE(xe_ras_severities) == XE_RAS_SEV_MAX);
> > > > +
> > > > +static const char *const xe_ras_components[] = {
> > > > +	[XE_RAS_COMP_NOT_SUPPORTED]		= "Not Supported",
> > > > +	[XE_RAS_COMP_DEVICE_MEMORY]		= "Device Memory",
> > > > +	[XE_RAS_COMP_CORE_COMPUTE]		= "Core Compute",
> > > > +	[XE_RAS_COMP_RESERVED]			= "Reserved",
> > > > +	[XE_RAS_COMP_PCIE]			= "PCIe",
> > > > +	[XE_RAS_COMP_FABRIC]			= "Fabric",
> > > > +	[XE_RAS_COMP_SOC_INTERNAL]		= "SoC Internal",
> > > > +};
> > > > +static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
> > > > +
> > > > +static inline const char *sev_to_str(struct xe_device *xe, u32 sev)
> > > > +{
> > > > +	xe_assert(xe, sev < XE_RAS_SEV_MAX);
> > > > +
> > > > +	return sev < XE_RAS_SEV_MAX ? xe_ras_severities[sev] : "Unknown";
> > > > +}
> > > > +
> > > > +static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
> > > > +{
> > > > +	xe_assert(xe, comp < XE_RAS_COMP_MAX);
> > > > +
> > > > +	return comp < XE_RAS_COMP_MAX ? xe_ras_components[comp] : "Unknown";
> > > > +}
> > > > +
> > > > +void xe_ras_event_log(struct xe_sysctrl *sc, struct xe_sysctrl_event_response *response)
> > > > +{
> > > > +	struct xe_ras_event_threshold_crossed *pending = (void *)&response->data;
> > > > +	struct xe_ras_error *errors = pending->counters;
> > > > +	struct xe_device *xe = sc_to_xe(sc);
> > > > +	u32 cid, sev, comp, inst, cause;
> > > > +	u8 tile;
> > > > +
> > > > +	xe_assert(xe, pending->ncounters < XE_RAS_NUM_COUNTERS);
> > > > +	xe_warn(xe, "[RAS]: threshold crossed, %u new errors\n", pending->ncounters);
> > > > +
> > > > +	for (cid = 0; cid < pending->ncounters && cid < XE_RAS_NUM_COUNTERS; cid++) {
> > > > +		sev = errors[cid].common.severity;
> > > > +		comp = errors[cid].common.component;
> > > > +
> > > > +		tile = errors[cid].product.unit.tile;
> > > > +		inst = errors[cid].product.unit.instance;
> > > > +		cause = errors[cid].product.cause.cause;
> > > > +
> > > > +		xe_warn(xe, "[RAS]: Tile:%u Instance:%u Component:%s Error:%s Cause:%#x\n",
> > > > +			tile, inst, comp_to_str(xe, sev), sev_to_str(xe, comp), cause);
> 
> Please fix Severity/Component Parameter Swap.

Yep, missed it.

Raag

> > > We can have minimal logging here with only severity and component and add
> > > additional logging
> > > 
> > > in following patches.
> > I plan to remove it entirely once we have cper in place, but until that
> > happens (and given the fragility of things) it'll good for debugging.
> > 
> > > > +	}
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> > > > new file mode 100644
> > > > index 000000000000..22f035fa498d
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_ras.h
> > > > @@ -0,0 +1,14 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2026 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef _XE_RAS_H_
> > > > +#define _XE_RAS_H_
> > > > +
> > > > +struct xe_sysctrl;
> > > > +struct xe_sysctrl_event_response;
> > > > +
> > > > +void xe_ras_event_log(struct xe_sysctrl *sc, struct xe_sysctrl_event_response *response);
> > > > +
> > > > +#endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> > > > new file mode 100644
> > > > index 000000000000..2982c4696b6d
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> > > > @@ -0,0 +1,73 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2026 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef _XE_RAS_TYPES_H_
> > > > +#define _XE_RAS_TYPES_H_
> > > > +
> > > > +#include <linux/types.h>
> > > > +
> > > > +#define XE_RAS_NUM_COUNTERS			16
> > > > +
> > > > +/**
> > > > + * struct xe_ras_error_common - Error fields that are common across all products
> > > > + */
> > > > +struct xe_ras_error_common {
> > > > +	/** @severity: Error severity */
> > > > +	u8 severity;
> > > > +	/** @component: IP block where error originated */
> > > > +	u8 component;
> > > > +} __packed;
> > > > +
> > > > +/**
> > > > + * struct xe_ras_error_unit - Error unit information
> > > > + */
> > > > +struct xe_ras_error_unit {
> > > > +	/** @tile: Tile identifier */
> > > > +	u8 tile;
> > > > +	/** @instance: Instance identifier specific to IP */
> > > > +	u32 instance;
> > > > +} __packed;
> > > > +
> > > > +/**
> > > > + * struct xe_ras_error_cause - Error cause information
> > > > + */
> > > > +struct xe_ras_error_cause {
> > > > +	/** @cause: Cause/checker */
> > > > +	u32 cause;
> > > > +	/** @reserved: For future use */
> > > > +	u8 reserved;
> > > > +} __packed;
> > > > +
> > > > +/**
> > > > + * struct xe_ras_error_product - Error fields that are specific to the product
> > > > + */
> > > > +struct xe_ras_error_product {
> > > > +	/** @unit: Unit within IP block */
> > > > +	struct xe_ras_error_unit unit;
> > > > +	/** @cause: Cause/checker */
> > > > +	struct xe_ras_error_cause cause;
> > > > +} __packed;
> > > > +
> > > > +/**
> > > > + * struct xe_ras_error - Combines common and product-specific parts
> > > > + */
> > > > +struct xe_ras_error {
> > > error_class ?
> > I know that how it's in the spec, but it's full of needless verbiage that
> > doesn't add much to the meaning. I'm fine either way.
> > 
> > Raag
> > 
> > > > +	/** @common: Common error type and component */
> > > > +	struct xe_ras_error_common common;
> > > > +	/** @product: Product-specific unit and cause */
> > > > +	struct xe_ras_error_product product;
> > > > +} __packed;
> > > > +
> > > > +/**
> > > > + * struct xe_ras_event_threshold_crossed - Event data for threshold crossed event
> > > > + */
> > > > +struct xe_ras_event_threshold_crossed {
> > > > +	/** @ncounters: Number of error counters that crossed thresholds */
> > > > +	u32 ncounters;
> > > > +	/** @counters: Array of error counters that crossed threshold */
> > > > +	struct xe_ras_error counters[XE_RAS_NUM_COUNTERS];
> > > > +} __packed;
> > > > +
> > > > +#endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> > > > index 47afca586bd1..1833ecadd9a1 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> > > > +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> > > > @@ -6,6 +6,7 @@
> > > >    #include "xe_device.h"
> > > >    #include "xe_irq.h"
> > > >    #include "xe_printk.h"
> > > > +#include "xe_ras.h"
> > > >    #include "xe_sysctrl.h"
> > > >    #include "xe_sysctrl_event_types.h"
> > > >    #include "xe_sysctrl_mailbox.h"
> > > > @@ -38,7 +39,7 @@ static void xe_sysctrl_get_pending_event(struct xe_sysctrl *sc,
> > > >    		}
> > > >    		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED) {
> > > > -			xe_warn(xe, "[RAS]: error counter threshold crossed\n");
> > > > +			xe_ras_event_log(sc, &response);
> > > >    		} else {
> > > >    			xe_err(xe, "sysctrl: unexpected event %#x\n", response.event);
> > > >    			return;
