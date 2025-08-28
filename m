Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F10CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 22:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D1810EAEB;
	Thu, 28 Aug 2025 22:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aoEImUZ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A66C10EAEA
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 22:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756418719; x=1787954719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CylovF21glYRleGlF3qortMSkI7fL3O/pYpzXfHchBE=;
 b=aoEImUZ25JjNCry7OkHDIX8FVuSMlzdbCZWx3AK5ipwRODCNZOb9DWui
 02dtqI4+HyGtvNrGO2isln37NJk39TCM/Cru8Hs9OZd5C0UWF0UeMoiGq
 Co1Doc97ZR5bKi/6FKRROOiKF0+WiCIxsfPRanofMjnBTtLv/xr3TRy7y
 jI5wm50sw1pLyEGWVIiIXMYLDthdvd4zQYqHIMfQBioq032Yg963yYU6z
 95sOq1FtJ73BMh2GCd77mK6b13bXMP8qARIX5wwZMvDXzpu6OPhGl4hBG
 Mi9zfEfh3eziXLtjvqrwbjvQPyDEs+VJAmHxPVgws2pPx2IiLLjcWDxAK A==;
X-CSE-ConnectionGUID: pYn8XADSRMeldrAqg55Hgw==
X-CSE-MsgGUID: 9ASZUP0YReyAIn4VweNPtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84106380"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="84106380"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 15:05:19 -0700
X-CSE-ConnectionGUID: x3q+A6cBTpKla0rHl/jn1w==
X-CSE-MsgGUID: 1MmlWylZQDi6HDDm2XsTGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170126762"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 15:05:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/4] drm/xe/device: Use poll_timeout_us() to wait for lmem
Date: Thu, 28 Aug 2025 15:04:56 -0700
Message-ID: <20250828-xe-iopoll-v1-1-9832ccd1c8b1@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250828-xe-iopoll-v1-0-9832ccd1c8b1@intel.com>
References: <20250828-xe-iopoll-v1-0-9832ccd1c8b1@intel.com>
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
 drivers/gpu/drm/xe/xe_device.c | 50 +++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9e4773a17ef8d..ffcd3d04ebbf7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -8,6 +8,7 @@
 #include <linux/aperture.h>
 #include <linux/delay.h>
 #include <linux/fault-inject.h>
+#include <linux/iopoll.h>
 #include <linux/units.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -636,7 +637,9 @@ static bool verify_lmem_ready(struct xe_device *xe)
 
 static int wait_for_lmem_ready(struct xe_device *xe)
 {
-	unsigned long timeout, start;
+	unsigned long prev_jiffies;
+	const unsigned long TIMEOUT_SEC = 60;
+	int ret;
 
 	if (!IS_DGFX(xe))
 		return 0;
@@ -648,35 +651,28 @@ static int wait_for_lmem_ready(struct xe_device *xe)
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
+	ret = poll_timeout_us(ret = verify_lmem_ready(xe), ret,
+			      20 * USEC_PER_MSEC,
+			      TIMEOUT_SEC * USEC_PER_SEC, true);
+	if (ret) {
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

