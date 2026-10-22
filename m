Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8C5606A31D
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 11:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LMx4f4C8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A41911251C;
	Thu, 22 Oct 2026 11:56:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6618A11250B;
 Thu, 22 Oct 2026 11:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792670165; x=1824206165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DZ40MB10qP/GHubceg4uyqvebfZus1h6jT0Y4HjGteU=;
 b=LMx4f4C8q/zb1tYIeRzM8Nx3FOycc92O+Ns0wOJ/bgJEmOx52t5BsS2i
 N4ETKkcv7y5K1nfSGqAXs3A/+5GCMWrSbNA99Pl/94AlYDbQljLxoM0Th
 KRFg2sE99iAMn+G1OqruxvN1OV4fH+PqKWRD3iDvxkypDiEmJvkdJGTSD
 M51L3lFxYmiFrXe9cbhYmxuBHY5aCe1PiUcD2W1NJLiWw3hxN81ybrp4Z
 iYwTHXqKpx5qSHWsCxZlZ+p1oH8DuvgJlE4OYaaPm3LYUjifuza9bKPrN
 6NcD6R0pL9Leqxs+GOXgr4Zu0NAa/SpO009Exaurb8GqfCOJrkmTKUG2U Q==;
X-CSE-ConnectionGUID: afvZm2p2S4KU9+EMU1PhOw==
X-CSE-MsgGUID: eAX/DROlSOWQJ3rw0lJRzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1520069"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1520069"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 04:56:04 -0700
X-CSE-ConnectionGUID: 9pkjbgJoSiWpRBEww8lJ5A==
X-CSE-MsgGUID: 9OokjK5GT7G+/wTaGWM0rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3351470"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.245])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 04:56:03 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915: Use intel_de_{read,
 write})fw() in VLV/CHV irq handlers
Date: Thu, 22 Oct 2026 14:55:47 +0300
Message-ID: <20261022115548.32678-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022115548.32678-1-ville.syrjala@linux.intel.com>
References: <20261022115548.32678-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

MMIO is rather expensive on VLV and CHV. MMIO read in particular
seems to take around 450 ns on CHV. VLV is a bit better
in the 200-300 ns range. The use of the non-fw() register
accessors means that each actual register access is bracketed
by two CLAIM_ER reads. I'm thinking we don't want that extra
cost in the irq handlers, so switch over to the fw() accessors.

On VLV/CHV this also means we lose the uncore.lock protection
around the MMIO accesses, but that is fine as these platforms
do not need any serialization of parallel MMIO accesses.

This actually changes all GMCH platofors since the irq
handlers are shared between the platforms. But that doesn't
actually cause significant functional changes on the older
platforms as the non-fw() accessors are identical to the fw()
versions, apart from some rpm asserts.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../gpu/drm/i915/display/intel_display_irq.c  | 32 +++++++++----------
 .../gpu/drm/i915/display/intel_hotplug_irq.c  |  8 ++---
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index d2d45767bfd2..25b899990475 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -501,19 +501,19 @@ static void i9xx_pipe_crc_irq_handler(struct intel_display *display,
 	u32 res1, res2;
 
 	if (DISPLAY_VER(display) >= 3)
-		res1 = intel_de_read(display, PIPE_CRC_RES_RES1_I915(display, pipe));
+		res1 = intel_de_read_fw(display, PIPE_CRC_RES_RES1_I915(display, pipe));
 	else
 		res1 = 0;
 
 	if (DISPLAY_VER(display) >= 5 || display->platform.g4x)
-		res2 = intel_de_read(display, PIPE_CRC_RES_RES2_G4X(display, pipe));
+		res2 = intel_de_read_fw(display, PIPE_CRC_RES_RES2_G4X(display, pipe));
 	else
 		res2 = 0;
 
 	display_pipe_crc_irq_handler(display, pipe,
-				     intel_de_read(display, PIPE_CRC_RES_RED(display, pipe)),
-				     intel_de_read(display, PIPE_CRC_RES_GREEN(display, pipe)),
-				     intel_de_read(display, PIPE_CRC_RES_BLUE(display, pipe)),
+				     intel_de_read_fw(display, PIPE_CRC_RES_RED(display, pipe)),
+				     intel_de_read_fw(display, PIPE_CRC_RES_GREEN(display, pipe)),
+				     intel_de_read_fw(display, PIPE_CRC_RES_BLUE(display, pipe)),
 				     res1, res2);
 }
 
