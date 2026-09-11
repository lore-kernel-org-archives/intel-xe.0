Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5F1C88E53
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 18:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E197C10F6AE;
	Fri, 11 Sep 2026 18:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8VPtWQE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8C010F6AE
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 18:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789151001; x=1820687001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kgaeDnrvolBRkDf9ZIkHSKMWgR1I4tNVh4QvWOdIQ7w=;
 b=G8VPtWQECK4cR//DyYsWDlLwQGIU8hzfwe3xid3hsmsl/UAZkcruScUa
 Fzs635GcPEI7cfT1Y7gs5C2pC6dekpCI4FCGuFqimLQf9vCTqMN8B0O6L
 +BssSzopEiepnc/tx9+H+LPYcDj3JEKR/8MIlTf+35vk4Eyx7cxa0UXy+
 eWCkR96tZ2usMYV1zCccwfLQ5Naeg0aqpakJZoRSuwQwpgAcWowspeCsQ
 3xc4hLGTId8uVrb87oEMiZf7I1ZG+TiUEpiHNCLWxr0BhrW0ccABm/+T7
 d3nz3yw+fY1EOK8OsJCJxWPKzGvPWXfs9lLSo3G0cNiEafMmu92EZ5e1c A==;
X-CSE-ConnectionGUID: SRRL6mDdRqKPZ2FSXIpcQQ==
X-CSE-MsgGUID: AYl0d1bUSWuI+jEeQgMWaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="107129674"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="107129674"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 11:23:21 -0700
X-CSE-ConnectionGUID: GmZiRg+CR2+FowcnDO9I3g==
X-CSE-MsgGUID: FwZOhpkoQSOuF1LECV2RCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="277248520"
Received: from ncataldi-mobl3.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.174])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 11:23:20 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Refactor VF LMEM BAR resize helper function
Date: Fri, 11 Sep 2026 20:23:06 +0200
Message-ID: <20260911182306.14973-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Improve and move diagnostics messages to the helper function to
keep the caller function tidy.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 35e6b53e18ce..c023a2a1fc17 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -82,16 +82,33 @@ static void pf_engine_activity_stats(struct xe_device *xe, unsigned int num_vfs,
 	}
 }
 
-static int resize_vf_vram_bar(struct xe_device *xe, int num_vfs)
+static int pf_resize_vf_vram_bar(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	char buf[10];
 	u32 sizes;
+	int size;
+	int err;
+
+	if (!IS_DGFX(xe))
+		return 0;
 
 	sizes = pci_iov_vf_bar_get_sizes(pdev, VF_LMEM_BAR, num_vfs);
 	if (!sizes)
 		return 0;
 
-	return pci_iov_vf_bar_set_size(pdev, VF_LMEM_BAR, __fls(sizes));
+	size = __fls(sizes);
+	string_get_size(pci_rebar_size_to_bytes(size), 1, STRING_UNITS_2, buf, sizeof(buf));
+
+	err = pci_iov_vf_bar_set_size(pdev, VF_LMEM_BAR, size);
+	if (err) {
+		xe_sriov_notice(xe, "Failed to resize VF BAR %u to %s (%pe)\n",
+				VF_LMEM_BAR, buf, ERR_PTR(err));
+		return err;
+	}
+
+	xe_sriov_dbg(xe, "VF LMEM BAR resized to %s\n", buf);
+	return 0;
 }
 
 static int pf_prepare_vfs_enabling(struct xe_device *xe)
@@ -142,11 +159,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	if (err < 0)
 		goto failed;
 
-	if (IS_DGFX(xe)) {
-		err = resize_vf_vram_bar(xe, num_vfs);
-		if (err)
-			xe_sriov_info(xe, "Failed to set VF LMEM BAR size: %d\n", err);
-	}
+	pf_resize_vf_vram_bar(xe, num_vfs);
 
 	err = pci_enable_sriov(pdev, num_vfs);
 	if (err < 0)
-- 
2.47.1

