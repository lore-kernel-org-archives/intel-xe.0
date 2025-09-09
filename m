Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF4DCA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 16:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816F910E7AB;
	Tue,  9 Sep 2025 16:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XU9F/Cc0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA67C10E247
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 16:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757433776; x=1788969776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ieA019sDz5UPrz1C1mfqAv9txA59u5OrnFOppREqMe0=;
 b=XU9F/Cc0mo5dLtYT9Tnl30ItyXpygYJPvQbZExUrDt3z0A2An22NSRti
 FDpA5YD1/5Ut8r47q3ufzXApKkGbrVr+gxpxPPa7P1IlmmhfQK0Z8PtFt
 iM/xlGOIYz3+za1AnBMTsHRlwAnlikp4ehks05BawzE83vNUMxTzF9HcF
 D2M59mKJVQmyGsnC7YOhEePGefn/VVHcdjbNQS1iDaWVotS3r+Br6JxCO
 /IHXgVXV9rRFWEcWNnQiWg44ZJXOdavPxzXzx9BMXnj14g0rXL/9BWntn
 Z8SiSNjIB+ZesReR6QgyDKCpMOj4Kb5JPW261RC6ZX3V7VAtWiCAs+Ivt A==;
X-CSE-ConnectionGUID: p5YBqwTsRrKvcekQmpA71w==
X-CSE-MsgGUID: sCfVBwcNSr6JnJFzjsY8Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="47296495"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="47296495"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 09:02:53 -0700
X-CSE-ConnectionGUID: Ob6pjlFBS8OlR7097S2ylA==
X-CSE-MsgGUID: yZAcNBsoTrKKrpmXYXx54A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172993657"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 09:02:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 1/4] drm/xe/device: Use poll_timeout_us() to wait for lmem
Date: Tue,  9 Sep 2025 09:02:35 -0700
Message-ID: <20250909-xe-iopoll-v2-1-4c7ae9726e8e@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250909-xe-iopoll-v2-0-4c7ae9726e8e@intel.com>
References: <20250909-xe-iopoll-v2-0-4c7ae9726e8e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

Now that there's a generic poll_timeout_us(), use it to wait for
LMEM_INIT in GU_CNTL.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2:
- Handle signal_pending() as it was originally
- Don't mix return from poll_timeout_us() with return from condition
  (Maarten)
---
 drivers/gpu/drm/xe/xe_device.c | 65 ++++++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9e2952c9c06a8..be7844968011a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -8,6 +8,7 @@
 #include <linux/aperture.h>
 #include <linux/delay.h>
 #include <linux/fault-inject.h>
+#include <linux/iopoll.h>
 #include <linux/units.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -627,16 +628,22 @@ static int xe_set_dma_info(struct xe_device *xe)
 	return err;
 }
 
-static bool verify_lmem_ready(struct xe_device *xe)
+static int lmem_initializing(struct xe_device *xe)
 {
-	u32 val = xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL) & LMEM_INIT;
+	if (xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL) & LMEM_INIT)
+		return 0;
+
+	if (signal_pending(current))
+		return -EINTR;
 
-	return !!val;
+	return 1;
 }
 
 static int wait_for_lmem_ready(struct xe_device *xe)
 {
-	unsigned long timeout, start;
+	const unsigned long TIMEOUT_SEC = 60;
+	unsigned long prev_jiffies;
+	int initializing;
 
 	if (!IS_DGFX(xe))
 		return 0;
@@ -644,39 +651,35 @@ static int wait_for_lmem_ready(struct xe_device *xe)
 	if (IS_SRIOV_VF(xe))
 		return 0;
 
-	if (verify_lmem_ready(xe))
+	if (!lmem_initializing(xe))
 		return 0;
 
 	drm_dbg(&xe->drm, "Waiting for lmem initialization\n");
+	prev_jiffies = jiffies;
 
-	start = jiffies;
-	timeout = start + secs_to_jiffies(60); /* 60 sec! */
-
-	do {
-		if (signal_pending(current))
-			return -EINTR;
-
-		/*
-		 * The boot firmware initializes local memory and
-		 * assesses its health. If memory training fails,
-		 * the punit will have been instructed to keep the GT powered
-		 * down.we won't be able to communicate with it
-		 *
-		 * If the status check is done before punit updates the register,
-		 * it can lead to the system being unusable.
-		 * use a timeout and defer the probe to prevent this.
-		 */
-		if (time_after(jiffies, timeout)) {
-			drm_dbg(&xe->drm, "lmem not initialized by firmware\n");
-			return -EPROBE_DEFER;
-		}
-
-		msleep(20);
-
-	} while (!verify_lmem_ready(xe));
+	/*
+	 * The boot firmware initializes local memory and
+	 * assesses its health. If memory training fails,
+	 * the punit will have been instructed to keep the GT powered
+	 * down.we won't be able to communicate with it
+	 *
+	 * If the status check is done before punit updates the register,
+	 * it can lead to the system being unusable.
+	 * use a timeout and defer the probe to prevent this.
+	 */
+	poll_timeout_us(initializing = lmem_initializing(xe),
+			initializing <= 0,
+			20 * USEC_PER_MSEC, TIMEOUT_SEC * USEC_PER_SEC, true);
+	if (initializing < 0)
+		return initializing;
+
+	if (initializing) {
+		drm_dbg(&xe->drm, "lmem not initialized by firmware\n");
+		return -EPROBE_DEFER;
+	}
 
 	drm_dbg(&xe->drm, "lmem ready after %ums",
-		jiffies_to_msecs(jiffies - start));
+		jiffies_to_msecs(jiffies - prev_jiffies));
 
 	return 0;
 }

-- 
2.50.1

