Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E5ECA600A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 14:05:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FA710F5F4;
	Wed,  7 Oct 2026 14:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="krRPklGR";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF8A10E3FD;
 Tue,  6 Oct 2026 19:38:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 437DB401E9;
 Tue,  6 Oct 2026 19:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24ABAC2BCF4;
 Tue,  6 Oct 2026 19:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1791315519;
 bh=4gZurF+WxwYW3vECDKp4O+sMU/KQSupKQ0lm4KQpDQI=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=krRPklGRd2XZDLxBWjLwubu0GxHSNhU1WJ8cQwjpa4e9DttFAVJMWl0RJ7OUkCxjl
 imH8YE101Hfx62uPHWtC0OynEs7kMGQpLreY1mnp27iBOlmZ0EQANXesQqCXvmjfn3
 5jqjyBqfLFKjIICd7xJcNdK98Xp/k99lueZriEXYvVVQi1hVsmNfjmT0yZm72Kn1vc
 Aew4C6AX2NAlnsygz8nBSWaXdY+m/8qBHODbQXDVzJXkp1wZNg+qrOaUhog298hIkm
 iBv35jUfZlhc1LgFpONix+FASoR6aJkRnMz+lIRzccaBsa2bKTrD1+8ao0j5OVvNNV
 hsx5+dieT8FKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD7BCA5FFC;
 Tue,  6 Oct 2026 19:38:39 +0000 (UTC)
From: =?utf-8?q?Burak_G=C3=B6nc=C3=BC_via_B4_Relay?=
 <devnull+burakgon12.gmail.com@kernel.org>
Date: Tue, 06 Oct 2026 22:38:38 +0300
Subject: [PATCH RFC] drm/i915/cx0: request TCSS power for the non-TC C20
 PHY on PTL port B
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261006-ptl-port-b-tcss-v1-1-240670342cd3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwMz3YKSHN2C/KIS3STdkuTiYl2LJMPkpGTTFEuLVAMloK6CotS0zAq
 widFKQW7OSrEQweLSpKzU5BKQWUq1tQBZaHFbeAAAAA==
X-Change-ID: 20261006-ptl-port-b-tcss-8b1cbc5d98e0
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Imre Deak <imre.deak@intel.com>, 
 Mika Kahola <mika.kahola@intel.com>, 
 =?utf-8?q?Burak_G=C3=B6nc=C3=BC?= <burakgon12@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791315518; l=8020;
 i=burakgon12@gmail.com; s=20261006; h=from:subject:message-id;
 bh=84O+rVPELklDafjdEzewckIfux8kE8FYZHGvW1Kv7BU=;
 b=TtxBEXa/wHxX3pLyi88l1wteEfUwhy9lGSs8XgWkAQeZiLqZNUynevfasfnTea5vzR18kNb7k
 1Y+sbNm7T3QCt7HSnPwpc4jIMtQw5s4RHctdwx3koGnYZHfSGZHTWdo
X-Developer-Key: i=burakgon12@gmail.com; a=ed25519;
 pk=qcexQajnoYGkNqFOy3eFqTzvqTOR/P++ksapi6qUbvw=
X-Endpoint-Received: by B4 Relay for burakgon12@gmail.com/20261006 with
 auth_id=1126
X-Original-From: =?utf-8?q?Burak_G=C3=B6nc=C3=BC?= <burakgon12@gmail.com>
X-Mailman-Approved-At: Wed, 07 Oct 2026 14:05:56 +0000
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
Reply-To: burakgon12@gmail.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Burak Göncü <burakgon12@gmail.com>

On PTL, port B is driven by a C20 PHY that sits in the Type-C subsystem,
but port B is not a TC port. The TC PHY code is what sets
XELPDP_TCSS_POWER_REQUEST, so for port B nothing in the driver does.

