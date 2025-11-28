Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C07CFD376
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 13:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2187E10E8D6;
	Fri, 28 Nov 2025 13:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqtt5AhE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF26C10E172
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Nov 2025 13:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764335609; x=1795871609;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3NVDStiBR61zBMXvncVCfnpBxOEfPWv4m41whDg1v0M=;
 b=cqtt5AhEEDbsg0wlTlzT7x4jeR6H4sPaB7sX+pKjVa70UDIHYfhHLZzJ
 TisQuTV6yfXFxcjKoftabV2dTl0o/3FCLu5gSjM2vnTmenrFnn1sI56Jd
 yfVx11UHH2uxOoiCu6cfV9TW4NgoCCwVY8xVl21Td8tpIqIlVm7kbhVzi
 Bms4DoCHlPyDFcVH1qELIFrdSHxqtTCsy7lPQN2gtf5hkFNBGG57ERy2P
 EhlrRN0E5V1OBufytgUnzpk3XjL+UF4gGk1r3iOgGTREvz2WWL9dCCkRW
 osCiQBuuKgTURoeAgfwKVlV/oOD171gamGp21+LkVp418bvOx0I/nb5eb w==;
X-CSE-ConnectionGUID: OIQjs48DQQ2Kx8/ZFytGsw==
X-CSE-MsgGUID: oqrxU5i0SyWxA+rho0lksg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66084609"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="66084609"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 05:13:29 -0800
X-CSE-ConnectionGUID: 8ntr2gH1T9CfUNNkm9+arQ==
X-CSE-MsgGUID: eInEC5e1R3WCAWwQFWOt/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="193126586"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 28 Nov 2025 05:13:28 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v7 1/4] drm/xe/vf: Enable VF migration only on supported GuC
 versions
Date: Fri, 28 Nov 2025 19:00:54 +0530
Message-ID: <20251128133052.17120-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128133052.17120-6-satyanarayana.k.v.p@intel.com>
References: <20251128133052.17120-6-satyanarayana.k.v.p@intel.com>
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

Enable VF migration starting with GuC 70.54.0 (compatibility version
1.27.0) which supports additional VF2GUC_RESFIX_START message required
to handle migration recovery in a more robust way.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

---
V6 -> V7:
- Fixed review comments (Michal W).
- vf_migration_init_late() checks whether migration is supported or not.

V5 -> V6:
- Fixed review comments (Michal W).
- Updated commit message.
- return xe_sriov_vf_migration_supported() from vf_migration_init_late().

V4 -> V5:
- Created new function vf_migration_init_late() (Michal W).

V3 -> V4:
- New commit

V2 -> V3:
- None.

V1 -> V2:
- None.
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 284ce37ca92d..d56b8cfea50b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -170,6 +170,26 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
 	vf_migration_init_early(xe);
 }
 
+static bool vf_migration_init_late(struct xe_device *xe)
+{
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_uc_fw_version guc_version;
+
+	if (!xe_sriov_vf_migration_supported(xe))
+		return 0;
+
+	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
+	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 27, 0)) {
+		xe_sriov_vf_migration_disable(xe,
+					      "requires GuC ABI >= 1.27.0, but only %u.%u.%u found",
+					      guc_version.major, guc_version.minor,
+					      guc_version.patch);
+		return 0;
+	}
+
+	return xe_sriov_vf_ccs_init(xe);
+}
+
 /**
  * xe_sriov_vf_init_late() - SR-IOV VF late initialization functions.
  * @xe: the &xe_device to initialize
@@ -180,7 +200,7 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
  */
 int xe_sriov_vf_init_late(struct xe_device *xe)
 {
-	return xe_sriov_vf_ccs_init(xe);
+	return vf_migration_init_late(xe);
 }
 
 static int sa_info_vf_ccs(struct seq_file *m, void *data)
-- 
2.51.0

