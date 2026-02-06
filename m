Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6036FEE20A6
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 14:49:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183FF10E802;
	Fri,  6 Feb 2026 14:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZgJgbpan";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE00D10E802
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 14:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770389371; x=1801925371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y+0BkJaerzHv9ZydYg+Mqs/UNFWrXM146gcAkXI8pNA=;
 b=ZgJgbpanPSJH2Ws5qCHTkI5kc4WE5AutFMpyYVkRzThRSxVdDbqHThkc
 EXbaA8Gd2bOfZAbtmBmPPbte6J4nfDlPCugEy2dYNq6txmt4plR+AI+gl
 ivObHmb344zFnb5DSTgoZ9GdS0gYEn3kYNljPtbHW6YvyKZ32VLfqHahJ
 cqpy/ZO6/9EuHigH/8+QJ1p1PpVfGEskaDWmwo2EBts/Vt+l7AT8/wIh0
 QgTcGYJVNjYYp5/owY5DAbr/TG1t3f7cXCl6f2PSiLVAkfaqvvftZwDsi
 1BXj9Z5rUXgTxMWm369vqoFA1rJ5mQZRs7R+MB8CT7mBEHnMTNsSWo9yq Q==;
X-CSE-ConnectionGUID: l/8K1poWQSaB1e1GH3SanA==
X-CSE-MsgGUID: Lm12OfWTQla97g6Qz7LMng==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="70789732"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="70789732"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 06:49:30 -0800
X-CSE-ConnectionGUID: hVSA7d78SmaqruHyt83YzA==
X-CSE-MsgGUID: e45T6I/bTj6Bd1DYE0JbcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="210767449"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa008.fm.intel.com with ESMTP; 06 Feb 2026 06:49:29 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v1 4/4] drm/xe/vf: Redo LRC creation while in VF fixups
Date: Fri,  6 Feb 2026 15:53:34 +0100
Message-Id: <20260206145334.674679-5-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260206145334.674679-1-tomasz.lis@intel.com>
References: <20260206145334.674679-1-tomasz.lis@intel.com>
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

If the xe module within a VM was creating a new LRC during
save/restore, this LRC will be invalid. The fixups procedure
may not be able to reach it, as there will be a race to add
the new LRC reference to an exec queue.

Testing suggests that even if new LRC which was being created
during VM migration is added to EQ in time for fixups, said
LRC may still remain damaged.

Free the incorrectly created LRC, and trigger a re-run of the
creation, but only after waiting for default LRC fixups.

Since LRC creation is many times faster than fixups procedure
(because fixups include GuC handshake), checking once at
the end of LRC creation is enough to ensure that the fixups
running in parallel will be spotted.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c  | 6 ++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 8 ++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h | 1 +
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6eb561086e1c..2ebf25a35557 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -316,6 +316,12 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 			err = PTR_ERR(lrc);
 			goto err_lrc;
 		}
+		if (!xe_gt_vf_valid_default_lrc(q->gt)) {
+			xe_lrc_put(lrc);
+			i--;
+			continue;
+		}
+
 
 		/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
 		WRITE_ONCE(q->lrc[i], lrc);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 1edccee84c76..704c7e083ff4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1504,6 +1504,14 @@ static bool vf_valid_default_lrc(struct xe_gt *gt)
 	return true;
 }
 
+bool xe_gt_vf_valid_default_lrc(struct xe_gt *gt)
+{
+	if (!IS_SRIOV_VF(gt_to_xe(gt)) ||
+	    !xe_sriov_vf_migration_supported(gt_to_xe(gt)))
+		return true;
+	return vf_valid_default_lrc(gt);
+}
+
 /**
  * xe_gt_sriov_vf_wait_valid_default_lrc() - wait for valid GGTT refs in default LRCs
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 70232dc38f9a..8c21b8ab2f16 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -39,6 +39,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
 
+bool xe_gt_vf_valid_default_lrc(struct xe_gt *gt);
 void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt);
 
 #endif
-- 
2.25.1

