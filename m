Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C72C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 14:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9420410E1F9;
	Tue, 30 Jun 2026 14:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YGqlgD8F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248F510E1F9
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 14:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782829550; x=1814365550;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/kYGeLBPjmY8M2b+c4ffmEGZblYnqqGFtTgND0vt+2A=;
 b=YGqlgD8FzOq2wwU/bvk1A5VBmGhjlxvhX0+gnDJ8IUXzKi6mXXsatdZp
 Lm8gFfRdAubEWa8DUqHuxRJlmTXIxk5VDkC0vXCjl0huWXB4l0jPrX7co
 U7vM0rNtP6SFDK5YHAZk6vI14q443wNNc0/sMrTNBDBcEThzZZjucU01S
 KWKavyujkwgm3jFsVlMIHqsaW8eDW4jOukvCAlqRnkF+QNTvWHUca8dHY
 ZwcZM0HxpM6q+p1YJRE58G1Wl/15WZO7mEQUALfYwSndA77rMzF7LPGfu
 134vmYoHNe5DNKYWOJUprHTpY0P+uw7P55BUWOVvSjc4yAzNtyrl3+1Dr g==;
X-CSE-ConnectionGUID: dq9piZtKSfa93PZt5EMc2A==
X-CSE-MsgGUID: EmX2xq6uSN+d8fnUDGUOYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="100970309"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="100970309"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 07:25:49 -0700
X-CSE-ConnectionGUID: v9KXFHPjT1KT1ydsC7BB8w==
X-CSE-MsgGUID: uerB3RGTSuGlezhPqkmzUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="251222613"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 07:25:47 -0700
Date: Tue, 30 Jun 2026 16:25:43 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com
Subject: Re: [RFC PATCH v4 1/5] drm/xe: Add SIG_IDs for RAS error logging
Message-ID: <akPR5wZqkPlvsIfY@black.igk.intel.com>
References: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
 <20260630115503.407158-8-mallesh.koujalagi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630115503.407158-8-mallesh.koujalagi@intel.com>
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

On Tue, Jun 30, 2026 at 05:25:05PM +0530, Mallesh Koujalagi wrote:
> Add xe_sig_ids.h which defines a set of stable numeric labels
> for Xe error categories, called SIG_IDs.
> 
> Each SIG_ID identifies which subsystem reported an error (e.g. probe,
> wedged, GT TDR, firmware). It does not encode the full failure details,
> those come from errno and the free-form message:
> 
>   SIG_ID  -> which area failed
>   errno   -> what failed
>   message -> extra human-readable context
> 
> Also add a DOC: kernel-doc section covering design rationale, driver
> severity labels (FATAL/RECOVERABLE), usage guidelines, and the
> distinction between driver and hardware error paths.

...

