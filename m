Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4DCCAC587
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 18:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CAF10EB79;
	Thu, 11 Sep 2025 18:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tsqn/ZFk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB8710EB79
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 18:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757613678; x=1789149678;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=elNychf78rYL76YrY777kejfJDgZNB55U44l4esRvCc=;
 b=Tsqn/ZFkDNoSdJHKp1mY7oNAEZISajJVpf9sjwZieOtFJPW3EsSdqEW2
 G9Q6YhXoqCPfu7voMTXp/3OPnNf9xSOcYWiKbOBNRD2mnTslMglVLQv4i
 iAbBHU4fDrW/J0UNAks0QB/bJyLE04JK92yRayOCmrVsokR+mHDUhqD6O
 2MVhX2K5K4l+j9m9l6xo8BQ0++hLJqVw7Y2XOwn4tjvZNjUG46gXrm+aq
 4qkNtv12GUs5RvCWiSeVwF0RaIQMyxUHYapzdTNy2X5n7FzXBD1HW56NK
 WJGUQ8iwkzNNYlS9PHMSNP/aIRgYFjvI3d4y56xmQGdn4hJ6ctIdSJ8yk A==;
X-CSE-ConnectionGUID: IE+GO6MLSs+eK7qR1frZ8w==
X-CSE-MsgGUID: 0jEGG7gdS8So7fjcd/uSrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="77566135"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="77566135"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 11:01:18 -0700
X-CSE-ConnectionGUID: duZ0B/zkSWSwzDtICGEqkw==
X-CSE-MsgGUID: 2DruzwleRAWo4GBAPtLe7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="173321287"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 11:01:18 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [CI] drm/xe: Check GuC v70.50.0 on all Platforms
Date: Thu, 11 Sep 2025 11:01:11 -0700
Message-ID: <20250911180111.39828-2-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
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

UAPI version 1.24.5

Patch for CI only.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index ec58bbad4b9f..a89b2ab90d03 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,15 +115,15 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 49, 4))	\
-	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 49, 4))	\
-	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 45, 2))	\
-	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
-	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
-	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 45, 2))	\
-	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 44, 1))	\
-	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
-	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	major_ver(i915,	guc,	adlp,	70, 44, 1))	\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 50, 0))	\
+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	bmg,	70, 50, 0))	\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	lnl,	70, 50, 0))	\
+	fw_def(METEORLAKE,	GT_TYPE_ANY,	mmp_ver(i915,	guc,	mtl,	70, 50, 0))	\
+	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 50, 0))	\
+	fw_def(DG2,		GT_TYPE_ANY,	mmp_ver(i915,	guc,	dg2,	70, 50, 0))	\
+	fw_def(DG1,		GT_TYPE_ANY,	mmp_ver(i915,	guc,	dg1,	70, 50, 0))	\
+	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	mmp_ver(i915,	guc,	tgl,	70, 50, 0))	\
+	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	mmp_ver(i915,	guc,	adlp,	70, 50, 0))	\
 	fw_def(ALDERLAKE_S,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
 	fw_def(ROCKETLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
 	fw_def(TIGERLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))
-- 
2.51.0

