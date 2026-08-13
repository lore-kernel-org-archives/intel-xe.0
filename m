Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F53C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 09:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE9F10F23C;
	Thu, 13 Aug 2026 09:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iYrR5byO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5861610F238
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786613639; x=1818149639;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vILSM2F/cSeWsahP0qbeDd36eFtPrWw2RoYmNDg2VgU=;
 b=iYrR5byOVJdzh08mYO2KM+wCM78EG6Q64euKo/5K7x5yTpemX7pTCfDg
 PasdJCIeOQ5aZQNmD9GYns4u/lqyTDSJtu4552uJO6UOBsw8HaDWzqkrm
 65rF5kR5h7pP1J5jOpw+AiRT0JBTpeRaYD+F3LOzirGZrKLnPO7VnS1Yk
 Jo79BQVfP4/uZSOrwB67OyJ/IfkWRZAcegYzGyt65/XtZOli/5eziTzu+
 cmqm8BIzJxDY8DSvi62DmIK7P5/EPdlMavPSJZx1me78hUyPHg7s7U/3a
 0/Zt3aLSJN/GVpTrZL2JCINe77zIFEiWGHQ1ch7fcoqa2kptOMAD1/sEp Q==;
X-CSE-ConnectionGUID: rmwv5BIpR9exI5rhpwbjfA==
X-CSE-MsgGUID: qFz9rm40R++HZHCxCp8/JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97531301"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="97531301"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 02:33:59 -0700
X-CSE-ConnectionGUID: CbvQXowpQVG33rJsFHEcRA==
X-CSE-MsgGUID: jd6YvytASCKwehw2VPpHtw==
X-ExtLoop1: 1
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.144.213])
 ([10.247.144.213])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 02:33:56 -0700
Message-ID: <23eb71a4-6e93-4f93-b403-eefd8d6036c1@linux.intel.com>
Date: Thu, 13 Aug 2026 15:03:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/23] drm/xe/log: Add structured SIGID error logging
 infrastructure
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Yoni Levitt <yoni.levitt@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Riana Tauro <riana.tauro@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20260730152121.576-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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


