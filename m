Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF446606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L6doRTkc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772821123E3;
	Thu, 26 Nov 2026 13:23:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184001123E6;
 Thu, 26 Nov 2026 13:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795699419; x=1827235419;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=1tSKPYYtMRgapk897aRT3gaL9KEScP8XEGeCOOOZLWs=;
 b=L6doRTkcq5ybmDr53R0GLlVoQKDpGUTXSK4H3t+lVcmj+mYWsuBGPaSz
 a+eDDBY+3L/PsuYd44kimKV93D6gkbD8iVtMoO82hqZS3U8XUhgbX+BFP
 08YtHL8FgPpLjqh24yRUOk0RKV3/rq//+soCYnrldP6Os70jVNFVk07Nl
 lw51sC3M7PMwFA8ys330vtzxUHbM16BktMLsszAkU5CmKLBNbVHBxDuZQ
 VlEhw8xlY3rkgHFmxwlF/M8RmNmD4rVkZf+nOisGVx5xNTxF6l0dIxs3j
 h0sWGgEW71FyfauXjsZtUAT5YcH3nTKHYLMdHMzgB4LACppH/CifkU1kd Q==;
X-CSE-ConnectionGUID: s9LRa9MQQ4ac6U3z8ocbpA==
X-CSE-MsgGUID: 9cRkgUk8SXS4TKq4zxMnsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4696102"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4696102"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:23:38 -0800
X-CSE-ConnectionGUID: AxwULLRUSIK2903hSCI7Kg==
X-CSE-MsgGUID: UIIRFA1xS36GsgEatE+bQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12593200"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.235])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:23:36 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 06/13] drm/i915/ddi_mgr: Add support for dynamic DDI
 allocation
In-Reply-To: <20261126100755.1252635-7-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261126100755.1252635-1-imre.deak@intel.com>
 <20261126100755.1252635-7-imre.deak@intel.com>
Date: Thu, 26 Nov 2026 15:23:32 +0200
Message-ID: <b5aae9bb49d36cab599df615ce0546a572ae37a8@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 26 Nov 2026, Imre Deak <imre.deak@intel.com> wrote:
> Type-C ports described in VBT need a DDI assignment to drive a legacy or
> DP-alt PHY, or a TBT DP-in adapter. eDP panels on Type-C PHYs and
> dedicated external ports have preallocated, fixed DDIs; the latter are
> not controlled by the Type-C subsystem.
>
> The driver allocates DDIs for dynamic legacy ports; IOM and TBT firmware
> handle DP-alt and TBT-alt allocations, respectively. IOM_DP_RESOURCE_MNG
> exposes the shared pool for VBT ports with dynamic-DDI support and
> eligible alt-mode ports. A free DDI can be assigned to a PHY or DP-in
> adapter on demand.
>
> Firmware allocates and releases DDIs as alt-mode sinks connect and
> disconnect, regardless of whether userspace enables them. Connected but
> unused alt-mode sinks can therefore occupy DDIs needed by a legacy sink
> the user wants to enable. Driver control over all allocations would let
> assignments follow the requested display configuration. Alas, the
> hardware design on current generations does not allow this and instead
> imposes a complex allocation scheme involving both the OS and firmware.
>
> Add a manager to read VBT and IOM state before GMBUS and output setup,
> inherit existing legacy DDI assignments from BIOS and allocate free
> supported DDIs, preferring DDI-to-PHY identity mappings. Each DRM
> encoder keeps a fixed DDI in encoder->port. The DDI assigned to a legacy
> PHY determines which encoder handles it, whether inherited from BIOS/GOP
> for an active or inactive port or newly allocated by the driver.
>
> For now, this enables only static legacy DDI allocation. Legacy DDIs are
> inherited from BIOS or allocated only during driver loading and system
> resume, and these assignments remain unchanged during runtime. Runtime
> reallocation support will be added in a follow-up series.
>
> AUX and DDI/PHY/PLL register accesses use the allocated DDI instance.
> Legacy HPD and GMBUS DDC pins identify the PHY, while DP-alt/TBT-alt HPD
> sources identify the DDI. An encoder selected for a legacy PHY must use
> that PHY's HPD source, DDC pin and VBT capabilities, including link
> limits, and switch to legacy Type-C mode. Its logical HPD pin stays
> fixed; the HPD mapping selects the HW source. Other pool encoders remain
> non-legacy, including those whose DDI is unallocated. PHY-specific VBT
> data follows the selected PHY through encoder->devdata; AUX channel
> selection stays tied to the fixed DDI.
>
> DDC adapters for pool encoders must be separate from the ordinary
> per-pin adapters:
> a pool encoder's original VBT entry may specify no DDC pin, and its
> default pin may already be used by a non-pool port. Each pool encoder
> keeps the same DDC adapter while only the physical pin driven by that
> adapter changes, so its HDMI connector's userspace DDC symlink remains
> unchanged. Ordinary adapters retain their fixed physical pins.
>
> If allocation fails after successfully reading and verifying the pool,
> keep its encoders available for alt-mode sinks and disable legacy
> operation. Earlier initialization failures retain the original port
> configuration.
>
> Follow-up patches will add the connector and DDC adapter support,
> suspend/resume handling and activation of the pool.
>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/display/intel_ddi_mgr.c  | 808 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_ddi_mgr.h  |  18 +
>  .../gpu/drm/i915/display/intel_ddi_mgr_regs.h |  40 +
>  .../gpu/drm/i915/display/intel_display_core.h |   3 +
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  6 files changed, 871 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_ddi_mgr.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_ddi_mgr.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_ddi_mgr_regs.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index ba7eecfffdca1..3357d84ca56aa 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -349,6 +349,7 @@ i915-y +=3D \
>  	display/intel_cx0_phy.o \
>  	display/intel_ddi.o \
>  	display/intel_ddi_buf_trans.o \
> +	display/intel_ddi_mgr.o \
>  	display/intel_dip.o \
>  	display/intel_display_device.o \
>  	display/intel_display_trace.o \
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c b/drivers/gpu/d=
rm/i915/display/intel_ddi_mgr.c
> new file mode 100644
> index 0000000000000..7dc547a617990
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
> @@ -0,0 +1,808 @@
> +// SPDX-License-Identifier: MIT
> +/* Copyright =C2=A9 2026 Intel Corporation */

