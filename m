Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FF0D111A8
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 10:32:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEE010E36D;
	Mon,  1 Dec 2025 10:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VLm/ecpS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BE210E380
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 10:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764585120; x=1796121120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WIMgytpzOqCzi+LOWpX0RfNX1LQheyr0fvWyr4nykfY=;
 b=VLm/ecpStJlcOgn7xVF0g7jm+NUS1S/59nPlSoL0Gv9hTpglxDzDZrSL
 oBEnAL5xODkMMZu8WsDtQuHjvn2fm+bUEv8e9BU3tuGfFyfXx1YbTYWJa
 yTnCjoUIBfgIj/LmMKv9I7lbqtNdUBJrpGgJTomkQFPRUUjuvOl3aPDHq
 lxjti1PaZGyDt0Ez+JVy3Pk+1pRewiUiYggWYGR1PsSGSUM3gY41IMmBW
 LYnnaQm/Ko/8P1WdFhsrhmkcvQXPMCKH64ZjcwJ/kVpB/1fh8Ix3yyfJJ
 BIvBhZuN7G1dzNM9E3eB6M52ndmaa4+CziJaQOaA0Vn8qWJzVLCRUFwQR Q==;
X-CSE-ConnectionGUID: Cosz2mmRRgOIDXrrQVUCpQ==
X-CSE-MsgGUID: vtZrgDNrSA2Dg4rJxf5vDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="70131285"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="70131285"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 02:32:00 -0800
X-CSE-ConnectionGUID: Mj0XHOUWTIWgBK9VGzGa2A==
X-CSE-MsgGUID: gBwOLeQPRuaFkPTz60dVUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="194134159"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 01 Dec 2025 02:31:57 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: rodrigo.vivi@intel.com,
	jani.nikula@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com, ville.syrjala@linux.intel.com,
 karthik.poosa@intel.com, anshuman.gupta@intel.com,
 matthew.d.roper@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 1/4] drm/xe/pcode: Introduce PCODE_FALLBACK_MAGIC
Date: Mon,  1 Dec 2025 15:57:55 +0530
Message-ID: <20251201102902.362650-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201102902.362650-1-raag.jadav@intel.com>
References: <20251201102902.362650-1-raag.jadav@intel.com>
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

If the device is running older PCODE firmware, it is possible that newer
mailbox commands are not supported by it. The respective functionality
isn't useful in that case but nor is error logging, as it doesn't
particularly signify anything wrong with PCODE firmware or device as a
whole. Introduce PCODE_FALLBACK_MAGIC bit which allows checking for
mailbox command support without it being reported as a fatal error. This
is useful in cases where we want to make functionality decisions in the
driver and allow the caller to determine the fallback path based on PCODE
return codes. This is a relatively simpler design choice compared to other
solutions like checking PCODE firmware version, which comes with additional
complexity of binding every single command to a specific version and deems
PCODE commands useless in case the driver fails to obtain it for reasons
unrelated to PCODE.

The fallback is only allowed for command and subcommand failures and other
failures are still reported as fatal errors, so we don't end up hiding the
genuine ones.

v2: Convert fallback cases to -EOPNOTSUPP (Lucas)
    Use xe_tile_err() (Michal)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c     | 47 ++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_pcode_api.h |  1 +
 2 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 0d33c14ea0cf..4078c4aa2b35 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -15,6 +15,7 @@
 #include "xe_device.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
+#include "xe_tile_printk.h"
 
 /**
  * DOC: PCODE
@@ -25,12 +26,28 @@
  * single and consolidated place that will communicate with PCODE. All read
  * and write operations to PCODE will be internal and private to this component.
  *
+ * The usual PCODE return codes translate to:
+ * - 0: "Command Success"
+ * - -ENXIO: "Illegal Command"
+ * - -ETIMEDOUT: "Timed out"
+ * - -EINVAL: "Illegal Data"
+ * - -ENXIO, "Illegal Subcommand"
+ * - -EBUSY: "PCODE Locked"
+ * - -EOVERFLOW, "GT ratio out of range"
+ * - -EACCES, "PCODE Rejected"
+ * - -EPROTO, "Unknown"
+ *
+ * All failure are reported as fatal errors except -EOPNOTSUPP, which is returned only
+ * when PCODE_FALLBACK_MAGIC is embedded with mailbox command. This is facilitated to
+ * allow the caller to check for mailbox command support without it being reported as
+ * a fatal error.
+ *
  * What's next:
  * - PCODE hw metrics
  * - PCODE for display operations
  */
 