On 30-07-2026 20:50, Michal Wajdeczko wrote:
> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
> Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
> strings that have no stable shape. That is readable for a human, but it
> gives fleet tooling nothing durable to match on: the wording changes
> between releases, lines can be rate-limited or dropped under an error
> storm, and there is no consistent way to ask "which recognised fault
> just happened?".
>
> Introduce a signature identifier (SIGID): a small, stable integer that
> names one recognised Xe fault situation and serves as the primary handle
> for triage. A SIGID maps, through published end-user documentation, to a
> description and a recommended action; the driver only has to emit the
> right SIGID next to the usual human-readable text.
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Assisted-by: Copilot:Opus-4.8
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> Cc: Yoni Levitt <yoni.levitt@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: CORRECTED is still an error (Michal)
>     prepare to decorate dmesg with comp/loc (Michal)
> ---
>  Documentation/gpu/xe/index.rst        |   1 +
>  Documentation/gpu/xe/xe_sigid.rst     |  14 ++
>  drivers/gpu/drm/xe/Makefile           |   1 +
>  drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 183 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_log.c           | 135 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_log.h           |  20 +++
>  6 files changed, 354 insertions(+)
>  create mode 100644 Documentation/gpu/xe/xe_sigid.rst
>  create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>  create mode 100644 drivers/gpu/drm/xe/xe_log.c
>  create mode 100644 drivers/gpu/drm/xe/xe_log.h
>
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 665c0e93601c..0247a255f7e6 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
>     xe-drm-usage-stats.rst
>     xe_configfs
>     xe_gt_stats
> +   xe_sigid
> diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/xe_sigid.rst
> new file mode 100644
> index 000000000000..45d84a62f185
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_sigid.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +========
> +Xe SIGID
> +========
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> +   :doc: Xe Error Signatures (SIGID)
> +
> +Signature Identifiers
> +=====================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> +   :internal:
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 67ada1d6c2fb..7ac3954737f9 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>  	xe_hw_fence.o \
>  	xe_irq.o \
>  	xe_late_bind_fw.o \
> +	xe_log.o \
>  	xe_lrc.o \
>  	xe_mem_pool.o \
>  	xe_migrate.o \
> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> new file mode 100644
> index 000000000000..99717fdf74a6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> @@ -0,0 +1,183 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _ABI_XE_SIGID_ABI_H_
> +#define _ABI_XE_SIGID_ABI_H_
> +
> +/**
> + * DOC: Xe Error Signatures (SIGID)
> + *
> + * What SIGID stands for
> + * ---------------------
> + *
> + * SIGID is short for *Signature Identifier*. A SIGID is a small, stable integer
> + * that names one *recognised Xe fault situation* -- nothing more. It is the
> + * primary handle used for triage: a SIGID maps to a human description and a
> + * recommended first action. A coarse first-order action is documented in-tree
> + * per SIGID (see "First-order action" below) so the id is actionable on its
> + * own; published end-user documentation refines it with finer, cross-product
> + * detail. The driver's only job is to emit the right SIGID next to the usual
> + * human-readable text.
> + *
> + * Why this exists
> + * ---------------
> + *
> + * Today the driver reports faults with ad-hoc ``drm_err()`` / ``xe_gt_err()``
> + * strings that have no stable shape. That is fine for a human reading dmesg,
> + * but it gives fleet tooling nothing durable to match on: the wording changes
> + * between releases, lines can be rate-limited or dropped under an error storm,
> + * and there is no consistent way to ask "which recognised fault just happened?"
> + * A SIGID answers exactly that one question, identically across driver and
> + * firmware versions, and (eventually) across other Intel devices in a node.
> + *
> + * What a SIGID is (and is not)
> + * ----------------------------
> + *
> + * A SIGID names *which situation* is being reported. It deliberately does not
> + * encode the detailed reason or the outcome. Those are carried alongside it::
> + *
> + *   SIGID    -> which recognised situation is being reported
> + *   severity -> how serious this instance is (see below -- not fixed per SIGID)
> + *   errno    -> the failing operation's error, shown with %pe
> + *   message  -> free-form human-readable context
> + *
> + * Severity is independent of the SIGID. The same situation can be reported at
> + * different severities depending on the instance and the recovery taken, so a
> + * SIGID is never tied to one severity; the reporting site chooses it by calling
> + * the matching xe_log_*() helper (see xe_log.h).
> + *
> + * How to pick a SIGID (the uniqueness rule)
> + * -----------------------------------------
> + *
> + * Pick per *report site*, not per incident. Each site emits the single most
> + * specific recognised situation *for that site* -- so the question is never
> + * "classify this whole failure", it is "what does this site detect?", which has
> + * one answer. A single underlying failure therefore legitimately produces a
> + * *chain* of reports from different layers, each with its own SIGID -- e.g. a
> + * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
> + * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
> + * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
> + * follow a fault from origin to final effect; it is not a duplicate.
> + *
> + * If a site does not match any defined situation, keep using the ordinary
> + * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a wrong
> + * or over-broad classification is harder to retire than a missing one. When a
> + * new situation is genuinely worth triaging, add it to the list below.
> + *
> + * Scope: software-emitted signatures only
> + * ---------------------------------------
> + *
> + * This header enumerates only the situations that the *driver itself* detects
> + * and reports from software: probe abort, wedged, survivability, driver-
> + * detected firmware failures, engine TDR, memory faults and IO/bus faults.
> + * These are the only values the driver assigns.
> + *
> + * Signatures that *originate* in firmware or hardware are a different thing:
> + * they are produced and identified by the firmware or the hardware itself
> + * (e.g. via their own records or error counters), and the driver merely logs
> + * them as they are given to us. They are deliberately *not* enumerated here --
> + * minting a driver-side id for a firmware/hardware-reported error would only
> + * duplicate an identifier the reporting layer already owns. The two
> + * driver-detected firmware situations below (%XE_SIGID_RUNTIME_FW,
> + * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the driver*
> + * observed a firmware problem, not a signature reported by the firmware.
> + *
> + * Numbering
> + * ---------
> + *
> + * SIGIDs are a single flat list numbered sequentially within the assigned range,
> + * in the order the situations were introduced. Values are stable: once assigned
> + * they are only ever appended, never renumbered or reused.
> + *
> + * A retired situation is deprecated in place, never re-purposed.
> + *
> + * First-order action (resolution buckets)
> + * ---------------------------------------
> + *
> + * So that a SIGID is actionable on its own, each one is tagged with a coarse
> + * *resolution bucket*: the first thing an operator should do on seeing it. The
> + * bucket is a stable, driver-owned hint; external documentation may refine it,
> + * but the in-tree value always stands on its own. Every new SIGID must pick a
> + * bucket, which forces the question "what should someone do about this?" to be
> + * answered up front. The buckets are::
> + *
> + *   COLLECT  -- capture logs and open a bug report
> + *   RETRY    -- transient or already recovered; watch for recurrence
> + *   UPDATE   -- a firmware update / flash is required
> + *   RECOVER  -- an explicit recovery step is needed (rebind, bus reset)
> + *   IGNORE   -- ignore if the SIGID severity is INFORMATIONAL
> + *
> + * The bucket is documentation only -- it is recorded per SIGID in the enum
> + * kernel-doc below and is not printed on the (deliberately lean) dmesg line.
> + *
> + * When to use SIGID logging
> + * -------------------------
> + *
> + * The xe_log_*() helpers are for these recognised fault situations only --
> + * important, operator-relevant faults and events. They are not a replacement
> + * for ``xe_info()`` / ``xe_dbg()`` / tracing, nor for one-off diagnostics;
> + * using them for ordinary logging would dilute the fault stream. Not every
> + * ``xe_err()`` needs to become a SIGID report -- only those that correspond to
> + * a published situation.
> + *
> + * dmesg vs. the machine record
> + * ----------------------------
> + *
> + * The dmesg line stays close to a normal xe error message so it remains
> + * readable for admins; the only stable, machine-matchable token on it is
> + * ``SIGID=<n>`` (``dmesg | grep SIGID=``). dmesg is not an ABI: the surrounding
> + * text may change freely, and lines may be dropped. The durable record for
> + * tooling is the CPER record carrying the same SIGID (generation is a planned
> + * follow-up).
> + */
> +
> +/*
> + * Top level Intel Error Signature Identifiers.
> + */
> +#define INTEL_SIGID_INVALID			0
> +#define INTEL_SIGID_GPU_START			100
> +#define INTEL_SIGID_GPU_END			999
> +
> +#define INTEL_SIGID_GPU_XE_START		100
> +#define INTEL_SIGID_GPU_XE_END			299
> +
> +#define INTEL_SIGID_GPU_XE_SOFTWARE_START	100
> +#define INTEL_SIGID_GPU_XE_SOFTWARE_END		199
> +#define INTEL_SIGID_GPU_XE_HARDWARE_START	200
> +#define INTEL_SIGID_GPU_XE_HARDWARE_END		299
> +
> +/**
> + * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
> + * @XE_SIGID_SW: Software component failure. [COLLECT]
> + * @XE_SIGID_PROBE: Device probe/bind was aborted. [COLLECT]
> + * @XE_SIGID_WEDGED: Device was declared wedged and is no longer usable. [RECOVER]
> + * @XE_SIGID_SURVIVABILITY: Device entered survivability mode. [UPDATE]
> + * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure, GuC/HuC/GSC. [RETRY]
> + * @XE_SIGID_DEVICE_FW: Driver-detected device firmware failure, PCODE/sysctrl. [RETRY]
> + * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset). [RETRY]
> + * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
> + * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. [RECOVER]
> + *
> + * The situations the driver detects and reports in software. Values are
> + * numbered sequentially, are only ever appended, and are never renumbered or
> + * reused. The tag in brackets is the default resolution bucket (see the `Xe
> + * Error Signatures (SIGID)`_ section).
> + *
> + * Firmware- and hardware-originated signatures are not listed here; they are
> + * logged as reported by those layers.
> + */
> +enum xe_sigid {
> +	XE_SIGID_SW			= INTEL_SIGID_GPU_XE_SOFTWARE_START,
> +	XE_SIGID_PROBE			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 1,
> +	XE_SIGID_WEDGED			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 2,
> +	XE_SIGID_SURVIVABILITY		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 3,
> +	XE_SIGID_RUNTIME_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 4,
> +	XE_SIGID_DEVICE_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 5,
> +	XE_SIGID_GT_TDR			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
> +	XE_SIGID_MEM_FAULT		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
> +	XE_SIGID_IO_BUS			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> new file mode 100644
> index 000000000000..70a41bdf1a01
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_log.c
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_log.h"
> +#include "xe_printk.h"
> +
> +static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +			  u32 component, u32 location, const void *data, size_t len,
> +			  struct va_format *vaf)
> +{
> +	/* TODO */
> +}
> +
> +static bool is_hw_sigid(enum xe_sigid sigid)
> +{
> +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> +}
> +
> +static bool is_sev_error(int cper_sev)
> +{
> +	return cper_sev != CPER_SEV_INFORMATIONAL;
> +}
> +
> +static const char *log_hwe_prefix(int cper_sev, enum xe_sigid sigid)
> +{
> +	return is_sev_error(cper_sev) && is_hw_sigid(sigid) ? HW_ERR : "";
> +}
> +
> +static const char *log_sev_prefix(int cper_sev)
> +{
> +	switch (cper_sev) {
> +	case CPER_SEV_FATAL:
> +		return "FATAL ";
> +	case CPER_SEV_RECOVERABLE:
> +		return "";
> +	case CPER_SEV_CORRECTED:
> +		return "CORRECTED ";
> +	default:
> +		return "";
> +	}
> +}
> +
> +#define __LOG_DRM_PRINTK_FMT(fmt, args...)	"[drm] " fmt, ##args
> +#define __LOG_DRM_PRINTK_ERR_FMT(fmt, args...)	__LOG_DRM_PRINTK_FMT("*ERROR* " fmt, args)
> +
> +static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
> +{
> +	if (cper_sev == CPER_SEV_INFORMATIONAL)
> +		pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
> +	else
> +		pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT("%pV", vaf));
> +}
> +
> +static void log_dmesg_printf(struct pci_dev *pdev, int cper_sev, const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	log_dmesg_vprintk(pdev, cper_sev, &vaf);
> +
> +	va_end(args);
> +}
> +
> +static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +			   u32 component, u32 location, const void *data, size_t len,
> +			   struct va_format *vaf)
> +{
> +	const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
> +	const char *sev_prefix = log_sev_prefix(cper_sev);
> +
> +	/* TODO: add component/location details */
> +
> +	if (IS_ERR(data))
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe) %s%pV",
> +				 sigid, sev_prefix, data, hwe_prefix, vaf);
> +	else if (data && len)
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%pV",
> +				 sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
> +	else
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%pV",
> +				 sigid, sev_prefix, hwe_prefix, vaf);

