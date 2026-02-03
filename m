Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B8FE7C712
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 19:38:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DC410E25F;
	Tue,  3 Feb 2026 19:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PURslEaT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618C210E763
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 19:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770147482; x=1801683482;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ec3MezKF4+2tPGRtMWkuqsk2GWZMNzdH6WkeSUfwDSA=;
 b=PURslEaTYvdJMm8UgwHM/PJZH2FKBFN7xYif6Ogl2PL32EUXkgKaHngk
 pWw9qsytQUQJcGWQhraTsHGsoxZfp4OsE+n9RNW6RZbUMKQNeo2QgaBv8
 0pkg174mdUota98TUdIQYo7Pg7nJXEtEAEDSh9Rg2vJ2SKmoRo1s+35Lg
 KCfqJpz70QWIkS6NnjCNyc92nuk6cFoPawJgAo8ak1KpjUOBFa6nV5wcG
 Y+mVBUXFwiEWRBWG8Ukw6VfLeu9Er2WgeRtqqnKnGXgRyYgmIHsUFwN4z
 XQNN3nTjlkF8W2I5Z4GMWny+rkblBbIzjyqfIMv1JPKAY+N06DmJpHn7r Q==;
X-CSE-ConnectionGUID: i07niP37QBW1PzVxxR8AuQ==
X-CSE-MsgGUID: Ez7EBNGMSo+ofqkNcXtUrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="73928571"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="73928571"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 11:38:02 -0800
X-CSE-ConnectionGUID: PfghfvcqSkSHE8yZGlX/Tg==
X-CSE-MsgGUID: cIi7XBwySiyc8GsamXfI8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="240628095"
Received: from unknown (HELO mwajdecz-hp.clients.intel.com) ([10.246.19.151])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 11:38:00 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/xe/configfs: Fix 'parameter name omitted' errors
Date: Tue,  3 Feb 2026 20:37:45 +0100
Message-ID: <20260203193745.576-1-michal.wajdeczko@intel.com>
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

On some configs and old compilers we can get following build errors:

  ../drivers/gpu/drm/xe/xe_configfs.h: In function 'xe_configfs_get_ctx_restore_mid_bb':
  ../drivers/gpu/drm/xe/xe_configfs.h:40:76: error: parameter name omitted
   static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
                                                                            ^~~~~~~~~~~~~~~~~~~~
  ../drivers/gpu/drm/xe/xe_configfs.h: In function 'xe_configfs_get_ctx_restore_post_bb':
  ../drivers/gpu/drm/xe/xe_configfs.h:42:77: error: parameter name omitted
   static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
                                                                             ^~~~~~~~~~~~~~~~~~~~
when trying to define our configfs stub functions. Fix that.

Fixes: 7a4756b2fd04 ("drm/xe/lrc: Allow to add user commands mid context switch")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v1: https://patchwork.freedesktop.org/patch/696102/?series=159395&rev=1
v2: align everything with the .c signatures (Rodrigo)
---
 drivers/gpu/drm/xe/xe_configfs.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 487531269511..07d62bf0c152 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -23,9 +23,11 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
 bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
 bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
-u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
+u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
+				       enum xe_engine_class class,
 				       const u32 **cs);
-u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
+u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
+					enum xe_engine_class class,
 					const u32 **cs);
 #ifdef CONFIG_PCI_IOV
 unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
@@ -40,9 +42,11 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
 static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
 static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
-static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
+static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
+						     enum xe_engine_class class,
 						     const u32 **cs) { return 0; }
-static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
+static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
+						      enum xe_engine_class class,
 						      const u32 **cs) { return 0; }
 #ifdef CONFIG_PCI_IOV
 static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
-- 
2.47.1