The ASUS Zenbook Duo UX8407AA connects its second internal panel (eDP-2)
to port B. The firmware lights that panel at power-on only when the
detachable keyboard is not lying on it. After a power-on with the
keyboard in place, the first enable of eDP-2 fails:

  PHY B failed to request refclk
  PHY B failed to change powerdown state
  PHY B failed to bring out of lane reset
  Failed to bring PHY B to idle.
  Port B PLL not locked
  Timeout waiting for DDI BUF B to get active

and every later commit on pipe B waits for the flip_done timeout, or the
machine hangs. The state survives warm reboots until a full power cycle.

In that state XELPDP_PORT_BUF_CTL1 of port B reads back with both
XELPDP_TCSS_POWER_REQUEST and XELPDP_TCSS_POWER_STATE clear, and its
XELPDP_PORT_CLOCK_CTL stays at 0xa0008400 where port A reaches
0xf0008400. With the request set, the power state is acknowledged, the
clock control reaches 0xf0008400 too and the panel comes up.

Request TCSS power, including the PTL mailbox handshake the TC code
uses (Wa_14020908590), before programming the PLL of a non-TC C20 PHY on
PTL, wait for the acknowledgment, and release the request once the PLL
is disabled, mirroring what the TC PHY code does for TC ports.

The failure and the TCSS power request as its fix were first identified
by the zenbook-duo26-Ubuntu26.04 project.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9196
Link: https://github.com/therealarnold666/zenbook-duo26-Ubuntu26.04
Assisted-by: LLM
Signed-off-by: Burak Göncü <burakgon12@gmail.com>
---
RFC because I cannot check this against Bspec. Questions:

- Does port B's C20 PHY on PTL always need the TCSS power request when it
  is used as a non-TC port, as this patch assumes, or does this belong in
  the port's power well / AUX handling, or in a board quirk?
- Should the request be held for as long as the port is in use rather
  than per PLL enable/disable? Releasing it while the panel is off puts
  the hardware back into the state an unpatched kernel has; holding it
  showed no measurable difference in package power or PC10/LPI residency
  on this machine.

Testing was done on an ASUS Zenbook Duo UX8407AA (BIOS 310) running
7.2.9, with this change limited to that board by a DMI match and
otherwise identical: power-on with the keyboard docked, then
undock/dock/undock, and s2idle with the keyboard docked. No PHY B
errors; XELPDP_TCSS_POWER_STATE follows the request, and the request is
clear while the panel is off. An earlier version that kept the request
set also went through s2idle with the panel on, and brought the panel
up in a boot that followed a failed eDP-2 enable on an unpatched kernel.
HDMI/DP on port B could not be tested, as this board only drives eDP
there.

Compile-tested on drm-tip with W=1 for i915 and xe (clang). Logs of
failing boots are in the gitlab issue.

An LLM-based assistant helped with the investigation and with writing
the patch; I tested it on the hardware and reviewed it.
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 36 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_tc.c      | 23 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_tc.h      |  1 +
 3 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index b83f0afaa..597ca94e5 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -54,6 +54,35 @@ bool intel_encoder_is_c10phy(struct intel_encoder *encoder)
 	return false;
 }
 
