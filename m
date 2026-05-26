Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FBCCD5BD1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 19:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F225288C11;
	Tue, 26 May 2026 19:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CDrPyA5j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE9788C11
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 19:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779825307; x=1811361307;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VCiwO9ufNzCvdpTJYpiCCQN4ZVc0sT9Iu/ZU21m0ix0=;
 b=CDrPyA5jQR0UWRUAPnX8tEM+k3tuS3zAiRWMSkwGhsOYZLO0kSyGJBR3
 qnLUZwFSvq9gK/uk+YFtbcOXZ0j5pv4H2o4dAMTL1sQHMjI4BY98LL0se
 DvitjLCBgc4H9cOut30o/Tev/xfD+uCNl9v50jzub8jy1Xj8wqxBLt8+5
 U40tAyp8WUJrvk4y0lvmBUNycOJ8M7Xx5fU0MDecT1lCDjby3qMVkq4eK
 YVYzj8NcvrnIAuP/KTsUif6pmUZMPfZc/EObj11cWizib+k+40I9LXGUt
 tivZ89a3v6kAXBuH0FavaH+K1qiVfltr8sdsuzmagHTqUCE/fI3ieJyAa Q==;
X-CSE-ConnectionGUID: U4vsOp3MRYCfkhz76UB7uQ==
X-CSE-MsgGUID: eFZTg7dsTE2PatkegVLLzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80498754"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80498754"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:55:07 -0700
X-CSE-ConnectionGUID: nn+jNW6FSHu5pva1f0tk6g==
X-CSE-MsgGUID: 52qfAoyIRM+QuUyv1rbHag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="239013236"
Received: from adobrzyn-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.151])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:55:05 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 1/7] drm/xe: Use raw device ID to find sub-platform
 descriptor
Date: Tue, 26 May 2026 21:54:46 +0200
Message-ID: <20260526195452.20545-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526195452.20545-1-michal.wajdeczko@intel.com>
References: <20260526195452.20545-1-michal.wajdeczko@intel.com>
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

We don't need the partially initialized xe_device pointer to
find the sub-platform descriptor, as for the descriptor lookup
only the device ID is required and it can be obtained directly
from the pci_dev.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e2a1232c4fbf..59b18a80100b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -576,14 +576,14 @@ static bool id_blocked(u16 device_id)
 }
 
 static const struct xe_subplatform_desc *
-find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
+find_subplatform(const struct xe_device_desc *desc, u16 devid)
 {
 	const struct xe_subplatform_desc *sp;
 	const u16 *id;
 
 	for (sp = desc->subplatforms; sp && sp->subplatform; sp++)
 		for (id = sp->pciidlist; *id; id++)
-			if (*id == xe->info.devid)
+			if (*id == devid)
 				return sp;
 
 	return NULL;
@@ -1065,6 +1065,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct xe_device *xe;
 	int err;
 
+	subplatform_desc = find_subplatform(desc, pdev->device);
+
 	xe_configfs_check_device(pdev);
 
 	if (desc->require_force_probe && !id_forced(pdev->device)) {
@@ -1099,7 +1101,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_set_drvdata(pdev, &xe->drm);
 
 	xe_pm_assert_unbounded_bridge(xe);
-	subplatform_desc = find_subplatform(xe, desc);
 
 	pci_set_master(pdev);
 
-- 
2.47.1

