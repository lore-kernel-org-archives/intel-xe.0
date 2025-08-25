Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEADCA0FE7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 15:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A21710E4F0;
	Mon, 25 Aug 2025 15:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3T/7GZh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D8810E4F0
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 15:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756137203; x=1787673203;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8ToYIvbf97MAwRtycBmsiEYjAdQsHf7bUoKqZO/I2yc=;
 b=O3T/7GZhOXL7Ir5bUYZ1gZGJpTy66rVR8sEKPcxGXdM8X6S93QyRB1cG
 VpNAA0vd8jsoquFVq0IiSFKzXJRzk6o2PdOgFRHJxkU77FDubARztj3Ds
 U7hukjU9SB/iP6VjFbG/OM6Oiux8NHzMhqjSSXoGf797oT0qDqpuAXoZL
 KpwXlPZBhQUqo/LP/EKXd31nQgw3VZkEA2U0iQRdTavEbMLIewiRyDr8y
 hcjpCBD4o4QszjLwDW72XTDTuasRCb7DwOvjZdmooiHkhpphLk749KiUS
 +KK0PHMMSfdxUy8kIk4qkrmuu/OgLg1oQEDw1HrR6+piEL+kYNM5ypuAi A==;
X-CSE-ConnectionGUID: 9rBIsPAdQNyg6jKNja9xoA==
X-CSE-MsgGUID: d+x4jKF+TkiGoNxijeLv9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69068714"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="69068714"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 08:53:23 -0700
X-CSE-ConnectionGUID: 6/zquXK/Q8iH4pE6ictNSA==
X-CSE-MsgGUID: 8IXMC2n8T5iVC3inwWarXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="169263852"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 08:53:22 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [CI] drm/xe/guc: Test GuC v70.49.3 for BMG, LNL, PTL
Date: Mon, 25 Aug 2025 08:53:05 -0700
Message-ID: <20250825155304.165664-2-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.50.1
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

UAPI compatiblity version 1.24.3

This patch is for testing only. If testing is successful the binary
blobs will replace the major versioned '*_guc_70.bin' files for given
platforms.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index a236f1d37248..05c2c319d5a8 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,9 +115,9 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 47, 0))	\
-	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 45, 2))	\
-	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 45, 2))	\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 49, 3))	\
+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	bmg,	70, 49, 3))	\
+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	lnl,	70, 49, 3))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
 	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
 	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 45, 2))	\
-- 
2.50.1

