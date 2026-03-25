Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EFE109C05A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 18:54:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E9F10E888;
	Wed, 25 Mar 2026 18:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsuPp+XH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95A010E888;
 Wed, 25 Mar 2026 18:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774464871; x=1806000871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OqL8diJiuTn7luNC7KkNKe42983IL/+qJUojdCFq0dk=;
 b=BsuPp+XHsC37j/r6GUMPaShY/q/iSbOQKQNhdwiuc9Ve0BsPxd7qnNWo
 XQg8wa7BdhgxakFZvuOCkNCrP85qiuu/Pq2+R5jYKCiocoMCLk8REv7Nb
 9EaqaX+8wuTLdQfOtf4o+K2g59sLqm/U8xobqQrT0PEthfwkOM05tw+I7
 /peUWKuGa8/qrvI8CjM2d6NzR9AioKEpL5IUmEI9TOW84W7CNyDgzA8Du
 aDIBsANkOJIW9OuWTxUR7W6V7XXX/XqPZlUmjrc9gvDI+geDHOa2opWBr
 sbjsiPTPG781pRR7yEmY3Iz8eLYRiXL4d1Cr5EQDPByCLJluu3VWbbXav w==;
X-CSE-ConnectionGUID: 3a1hsALzQeOGDp8cBE4w8A==
X-CSE-MsgGUID: ev7Ksmv/QDOm+3e58bBkhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86991709"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="86991709"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 11:54:30 -0700
X-CSE-ConnectionGUID: g2MdITieQX+drT6kcAgWfA==
X-CSE-MsgGUID: L3ElyzEnQHiUdR/Rho/AeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="221448848"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.117])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 11:54:29 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 12/12] drm/i915/rom: Use intel_de for SPI ROM register access
Date: Wed, 25 Mar 2026 20:53:41 +0200
Message-ID: <20260325185342.11482-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260325185342.11482-1-ville.syrjala@linux.intel.com>
References: <20260325185342.11482-1-ville.syrjala@linux.intel.com>
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

Since we moved intel_rom.c back into the display code, juse
use intel_de_{read,write}() for the register accesses.

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