Can we print the device UUID as well every time we print the SIG_ID, as
the BDFs keep changing it can be helpful to identify the part correctly.

Thanks,
Aravind.
> +}
> +
> +/**
> + * xe_log_emit() - Emit a structured SIGID log entry
> + * @pdev: the &pci_dev device
> + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
> + * @sigid: signature identifier, see &enum xe_sigid
> + * @component: component identifer
> + * @location: location details of the @component
> + * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
> + * @len: length of the @data in bytes, or 0 if not applicable
> + * @fmt: printf-style format string
> + * @...: format arguments
> + *
> + * Emits a dmesg line that includes a single stable, machine-matchable token
> + * ``SIGID=<n>`` followed by the optional severity token (like ``FATAL``) and,
> + * when @data pointer is set, either the error printed with %pe or a packed hex
> + * dump of the @data binary blob. The dmesg line will also include printf-style
> + * text message.
> + *
> + * Note that the full dmesg line, with the free text message, is only a debugging
> + * aid, not an interface! Only the ``SIGID=<n>`` token is stable there.
> + * The durable machine record is the CPER carrying the same SIGID.
> + *
> + * Note: generation of the CPER record is a planned follow-up.
> + *
> + * Examples::
> + *
> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO) Invalid GuC reply
> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
> + *   <6> xe 0000:03:00.0: [drm] *ERROR* SIGID=103 In survivability mode
> + */
> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +		 u32 component, u32 location, const void *data, size_t len,
> +		 const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	log_emit_dmesg(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> +	log_emit_cper(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> +
> +	va_end(args);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> new file mode 100644
> index 000000000000..d475e816ee0b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_log.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_LOG_H_
> +#define _XE_LOG_H_
> +
> +#include <linux/cper.h>
> +
> +#include "abi/xe_sigid_abi.h"
> +
> +struct pci_dev;
> +
> +__printf(8, 9)
> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +		 u32 component, u32 location, const void *data, size_t len,
> +		 const char *fmt, ...);
> +
> +#endif
