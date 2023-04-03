Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC924C76196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 13:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD7310E15A;
	Mon,  3 Apr 2023 13:42:29 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDE910E15A
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 13:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680529347; x=1712065347;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oMfyBJXsGprwVVU0/GdvyN2OrLpxBOj7tTMLEiFnd3s=;
 b=FAyll721EsKEan6XiOGOygprV3tIZLb7lNlaF4aVKOukTKhwdoYaXkLY
 MmYbeSKBpA1UPg7MQ3rUPoN9jIG935xGN6FUXzd6wn/CvrTcxOVGCmbfX
 NTYx5NTApo8xJwOc4C0pmZE/M2sMiSTkd5K9G1nlJ24rHHKuD+rkIxwvX
 zXTZF6+nTbSTr1r94V+9pAvvLrBwEWWNv7r+vyW6U2xQxUa6fpGkPdON5
 jKm36IT1xNyE0VDIpsGnSPlj+ZPsJwWeM8pcscCzXE8zM6OE69fRuNZty
 8orubZ77sKLvLui8c7fY9XoBQu4EQQdIyohs9wJrW7gK8jJHyV4jY95jb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="369706842"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="369706842"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 06:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="716295437"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="716295437"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 06:42:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  3 Apr 2023 06:42:30 -0700
Message-Id: <20230403134230.3093580-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] CI: Update GuC firmware to 70.6.2
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

---
 drivers/gpu/drm/xe/xe_uc_fw.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e2c982b37e87..e273b5c793f1 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -42,13 +42,13 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
  * Must be ordered based on platform, from newer to older.
  */
 #define XE_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
-	fw_def(METEORLAKE,   guc_def(mtl,  70, 5, 2)) \
-	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
-	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
-	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
-	fw_def(DG2,          guc_def(dg2,  70, 5, 2)) \
-	fw_def(DG1,          guc_def(dg1,  70, 5, 2)) \
-	fw_def(TIGERLAKE,    guc_def(tgl,  70, 5, 2))
+	fw_def(METEORLAKE,   guc_def(mtl,  70, 6, 2)) \
+	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 6, 2)) \
+	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 6, 2)) \
+	fw_def(PVC,          guc_def(pvc,  70, 6, 2)) \
+	fw_def(DG2,          guc_def(dg2,  70, 6, 2)) \
+	fw_def(DG1,          guc_def(dg1,  70, 6, 2)) \
+	fw_def(TIGERLAKE,    guc_def(tgl,  70, 6, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def, huc_ver) \
 	fw_def(ALDERLAKE_S,	huc_def(tgl)) \
-- 
2.34.1

