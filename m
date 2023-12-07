Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16F4C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 12:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801FD10E8A0;
	Thu,  7 Dec 2023 12:50:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F1410E8A1
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701953448; x=1733489448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W8vWvr/c5Qd/KzEScyliAVivqyefCBJGtyozflg+06c=;
 b=E+V9Nlvd4nmbjsfG0uhaTiv4+4+1Hsjp/fBoM3WqFea/tkkYkBiEGQjr
 vQPONt/ApYbc9HtyQzj9NcvM1QgJH3NNvuPLOkXdAez2camW8J0jlHrDG
 viegAakp4MI1RAzMwyfY3MWmFCZaHDTch56y6ChCEaJY4PkC4GcJqdwNW
 +ns8hP0GpCGz8lYm/45TWA2BYszGvIj7K5fUOUz+Y+Ef8+laO9LojzhxK
 3qN5GQkt4py0T1ZVBjNj2Z+SyBwfAa4UwU4Yu3/+H/7GHNdjUccna9JL+
 Ylzhu4p/TfQQhmjg5h4xLS4tsVqAIKU+gW1AhSyUMaWs/LVgnN2hdjfoT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1051378"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1051378"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:50:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="19692685"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 04:50:45 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/8] RFC drm/xe/guc: Expose engine busyness only for
 supported GuC version
Date: Thu,  7 Dec 2023 18:27:57 +0530
Message-Id: <20231207125802.3730165-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231207125802.3730165-1-riana.tauro@intel.com>
References: <20231207125802.3730165-1-riana.tauro@intel.com>
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

Guc version numbers are 8 bits only so convert to 32 bit 8.8.8
to allow version comparisions. use compatibility version
for the same.

Engine busyness is supported only on GuC versions >= 70.11.1.
Allow enabling/reading engine busyness only on supported
GuC versions. Warn once if not supported.

v2: rebase
    fix guc comparison error (Matthew Brost)
    add a macro for guc version comparison

Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 29 +++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
index 287429e31e6c..431d1ca59d2f 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
@@ -23,6 +23,23 @@
  * engine busyness ticks (ticks_engine) : clock ticks for which engine was active
  */
 
+/* GuC version number components are only 8-bit, so converting to a 32bit 8.8.8 */
+#define GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
+
+static bool guc_engine_busyness_supported(struct xe_guc *guc)
+{
+	struct xe_uc_fw *uc_fw = &guc->fw;
+	struct xe_uc_fw_version *version = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
+
+	if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(1, 3, 1))
+		return true;
+
+	drm_WARN_ON_ONCE(&guc_to_xe(guc)->drm,
+			 "Engine busyness not supported in this GuC version\n");
+
+	return false;
+}
+
 static void guc_engine_busyness_usage_map(struct xe_guc *guc,
 					  struct xe_hw_engine *hwe,
 					  struct iosys_map *engine_map)
@@ -80,6 +97,10 @@ static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
 	struct xe_device *xe = guc_to_xe(guc);
 	int ret;
 
+	/* Engine busyness supported only on GuC >= 70.11.1 */
+	if (!guc_engine_busyness_supported(guc))
+		return;
+
 	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
 	if (ret)
 		drm_err(&xe->drm, "Failed to enable usage stats %pe", ERR_PTR(ret));
@@ -104,6 +125,10 @@ u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 {
 	u64 ticks_engine;
 
+	/* Engine busyness supported only on GuC >= 70.11.1 */
+	if (!guc_engine_busyness_supported(guc))
+		return 0;
+
 	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine);
 
 	return ticks_engine;
@@ -127,6 +152,10 @@ int xe_guc_engine_busyness_init(struct xe_guc *guc)
 	u32 size;
 	int err;
 
+	/* Engine busyness supported only on GuC >= 70.11.1 */
+	if (!guc_engine_busyness_supported(guc))
+		return 0;
+
 	/* Initialization already done */
 	if (guc->busy.bo)
 		return 0;
-- 
2.40.0

