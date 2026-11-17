Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541E4606A323
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 13:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z1n8iYFm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C5410F714;
	Tue, 17 Nov 2026 13:15:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148AF10F70C
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 13:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794921294; x=1826457294;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xnv7H/iCK4IDHpmefRKdW4fQRxcM31FqVuM75VB5peY=;
 b=Z1n8iYFmwYPrFGxrY4ejvZqXwSuUlS0vjM5zRaS29yASerNDutlATqOc
 G1zvAcJwoBQcVf0vB8+xWQiqvyfMfdacp6fzAkVcTxoNgPKpVOdzHdRT3
 +C4nlRnHk4ILcq9+BeqvNuKfJR13Ct/fssK/DqaiRF9inlcjDeyEuf+fY
 ZcHQzcuMF3611fx1UrCRqueIBo3hJGFUIKP10yYx9rOqt2+yO086QA58e
 kq6MY35ZN4pc83VnrUdqKiUTskmNxf+C1SFXDzGuy6sbx2UQlA2jlfuZM
 4+eUrfaoTNXred3t7CupbZbJYOgPYq/xhU7z09Ruc9XWtaPI2Eaj2X9qX w==;
X-CSE-ConnectionGUID: aIZTva0nTk+sbpssDOnoHg==
X-CSE-MsgGUID: sr8MdVquQNGWYfaHTSKWfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3556486"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3556486"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 05:14:54 -0800
X-CSE-ConnectionGUID: fCJQmprqQ9uVrMMvjOkjlA==
X-CSE-MsgGUID: YvM8c4J1Qa+H7JWfU/pHdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="10367178"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 05:14:52 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] drm/xe/xe_late_bind_fw: Skip OCODE late bind if same version
 is already running
Date: Tue, 17 Nov 2026 18:29:05 +0530
Message-ID: <20261117125904.2877468-2-sk.anirban@intel.com>
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

Late binding currently uploads OCODE without checking what is already
running. Before the upload, check whether OCODE is initialized and
compare its version with the payload's. Skip the push when they
match.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 355d7c841871..4b8c48871d8c 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -246,6 +246,31 @@ static void wait_for_worker_completion(struct xe_late_bind *late_bind)
 	}
 }
 
+static bool xe_late_bind_ocode_is_current(struct xe_late_bind_fw *lbfw)
+{
+	struct xe_device *xe = late_bind_fw_to_xe(lbfw);
+	u16 running_ver;
+	int ret;
+
+	if (lbfw->type != INTEL_LB_TYPE_OCODE || !xe->info.has_sysctrl)
+		return false;
+
+	if (!xe_sysctrl_is_oobmsm_fw_ready(xe))
+		return false;
+
+	ret = xe_sysctrl_sdk_api_version(xe, &running_ver);
+	if (ret) {
+		drm_dbg(&xe->drm, "Failed to get running OCODE SDK API version: %pe\n",
+			ERR_PTR(ret));
+		return false;
+	}
+
+	drm_dbg(&xe->drm, "OCODE SDK API version running %u, payload %u\n",
+		running_ver, lbfw->sdk_api_version);
+
+	return running_ver == lbfw->sdk_api_version;
+}
+
 static void xe_late_bind_work(struct work_struct *work)
 {
 	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
@@ -258,6 +283,12 @@ static void xe_late_bind_work(struct work_struct *work)
 
 	xe_device_assert_mem_access(xe);
 
+	if (xe_late_bind_ocode_is_current(lbfw)) {
+		drm_dbg(&xe->drm, "%s firmware already loaded, skipping\n",
+			fw_id_to_name[lbfw->id]);
+		goto out;
+	}
+
 	/* we can queue this before the component is bound */
 	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
 		if (late_bind->component.ops)
-- 
2.43.0

