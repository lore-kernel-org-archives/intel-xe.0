Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA019C021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 22:42:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D7010E9F1;
	Wed, 26 Feb 2025 22:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AK3EG24j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF5F10E9F1
 for <Intel-Xe@lists.freedesktop.org>; Wed, 26 Feb 2025 22:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740609769; x=1772145769;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Abt9BkJEK0T88VcAJBw0dfgB3XqSLz2Fo2tyvm/N28E=;
 b=AK3EG24j0ugzqMum9+2a4Tl8xKt0Ic0d5naI9XgA0qbX4L8FyWdAb/dm
 /XzsJ3W5eveN9lixgCensuETcHTkCb7rUJ6ln7HJhD/PAUDrYKDGh+Ifo
 WdfA3dc8g/kq3wMqlrcTcI5Jk3AIsJHWCSb6naTNjwuzzUkZCbesJDkmB
 VQ8oKjFlvd9yzE7SUGVcQPi4U32a6jXyGbnMXfJbT0Qd3pmE1NW/ST1GQ
 NzN73LR6LUpneKz3Q1QGds9s0wwjlfRCQVwI6LUZdtDL2KvhiordMIhnP
 YGFnC6nTJVe+CxjT2tO13n4OxhiXRpZx6ch9S6tkX9dNM948gOkrc5nQN g==;
X-CSE-ConnectionGUID: C6Mlv8FZS56Xb7P6Im8R9w==
X-CSE-MsgGUID: +hQYTk9LSAuyS0x/ZjmOjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45393928"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="45393928"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 14:42:49 -0800
X-CSE-ConnectionGUID: QB/DYRP2RuSjBF0wGuZHsw==
X-CSE-MsgGUID: RMlbmoKTTsSTAmCNKSDCJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="121953780"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa004.fm.intel.com with ESMTP; 26 Feb 2025 14:42:48 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] [CI] Test out GuC v70.40.2
Date: Wed, 26 Feb 2025 14:42:48 -0800
Message-ID: <20250226224248.450750-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Test patch to get CI results for GuC 70.40.2 on BMG and LNL.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 18e06ee9e23f..d27fc4f1edbb 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -108,8 +108,8 @@ struct fw_blobs_by_type {
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
 	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 38, 1))	\
-	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
-	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
+	fw_def(BATTLEMAGE,	mmp_ver(xe,	guc,	bmg,	70, 40, 2))	\
+	fw_def(LUNARLAKE,	mmp_ver(xe,	guc,	lnl,	70, 40, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
 	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 29, 2))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
-- 
2.47.0

