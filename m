Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19884109B492
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 15:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9F310EAE6;
	Tue, 31 Mar 2026 15:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oEuuFzJm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250A510EAE6;
 Tue, 31 Mar 2026 15:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774971834; x=1806507834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0C67toRMXqRwv/RWf0OxDdihmGENjtUtpLGRQXQhZ6A=;
 b=oEuuFzJmxrZQCgIVjeSEMOqvjEH0LZPmdDkdi+q7depcx9yI857su6OC
 qNoR2j4evgd6Md0wUFTTt54YAaGbGwPA6JwCZi3+13wl0pVaqprqXS72Y
 b9tSx+vyr63ZiedTmhvN8BSgeumdc1DGhU6/PwrDp2Bzn0ys0xoHHidd4
 gugeIZokqV+A8+wxXEsBl1XVzdu8XTP5JSs5r4K87o+Y6PuIMa7FgJjsA
 mS7BCfs3ta/DjpSQWQquuWcDodxpxE0+70JGwQ+7odSV3bzpydznRO2ba
 IyDM9Qryjymgw6VlePtt1sRMRfFlXzLDLJgOaR4m+Ie0k6LLzZYwUdnHj g==;
X-CSE-ConnectionGUID: GRtsv8FiQ4KVm4Y9jxf+5A==
X-CSE-MsgGUID: yLpkfpQOS9y/iOsgsw7RTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76181031"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="76181031"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:43:54 -0700
X-CSE-ConnectionGUID: fbwGhy6aQjiAM6ieO4EBIQ==
X-CSE-MsgGUID: uHNFRMN0TZimHCreQdkVVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="223519439"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:43:52 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 12/12] drm/i915/rom: Use intel_de for SPI ROM register
 access
Date: Tue, 31 Mar 2026 18:42:59 +0300
Message-ID: <20260331154259.24600-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260331154259.24600-1-ville.syrjala@linux.intel.com>
References: <20260331154259.24600-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Since we moved intel_rom.c back into the display code, just
use intel_de_{read,write}() for the register accesses.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_rom.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_rom.c b/drivers/gpu/drm/i915/display/intel_rom.c
index d573059fb0d9..54f842c09fb0 100644
--- a/drivers/gpu/drm/i915/display/intel_rom.c
+++ b/drivers/gpu/drm/i915/display/intel_rom.c
@@ -7,8 +7,9 @@
 
 #include <drm/drm_device.h>
 
+#include "intel_de.h"
+#include "intel_display_types.h"
 #include "intel_rom.h"
-#include "intel_uncore.h"
 #include "intel_oprom_regs.h"
 
 struct intel_rom {
@@ -17,7 +18,7 @@ struct intel_rom {
 	void __iomem *oprom;
 
 	/* for SPI */
-	struct intel_uncore *uncore;
+	struct intel_display *display;
 	loff_t offset;
 
 	size_t size;
@@ -30,10 +31,10 @@ struct intel_rom {
 
 static u32 spi_read32(struct intel_rom *rom, loff_t offset)
 {
-	intel_uncore_write(rom->uncore, PRIMARY_SPI_ADDRESS,
-			   rom->offset + offset);
+	intel_de_write(rom->display, PRIMARY_SPI_ADDRESS,
+		       rom->offset + offset);
 
-	return intel_uncore_read(rom->uncore, PRIMARY_SPI_TRIGGER);
+	return intel_de_read(rom->display, PRIMARY_SPI_TRIGGER);
 }
 
 static u16 spi_read16(struct intel_rom *rom, loff_t offset)
@@ -50,13 +51,13 @@ struct intel_rom *intel_rom_spi(struct drm_device *drm)
 	if (!rom)
 		return NULL;
 
-	rom->uncore = to_intel_uncore(drm);
+	rom->display = to_intel_display(drm);
 
-	static_region = intel_uncore_read(rom->uncore, SPI_STATIC_REGIONS);
+	static_region = intel_de_read(rom->display, SPI_STATIC_REGIONS);
 	static_region &= OPTIONROM_SPI_REGIONID_MASK;
-	intel_uncore_write(rom->uncore, PRIMARY_SPI_REGIONID, static_region);
+	intel_de_write(rom->display, PRIMARY_SPI_REGIONID, static_region);
 
-	rom->offset = intel_uncore_read(rom->uncore, OROM_OFFSET) & OROM_OFFSET_MASK;
+	rom->offset = intel_de_read(rom->display, OROM_OFFSET) & OROM_OFFSET_MASK;
 
 	rom->size = 0x200000;
 
-- 
2.52.0

