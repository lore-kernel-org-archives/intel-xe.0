Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB697C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 20:32:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C69210EBB3;
	Wed, 24 Apr 2024 20:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PILlTFV+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5901310EBB3
 for <Intel-Xe@lists.freedesktop.org>; Wed, 24 Apr 2024 20:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713990775; x=1745526775;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SnXXbIcPhAM0+aJjGWMehQw1i9/rTWAIDgmzcNwrC1k=;
 b=PILlTFV+ud77mN0GUmDlybYZA3FzDPsPXTPGP3FulnlBFT+Csq+QAkSN
 plpt9D2UZYbEzpxYSyGovkkhdwtTKeN5VE604sEw9pJyqTSnxsun4kUXt
 oBtDfj5xMuO4DwH45xveZxQAC2pmyLjoA6/lIiWmmfr6mktg4MUNwKJIj
 NnCWupl+pF/FLoPO3TbOlMeAjSu2Uo+6ZcuK6TDNpC40btgsgYmF2tqjg
 JC9y+8PIDjzcIct7yk5aY9TedbN2WaSg9ilPFkQAi21kWfVDLZfK4FtDg
 M1XOAU8Ru9ScVsNg7Rjrst9c2jtNMxeQ92N/ibYq85OCxmjBK/3NJjeN2 w==;
X-CSE-ConnectionGUID: FUDlljeISBO0y82+n9YLnA==
X-CSE-MsgGUID: JcwjsZZGQP+ycpGBueOVTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="35043393"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="35043393"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 13:32:55 -0700
X-CSE-ConnectionGUID: w1eGn/lbTmm13a+VcbxKFw==
X-CSE-MsgGUID: V42U5lE3RmSf0LDdouJ2Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="29618865"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa005.jf.intel.com with ESMTP; 24 Apr 2024 13:32:55 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/guc: Pre-release GuC firmware v70.24.0 for LNL/BMG/PVC
Date: Wed, 24 Apr 2024 13:32:54 -0700
Message-ID: <20240424203254.1616238-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
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

Update to the latest (pre-release) GuC version for LNL and PVC. Also
add pre-release support for BMG.

UAPI version 1.10.2.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index f27e96c47baa..ed819f1df888 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -104,9 +104,10 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
+	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 24, 0))	\
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 24, 0))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
-	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 20, 0))	\
+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
-- 
2.43.2