+/*
+ * On PTL, port B is driven by a C20 PHY inside the Type-C subsystem, but
+ * port B is not a TC port, so the TC PHY code never requests TCSS power
+ * for it. Unless the firmware has done so while lighting a display on the
+ * port at boot, the PHY then never acknowledges its refclk and PLL
+ * requests.
+ */
+static bool intel_cx0_needs_tcss_power(struct intel_encoder *encoder)
+{
+	struct intel_display *display = to_intel_display(encoder);
+
+	return display->platform.pantherlake &&
+	       !intel_encoder_is_c10phy(encoder) &&
+	       !intel_encoder_is_tc(encoder);
+}
+
+static void intel_cx0_request_tcss_power(struct intel_encoder *encoder, bool enable)
+{
+	struct intel_display *display = to_intel_display(encoder);
+
+	intel_tc_request_tcss_power(encoder, enable);
+
+	if (enable &&
+	    intel_de_wait_for_set_ms(display, XELPDP_PORT_BUF_CTL1(display, encoder->port),
+				     XELPDP_TCSS_POWER_STATE, 5))
+		drm_warn(display->drm, "Port %c: TCSS power request not acknowledged\n",
+			 port_name(encoder->port));
+}
+
 static int lane_mask_to_lane(u8 lane_mask)
 {
 	if (WARN_ON((lane_mask & ~INTEL_CX0_BOTH_LANES) ||
@@ -3191,6 +3220,10 @@ static void intel_cx0pll_enable(struct intel_encoder *encoder,
 	 */
 	drm_WARN_ON(display->drm, lane_reversal && intel_tc_port_in_dp_alt_mode(dig_port));
 
+	/* The PHY must be powered before its clocks are requested. */
+	if (intel_cx0_needs_tcss_power(encoder))
+		intel_cx0_request_tcss_power(encoder, true);
+
 	/*
 	 * 1. Program PORT_CLOCK_CTL REGISTER to configure
 	 * clock muxes, gating and SSC
@@ -3536,6 +3569,9 @@ static void intel_cx0pll_disable(struct intel_encoder *encoder)
 	intel_de_rmw(display, XELPDP_PORT_CLOCK_CTL(display, encoder->port),
 		     XELPDP_FORWARD_CLOCK_UNGATE, 0);
 
+	if (intel_cx0_needs_tcss_power(encoder))
+		intel_cx0_request_tcss_power(encoder, false);
+
 	intel_cx0_phy_transaction_end(encoder, wakeref);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index f2d86b29c..2a8665d4c 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -1090,6 +1090,29 @@ static void xelpdp_tc_power_request_wa(struct intel_display *display, bool enabl
 	}
 }
 
+/**
+ * intel_tc_request_tcss_power - request TCSS power for a non-TC port's PHY
+ * @encoder: encoder of a non-TC port whose PHY sits in the Type-C subsystem
+ * @enable: request or release the power
+ *
+ * TC ports get TCSS power from the TC PHY code. This is for a non-TC port
+ * whose PHY nevertheless needs it, like port B's C20 PHY on PTL.
+ */
+void intel_tc_request_tcss_power(struct intel_encoder *encoder, bool enable)
+{
+	struct intel_display *display = to_intel_display(encoder);
+	intel_reg_t reg = XELPDP_PORT_BUF_CTL1(display, encoder->port);
+
+	if (!!(intel_de_read(display, reg) & XELPDP_TCSS_POWER_REQUEST) == enable)
+		return;
+
+	if (DISPLAY_VER(display) == 30)
+		xelpdp_tc_power_request_wa(display, enable);
+
+	intel_de_rmw(display, reg, XELPDP_TCSS_POWER_REQUEST,
+		     enable ? XELPDP_TCSS_POWER_REQUEST : 0);
+}
+
 static void __xelpdp_tc_phy_enable_tcss_power(struct intel_tc_port *tc, bool enable)
 {
 	struct intel_display *display = to_intel_display(tc->dig_port);
diff --git a/drivers/gpu/drm/i915/display/intel_tc.h b/drivers/gpu/drm/i915/display/intel_tc.h
index 6719aea5b..b49a5b5c5 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.h
+++ b/drivers/gpu/drm/i915/display/intel_tc.h
@@ -88,6 +88,7 @@ bool intel_tc_port_in_legacy_mode(struct intel_digital_port *dig_port);
 bool intel_tc_port_handles_hpd_glitches(struct intel_digital_port *dig_port);
 
 bool intel_tc_port_connected(struct intel_encoder *encoder);
+void intel_tc_request_tcss_power(struct intel_encoder *encoder, bool enable);
 
 enum intel_tc_pin_assignment
 intel_tc_port_get_pin_assignment(struct intel_digital_port *dig_port);

---
base-commit: daeb062fc40f727fafefed080c6d12a5ad1d0d12
change-id: 20261006-ptl-port-b-tcss-8b1cbc5d98e0

Best regards,
--  
Burak Göncü <burakgon12@gmail.com>


