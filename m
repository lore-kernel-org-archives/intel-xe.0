Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF4D606A32A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 20:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HRxdwLi7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30AD10EC91;
	Wed, 18 Nov 2026 20:13:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9E110EC91
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 20:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795032784; x=1826568784;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uQMpYsBm6rmn1h654QEtqbsfzvUDx3Ip6O+vvThiIvA=;
 b=HRxdwLi7IBOCwhBT0zf2HsRYU0OrsAO9DFvJQLVJ0r5nGp03I5xcAngx
 Cbyoynsc0nZHJ0E5LNfEkjO/ZAvyMFGvd+WJPZsde4z1MlGn8jk/S1NLN
 X7J2B7lrXC7o2CHWliF/1aV9awkHEhNxFRt0vk26CWf0h8I+de77DZEek
 We30pVEvtNcCsP72rQxrL0YJkICZdpX2yIOxP6Xrq67uW+2xetnPn5weW
 OVbakpNCrmlkc2TMpuTrFXxWoflwioREdnqs7cNx3My1Zk/A97VPV8ay4
 TyKFmfoDmtZgpOGF8dZWtDST4glwpnHCFR3BEREE+vnOM3gWw5etX7qwZ w==;
X-CSE-ConnectionGUID: nrKjYiKtRtSsNZLz0fdCiQ==
X-CSE-MsgGUID: ZS5QOBSiTeaT0n5fHkW9fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3746595"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3746595"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 12:13:04 -0800
X-CSE-ConnectionGUID: YYFXhwovR/6f1RVMg87hwQ==
X-CSE-MsgGUID: mTqUqsdRTEqEQ3+eF/OPZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10778262"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 12:13:00 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2] drm/xe/xe_late_bind_fw: Skip OCODE late bind if already
 running
Date: Thu, 19 Nov 2026 01:27:06 +0530
Message-ID: <20261118195705.3231462-2-sk.anirban@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On resume, skip the OCODE push if OCODE is already running.
A new blob takes effect at the next device reset. Probe still
pushes unconditionally, version-based skipping on probe will
follow once a running-version mailbox is available.

v2: Split patches (Badal)
    Modify the subject and commit message (Rodrigo)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 355d7c841871..36e8e72c03a2 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -306,7 +306,17 @@ static void xe_late_bind_work(struct work_struct *work)
 	xe_pm_runtime_put(xe);
 }
 
-static void xe_late_bind_fw_load(struct xe_late_bind *late_bind)
+static bool xe_late_bind_ocode_is_loaded(struct xe_late_bind_fw *lbfw)
+{
+	struct xe_device *xe = late_bind_fw_to_xe(lbfw);
+
+	if (lbfw->type != INTEL_LB_TYPE_OCODE || !xe->info.has_sysctrl)
+		return false;
+
+	return xe_sysctrl_is_oobmsm_fw_ready(xe);
+}
+
+static void xe_late_bind_fw_load(struct xe_late_bind *late_bind, bool resume)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 	struct xe_late_bind_fw *lbfw;
@@ -314,6 +324,11 @@ static void xe_late_bind_fw_load(struct xe_late_bind *late_bind)
 
 	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
 		lbfw = &late_bind->late_bind_fw[fw_id];
+		if (resume && lbfw->payload && xe_late_bind_ocode_is_loaded(lbfw)) {
+			drm_dbg(&xe->drm, "%s firmware already loaded, skipping\n",
+				fw_id_to_name[lbfw->id]);
+			continue;
+		}
 		if (lbfw->payload) {
 			xe_pm_runtime_get_noresume(xe);
 			queue_work(late_bind->wq, &lbfw->work);
@@ -511,7 +526,7 @@ void xe_late_bind_pm_resume(struct xe_late_bind *late_bind)
 	if (!late_bind->component_added || late_bind->disable)
 		return;
 
-	xe_late_bind_fw_load(late_bind);
+	xe_late_bind_fw_load(late_bind, true);
 }
 
 /**
@@ -550,7 +565,7 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
 	if (err)
 		return err;
 
-	xe_late_bind_fw_load(late_bind);
+	xe_late_bind_fw_load(late_bind, false);
 
 	return 0;
 }
-- 
2.43.0

