Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A57FCB60B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 15:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669D710E3ED;
	Fri,  6 Mar 2026 15:14:07 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B0110E3ED;
 Fri,  6 Mar 2026 15:14:05 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 13D6D3F1E5;
 Fri,  6 Mar 2026 16:14:02 +0100 (CET)
From: Simon Richter <Simon.Richter@hogyros.de>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Simon Richter <Simon.Richter@hogyros.de>
Subject: [PATCH v3 1/1] drm/i915: handle failure from vga_get_uninterruptible()
Date: Sat,  7 Mar 2026 00:13:16 +0900
Message-ID: <20260306151347.758836-1-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218131131.460105-1-Simon.Richter@hogyros.de>
References: <20260218131131.460105-1-Simon.Richter@hogyros.de>
MIME-Version: 1.0
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

The vga_get_uninterruptible() function can return an error if it fails to
set up VGA decoding for the requested device.

If VGA decoding is unavailable, we don't need to be careful to leave the
VGA emulation in a usable state, as vgacon will also be unable to get
access later on, so just skip over the VGA accesses and the vga_put() call
matching the failed vga_get_uninterruptible().

Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1824
---
 drivers/gpu/drm/i915/display/intel_vga.c | 33 +++++++++++++++++++-----
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index 6fc3e3702cb8..9832a4ade318 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -112,12 +112,16 @@ static bool intel_pci_bridge_set_vga(struct pci_dev *pdev, bool enable)
 	return old & PCI_BRIDGE_CTL_VGA;
 }
 
-static bool intel_vga_get(struct intel_display *display, bool mmio)
+static int intel_vga_get(struct intel_display *display, bool mmio,
+			 bool *old_io_decode)
 {
 	struct pci_dev *pdev = to_pci_dev(display->drm->dev);
+	int err;
 
-	if (mmio)
-		return false;
+	if (mmio) {
+		*old_io_decode = false;
+		return 0;
+	}
 
 	/*
 	 * Bypass the VGA arbiter on the iGPU and just enable
@@ -130,10 +134,15 @@ static bool intel_vga_get(struct intel_display *display, bool mmio)
 	 * grab any VGA IO access when IO decode is enabled, regardless
 	 * of how any other VGA routing bits are configured.
 	 */
-	if (display->platform.dgfx)
-		vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
+	if (display->platform.dgfx) {
+		err = vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
+		if (err)
+			return err;
+	}
+
+	*old_io_decode = intel_pci_set_io_decode(pdev, true);
 
-	return intel_pci_set_io_decode(pdev, true);
+	return 0;
 }
 
 static void intel_vga_put(struct intel_display *display, bool io_decode, bool mmio)
@@ -175,6 +184,7 @@ void intel_vga_disable(struct intel_display *display)
 	bool io_decode;
 	u8 msr, sr1;
 	u32 tmp;
+	int err;
 
 	if (!intel_vga_decode_is_enabled(display)) {
 		drm_dbg_kms(display->drm, "VGA decode is disabled\n");
@@ -216,7 +226,16 @@ void intel_vga_disable(struct intel_display *display)
 			goto reset_vgacntr;
 	}
 
-	io_decode = intel_vga_get(display, mmio);
+	/*
+	 * This should not fail, because the vga_get() family of functions
+	 * will only report errors for dGPUs that are unreachable via the
+	 * bridge, and cannot be made reachable either. We shouldn't even
+	 * get here for this case, but if we do, we assume that the bridge
+	 * will also refuse future requests to forward VGA accesses.
+	 */
+	err = intel_vga_get(display, mmio, &io_decode);
+	if (err)
+		goto reset_vgacntr;
 
 	drm_WARN_ON(display->drm, !mmio && !intel_pci_has_vga_io_decode(pdev));
 
-- 
2.47.3

