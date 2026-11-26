Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15179606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 13:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lPGJg5CD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF58D1123F5;
	Thu, 26 Nov 2026 13:25:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CB71123E6;
 Thu, 26 Nov 2026 13:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795699522; x=1827235522;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=6rcHp35KtgLDvy/OPqUNVdYFy2OnO1E4CtTopejbOlo=;
 b=lPGJg5CDCJinLnpAk09UhD/dvifBCXpQBUvPcmI4chGq+cxZs5Mlbmbm
 VU5TSTKFm7k3VhI/gK4nisS0FUYfx+qdwls5+X7BqpebXMCAGzUKgS7Bv
 k/4aBMhMfWG6rgkMr34BWql6wMu2yhC0V50EsZrZSR9OLi1E32hSe2oyK
 jOdYejJ7y06Gz8le6X96+3xHrU5zys3WBHFQisvRIOY01nlLY3EThSYYA
 TGfHKLFQryOgDWQW1qB+QBbiCXvlq0aUni7YX4W6qN0YeH5BdsAoEz6aR
 7/IwptzzcuLI6FN161XuA21QiaX2yW9vZQOJ4XsXg66NbW+DzsiJifN83 g==;
X-CSE-ConnectionGUID: en6fuZgZTGmihsvozdhWfw==
X-CSE-MsgGUID: k2FgUvfWTdCYovPoYmrq5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4578491"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4578491"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:25:21 -0800
X-CSE-ConnectionGUID: /0X0rbg+Rw6sxw+DKmbY9Q==
X-CSE-MsgGUID: wKxvjBUdScaDiZB02FbTMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12031430"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.235])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 05:25:20 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 11/13] drm/i915/ddi_mgr: Verify and restore DDI
 allocations after runtime resume
In-Reply-To: <20261126100755.1252635-12-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261126100755.1252635-1-imre.deak@intel.com>
 <20261126100755.1252635-12-imre.deak@intel.com>
