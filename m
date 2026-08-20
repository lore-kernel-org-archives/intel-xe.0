Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C933EC5DF81
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 20:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768D810E48B;
	Thu, 20 Aug 2026 20:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGYT1n+s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F2A610E48B
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 20:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787258131; x=1818794131;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=krJ8q7MM0GY40K7vdj9jW67ec+E0ZFj2rbsDsaJn0ks=;
 b=kGYT1n+sY7HlC79XO45vuvoYivZNYNNdII8fk90heZBjX3gB40CBwblB
 bSHao15iSgfnHyoimeChlUJPDnO9rkmM7XkEpoX2sMQipqPO9dY5RT5tN
 YtkXKmhWpUQEaWKWh4/xDiRMFH2pGTsnecgJ5fxKbXplRvoVYsyxIGeHl
 WcmXsfOq1PxwzoOa7PEXxf2kbu51UdCJqP6MWpgTYNk50ik7qmM1RtPr1
 6Jqjb5gfuGZMayB6FPVFhBTmltMNEmiVe5PjyWtsYhfJaPKBpR16qMfuF
 0xP063OCFDqnpaV5DkVlQ2Jrc86jspED3BC+/Zwk7ZJISF0JN3Yt+didt g==;
X-CSE-ConnectionGUID: pnjxwKISTIeNde1fTEDPVg==
X-CSE-MsgGUID: 4WI67Kj+R1mTCq6WKNou6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="98473833"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="98473833"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 13:35:31 -0700
X-CSE-ConnectionGUID: RDO1MsFzRi+dbxq6aCdUkw==
X-CSE-MsgGUID: C57P5LGkSVaEGR6Lwdwsdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="270378380"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 13:35:31 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH] drm/xe/guc: Test GuC v70.74.0 for MTL, DG2
Date: Thu, 20 Aug 2026 13:35:11 -0700
Message-ID: <20260820203527.3053167-2-julia.filipchuk@intel.com>
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

UAPI compatibility version 1.38.4

This patch is for testing only. If testing is successful the binary
blobs will replace the major versioned *_guc_70.bin files for given
platforms.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index e29878b255ba..2c5865136b08 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -122,9 +122,9 @@ struct fw_blobs_by_type {
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
-	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 53, 0))	\
+	fw_def(METEORLAKE,	GT_TYPE_ANY,	mmp_ver(i915,	guc,	mtl,	70, 74, 0))	\
 	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
-	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 53, 0))	\
+	fw_def(DG2,		GT_TYPE_ANY,	mmp_ver(i915,	guc,	dg2,	70, 74, 0))	\
 	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 44, 1))	\
 	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
 	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	major_ver(i915,	guc,	adlp,	70, 44, 1))	\
-- 
2.51.0

