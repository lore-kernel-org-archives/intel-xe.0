Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E458FCFD313
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 15:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F6410E2E5;
	Mon, 24 Nov 2025 15:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YPmpq1pc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1943310E2E5
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 15:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763999395; x=1795535395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cv0hkYeUAqs8IN9fxywStBMpBrEbLOHS4dlULmtn5pE=;
 b=YPmpq1pcGQu0wZ2AzEdox4yTJxvNjSOnkqo1ROs4zEg62ibu0IksRHIV
 H5VzBXXkyx9jWqlZSdkgwza8Mlm6GW6YTx6lkj7UTW2Pb0SnPt3cl3uz+
 SMCnltXcvA7zea/s+iD0e+aKRRym/PBPg5lF9dCgboftbh00sv+ZyEkdL
 LL/kq/MtnJrPx3NwL3aC5xJo9enBZQSQLYKoTdUYdVszmCD2+XcXNXDAH
 Zcu62QiskuqHiQHmyH+g1i1bbk1Ob4/k1zVfalFC0Q8ldllQSJQK749QX
 AE+8R8hVzjlRQvdYfRnD3rHIwNmP1Sr45yTMg2PZa8PUND+QVexFOqhrn g==;
X-CSE-ConnectionGUID: VTqSROxrRQa2MyjjQiJIkA==
X-CSE-MsgGUID: hV7gI518SjOv9QbszEJfHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65002171"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="65002171"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 07:49:55 -0800
X-CSE-ConnectionGUID: iibgm7rFSFeFYqMlu/5Icw==
X-CSE-MsgGUID: 7CYjxH2hRgix/o9SppcnCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="196662199"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa005.fm.intel.com with ESMTP; 24 Nov 2025 07:49:53 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v6 1/3] drm/xe/vf: Enable VF migration only on supported GuC
 versions
Date: Mon, 24 Nov 2025 21:37:21 +0530
Message-ID: <20251124160719.29812-6-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124160719.29812-5-satyanarayana.k.v.p@intel.com>
References: <20251124160719.29812-5-satyanarayana.k.v.p@intel.com>
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
 drivers/gpu/drm/xe/xe_sriov_vf.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 284ce37ca92d..f53d68f2f1d2 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -170,6 +170,22 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
 	vf_migration_init_early(xe);
 }
 
+static bool vf_migration_init_late(struct xe_device *xe)
+{
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_uc_fw_version guc_version;
+
+	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
+	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 27, 0)) {
+		xe_sriov_vf_migration_disable(xe,
+					      "requires GuC ABI >= 1.27.0, but only %u.%u.%u found",
+					      guc_version.major, guc_version.minor,
+					      guc_version.patch);
+	}
+
+	return xe_sriov_vf_migration_supported(xe);
+}
+
 /**
  * xe_sriov_vf_init_late() - SR-IOV VF late initialization functions.
  * @xe: the &xe_device to initialize
@@ -180,6 +196,9 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
  */
 int xe_sriov_vf_init_late(struct xe_device *xe)
 {
+	if (!vf_migration_init_late(xe))
+		return 0;
+
 	return xe_sriov_vf_ccs_init(xe);
 }
 
-- 
2.51.0

