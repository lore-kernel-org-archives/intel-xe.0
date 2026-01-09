Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F96D26D60
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 15:12:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF64110E8E6;
	Fri,  9 Jan 2026 15:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vz2OmEcu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0388E10E8E4
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 15:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767971561; x=1799507561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ado0o+nrCOCFKI+CgXBXTrSYsjwv5ZXj/j755e53fnA=;
 b=Vz2OmEcukqQIKSu4RmKo5nKYU7JyrdW81s3ShaUN1gsIIfhNRhSMQXOO
 TDwq+uQODBBfNzu9pjjjFw7FWqneqwlqmNHny9gjj6XHdXGtiVo87iZax
 rXwdrWUCnE9TI1DmlvAHaCBHuvB4AWQISVfsn1ScrgxAmRuwnF7Cs8S8v
 stuikQo515nmy3OB/82oEHKxg7q1yxg1s92E0i7d9q+1WTLMroKmujDs9
 Ainq5fYJ4fSyFEO3DuDw/vyruvnv5GP5HydeXZ9ifB7ZbQYkTAFVKA4SU
 dXtEWAgGVGuHPs7szU94tHy9eOKOT9dPHVqNmvC57Y/JMXplqi11yG88m w==;
X-CSE-ConnectionGUID: ge6EzVXiRAKz0hs1JBpipA==
X-CSE-MsgGUID: fwEgCkJPR7mzTs0n6gHy3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="79990721"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="79990721"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:12:41 -0800
X-CSE-ConnectionGUID: JLbwR18ISrurr8fXi+Akcg==
X-CSE-MsgGUID: VPcpdyx8RJ+se4IHvsBnVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="234687663"
Received: from carusoal-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 07:12:40 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH 5/5] drm/xe/mert: Move MERT initialization to xe_mert.c
Date: Fri,  9 Jan 2026 16:12:19 +0100
Message-ID: <20260109151219.26206-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109151219.26206-1-michal.wajdeczko@intel.com>
References: <20260109151219.26206-1-michal.wajdeczko@intel.com>
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

Most of the MERT code is already in dedicated file, no reason to
keep internal MERT data structure initialization elsewhere.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_mert.c     | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_mert.h     |  1 +
 drivers/gpu/drm/xe/xe_sriov_pf.c |  4 +---
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
index d139663c45ce..8ad6aa7f4e24 100644
--- a/drivers/gpu/drm/xe/xe_mert.c
+++ b/drivers/gpu/drm/xe/xe_mert.c
@@ -11,6 +11,19 @@
 #include "xe_mmio.h"
 #include "xe_tile.h"
 
+/**
+ * xe_mert_init_early() - Initialize MERT data
+ * @xe: the &xe_device with MERT to init
+ */
+void xe_mert_init_early(struct xe_device *xe)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_mert *mert = &tile->mert;
+
+	spin_lock_init(&mert->lock);
+	init_completion(&mert->tlb_inv_done);
+}
+
 /**
  * xe_mert_invalidate_lmtt() - Invalidate MERT LMTT
  * @xe: the &xe_device with MERT
diff --git a/drivers/gpu/drm/xe/xe_mert.h b/drivers/gpu/drm/xe/xe_mert.h
index 44daeca094bd..fc977203692d 100644
--- a/drivers/gpu/drm/xe/xe_mert.h
+++ b/drivers/gpu/drm/xe/xe_mert.h
@@ -25,6 +25,7 @@ struct xe_mert {
 };
 
 #ifdef CONFIG_PCI_IOV
+void xe_mert_init_early(struct xe_device *xe);
 int xe_mert_invalidate_lmtt(struct xe_device *xe);
 void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl);
 #else
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 72423bb17e6f..6ce3c58e003c 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -90,7 +90,6 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
  */
 int xe_sriov_pf_init_early(struct xe_device *xe)
 {
-	struct xe_mert *mert = &xe_device_get_root_tile(xe)->mert;
 	int err;
 
 	xe_assert(xe, IS_SRIOV_PF(xe));
@@ -112,8 +111,7 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
 
 	xe_sriov_pf_service_init(xe);
 
-	spin_lock_init(&mert->lock);
-	init_completion(&mert->tlb_inv_done);
+	xe_mert_init_early(xe);
 
 	return 0;
 }
-- 
2.47.1