> +/**
> + * DOC: SIG_ID Overview
> + *
> + * Signature ID (SIG_ID) is a stable numeric identifier (u16) for a defined
> + * Xe error category - it answers: "which subsystem reported the error?"

Introducing a new concept is a bit of an uphill battle in itself, not
because it lacks an explanation but because the explanation often assumes
that the reader has the same context as the writer and what we end up
with is a terminology soup that doesn't add much to the understanding :)

> + * SIG_ID format
> + * =============
> + *
> + * Xe error events are emitted as a single structured line using stable fields.
> + * Driver events use:
> + *
> + *   [xe-err] SIG_ID = <u16> Severity = <CPER_SEV_*>
> + *            Location = <device|tile/gt> Errno = <neg_errno>
> + *            Message = "<free-form text>"
> + *
> + * Hardware-originated RAS events use the same overall format, but typically
> + * omit Errno and Message and instead report the hardware-derived location /
> + * error-class information.
> + *
> + * Important
> + * =========
> + *
> + * SIG_ID identifies the reporting subsystem/category only. It does not encode
> + * the detailed failure reason. The detailed reason is carried separately by::
> + *
> + *   SIG_ID   -> which subsystem/category failed

So what exactly is "category" or "subsystem" and what fits the criteria of
it? In RAS context we have a unique ID attached to all hardware units (which
we've already defined under xe_ras), so similar to that, what makes a SIG_ID
unique?

Btw, I'm really unsure if 'probe' or 'wedged' are subsystems ;)

> + *   Severity -> how serious the event is
> + *   Errno    -> what failed (driver events)
> + *   Message  -> human-readable context
> + *
> + * Example (driver event)

In Linux world these are not events, so I'd try to find a better terminology
(and in all other places where applicable).

> + * ======================
> + *
> + *   [xe-err] SIG_ID = 6 Severity = CPER_SEV_RECOVERABLE
> + *   Location = tile0/gt0 Errno = -5
> + *   Message = "Engine 'rcs0' hung; TDR triggered, engine reset succeeded"
> + *
> + * In the example
> + * ==============
> + *
> + *   SIG_ID 6   = XE GT/TDR category
> + *   RECOVERABLE = workload impacted, device still operational
> + *   -5         = Linux errno (-EIO)
> + *   Message    = extra context for triage
> + *
> + * Why SIG_ID exists?
> + * ==================
> + *
> + * The goal is to replace inconsistent ad-hoc error strings with a small
> + * set of stable, structured error events that are easier for operators
> + * and tools to understand. Each driver event carries a fixed SIG_ID with
> + * a severity determined by its error category, and structured output that
> + * can be consumed consistently across driver or firmware versions. It
> + * reduces guesswork during triage and allows machine parsing of important
> + * fault events.

Okay so the problem statement is good enough but let's say the tools actually
parse these IDs, what do you expect the outcome of the parsing to be? What
will the results be used for?

I understand the telemetry aspect, but if the expectation is to perform a
"certain recovery procedure" based on the ID, wouldn't it be more intuitive
to just define the IDs based on procedure itself?

> + * Driver severity labels
> + * ======================
> + *
> + * FATAL means the device cannot continue operation (e.g. probe failure,
> + * device wedged). RECOVERABLE means the driver encountered an error but
> + * may continue with degraded functionality.
> + *
> + * When to use the xe_ras_log helpers (see xe_ras_log.h)
> + * =====================================================
> + *
> + * Use them only for defined Xe error events that belong to the published
> + * error categories. These helpers are intended for important fault paths
> + * such as probe failure, wedged device, survivability mode, firmware
> + * failures, GT hang/TDR/reset, memory faults, and runtime IO/bus faults.
> + * The selected macro fixes the SIG_ID and severity for that category.
> + *
> + * Do not use xe_ras_log helpers for all logs
> + * ==========================================
> + *
> + * These helpers are not a replacement for normal drm_info(), drm_dbg(),
> + * tracing, or one-off diagnostics. They are for stable, structured error
> + * reporting only. Using them for ordinary logs would dilute the error
> + * stream and make operator-facing fault reporting noisy and less useful.
> + *
> + * Hardware errors
> + * ===============
> + *
> + * Hardware errors are hardware-reported RAS events and map to the
> + * XE_SIG_HW_* identifiers. They are reported through the hardware error
> + * path (e.g. CPER records), not through the driver xe_ras_log helpers.
> + *
> + * Unlike driver xe_ras_log helpers, hardware events do not have one fixed
> + * severity per SIG_ID. For example, a fabric event (XE_SIG_HW_FABRIC) may
> + * be reported as CPER_SEV_CORRECTED, CPER_SEV_FATAL, CPER_SEV_RECOVERABLE,
> + * or CPER_SEV_INFORMATIONAL, depending on what the hardware reported.
> + */
> +
> +/*
> + * Driver errors: SIG_IDs
> + */
> +#define XE_SIG_PROBE			1  /* FATAL: probe failed */
> +#define XE_SIG_WEDGED			2  /* FATAL: device wedged */
> +#define XE_SIG_SURVIVABILITY		3  /* FATAL: survivability mode */
> +#define XE_SIG_RUNTIME_FW		4  /* RECOVERABLE: GuC/HuC/UC/GSC */
> +#define XE_SIG_DEVICE_FW		5  /* RECOVERABLE: PCODE/CSC/System controller */
> +#define XE_SIG_GT_TDR			6  /* RECOVERABLE: engine hang / reset */
> +#define XE_SIG_MEM_FAULT		7  /* RECOVERABLE: VM bind, page fault, GTT */
> +#define XE_SIG_IO_BUS			8  /* RECOVERABLE: runtime PCIe/IOMMU/MMIO */

Many of the above actually overlap, for example boottime survivability or
firmware load failure will result in probe failure, while runtime survivability
or GT reset failure will result in wedging. So which ID is exactly applicable
in those cases and how does it help the usecase here?

> +/*
> + * Hardware errors: SIG_IDs
> + */
> +#define XE_SIG_HW_DEVICE_MEMORY		9  /* Device memory errors */
> +#define XE_SIG_HW_CORE_COMPUTE		10 /* Compute/shader core errors */
> +#define XE_SIG_HW_PCIE			11 /* PCIe interface errors */
> +#define XE_SIG_HW_FABRIC		12 /* Fabric errors */
> +#define XE_SIG_HW_SOC_INTERNAL		13 /* SoC-internal errors */

So is this to be reused in CPER or is that its own thing?

Confused :(

Raag

> +#endif /* _XE_SIG_IDS_H_ */
> -- 
> 2.34.1
> 
