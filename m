Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B44C5B553
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 23:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0795710E6D7;
	Wed, 28 May 2025 23:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7PDItDI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BC810E6D1
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 23:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748475762; x=1780011762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0wpkofn/9wCvxnkEwicPzH4pSFjvUUPIqFSvMWrvme8=;
 b=k7PDItDIUshRKctUISftpmFpFOyrCUODI1smn04Y2lNl+nF2KLKYGZ5l
 2nA2c9LsPq2P2SY5mnqrBEw18Q7t09i9RXWQZyDIY2LMU8rkhCmBoXneg
 5TeJYzTRGzjbB4dS6uH9J9M4kQuO5x8ypHUMm98yj4eI57g57kLf4L837
 Psbv+MpuQJj4otVjMmq+3ZiYxc9an4IZyKG+Rx2OHXQn5xa9wmPcch7Qt
 huV6TEScC4UYeSzlV5BCyRLb+Bcd2tYBFtkte6pd9qFkTSDM8bnIXtqfv
 JZqq0Lzfie+QbyWB4br06fDv2GEtTpSqotfc1Rsu2bTiY2X4r1VI/sBS6 w==;
X-CSE-ConnectionGUID: IzNXXPYnQgmwyIa6dkpLVw==
X-CSE-MsgGUID: h5zbXUR+S9qFGSdOAuDOdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50674859"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="50674859"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:42:42 -0700
X-CSE-ConnectionGUID: u+h1Xh0RSvCDrVeidKJIMw==
X-CSE-MsgGUID: o139pm8eQhGHvxZfUNCzhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="148245526"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:42:42 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 1/4] drm/xe/uc: Prepare uc_fw_version for storing the VF
 ABI version
Date: Wed, 28 May 2025 16:42:31 -0700
Message-ID: <20250528234229.4185039-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250528234229.4185039-6-daniele.ceraolospurio@intel.com>
References: <20250528234229.4185039-6-daniele.ceraolospurio@intel.com>
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

The VF ABI version has a branch field, so to store it inside the
uc_fw_version we need to add a new branch variable to the latter.
Existing code needs to be updated to handle the fact that we have the
new field.

v2: split out to its own patch (Michal)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_engine_activity.c | 2 +-
 drivers/gpu/drm/xe/xe_uc_fw_types.h         | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
index 0fb48f8f05d8..92e1f9f41b8c 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -124,7 +124,7 @@ static void free_engine_activity_buffers(struct engine_activity_buffer *buffer)
 static bool is_engine_activity_supported(struct xe_guc *guc)
 {
 	struct xe_uc_fw_version *version = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
-	struct xe_uc_fw_version required = { 1, 14, 1 };
+	struct xe_uc_fw_version required = { .major = 1, .minor = 14, .patch = 1 };
 	struct xe_gt *gt = guc_to_gt(guc);
 
 	if (IS_SRIOV_VF(gt_to_xe(gt))) {
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
index ad3b35a0e6eb..914026015019 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
@@ -65,6 +65,8 @@ enum xe_uc_fw_type {
  * struct xe_uc_fw_version - Version for XE micro controller firmware
  */
 struct xe_uc_fw_version {
+	/** @branch: branch version of the FW (not always available) */
+	u16 branch;
 	/** @major: major version of the FW */
 	u16 major;
 	/** @minor: minor version of the FW */
-- 
2.43.0