Date: Thu, 26 Nov 2026 15:25:16 +0200
Message-ID: <ba22619bb6a72f0148c62f1ce123fc5c67c37f53@intel.com>
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
> Check that the IOM resource pool and recorded legacy PHY assignments are
> preserved across runtime suspend. Restore missing legacy assignments to
> their original DDIs when those DDIs are free and the PHYs have no other
> assignment.
>
> Firmware may reuse a legacy DDI while the device is suspended. Track
> allocations that could not be restored separately from the saved routes,
> and report their connectors as disconnected until the allocations can
> be restored. Reject enabling these connectors, including when the loss
> is discovered by the commit's runtime resume, while allowing them to be
> detached.
>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi_mgr.c  | 123 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_ddi_mgr.h  |   2 +
>  drivers/gpu/drm/i915/display/intel_display.c  |  12 +-
>  .../drm/i915/display/intel_display_driver.c   |   3 +
>  drivers/gpu/drm/i915/display/intel_tc.c       |  33 ++++-
>  drivers/gpu/drm/xe/display/xe_display.c       |   3 +
>  6 files changed, 174 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c b/drivers/gpu/d=
rm/i915/display/intel_ddi_mgr.c
> index 236146a37fc34..8f32e7c8dff27 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: MIT
>  /* Copyright =C2=A9 2026 Intel Corporation */
>=20=20
> +#include <linux/compiler.h>
>  #include <linux/iopoll.h>
>  #include <linux/seq_buf.h>
>  #include <linux/string.h>
> @@ -45,6 +46,7 @@ struct intel_ddi_mgr {
>  	struct intel_ddi_route route[INTEL_DDI_MGR_NUM_PORTS];
>  	u8 ddc_pin[INTEL_DDI_MGR_NUM_PORTS];
>  	u8 pool_ddi_mask;
> +	u8 disabled_ddi_mask;
>  	u8 legacy_phy_mask;
>  	u16 ddc_pins;
>  	bool has_hdmi;
> @@ -101,6 +103,16 @@ bool intel_ddi_mgr_is_pool_ddi(struct intel_display =
*display, enum port ddi)
>  		display->ddi_mgr->pool_ddi_mask & BIT(ddi - PORT_TC1);
>  }
>=20=20
> +bool intel_ddi_mgr_is_ddi_disabled(struct intel_display *display, enum p=
ort ddi)
> +{
> +	struct intel_ddi_mgr *mgr =3D display->ddi_mgr;
> +
> +	if (!mgr || ddi < PORT_TC1 || ddi > PORT_TC4)
> +		return false;
> +
> +	return READ_ONCE(mgr->disabled_ddi_mask) & BIT(ddi - PORT_TC1);
> +}
> +
>  bool intel_ddi_mgr_pool_supports_hdmi(struct intel_display *display)
>  {
>  	struct intel_ddi_mgr *mgr =3D display->ddi_mgr;
> @@ -165,6 +177,9 @@ bool intel_ddi_mgr_aux_available(struct intel_encoder=
 *encoder)
>  {
>  	struct intel_display *display =3D to_intel_display(encoder);
>=20=20
> +	if (intel_ddi_mgr_is_ddi_disabled(display, encoder->port))
> +		return false;
> +
>  	if (!intel_ddi_mgr_is_pool_ddi(display, encoder->port))
>  		return true;
>=20=20
> @@ -193,6 +208,9 @@ bool intel_ddi_mgr_connector_available(struct intel_c=
onnector *connector)
>  		return true;
>=20=20
>  	encoder =3D &dig_port->base;
> +	if (intel_ddi_mgr_is_ddi_disabled(display, encoder->port))
> +		return false;
> +
>  	if (connector->base.connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA)
>  		return intel_ddi_mgr_is_legacy_pool_encoder(encoder) &&
>  			(intel_bios_encoder_supports_hdmi(encoder->devdata) ||
> @@ -822,6 +840,111 @@ static void update_hpd_sources(struct intel_display=
 *display)
>  	}
>  }
>=20=20
> +static u8 legacy_ddi_mismatch_mask(const struct intel_ddi_mgr *mgr, u32 =
resources)
> +{
> +	u8 ddi_mask =3D 0;
> +	int ddi;
> +
> +	for (ddi =3D 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++) {
> +		const struct intel_ddi_route *route =3D &mgr->route[ddi];
> +
> +		if (!(mgr->pool_ddi_mask & BIT(ddi)) ||
> +		    route->mode !=3D INTEL_DDI_ROUTE_LEGACY)
> +			continue;
> +
> +		if (IOM_DDI_CONSUMER_GET(resources, ddi) !=3D
> +		    IOM_DDI_CONSUMER_PHY(route->phy))
> +			ddi_mask |=3D BIT(ddi);
> +	}
> +
> +	return ddi_mask;
> +}
> +
> +static u32 restore_legacy_allocations(struct intel_display *display, u32=
 resources)
> +{
> +	struct intel_ddi_mgr *mgr =3D display->ddi_mgr;
> +	u32 new_resources =3D resources;
> +	u32 readback;
> +	int ddi, slot;
> +
> +	for (ddi =3D 0; ddi < INTEL_DDI_MGR_NUM_PORTS; ddi++) {
> +		const struct intel_ddi_route *route =3D &mgr->route[ddi];
> +		u32 consumer =3D IOM_DDI_CONSUMER_GET(resources, ddi);
> +
> +		if (!(mgr->pool_ddi_mask & BIT(ddi)) || route->mode !=3D INTEL_DDI_ROU=
TE_LEGACY)
> +			continue;
> +
> +		if (consumer !=3D IOM_DDI_CONSUMER_FREE)
> +			continue;
> +
> +		for (slot =3D 0; slot < IOM_DDI_NUM_SLOTS; slot++)
> +			if (IOM_DDI_CONSUMER_GET(resources, slot) =3D=3D
> +			    IOM_DDI_CONSUMER_PHY(route->phy))
> +				break;
> +
> +		if (slot < IOM_DDI_NUM_SLOTS)
> +			continue;
> +
> +		new_resources |=3D IOM_DDI_CONSUMER(ddi, IOM_DDI_CONSUMER_PHY(route->p=
hy));
> +	}
> +
> +	if (new_resources =3D=3D resources)
> +		return resources;
> +
> +	intel_de_write(display, IOM_DP_RESOURCE_MNG, new_resources);
> +	readback =3D intel_de_read(display, IOM_DP_RESOURCE_MNG);
> +	if (readback !=3D new_resources)
> +		drm_err(display->drm,
> +			"DDIMGR: DDI restore mismatch: requested 0x%08x, read 0x%08x\n",
> +			new_resources, readback);
> +
> +	return readback;
> +}
> +
> +void intel_ddi_mgr_verify_state(struct intel_display *display)
> +{
> +	struct intel_ddi_mgr *mgr =3D display->ddi_mgr;
> +	u8 old_disabled_ddi_mask, disabled_ddi_mask;
> +	u32 resources;
> +	int err;
> +
> +	if (!intel_ddi_mgr_is_enabled(mgr))
> +		return;
> +
> +	old_disabled_ddi_mask =3D READ_ONCE(mgr->disabled_ddi_mask);
> +
> +	err =3D iom_lock(display);
> +	if (err)
> +		return;
> +
> +	resources =3D intel_de_read(display, IOM_DP_RESOURCE_MNG);
> +	verify_ddi_counts(display, resources);
> +
> +	err =3D verify_ddi_pool(display, resource_to_pool_ddi_mask(resources));
> +	if (err)
> +		goto out;
> +
> +	if (!legacy_ddi_mismatch_mask(mgr, resources))
> +		goto out;
> +
> +	drm_dbg_kms(display->drm,
> +		    "DDIMGR: Legacy DDI allocations changed during runtime suspend: 0x=
%08x\n",
> +		    resources);
> +
> +	resources =3D restore_legacy_allocations(display, resources);
> +
> +out:
> +	iom_unlock(display);
> +
> +	disabled_ddi_mask =3D legacy_ddi_mismatch_mask(mgr, resources);
> +	if (disabled_ddi_mask =3D=3D old_disabled_ddi_mask)
> +		return;
> +
> +	WRITE_ONCE(mgr->disabled_ddi_mask, disabled_ddi_mask);
> +	drm_dbg_kms(display->drm, "DDIMGR: Disabled DDIs: 0x%02x -> 0x%02x\n",
> +		    old_disabled_ddi_mask, disabled_ddi_mask);
> +}
> +
>  static int init_ddi_resource(struct intel_display *display, int ddi)
>  {
>  	struct intel_ddi_mgr *mgr =3D display->ddi_mgr;
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi_mgr.h b/drivers/gpu/d=
rm/i915/display/intel_ddi_mgr.h
> index db10d0e8b3a97..fddd69564b84d 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
> +++ b/drivers/gpu/drm/i915/display/intel_ddi_mgr.h
> @@ -14,8 +14,10 @@ struct intel_display;
>  struct intel_encoder;
>=20=20
>  void intel_ddi_mgr_init(struct intel_display *display);
> +void intel_ddi_mgr_verify_state(struct intel_display *display);
>=20=20
>  bool intel_ddi_mgr_is_pool_ddi(struct intel_display *display, enum port =
ddi);
> +bool intel_ddi_mgr_is_ddi_disabled(struct intel_display *display, enum p=
ort ddi);
>  bool intel_ddi_mgr_pool_supports_hdmi(struct intel_display *display);
>  bool intel_ddi_mgr_is_legacy_pool_encoder(struct intel_encoder *encoder);
>  bool intel_ddi_mgr_encoder_has_lane_reversal(struct intel_encoder *encod=
er);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 19caae633d29f..1c03e801e21cd 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -68,6 +68,7 @@
>  #include "intel_cursor_regs.h"
>  #include "intel_cx0_phy.h"
>  #include "intel_ddi.h"
> +#include "intel_ddi_mgr.h"
>  #include "intel_de.h"
>  #include "intel_dip.h"
>  #include "intel_display_driver.h"
> @@ -6812,7 +6813,16 @@ int intel_atomic_check(struct drm_device *dev,
>=20=20
>  static int intel_atomic_prepare_commit(struct intel_atomic_state *state)
>  {
> -	int ret;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
> +	int i, ret;
> +
> +	/* Runtime resume may have invalidated a DDI after atomic check. */
> +	for_each_new_connector_in_state(&state->base, connector, conn_state, i)=
 {
> +		if (conn_state->crtc &&
> +		    !intel_ddi_mgr_connector_available(to_intel_connector(connector)))
> +			return -ENODEV;
> +	}
>=20=20
>  	ret =3D drm_atomic_helper_prepare_planes(state->base.dev, &state->base);
>  	if (ret < 0)
> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/driver=
s/gpu/drm/i915/display/intel_display_driver.c
> index c13471a5a10e7..b018608eae032 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -30,6 +30,7 @@
>  #include "intel_crtc.h"
>  #include "intel_cursor.h"
>  #include "intel_dbuf_bw.h"
> +#include "intel_ddi_mgr.h"
>  #include "intel_de.h"
>  #include "intel_display_clock_gating.h"
>  #include "intel_display_core.h"
> @@ -962,6 +963,8 @@ void intel_display_driver_pm_runtime_resume_early(str=
uct intel_display *display)
>  /* after irq resume */
>  void intel_display_driver_pm_runtime_resume(struct intel_display *displa=
y)
>  {
> +	intel_ddi_mgr_verify_state(display);
> +
>  	/*
>  	 * On VLV/CHV display interrupts are part of the display
>  	 * power well, so hpd is reinitialized from there. For
> diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i9=
15/display/intel_tc.c
> index f878494bcb388..e01f367007424 100644
> --- a/drivers/gpu/drm/i915/display/intel_tc.c
> +++ b/drivers/gpu/drm/i915/display/intel_tc.c
> @@ -10,6 +10,7 @@
>  #include "intel_atomic.h"
>  #include "intel_cx0_phy_regs.h"
>  #include "intel_ddi.h"
> +#include "intel_ddi_mgr.h"
>  #include "intel_de.h"
>  #include "intel_display.h"
>  #include "intel_display_driver.h"
> @@ -1173,6 +1174,17 @@ static void xelpdp_tc_phy_get_hw_state(struct inte=
l_tc_port *tc)
>=20=20
>  	tc_cold_wref =3D __tc_cold_block(tc, &domain);
>=20=20
> +	if (intel_ddi_mgr_is_ddi_disabled(display, tc->dig_port->base.port)) {
> +		tc->mode =3D TC_PORT_DISCONNECTED;
> +		drm_dbg_kms(display->drm,
> +			    "Port %s: skipping PHY readout, legacy DDI allocation unavailable=
\n",
> +			    tc->port_name);
> +
> +		__tc_cold_unblock(tc, domain, tc_cold_wref);
> +
> +		return;
> +	}
> +
>  	tc->mode =3D tc_phy_get_current_mode(tc);
>  	if (tc->mode !=3D TC_PORT_DISCONNECTED) {
>  		tc->lock_wakeref =3D tc_cold_block(tc);
> @@ -1195,6 +1207,8 @@ static void xelpdp_tc_phy_get_hw_state(struct intel=
_tc_port *tc)
>=20=20
>  static bool xelpdp_tc_phy_connect(struct intel_tc_port *tc, int required=
_lanes)
>  {
> +	struct intel_display *display =3D to_intel_display(tc->dig_port);
> +
>  	tc->lock_wakeref =3D tc_cold_block(tc);
>=20=20
>  	if (tc->mode =3D=3D TC_PORT_TBT_ALT) {
> @@ -1203,6 +1217,10 @@ static bool xelpdp_tc_phy_connect(struct intel_tc_=
port *tc, int required_lanes)
>  		return true;
>  	}
>=20=20
> +	/* AUX transfers and modesets reject DDIs without their legacy allocati=
on. */
> +	if (intel_ddi_mgr_is_ddi_disabled(display, tc->dig_port->base.port))
> +		return true;
> +
>  	if (!xelpdp_tc_phy_enable_tcss_power(tc, true))
>  		goto out_unblock_tccold;
>=20=20
> @@ -1227,6 +1245,14 @@ static bool xelpdp_tc_phy_connect(struct intel_tc_=
port *tc, int required_lanes)
>=20=20
>  static void xelpdp_tc_phy_disconnect(struct intel_tc_port *tc)
>  {
> +	struct intel_display *display =3D to_intel_display(tc->dig_port);
> +
> +	if (intel_ddi_mgr_is_ddi_disabled(display, tc->dig_port->base.port)) {
> +		tc_cold_unblock(tc, fetch_and_zero(&tc->lock_wakeref));
> +
> +		return;
> +	}
> +
>  	switch (tc->mode) {
>  	case TC_PORT_LEGACY:
>  	case TC_PORT_DP_ALT:
> @@ -1733,6 +1759,9 @@ bool intel_tc_port_connected(struct intel_encoder *=
encoder)
>=20=20
>  	drm_WARN_ON(display->drm, !intel_tc_port_ref_held(dig_port));
>=20=20
> +	if (intel_ddi_mgr_is_ddi_disabled(display, encoder->port))
> +		return false;
> +
>  	if (tc->mode !=3D TC_PORT_DISCONNECTED)
>  		mask =3D BIT(tc->mode);
>=20=20
> @@ -1880,7 +1909,9 @@ static void __intel_tc_port_lock(struct intel_tc_po=
rt *tc,
>  					  false);
>=20=20
>  	drm_WARN_ON(display->drm, tc->mode =3D=3D TC_PORT_DISCONNECTED);
> -	drm_WARN_ON(display->drm, tc->mode !=3D TC_PORT_TBT_ALT && !tc_phy_is_o=
wned(tc));
> +	drm_WARN_ON(display->drm,
> +		    !intel_ddi_mgr_is_ddi_disabled(display, tc->dig_port->base.port) &&
> +		    tc->mode !=3D TC_PORT_TBT_ALT && !tc_phy_is_owned(tc));
>  }
>=20=20
>  void intel_tc_port_lock(struct intel_digital_port *dig_port)
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe=
/display/xe_display.c
> index f757cfad4bd6e..b36a7cc83420d 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -13,6 +13,7 @@
>  #include <drm/intel/display_member.h>
>  #include <drm/intel/display_parent_interface.h>
>=20=20
> +#include "intel_ddi_mgr.h"
>  #include "intel_display.h"
>  #include "intel_display_core.h"
>  #include "intel_display_device.h"
> @@ -340,6 +341,8 @@ static void xe_display_disable_d3cold(struct xe_devic=
e *xe)
>=20=20
>  	intel_dmc_resume(display);
>=20=20
> +	intel_ddi_mgr_verify_state(display);

The direction *must* be to add all of this stuff to display, not diverge
i915 and xe more.


> +
>  	if (intel_display_device_present(display))
>  		drm_mode_config_reset(&xe->drm);

--=20
Jani Nikula, Intel
