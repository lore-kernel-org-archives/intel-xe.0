Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D20606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 10:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jNsl3S8w
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3448C112AAB;
	Fri, 23 Oct 2026 10:36:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F81112AAE
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 10:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792751798; x=1824287798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+jppGKZqx2jAK9I5GSsMe1e/ZVhUceeAcIrt3KFjq+w=;
 b=jNsl3S8w1ZgEYlxEWhKuESwrjlYBIQIKsFmSKKg7YW7X++tElYd4K6N3
 FSbw1ZLefpOBPhonLcJk/cjO4YpRMDUdTpsoHMD5AW08Pd2FmiW/JmUFU
 Cgpg9yWLYlvUJ0mv+hl5thGfWzDvtIWByAYyTZc/wfjC9BnBmxa1TlsfX
 OS5YMhm+LTK5ikVL/aCYPBjKYwbhah3oLp0+Vpy8v0hO0q04+dQfMO8x3
 DtnXkSjjgjNRVOtm0R2e364OMqXJ3x7IXV6Qp4/0Ncp2hxJpK+SZXQyIE
 mFZQmKFkCzJADbaItER7VBBAlkNt0cpH4b3R+ea1nR/l3KIb6xZSlKlKS Q==;
X-CSE-ConnectionGUID: ta0+oVqjQL25KSR2Cd0duQ==
X-CSE-MsgGUID: 638bzN8LTimWEmx3o5bXpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1518480"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1518480"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 03:36:37 -0700
X-CSE-ConnectionGUID: p9aMcZZ/QCS2CVf3vKLf1Q==
X-CSE-MsgGUID: HCyxvkTSQPiYnWmXUoUV/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3604099"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa009.jf.intel.com with ESMTP; 23 Oct 2026 03:36:34 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH] drm/xe/hwmon: Store mailbox temperature data as bytes
Date: Fri, 23 Oct 2026 16:06:31 +0530
Message-ID: <20261023103631.432279-2-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Store pcode mailbox temperature data directly in the byte array
using put_unaligned_le32() instead of accessing it through
different views of the same storage.

This keeps the layout unchanged and makes the data access
consistent and endian-safe.

Fixes: ca6e33701de8 ("drm/xe/hwmon: Fix thermal sensor data handling")
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 42acfeb8818c..7bb1223dc30b 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -7,6 +7,7 @@
 #include <linux/hwmon.h>
 #include <linux/jiffies.h>
 #include <linux/types.h>
+#include <linux/unaligned.h>
 #include <linux/units.h>
 
 #include <drm/drm_managed.h>
@@ -165,12 +166,12 @@ struct xe_hwmon_thermal_info {
 	bool available[CHANNEL_MAX];
 	/** @msu_mask: VRAM subsystem enable mask read from MMIO */
 	u32 msu_mask;
-	union {
-		/** @value: per-sensor raw mailbox temperature; bit7=sign, bits6:0=magnitude */
-		u8 value[U8_MAX + 1];
-		/** @dword: sensor values as little-endian dwords, u32-aligned for pcode reads */
-		__le32 dword[DIV_ROUND_UP(U8_MAX + 1, sizeof(u32))];
-	};
+	/**
+	 * @value: per-sensor raw mailbox temperature; bit7=sign, bits6:0=magnitude.
+	 * Written one dword at a time via put_unaligned_le32() to
+	 * avoid inconsistent union access between dword and byte views.
+	 */
+	u8 value[U8_MAX + 1];
 	/** @vram_label: vram label names, dynamically allocated based on vram_count */
 	char (*vram_label)[MAX_LABEL_SIZE];
 };
@@ -995,7 +996,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 		if (ret)
 			return ret;
 		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, data);
-		hwmon->temp.dword[i] = cpu_to_le32(data);
+		put_unaligned_le32(data, &hwmon->temp.value[i * sizeof(u32)]);
 	}
 
 	for (i = start; i < end; i++) {
-- 
2.48.1

