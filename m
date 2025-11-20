Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6ACCF8861
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 14:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0180910E2A7;
	Thu, 20 Nov 2025 14:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajv2sOqX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D317A10E2A7
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 14:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763649274; x=1795185274;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oV3mpVXlVM9tAbiVjQ9q2IOh8tUPAWLHeITy+3+f3g0=;
 b=ajv2sOqXIbKqHZH/ENBcIO3apuO9clv6BrS7r2PuW0u8IGCICQNgx/3u
 2oiZh6seO/Ob2y6zSxvXrmuFKi1qtYD4t1Ph+C14sohtZuaXqIJR0VjsU
 btViodogVECvtIjniHFn4IqiyuubP9R5cNAw2diw7/aj2tD2JEAXFyhN4
 Ylwf98A1dT79C4NPOrOUNKEa3EX6KGbxVnKV83J0F0+I7WAcKLTP4YTMf
 0nVRtZVYcRX8hKzjE7/qryiLZW80gHR5Wa9kzjRg2/6TXyUxrQvJWzNri
 iR829z9mwjRAUf65tY8Cj0z1LhTvBaGM4yARHvK2qBVjQJ32dspWdhJWK A==;
X-CSE-ConnectionGUID: nq/34aVjTtukIHCPkwuZAA==
X-CSE-MsgGUID: mLUiai3cR5mBGU/W9+/JJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65418619"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65418619"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:34:34 -0800
X-CSE-ConnectionGUID: x7A5kcd+Say1D4EBi1GRJA==
X-CSE-MsgGUID: Ef2aqCsxQUOTVDHFUwcwuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="228689536"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa001.jf.intel.com with ESMTP; 20 Nov 2025 06:34:33 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v5 1/3] drm/xe/vf: Enable VF migration only on supported GuC
 versions
Date: Thu, 20 Nov 2025 20:21:59 +0530
Message-ID: <20251120145157.6995-6-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120145157.6995-5-satyanarayana.k.v.p@intel.com>
References: <20251120145157.6995-5-satyanarayana.k.v.p@intel.com>
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
1.27.0).

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

---
V4 -> V5:
- Created new function vf_migration_init_late() (Michal W).

V3 -> V4:
- New commit

V2 -> V3:
- None.

V1 -> V2:
- None.
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 284ce37ca92d..13cacdbbf2d2 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -170,6 +170,20 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
 	vf_migration_init_early(xe);
 }
 
+static void vf_migration_init_late(struct xe_device *xe)
+{
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_uc_fw_version guc_version;
+
+	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
+	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 27, 0)) {
+		xe_sriov_vf_migration_disable(xe,
+					      "requires GUC ABI >= 1.27.0, but only %u.%u.%u found",
+					      guc_version.major, guc_version.minor,
+					      guc_version.patch);
+	}
+}
+
 /**
  * xe_sriov_vf_init_late() - SR-IOV VF late initialization functions.
  * @xe: the &xe_device to initialize
@@ -180,6 +194,7 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
  */
 int xe_sriov_vf_init_late(struct xe_device *xe)
 {
+	vf_migration_init_late(xe);
 	return xe_sriov_vf_ccs_init(xe);
 }
 
-- 
2.51.0