Copy-pasting what I wrote to Suraj:

I would pretty much like to mandate that *every* file in display/ *must*
have a DOC: comment explaining what this stuff is about, what the
acronyms are, etc. Obviously not all the existing files have it, but all
new ones should.

You've basically written most of this already in the cover letter and
the commit messages. Add a bit of pixie dust on top and you're done.

> +
> +#include <linux/iopoll.h>
> +#include <linux/seq_buf.h>
> +#include <linux/string.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +
> +#include "intel_bios.h"
> +#include "intel_ddi_mgr.h"
> +#include "intel_ddi_mgr_regs.h"
> +#include "intel_de.h"
> +#include "intel_display.h"
> +#include "intel_display_core.h"
> +#include "intel_display_regs.h"
> +#include "intel_display_rpm.h"
> +#include "intel_display_types.h"
> +#include "intel_display_utils.h"
> +#include "intel_dp.h"
> +#include "intel_gmbus.h"
> +#include "intel_hotplug_irq.h"
> +#include "intel_tc.h"
> +
> +#define INTEL_DDI_MGR_NUM_PORTS 4
> +
> +enum intel_ddi_route_mode {
> +	/* DP-alt/TBT-alt, with allocations managed by firmware. */
> +	INTEL_DDI_ROUTE_ALT,
> +	/* Legacy DP/HDMI, with allocations managed by the driver. */
> +	INTEL_DDI_ROUTE_LEGACY,
> +};
> +
> +struct intel_ddi_route {
> +	/*
> +	 * Physical legacy PHY, or TC_PORT_NONE in ALT mode.
> +	 * TODO: Use a PHY enum instead of enum tc_port.
> +	 */
> +	enum tc_port phy;
> +	enum intel_ddi_route_mode mode;
> +};
> +
> +struct intel_ddi_mgr {
> +	/* Only route entries with a bit set in pool_ddi_mask are used. */
> +	struct intel_ddi_route route[INTEL_DDI_MGR_NUM_PORTS];
> +	u8 ddc_pin[INTEL_DDI_MGR_NUM_PORTS];
> +	u8 pool_ddi_mask;
> +	u8 legacy_phy_mask;
> +	u16 ddc_pins;
> +	bool has_hdmi;
> +	bool enabled;
> +};
> +
> +struct intel_ddi_hw_state {
> +	struct intel_ddi_route route[INTEL_DDI_MGR_NUM_PORTS];
> +	u32 inherited_resources;
> +	u32 current_resources;
> +	u8 pool_ddi_mask;
> +	u8 busy_ddi_mask;
> +	u8 assigned_phy_mask;
> +	u8 allocated_ddi_mask;
> +};
> +
> +static enum port ddi_to_port(int ddi)
> +{
> +	return PORT_TC1 + ddi;
> +}
> +
> +static enum tc_port ddi_to_tc(int ddi)
> +{
> +	return TC_PORT_1 + ddi;
> +}
> +
> +static enum hpd_pin tc_to_hpd_pin(enum tc_port tc_port)
> +{
> +	return HPD_PORT_TC1 + tc_port - TC_PORT_1;
> +}
> +
> +/* TODO: Fix the regular HDMI default selection on NVL+ and reuse it her=
e. */
> +static u8 default_ddc_pin(struct intel_display *display, enum port port)
> +{
> +	if (port >=3D PORT_TC1 && port <=3D PORT_TC4)
> +		return intel_gmbus_tc_port_to_pin(intel_port_to_tc(display, port));
> +
> +	return intel_port_to_phy(display, port) + 1;
> +}
> +
> +static bool intel_ddi_mgr_is_enabled(const struct intel_ddi_mgr *mgr)
> +{
> +	return mgr && mgr->enabled;
> +}
> +
> +bool intel_ddi_mgr_is_pool_ddi(struct intel_display *display, enum port =
ddi)
> +{
> +	return display->ddi_mgr && ddi >=3D PORT_TC1 && ddi <=3D PORT_TC4 &&
> +		display->ddi_mgr->pool_ddi_mask & BIT(ddi - PORT_TC1);
> +}
> +
> +bool intel_ddi_mgr_pool_supports_hdmi(struct intel_display *display)
> +{
> +	struct intel_ddi_mgr *mgr =3D display->ddi_mgr;
> +
> +	return mgr && mgr->pool_ddi_mask && mgr->has_hdmi;
> +}
> +
> +static const char *iom_lock_owner(u32 semaphore)
> +{
> +	switch (semaphore & IOM_REQUESTOR_ID_MASK) {
> +	case IOM_REQUESTOR_ID_IOM:
> +		return "IOM";
> +	case IOM_REQUESTOR_ID_TBT0:
> +		return "TBT0";
> +	case IOM_REQUESTOR_ID_TBT1:
> +		return "TBT1";
> +	case IOM_REQUESTOR_ID_DISPLAY_ENGINE:
> +		return "Display Engine";
> +	default:
> +		return "unknown";
> +	}
> +}
> +
> +static bool iom_trylock(struct intel_display *display, u32 *semaphore)
> +{
> +	u32 request =3D IOM_DP_HW_SEMLOCK | IOM_REQUESTOR_ID_DISPLAY_ENGINE;
> +	u32 mask =3D IOM_DP_HW_SEMLOCK | IOM_REQUESTOR_ID_MASK;
> +
> +	intel_de_rmw(display, IOM_DP_HW_RESOURCE_SEMAPHORE, mask, request);
> +	*semaphore =3D intel_de_read(display, IOM_DP_HW_RESOURCE_SEMAPHORE);
> +
> +	return (*semaphore & mask) =3D=3D request;
> +}
> +
> +static int iom_lock(struct intel_display *display)
> +{
> +	u32 semaphore;
> +	bool acquired;
> +	int err;
> +
> +	assert_display_rpm_held(display);
> +
> +	intel_de_rmw(display, IOM_HIP_INDEX, IOM_HIP_INDEX_MASK,
> +		     IOM_HIP_INDEX_RESOURCE_MGMT);
> +
> +	err =3D poll_timeout_us(acquired =3D iom_trylock(display, &semaphore),
> +			      acquired, 10, 100000, false);
> +	if (!err)
> +		return 0;
> +
> +	drm_warn(display->drm,
> +		 "DDIMGR: IOM DDI lock timeout: owner %s, register %#x\n",
> +		 iom_lock_owner(semaphore), semaphore);
> +
> +	return err;
> +}
> +
> +static void iom_unlock(struct intel_display *display)
> +{
> +	intel_de_rmw(display, IOM_DP_HW_RESOURCE_SEMAPHORE,
> +		     IOM_DP_HW_SEMLOCK | IOM_REQUESTOR_ID_MASK, IOM_REQUESTOR_ID_DISPL=
AY_ENGINE);
> +	intel_de_posting_read(display, IOM_DP_HW_RESOURCE_SEMAPHORE);
> +}
> +
> +static int resource_to_available_ddi_count(struct intel_display *display=
, u32 semaphore)
> +{
> +	u32 gray =3D REG_FIELD_GET(IOM_DDI_AVAILABLE_MASK, semaphore);
> +
> +	switch (gray) {
> +	case 0x0:
> +		return 0;
> +	case 0x1:
> +		return 1;
> +	case 0x2:
> +		return 3;
> +	case 0x3:
> +		return 2;
> +	case 0x6:
> +		return IOM_DDI_REPORTED_MAX_FREE; /* At least four resources are avail=
able. */
> +	default:
> +		drm_WARN(display->drm, 1, "DDIMGR: Invalid DDI availability %#x (semap=
hore %#x)\n",
> +			 gray, semaphore);
> +
> +		return -EINVAL;
> +	}
> +}
> +
> +static u8 resource_to_pool_ddi_mask(u32 resources)
> +{
> +	u8 pool_ddi_mask =3D 0;
> +	int ddi;
> +
> +	for (ddi =3D 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++)
> +		if (IOM_DDI_CONSUMER_GET(resources, ddi) !=3D IOM_DDI_CONSUMER_RESERVE=
D)
> +			pool_ddi_mask |=3D BIT(ddi);
> +
> +	return pool_ddi_mask;
> +}
> +
> +static void verify_ddi_counts(struct intel_display *display, u32 resourc=
es)
> +{
> +	u32 semaphore;
> +	int available_ddis, free_ddis =3D 0;
> +	int ddi;
> +
> +	semaphore =3D intel_de_read(display, IOM_DP_HW_RESOURCE_SEMAPHORE);
> +	available_ddis =3D resource_to_available_ddi_count(display, semaphore);
> +
> +	/* The hardware count covers all eight slots, not just our four TC DDIs=
. */
> +	for (ddi =3D 0; ddi < IOM_DDI_NUM_SLOTS; ddi++)
> +		if (IOM_DDI_CONSUMER_GET(resources, ddi) =3D=3D IOM_DDI_CONSUMER_FREE)
> +			free_ddis++;
> +
> +	drm_WARN(display->drm, free_ddis > INTEL_DDI_MGR_NUM_PORTS,
> +		 "DDIMGR: Free DDI count %d exceeds supported count %d\n",
> +		 free_ddis, INTEL_DDI_MGR_NUM_PORTS);
> +
> +	if (available_ddis < 0 || available_ddis =3D=3D min(free_ddis, IOM_DDI_=
REPORTED_MAX_FREE))
> +		return;
> +
> +	drm_dbg_kms(display->drm,
> +		    "DDIMGR: DDI count mismatch: available %d%s, free %d (semaphore %#=
x, table 0x%08x)\n",
> +		    available_ddis, available_ddis =3D=3D IOM_DDI_REPORTED_MAX_FREE ? =
"+" : "",
> +		    free_ddis, semaphore, resources);
> +}
> +
> +/* TC PHY consumer (legacy or DP-alt), rather than a TBT DP adapter. */
> +static bool consumer_is_dpalt_legacy(u32 consumer)
> +{
> +	return consumer & IOM_DDI_CONSUMER_DPALT_LEGACY &&
> +		REG_FIELD_GET(IOM_DDI_CONSUMER_PHY_MASK, consumer) < INTEL_DDI_MGR_NUM=
_PORTS;
> +}
> +
> +/* Caller must first check consumer_is_dpalt_legacy(). */
> +static enum tc_port consumer_to_phy(u32 consumer)
> +{
> +	return TC_PORT_1 + REG_FIELD_GET(IOM_DDI_CONSUMER_PHY_MASK, consumer);
> +}
> +
> +static void format_ddi_consumer(struct seq_buf *s, const struct intel_dd=
i_mgr *mgr,
> +				u32 consumer, const char *origin)
> +{
> +	if (consumer =3D=3D IOM_DDI_CONSUMER_FREE) {
> +		seq_buf_puts(s, "free");
> +
> +		return;
> +	}
> +
> +	if (consumer =3D=3D IOM_DDI_CONSUMER_RESERVED) {
> +		seq_buf_puts(s, "reserved");
> +
> +		return;
> +	}
> +
> +	if (consumer_is_dpalt_legacy(consumer)) {
> +		enum tc_port phy =3D consumer_to_phy(consumer);
> +		bool legacy =3D mgr->legacy_phy_mask & BIT(phy);
> +
> +		if (!legacy)
> +			origin =3D NULL;
> +
> +		seq_buf_printf(s, "PHY TC#%d (%s%s%s)", phy - TC_PORT_1 + 1,
> +			       legacy ? "legacy" : "dp-alt", origin ? ", " : "", origin ?: ""=
);
> +
> +		return;
> +	}
> +
> +	if (!(consumer & IOM_DDI_CONSUMER_DPALT_LEGACY) &&
> +	    REG_FIELD_GET(IOM_DDI_CONSUMER_TBT_DPIN_MASK, consumer)) {
> +		seq_buf_printf(s, "TBT%u DPIN%u",
> +			       REG_FIELD_GET(IOM_DDI_CONSUMER_TBT_DOMAIN_MASK, consumer),
> +			       REG_FIELD_GET(IOM_DDI_CONSUMER_TBT_DPIN_MASK, consumer) - 1);
> +
> +		return;
> +	}
> +
> +	seq_buf_printf(s, "unknown(0x%x)", consumer);
> +}
> +
> +static void print_ddi_allocations(struct drm_printer *p, const struct in=
tel_ddi_mgr *mgr,
> +				  const struct intel_ddi_hw_state *hw_state, int err)
> +{
> +	bool printed =3D false;
> +	int ddi;
> +
> +	for (ddi =3D 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++) {
> +		u32 consumer =3D IOM_DDI_CONSUMER_GET(hw_state->current_resources, ddi=
);
> +		DECLARE_SEQ_BUF(name, 64);
> +		const char *origin =3D NULL;
> +
> +		if (consumer =3D=3D IOM_DDI_CONSUMER_FREE || consumer =3D=3D IOM_DDI_C=
ONSUMER_RESERVED)
> +			continue;
> +
> +		if (consumer =3D=3D IOM_DDI_CONSUMER_GET(hw_state->inherited_resources=
, ddi))
> +			origin =3D "inherited";
> +		else if (!err && hw_state->allocated_ddi_mask & BIT(ddi))
> +			origin =3D "allocated";
> +
> +		format_ddi_consumer(&name, mgr, consumer, origin);
> +		drm_printf_indent(p, 1, "DDI TC#%d: %s\n", ddi + 1, seq_buf_str(&name)=
);
> +		printed =3D true;
> +	}
> +
> +	if (!printed)
> +		drm_printf_indent(p, 1, "none\n");
> +}
> +
> +static void print_ddi_resources(struct intel_display *display,
> +				const struct intel_ddi_hw_state *hw_state, int err)
> +{
> +	struct intel_ddi_mgr *mgr =3D display->ddi_mgr;
> +	struct drm_printer p =3D drm_dbg_printer(display->drm, DRM_UT_KMS, "DDI=
MGR:");
> +	unsigned long pool_ddi_mask =3D resource_to_pool_ddi_mask(hw_state->cur=
rent_resources) << 1;
> +	unsigned long unassigned_phy_mask =3D
> +		(mgr->legacy_phy_mask & ~hw_state->assigned_phy_mask) << 1;
> +
> +	drm_printf(&p, "Resources=3D0x%08x, Pool DDIs=3DDDI TC#{%*pbl}\n",
> +		   hw_state->current_resources, INTEL_DDI_MGR_NUM_PORTS + 1, &pool_ddi=
_mask);
> +	if (err)
> +		drm_printf(&p, "Configuration failed: %d\n", err);
> +
> +	/* ALT allocations are only a snapshot of firmware assignments. */
> +	drm_printf(&p, "Assigned DDIs:\n");
> +	print_ddi_allocations(&p, mgr, hw_state, err);
> +
> +	if (!err && unassigned_phy_mask)
> +		drm_printf(&p, "Unassigned legacy PHYs=3DPHY TC#{%*pbl}\n",
> +			   INTEL_DDI_MGR_NUM_PORTS + 1, &unassigned_phy_mask);
> +}
> +
> +static int verify_ddi_pool(struct intel_display *display, u8 pool_ddi_ma=
sk)
> +{
> +	struct intel_ddi_mgr *mgr =3D display->ddi_mgr;
> +	int ddi;
> +
> +	if (mgr->pool_ddi_mask && pool_ddi_mask !=3D mgr->pool_ddi_mask) {
> +		drm_dbg_kms(display->drm, "DDIMGR: DDI pool changed: expected %#x, rea=
d %#x\n",
> +			    mgr->pool_ddi_mask, pool_ddi_mask);
> +
> +		return -EINVAL;
> +	}
> +
> +	if (mgr->legacy_phy_mask & ~pool_ddi_mask) {
> +		drm_err(display->drm,
> +			"DDIMGR: Legacy PHYs missing from DDI pool: legacy=3D0x%02x pool=3D0x=
%02x\n",
> +			mgr->legacy_phy_mask, pool_ddi_mask);
> +
> +		return -EINVAL;
> +	}
> +
> +	for (ddi =3D 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++) {
> +		const struct intel_bios_encoder_data *vbt;
> +		bool alt_mode;
> +
> +		if (!(pool_ddi_mask & BIT(ddi)))
> +			continue;
> +
> +		vbt =3D intel_bios_encoder_data_lookup(display, ddi_to_port(ddi));
> +		if (!vbt) {
> +			drm_err(display->drm, "DDIMGR: Missing VBT data for pool DDI%d\n", dd=
i);
> +
> +			return -EINVAL;
> +		}
> +
> +		if (intel_bios_encoder_is_dedicated_external(vbt) ||
> +		    intel_bios_encoder_supports_edp(vbt) ||
> +		    intel_bios_encoder_supports_dsi(vbt) || intel_bios_encoder_is_lspc=
on(vbt)) {
> +			drm_err(display->drm,
> +				"DDIMGR: Unsupported pool DDI%d: dedicated=3D%d eDP=3D%d DSI=3D%d LS=
PCON=3D%d\n",
> +				ddi, intel_bios_encoder_is_dedicated_external(vbt),
> +				intel_bios_encoder_supports_edp(vbt),
> +				intel_bios_encoder_supports_dsi(vbt),
> +				intel_bios_encoder_is_lspcon(vbt));
> +
> +			return -EINVAL;
> +		}
> +
> +		alt_mode =3D intel_bios_encoder_supports_typec_usb(vbt) ||
> +			intel_bios_encoder_supports_tbt(vbt);
> +		if (alt_mode =3D=3D !!(mgr->legacy_phy_mask & BIT(ddi))) {
> +			drm_err(display->drm,
> +				"DDIMGR: Invalid VBT modes for pool DDI%d: alt=3D%d dyn-legacy=3D%d\=
n",
> +				ddi, alt_mode, !!(mgr->legacy_phy_mask & BIT(ddi)));
> +
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int verify_ddc_pins(struct intel_display *display, u8 pool_ddi_ma=
sk)
> +{
> +	struct intel_ddi_mgr *mgr =3D display->ddi_mgr;
> +	enum port port;
> +	int err =3D 0;
> +
> +	for (port =3D PORT_A; port < I915_MAX_PORTS; port++) {
> +		const struct intel_bios_encoder_data *vbt;
> +		int pin;
> +
> +		if (port >=3D PORT_TC1 && port <=3D PORT_TC4 &&
> +		    pool_ddi_mask & BIT(port - PORT_TC1))
> +			continue;
> +
> +		vbt =3D intel_bios_encoder_data_lookup(display, port);
> +		if (!vbt || (!intel_bios_encoder_supports_hdmi(vbt) &&
> +			     !intel_bios_encoder_supports_dvi(vbt)))
> +			continue;
> +
> +		pin =3D intel_bios_hdmi_ddc_pin(vbt);
> +		/* Match intel_hdmi_default_ddc_pin() for non-pool encoders. */
> +		if (!pin)
> +			pin =3D intel_port_to_phy(display, port) + 1;
> +
> +		if (pin >=3D GMBUS_NUM_PINS)
> +			continue;
> +
> +		if (!(mgr->ddc_pins & BIT(pin)))
> +			continue;
> +
> +		drm_err(display->drm, "DDIMGR: DDI pool DDC pin %d also used by port %=
c\n",
> +			pin, port_name(port));
> +
> +		err =3D -EINVAL;
> +	}
> +
> +	return err;
> +}
> +
> +/* Record the DDI's mode and legacy PHY in software. */
> +static void record_ddi_route(struct intel_ddi_route *route, enum tc_port=
 legacy_phy)
> +{
> +	route->phy =3D legacy_phy;
> +	route->mode =3D legacy_phy =3D=3D TC_PORT_NONE ?
> +		INTEL_DDI_ROUTE_ALT : INTEL_DDI_ROUTE_LEGACY;
> +}
> +
> +static void fallback_to_alt(struct intel_ddi_mgr *mgr)
> +{
> +	int ddi;
> +
> +	mgr->enabled =3D false;
> +
> +	for (ddi =3D 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++) {
> +		if (!(mgr->pool_ddi_mask & BIT(ddi)))
> +			continue;
> +
> +		record_ddi_route(&mgr->route[ddi], TC_PORT_NONE);
> +	}
> +}
> +
> +static int readout_ddi_resource(struct intel_display *display, int ddi,
> +				struct intel_ddi_hw_state *hw_state)
> +{
> +	struct intel_ddi_mgr *mgr =3D display->ddi_mgr;
> +	u32 consumer =3D IOM_DDI_CONSUMER_GET(hw_state->current_resources, ddi);
> +	enum tc_port phy;
> +
> +	if (ddi < INTEL_DDI_MGR_NUM_PORTS)
> +		record_ddi_route(&hw_state->route[ddi], TC_PORT_NONE);
> +
> +	if (hw_state->pool_ddi_mask & BIT(ddi) &&
> +	    intel_de_read(display, DDI_BUF_CTL(ddi_to_port(ddi))) & DDI_BUF_CTL=
_ENABLE)
> +		hw_state->busy_ddi_mask |=3D BIT(ddi);
> +
> +	if (!consumer_is_dpalt_legacy(consumer))
> +		return 0;
> +
> +	phy =3D consumer_to_phy(consumer);
> +
> +	/* The IOM also assigns PHY consumers for DP-alt ports. */
> +	if (!(mgr->legacy_phy_mask & BIT(phy)))
> +		return 0;
> +
> +	/* Reject legacy PHY assignments outside the supported DDI range. */
> +	if (ddi >=3D INTEL_DDI_MGR_NUM_PORTS) {
> +		drm_err(display->drm,
> +			"DDIMGR: Legacy PHY%d assigned to unsupported DDI%d (resources 0x%08x=
)\n",
> +			phy, ddi, hw_state->current_resources);
> +
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/* Reject duplicate legacy PHY assignments. */
> +	if (hw_state->assigned_phy_mask & BIT(phy)) {
> +		drm_err(display->drm,
> +			"DDIMGR: Duplicate legacy PHY%d assignment at DDI%d (resources 0x%08x=
)\n",
> +			phy, ddi, hw_state->current_resources);
> +
> +		return -EINVAL;
> +	}
> +
> +	record_ddi_route(&hw_state->route[ddi], phy);
> +	hw_state->assigned_phy_mask |=3D BIT(phy);
> +
> +	return 0;
> +}
> +
> +static int ddi_mgr_readout_hw_state(struct intel_display *display,
> +				    struct intel_ddi_hw_state *hw_state)
> +{
> +	int ddi, err;
> +
> +	hw_state->current_resources =3D intel_de_read(display, IOM_DP_RESOURCE_=
MNG);
> +	hw_state->inherited_resources =3D hw_state->current_resources;
> +	hw_state->pool_ddi_mask =3D resource_to_pool_ddi_mask(hw_state->current=
_resources);
> +	hw_state->busy_ddi_mask =3D 0;
> +	hw_state->assigned_phy_mask =3D 0;
> +	hw_state->allocated_ddi_mask =3D 0;
> +
> +	for (ddi =3D 0; ddi < IOM_DDI_NUM_SLOTS; ddi++) {
> +		err =3D readout_ddi_resource(display, ddi, hw_state);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ddi_mgr_verify_hw_state(struct intel_display *display,
> +				   const struct intel_ddi_hw_state *hw_state)
> +{
> +	int err;
> +
> +	verify_ddi_counts(display, hw_state->current_resources);
> +
> +	err =3D verify_ddi_pool(display, hw_state->pool_ddi_mask);
> +	if (err)
> +		return err;
> +
> +	return verify_ddc_pins(display, hw_state->pool_ddi_mask);
> +}
> +
> +static void ddi_mgr_store_hw_state(struct intel_ddi_mgr *mgr,
> +				   const struct intel_ddi_hw_state *hw_state)
> +{
> +	memcpy(mgr->route, hw_state->route, sizeof(mgr->route));
> +	mgr->pool_ddi_mask =3D hw_state->pool_ddi_mask;
> +}
> +
> +static int find_free_ddi(u8 ddi_mask, u32 resources)
> +{
> +	int ddi;
> +
> +	for (ddi =3D 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++) {
> +		if (!(ddi_mask & BIT(ddi)))
> +			continue;
> +
> +		if (IOM_DDI_CONSUMER_GET(resources, ddi) !=3D IOM_DDI_CONSUMER_FREE)
> +			continue;
> +
> +		return ddi;
> +	}
> +
> +	return -ENOSPC;
> +}
> +
> +static int legacy_phy_to_ddi(const struct intel_ddi_route *routes, enum =
tc_port phy)
> +{
> +	int ddi;
> +
> +	if (!routes)
> +		return -ENOENT;
> +
> +	for (ddi =3D 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++) {
> +		if (routes[ddi].mode !=3D INTEL_DDI_ROUTE_LEGACY)
> +			continue;
> +
> +		if (routes[ddi].phy =3D=3D phy)
> +			return ddi;
> +	}
> +
> +	return -ENOENT;
> +}
> +
> +static void allocate_ddi_for_phy(struct intel_ddi_hw_state *hw_state,
> +				 u8 ddi_mask, enum tc_port phy)
> +{
> +	int ddi;
> +
> +	ddi =3D find_free_ddi(ddi_mask, hw_state->current_resources);
> +	if (ddi < 0)
> +		return;
> +
> +	hw_state->current_resources |=3D IOM_DDI_CONSUMER(ddi, IOM_DDI_CONSUMER=
_PHY(phy));
> +	hw_state->allocated_ddi_mask |=3D BIT(ddi);
> +	hw_state->assigned_phy_mask |=3D BIT(phy);
> +	record_ddi_route(&hw_state->route[ddi], phy);
> +}
> +
> +enum ddi_alloc_policy {
> +	ALLOC_PREVIOUS_DDI,
> +	ALLOC_IDENTITY_DDI,
> +	ALLOC_ANY_FREE_DDI,
> +
> +	ALLOC_POLICY_NUM,
> +};
> +
> +static u8 ddi_mask_for_policy(const struct intel_ddi_hw_state *hw_state,
> +			      enum ddi_alloc_policy policy,
> +			      const struct intel_ddi_route *old_routes, enum tc_port phy)
> +{
> +	u8 ddi_mask =3D hw_state->pool_ddi_mask & ~hw_state->busy_ddi_mask;
> +	int old_ddi;
> +
> +	switch (policy) {
> +	case ALLOC_PREVIOUS_DDI:
> +		old_ddi =3D legacy_phy_to_ddi(old_routes, phy);
> +		if (old_ddi < 0)
> +			return 0;
> +
> +		ddi_mask &=3D BIT(old_ddi);
> +
> +		break;
> +	case ALLOC_IDENTITY_DDI:
> +		ddi_mask &=3D BIT(phy);
> +
> +		break;
> +	case ALLOC_ANY_FREE_DDI:
> +		break;
> +	default:
> +		MISSING_CASE(policy);
> +		return 0;
> +	}
> +
> +	return ddi_mask;
> +}
> +
> +static int allocate_legacy_ddis(struct intel_display *display,
> +				struct intel_ddi_hw_state *hw_state,
> +				const struct intel_ddi_route *old_routes)
> +{
> +	struct intel_ddi_mgr *mgr =3D display->ddi_mgr;
> +	u32 old_resources =3D hw_state->current_resources;
> +	u32 new_resources;
> +	enum ddi_alloc_policy policy;
> +	enum tc_port phy;
> +	u32 readback;
> +
> +	/* Prefer previous DDIs, then identity mappings, then any remaining DDI=
. */
> +	for (policy =3D ALLOC_PREVIOUS_DDI; policy < ALLOC_POLICY_NUM; policy++=
) {
> +		for (phy =3D TC_PORT_1; phy < INTEL_DDI_MGR_NUM_PORTS; phy++) {
> +			u8 ddi_mask;
> +
> +			if (!(mgr->legacy_phy_mask & BIT(phy)))
> +				continue;
> +
> +			if (hw_state->assigned_phy_mask & BIT(phy))
> +				continue;
> +
> +			ddi_mask =3D ddi_mask_for_policy(hw_state, policy, old_routes, phy);
> +			allocate_ddi_for_phy(hw_state, ddi_mask, phy);
> +		}
> +	}
> +
> +	new_resources =3D hw_state->current_resources;
> +	if (new_resources =3D=3D old_resources)
> +		return 0;
> +
> +	intel_de_write(display, IOM_DP_RESOURCE_MNG, new_resources);
> +	readback =3D intel_de_read(display, IOM_DP_RESOURCE_MNG);
> +	hw_state->current_resources =3D readback;
> +	if (readback !=3D new_resources) {
> +		drm_err(display->drm, "DDIMGR: DDI write mismatch: requested 0x%08x, r=
ead 0x%08x\n",
> +			new_resources, readback);
> +
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int configure_ddi_resources(struct intel_display *display,
> +				   const struct intel_ddi_route *old_routes)
> +{
> +	struct intel_ddi_hw_state hw_state;
> +	int err;
> +
> +	err =3D iom_lock(display);
> +	if (err)
> +		return err;
> +
> +	err =3D ddi_mgr_readout_hw_state(display, &hw_state);
> +	if (err)
> +		goto out;
> +
> +	err =3D ddi_mgr_verify_hw_state(display, &hw_state);
> +	if (err)
> +		goto out;
> +
> +	err =3D allocate_legacy_ddis(display, &hw_state, old_routes);
> +
> +	ddi_mgr_store_hw_state(display->ddi_mgr, &hw_state);
> +
> +out:
> +	iom_unlock(display);
> +
> +	print_ddi_resources(display, &hw_state, err);
> +
> +	return err;
> +}
> +
> +/* Update HPD sources before TC initialization or HPD IRQ enable. */
> +static void update_hpd_sources(struct intel_display *display)
> +{
> +	struct intel_ddi_mgr *mgr =3D display->ddi_mgr;
> +	int ddi;
> +
> +	for (ddi =3D 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++) {
> +		const struct intel_ddi_route *route =3D &mgr->route[ddi];
> +		enum hpd_pin logical_pin =3D tc_to_hpd_pin(ddi_to_tc(ddi));
> +		enum hpd_pin pch_hw_pin =3D HPD_NONE;
> +		enum hpd_pin hw_pin =3D HPD_NONE;
> +
> +		if (!(mgr->pool_ddi_mask & BIT(ddi)))
> +			continue;
> +
> +		if (intel_ddi_mgr_is_enabled(mgr) && route->mode =3D=3D INTEL_DDI_ROUT=
E_LEGACY)
> +			pch_hw_pin =3D tc_to_hpd_pin(route->phy);
> +		else
> +			hw_pin =3D logical_pin;
> +
> +		intel_hpd_set_pin_sources(display, logical_pin, hw_pin, pch_hw_pin);
> +	}
> +}
> +
> +static int init_ddi_resource(struct intel_display *display, int ddi)
> +{
> +	struct intel_ddi_mgr *mgr =3D display->ddi_mgr;
> +	const struct intel_bios_encoder_data *vbt;
> +	int pin;
> +
> +	record_ddi_route(&mgr->route[ddi], TC_PORT_NONE);
> +
> +	vbt =3D intel_bios_encoder_data_lookup(display, ddi_to_port(ddi));
> +	if (!vbt || !intel_bios_encoder_supports_dyn_port_over_tc(vbt))
> +		return 0;
> +
> +	mgr->legacy_phy_mask |=3D BIT(ddi);
> +
> +	if (!intel_bios_encoder_supports_hdmi(vbt) &&
> +	    !intel_bios_encoder_supports_dvi(vbt))
> +		return 0;
> +
> +	mgr->has_hdmi =3D true;
> +	pin =3D intel_bios_hdmi_ddc_pin(vbt);
> +	if (!pin)
> +		pin =3D default_ddc_pin(display, ddi_to_port(ddi));
> +
> +	if (!intel_gmbus_is_valid_pin(display, pin) || mgr->ddc_pins & BIT(pin)=
) {
> +		drm_err(display->drm, "DDIMGR: Invalid/duplicate legacy DDC pin %d\n",=
 pin);
> +
> +		return -EINVAL;
> +	}
> +
> +	mgr->ddc_pin[ddi] =3D pin;
> +	mgr->ddc_pins |=3D BIT(pin);
> +
> +	return 0;
> +}
> +
> +void intel_ddi_mgr_init(struct intel_display *display)
> +{
> +	struct intel_ddi_mgr *mgr;
> +	int ddi, err;
> +
> +	if (DISPLAY_VER(display) < 35)
> +		return;
> +
> +	mgr =3D drmm_kzalloc(display->drm, sizeof(*mgr), GFP_KERNEL);
> +	if (!mgr)
> +		return;
> +
> +	display->ddi_mgr =3D mgr;
> +
> +	for (ddi =3D 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++) {
> +		err =3D init_ddi_resource(display, ddi);
> +		if (err)
> +			goto err;
> +	}
> +
> +	if (!mgr->legacy_phy_mask)
> +		goto out_free;
> +
> +	err =3D configure_ddi_resources(display, NULL);
> +	if (err)
> +		goto err;
> +
> +	mgr->enabled =3D true;
> +	update_hpd_sources(display);
> +
> +	return;
> +
> +err:
> +	if (mgr->pool_ddi_mask) {
> +		fallback_to_alt(mgr);
> +		drm_err(display->drm,
> +			"DDIMGR: Cannot initialize DDI pool: %d; using ALT mode\n", err);
> +		update_hpd_sources(display);
> +
> +		return;
> +	}
> +
> +	drm_err(display->drm,
> +		"DDIMGR: Cannot initialize DDI pool: %d; using default port configurat=
ion\n", err);
> +out_free:
> +	drmm_kfree(display->drm, mgr);
> +	display->ddi_mgr =3D NULL;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.h b/drivers/gpu/d=
rm/i915/display/intel_ddi_mgr.h
> new file mode 100644
> index 0000000000000..b1793b848c238
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: MIT */
> +/* Copyright =C2=A9 2026 Intel Corporation */
> +
> +#ifndef __INTEL_DDI_MGR_H__
> +#define __INTEL_DDI_MGR_H__
> +
> +#include <linux/types.h>
> +
> +enum port;
> +
> +struct intel_display;
> +
> +void intel_ddi_mgr_init(struct intel_display *display);
> +
> +bool intel_ddi_mgr_is_pool_ddi(struct intel_display *display, enum port =
ddi);
> +bool intel_ddi_mgr_pool_supports_hdmi(struct intel_display *display);
> +
> +#endif
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr_regs.h b/drivers/=
gpu/drm/i915/display/intel_ddi_mgr_regs.h
> new file mode 100644
> index 0000000000000..2a65c27a1f099
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr_regs.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#ifndef __INTEL_DDI_MGR_REGS_H__
> +#define __INTEL_DDI_MGR_REGS_H__
> +
> +#include "intel_display_reg_defs.h"
> +
> +#define IOM_HIP_INDEX				_MMIO(0x1010a0)
> +#define  IOM_HIP_INDEX_MASK			REG_GENMASK(3, 0)
> +#define  IOM_HIP_INDEX_RESOURCE_MGMT		REG_FIELD_PREP(IOM_HIP_INDEX_MASK,=
 1)
> +
> +#define IOM_DP_HW_RESOURCE_SEMAPHORE		_MMIO(0x168038)
> +#define  IOM_DDI_AVAILABLE_MASK			REG_GENMASK(30, 28)
> +#define  IOM_DP_HW_SEMLOCK			REG_BIT(31)
> +#define  IOM_REQUESTOR_ID_MASK			REG_GENMASK(3, 0)
> +#define  IOM_REQUESTOR_ID_IOM			REG_FIELD_PREP(IOM_REQUESTOR_ID_MASK, 0)
> +#define  IOM_REQUESTOR_ID_TBT0			REG_FIELD_PREP(IOM_REQUESTOR_ID_MASK, 1)
> +#define  IOM_REQUESTOR_ID_TBT1			REG_FIELD_PREP(IOM_REQUESTOR_ID_MASK, 2)
> +#define  IOM_REQUESTOR_ID_DISPLAY_ENGINE		REG_FIELD_PREP(IOM_REQUESTOR_I=
D_MASK, 4)
> +
> +#define IOM_DDI_REPORTED_MAX_FREE		4
> +
> +#define IOM_DDI_NUM_SLOTS			8
> +
> +#define IOM_DP_RESOURCE_MNG			_MMIO(0x16802c)
> +#define  IOM_DDI_CONSUMER_MASK(ddi)		(0xfu << ((ddi) * 4))
> +#define  IOM_DDI_CONSUMER(ddi, consumer)		((u32)(consumer) << ((ddi) * 4=
))
> +#define  IOM_DDI_CONSUMER_GET(val, ddi)		(((val) >> ((ddi) * 4)) & 0xf)
> +#define  IOM_DDI_CONSUMER_FREE			0x0
> +#define  IOM_DDI_CONSUMER_TBT_DOMAIN_MASK	REG_BIT(2)
> +#define  IOM_DDI_CONSUMER_TBT_DPIN_MASK	REG_GENMASK(1, 0)
> +#define  IOM_DDI_CONSUMER_DPALT_LEGACY	REG_BIT(3)
> +#define  IOM_DDI_CONSUMER_PHY_MASK		REG_GENMASK(2, 0)
> +#define  IOM_DDI_CONSUMER_PHY(phy)		(IOM_DDI_CONSUMER_DPALT_LEGACY | (ph=
y))
> +#define  IOM_DDI_CONSUMER_RESERVED		0xf
> +
> +#endif /* __INTEL_DDI_MGR_REGS_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/=
gpu/drm/i915/display/intel_display_core.h
> index 72183bfee07a3..ec02f61a13706 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
> @@ -41,6 +41,7 @@ struct intel_cdclk_vals;
>  struct intel_color_funcs;
>  struct intel_crtc;
>  struct intel_crtc_state;
> +struct intel_ddi_mgr;
>  struct intel_display_parent_interface;
>  struct intel_dmc;
>  struct intel_dpll_global_funcs;
> @@ -312,6 +313,8 @@ struct intel_display {
>  	/* drm device backpointer */
>  	struct drm_device *drm;
>=20=20
> +	struct intel_ddi_mgr *ddi_mgr;
> +
>  	/* Platform (and subplatform, if any) identification */
>  	struct intel_display_platforms platform;
>=20=20
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 52f0d5dd54680..ea8ab7cb16204 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -263,6 +263,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) +=3D \
>  	i915-display/intel_dbuf_bw.o \
>  	i915-display/intel_ddi.o \
>  	i915-display/intel_ddi_buf_trans.o \
> +	i915-display/intel_ddi_mgr.o \
>  	i915-display/intel_de.o \
>  	i915-display/intel_dip.o \
>  	i915-display/intel_display.o \

--=20
Jani Nikula, Intel
