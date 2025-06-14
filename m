Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C62C71135
	for <intel-xe@archiver.kernel.org>; Sat, 14 Jun 2025 01:56:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2A310E9B1;
	Sat, 14 Jun 2025 01:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="faIAUHuC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F7010E96F
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Jun 2025 01:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749866157; x=1781402157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9ve9J+c1/tj0DN4AnvQSof6QS1dT1BUwpH0S7g5tyZA=;
 b=faIAUHuCylKkxUE0+DZkffsI4wGvIWuPT5Na7rYoudGUHcmuMRt5Z4Q0
 GHWrPAfT7pqmSIcaVe9AVztLks4sOMT5YTIQvr0ehQZBB1LX03WPV4nbv
 ByIaP4B/EhoKugIcMmCXW47FPNg4btoDf4clkp0pxXfxiWUso45Bh98Vx
 cepDAH/QNNe+sbYaFY1OyrF9o/UHwFpuRZLBGxpVUd7+fehzqQRVBh114
 yKd4IZWH0idZlwTg5sOXijrs1xpcpixWg/IU6NGRaStJxLtO6OIUrMm7i
 PVBLwk1Lxk/dgK1tOhu1rO03cvIo6HrduQGI9AslmIo2d1o9Wr8YYgoOb A==;
X-CSE-ConnectionGUID: P3kC3SRmSneHpR1TGST+8g==
X-CSE-MsgGUID: oMf+2DsuQ4Sz8A7icfu/Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="77481411"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="77481411"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 18:55:57 -0700
X-CSE-ConnectionGUID: FF58dlQRSIya7pkAf6L7lg==
X-CSE-MsgGUID: G1FQV6l3Re+7TsHjEGuHVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; d="scan'208";a="148875045"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 18:55:56 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 3/7] Revert "drm/xe/pvc: Add GuC firmware definition"
Date: Fri, 13 Jun 2025 18:55:07 -0700
Message-ID: <20250614015511.691610-4-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250614015511.691610-1-julia.filipchuk@intel.com>
References: <20250614015511.691610-1-julia.filipchuk@intel.com>
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

This reverts commit cf3b2c395f5d5ad17c689bf5cdbda537ec62d0cb.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6e04032ec3e0a..6d08695186521 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -118,7 +118,6 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 44, 1))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 44, 1))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
-	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
 	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 44, 1))	\
 	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 44, 1))	\
 	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
-- 
2.49.0