@@ -577,7 +577,7 @@ static void i9xx_pipestat_irq_ack(struct intel_display *display,
 			continue;
 
 		reg = PIPESTAT(display, pipe);
-		pipe_stats[pipe] = intel_de_read(display, reg) & status_mask;
+		pipe_stats[pipe] = intel_de_read_fw(display, reg) & status_mask;
 		enable_mask = i915_pipestat_enable_mask(display, pipe);
 
 		/*
@@ -590,8 +590,8 @@ static void i9xx_pipestat_irq_ack(struct intel_display *display,
 		 * an interrupt is still pending.
 		 */
 		if (pipe_stats[pipe]) {
-			intel_de_write(display, reg, pipe_stats[pipe]);
-			intel_de_write(display, reg, enable_mask);
+			intel_de_write_fw(display, reg, pipe_stats[pipe]);
+			intel_de_write_fw(display, reg, enable_mask);
 		}
 	}
 	spin_unlock(&display->irq.lock);
@@ -1893,7 +1893,7 @@ static void vlv_page_table_error_irq_ack(struct intel_display *display, u32 *dpi
 {
 	u32 status, enable, tmp;
 
-	tmp = intel_de_read(display, DPINVGTT);
+	tmp = intel_de_read_fw(display, DPINVGTT);
 
 	enable = tmp >> 16;
 	status = tmp & 0xffff;
@@ -1909,8 +1909,8 @@ static void vlv_page_table_error_irq_ack(struct intel_display *display, u32 *dpi
 	enable &= ~status;
 
 	/* customary ack+disable then re-enable to guarantee an edge */
-	intel_de_write(display, DPINVGTT, status);
-	intel_de_write(display, DPINVGTT, enable << 16);
+	intel_de_write_fw(display, DPINVGTT, status);
+	intel_de_write_fw(display, DPINVGTT, enable << 16);
 }
 
 static void vlv_page_table_error_irq_handler(struct intel_display *display, u32 dpinvgtt)
@@ -1932,21 +1932,21 @@ static void vlv_display_error_irq_ack(struct intel_display *display,
 {
 	u32 emr;
 
-	*eir = intel_de_read(display, VLV_EIR);
+	*eir = intel_de_read_fw(display, VLV_EIR);
 
 	if (*eir & VLV_ERROR_PAGE_TABLE)
 		vlv_page_table_error_irq_ack(display, dpinvgtt);
 
-	intel_de_write(display, VLV_EIR, *eir);
+	intel_de_write_fw(display, VLV_EIR, *eir);
 
 	/*
 	 * Toggle all EMR bits to make sure we get an edge
 	 * in the ISR master error bit if we don't clear
 	 * all the EIR bits.
 	 */
-	emr = intel_de_read(display, VLV_EMR);
-	intel_de_write(display, VLV_EMR, 0xffffffff);
-	intel_de_write(display, VLV_EMR, emr);
+	emr = intel_de_read_fw(display, VLV_EMR);
+	intel_de_write_fw(display, VLV_EMR, 0xffffffff);
+	intel_de_write_fw(display, VLV_EMR, emr);
 }
 
 static void vlv_display_error_irq_handler(struct intel_display *display,
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c b/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
index 913fcd2a1723..ce0c8f56106a 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
@@ -439,15 +439,15 @@ u32 i9xx_hpd_irq_ack(struct intel_display *display)
 	 * bits can itself generate a new hotplug interrupt :(
 	 */
 	for (i = 0; i < 10; i++) {
-		u32 tmp = intel_de_read(display,
-					PORT_HOTPLUG_STAT(display)) & hotplug_status_mask;
+		u32 tmp = intel_de_read_fw(display,
+					   PORT_HOTPLUG_STAT(display)) & hotplug_status_mask;
 
 		if (tmp == 0)
 			return hotplug_status;
 
 		hotplug_status |= tmp;
-		intel_de_write(display, PORT_HOTPLUG_STAT(display),
-			       hotplug_status);
+		intel_de_write_fw(display, PORT_HOTPLUG_STAT(display),
+				  hotplug_status);
 	}
 
 	drm_WARN_ONCE(display->drm, 1,
-- 
2.55.0

