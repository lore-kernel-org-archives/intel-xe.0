Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8104BEC01CD
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 11:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6B310E0F4;
	Mon, 23 Mar 2026 11:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHB+FXa7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF1410E0F4
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 11:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774266750; x=1805802750;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EEyQc2WUf3bJiS/Cimck+/ZCUDuoOy6KuoKWSeH5NF0=;
 b=MHB+FXa7EMBfc4uQIS6RMGOoYy41GWyBiVmfRKVUJ65Rn/OfMUBRtLJD
 sseoSSIyPKZ3s6NwZC0yqFizyY36otMoI1xqgmigjrpXECsnUqenGvJBy
 lmGn/zGlosTcsu/3/nvPiVfu6VWPzdahVhUfW88o/SFtPBursPMmgIS2/
 nQqavuwzswkOQszo7cCsLMaw9tOgpdCa9AR+ZAampW3YuTyPJwu3Fa2Tn
 E6PbuEynGNSsledjmxPUtCKPJ93OIzSloxK3g5PuUWc80ROCtxhzVqzpd
 UL4a0rgJA4/k3duVlA6kH/gvUk3zr5G3K+r6U7Fko6V7uuSP8l2CX/pcZ w==;
X-CSE-ConnectionGUID: P+K4Wt9TTLKH3DDSEdXcRQ==
X-CSE-MsgGUID: 6n6ZUCL5SISo2C/Mm6z56A==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75168271"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75168271"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 04:52:27 -0700
X-CSE-ConnectionGUID: oSzrqYAtQa6Apsu3a1khXg==
X-CSE-MsgGUID: K9zoTTmeQfuUglINy5uRyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="247035506"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 04:52:24 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2] drm/xe/hwmon: Read accepted power limit for CRI
Date: Mon, 23 Mar 2026 17:28:36 +0530
Message-Id: <20260323115836.3737300-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Update xe_hwmon_pcode_read_power_limit() and
xe_hwmon_pcode_rmw_power_limit() to read the accepted power limit for
discrete platforms post CRI.

For platforms before CRI only the last written pcode value was available.
From CRI onwards, pcode exposes a new param2 value 2 that allows reading
the accepted power limit by the hardware.

v2:
 - Read resolved power limit in xe_hwmon_pcode_rmw_power_limit()
   as well. (Badal)
 - Rephrase commit message. (Badal)
 - Add prepare_power_limit_param2() to prepare param2 for mailbox power
   limit read.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c     | 21 ++++++++++++++-------
 drivers/gpu/drm/xe/xe_pcode_api.h |  3 ++-
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 0fd4d4f1014a..0f92aa3fe8e8 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -180,6 +180,18 @@ struct xe_hwmon {
 	struct xe_hwmon_thermal_info temp;
 };
 
+static inline int prepare_power_limit_param2(const struct xe_hwmon *hwmon)
+{
+	if (hwmon->boot_power_limit_read) {
+		if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
+			return READ_PL_ACCEPTED;
+		else
+			return READ_PL_FROM_PCODE;
+	} else {
+		return READ_PL_FROM_FW;
+	}
+}
+
 static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
 					   u32 *uval)
 {
@@ -191,9 +203,7 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
 						  (channel == CHANNEL_CARD) ?
 						  READ_PSYSGPU_POWER_LIMIT :
 						  READ_PACKAGE_POWER_LIMIT,
-						  hwmon->boot_power_limit_read ?
-						  READ_PL_FROM_PCODE : READ_PL_FROM_FW),
-						  &val0, &val1);
+						  prepare_power_limit_param2(hwmon)), &val0, &val1);
 
 	if (ret) {
 		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
@@ -226,10 +236,7 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
 						  (channel == CHANNEL_CARD) ?
 						  READ_PSYSGPU_POWER_LIMIT :
 						  READ_PACKAGE_POWER_LIMIT,
-						  hwmon->boot_power_limit_read ?
-						  READ_PL_FROM_PCODE : READ_PL_FROM_FW),
-						  &val0, &val1);
-
+						  prepare_power_limit_param2(hwmon)), &val0, &val1);
 	if (ret)
 		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
 			channel, val0, val1, ret);
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 85cc7478b787..d762226a9987 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -47,8 +47,9 @@
 #define	WRITE_PSYSGPU_POWER_LIMIT		0x7
 #define	READ_PACKAGE_POWER_LIMIT		0x8
 #define	WRITE_PACKAGE_POWER_LIMIT		0x9
-#define	READ_PL_FROM_FW				0x1
 #define	READ_PL_FROM_PCODE			0x0
+#define	READ_PL_FROM_FW				0x1
+#define	READ_PL_ACCEPTED			0x2
 
 #define   PCODE_THERMAL_INFO			0x25
 #define     READ_THERMAL_LIMITS			0x0
-- 
2.25.1