-static int pcode_mailbox_status(struct xe_tile *tile)
+static int pcode_mailbox_status(struct xe_tile *tile, bool fallback)
 {
 	const char *err_str;
 	int err_decode;
@@ -57,8 +74,14 @@ static int pcode_mailbox_status(struct xe_tile *tile)
 	}
 
 	if (err) {
-		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
-			err_decode, err_str);
+		if (fallback && err_decode == -ENXIO)
+			/*
+			 * Command/Subcommand is not supported, allow the caller to fallback
+			 * instead of reporting a fatal error.
+			 */
+			err_decode = -EOPNOTSUPP;
+		else
+			xe_tile_err(tile, "PCODE Mailbox failed: %d %s", err_decode, err_str);
 
 		return err_decode;
 	}
@@ -72,6 +95,7 @@ static int __pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *d
 			      bool atomic)
 {
 	struct xe_mmio *mmio = &tile->mmio;
+	bool fallback;
 	int err;
 
 	if (tile_to_xe(tile)->info.skip_pcode)
@@ -80,6 +104,10 @@ static int __pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *d
 	if ((xe_mmio_read32(mmio, PCODE_MAILBOX) & PCODE_READY) != 0)
 		return -EAGAIN;
 
+	fallback = REG_FIELD_GET(PCODE_FALLBACK_MAGIC, mbox);
+	if (fallback)
+		mbox &= ~PCODE_FALLBACK_MAGIC;
+
 	xe_mmio_write32(mmio, PCODE_DATA0, *data0);
 	xe_mmio_write32(mmio, PCODE_DATA1, data1 ? *data1 : 0);
 	xe_mmio_write32(mmio, PCODE_MAILBOX, PCODE_READY | mbox);
@@ -95,7 +123,7 @@ static int __pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *d
 			*data1 = xe_mmio_read32(mmio, PCODE_DATA1);
 	}
 
-	return pcode_mailbox_status(tile);
+	return pcode_mailbox_status(tile, fallback);
 }
 
 static int pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *data1,
@@ -240,16 +268,7 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
  * not take the right decisions for some memory frequencies and affect latency.
  *
  * It returns 0 on success, and -ERROR number on failure, -EINVAL if max
- * frequency is higher then the minimal, and other errors directly translated
- * from the PCODE Error returns:
- * - -ENXIO: "Illegal Command"
- * - -ETIMEDOUT: "Timed out"
- * - -EINVAL: "Illegal Data"
- * - -ENXIO, "Illegal Subcommand"
- * - -EBUSY: "PCODE Locked"
- * - -EOVERFLOW, "GT ratio out of range"
- * - -EACCES, "PCODE Rejected"
- * - -EPROTO, "Unknown"
+ * frequency is higher then the minimal.
  */
 int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
 				 u32 max_gt_freq)
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 70dcd6625680..a5157966478a 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -9,6 +9,7 @@
 
 #define PCODE_MAILBOX			XE_REG(0x138124)
 #define   PCODE_READY			REG_BIT(31)
+#define   PCODE_FALLBACK_MAGIC		REG_BIT(30)	/* Driver use only, not used by PCODE */
 #define   PCODE_MB_PARAM2		REG_GENMASK(23, 16)
 #define   PCODE_MB_PARAM1		REG_GENMASK(15, 8)
 #define   PCODE_MB_COMMAND		REG_GENMASK(7, 0)
-- 
2.43.0

