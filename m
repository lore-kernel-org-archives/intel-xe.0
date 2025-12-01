Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C9AD111A8
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 09:32:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234A310E355;
	Mon,  1 Dec 2025 09:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZD8L+Qjm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378EC10E355
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 09:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764581564; x=1796117564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=47E5e9vOqjJ3LzHImQItMf+cWVJc2zf7m0M9t+QYQBA=;
 b=ZD8L+Qjm/cyEOWYFPT3CkJS33pjrtW/r2nstfWEbG5NNFohAdCDNZ0jo
 qck3i1q85vqrrgse/X0zhr3ixZc+vd5CW2x47bWoEjEV9CZpWYvPAjDJT
 62ewx8JAF7uHzXB2CJPUpBhN/pUsSQXvkXncA+UXtTw0c8+dbXPwLgx+s
 Vfct6mO7sMynCzCJv7vDrnlFYxH4ae36n6PPHTSviJeU2rHPscQSILK9/
 Pqh4WDPg/AcFTcJp8fZeRVBsfArHf35NCrR0FQCQuQYSL0mXtCZi0r35y
 bOywIxoZpMaN1BNuTuZ4sBdZzlJi3b9fXQfpy2YlJLoTHx9HLeuEnDMIk g==;
X-CSE-ConnectionGUID: ouu6D1fxTbaUpcxd7sRL3Q==
X-CSE-MsgGUID: K+vIlUN/SEGN0nq5TkBh3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="89164388"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="89164388"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:32:44 -0800
X-CSE-ConnectionGUID: y1XH0g21TcyxurqA7bay3w==
X-CSE-MsgGUID: SIjBX2KiS4K4sqqfJUJkkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198379550"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa005.fm.intel.com with ESMTP; 01 Dec 2025 01:32:42 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v8 1/4] drm/xe/vf: Enable VF migration only on supported GuC
 versions
Date: Mon,  1 Dec 2025 15:20:13 +0530
Message-ID: <20251201095011.21453-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251201095011.21453-6-satyanarayana.k.v.p@intel.com>
References: <20251201095011.21453-6-satyanarayana.k.v.p@intel.com>
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
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
V7 -> V8:
- None.

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

