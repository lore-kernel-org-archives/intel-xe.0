Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7E7CD484E
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 06:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F26D10E56C;
	Tue, 12 May 2026 06:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aye+w6xQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD6910E56C
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 06:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778565761; x=1810101761;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9HP0FyZTcIxQhvV/IhRkajoIeV5qXRCPWOdd9QwP/uM=;
 b=aye+w6xQ034I6COm/aKYW43ZvHRjNIYwpgaUpxdF756aSzZO+znp3QM+
 qSrw6BCWk6dJW45Wi8uQ8PEgyTrbWrIUZkf5OuoBXQX4LrPtMjuK/qZDL
 gP9A2A3AauaFi5TWhoZJz2v8A4JT6vXhj0PMPRNbfYfEbsNIi1ZEbafbC
 GI1Wr+PE+klEhjwXN9m4aTrErkzZFnJ4AVMlmf8wCRPWr+9OQY2Nij9q4
 TObA35iuT1jKWhoJt8uacYQlnLjeHLRteQNcDRKFTZbl6eLyazXHtlpdl
 Cs8lCuP9ckA66PFMTHa7R4DOLqm17h2a6bPhboLvFK8BbYvgVJwGOdJUq A==;
X-CSE-ConnectionGUID: H493OThQSsSxPCEQOVmLcA==
X-CSE-MsgGUID: aEe/nHiTRvuzooHhj9Xbew==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90848974"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="90848974"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 23:02:40 -0700
X-CSE-ConnectionGUID: 5QUhRToMRyqfapyzrbbX/A==
X-CSE-MsgGUID: INpX46DaRReF6Yg2paFXaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="242670578"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa005.jf.intel.com with ESMTP; 11 May 2026 23:02:40 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH] drm/xe: Check for dead config space on reading all 1s
Date: Tue, 12 May 2026 11:31:28 +0530
Message-Id: <20260512060128.209698-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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

Reading the VF_CAP returns all 1s when the config space is dead leading
to missdetection of VF and confusing the GuC.
Check for all 1s and pci device detect can act as a sanity.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7941
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index f3835867fce5..40e142d78924 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/fault-inject.h>
+#include <linux/pci.h>
 
 #include <drm/drm_managed.h>
 
@@ -39,8 +40,21 @@ const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode)
 
 static bool test_is_vf(struct xe_device *xe)
 {
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	u32 value = xe_mmio_read32(xe_root_tile_mmio(xe), VF_CAP_REG);
 
+	/*
+	 * If the device is inaccessible (e.g. parent bridge stuck in D3cold,
+	 * fatal AER Errors) MMIO reads returns all-ones, 0xffff.
+	 * VF_CAP would appear set and would misdetect as VF mode.
+	 * Sanity check PCI presence before trusting the read.
+	 */
+	if (value == U32_MAX && !pci_device_is_present(pdev)) {
+		drm_err(&xe->drm,
+			"VF_CAP_REG returned all 1s, config space looks to be dead, skipping SR-IOV mode detection\n");
+		return false;
+	}
+
 	return value & VF_CAP;
 }
 
-- 
2.25.1

