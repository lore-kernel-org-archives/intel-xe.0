Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C2ACC6B34
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 09:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB0B112283;
	Thu, 15 Oct 2026 09:55:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49D8112278
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 09:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792058131; x=1823594131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xY37lPWZuT8v2U8ZJSCNDi4OkDSFXW5bcE0qLYBRrtc=;
 b=kCQoR6eKxr7PtXTckXhAQyyk8eD/Ks11Z2h21cqPQ6PTH1dvNIDc1QMu
 gxZj5Lavv9N2azvgM4V9dZ+YPB83p5USXCdW6qAyaFG+VpdhiHFBMsorX
 VbwJ1DnYZqYGSnXTHbig72thMFUFD2QFzKTRNxfWt3Nc8K5Nzk5I54fVo
 5mhq0l8G7SZqJPWwlJsD9PMIYGoQR4J4xv2xOmcYO0E9rppU4e0SJzXBW
 WV6sOnNh76CbJ6FOr8q6J6NuBkKwnXwf2jQERx4wZBA/4MtT3NKLIXLjM
 sLO2bdtddDEYFlDgI6amm/QrsACmlv7hOzPBDlFaIRtRK5cY4OulnKwSE w==;
X-CSE-ConnectionGUID: 6QV3SDUfRaatdBGGsOVsyQ==
X-CSE-MsgGUID: rVzgrCy0SryGsqoRMssM6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="814946"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="814946"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 02:55:30 -0700
X-CSE-ConnectionGUID: 50a24I7eT92Bgb91FWt3LA==
X-CSE-MsgGUID: 1fr6dS4hRrexJknexoN+Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1674652"
Received: from abityuts-desk1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 02:55:29 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 2/2] drm/xe: revamp hw reserved PAT index checking
Date: Thu, 15 Oct 2026 10:55:19 +0100
Message-ID: <20261015095516.403932-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015095516.403932-4-matthew.auld@intel.com>
References: <20261015095516.403932-4-matthew.auld@intel.com>
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

This came up recently, where the current code uses the following to
check for hw reserved/invalid:

   if (XE_IOCTL_DBG(xe, !coh_mode))

This works, but is actually confusing since coh_mode being zero is valid
from the spec pov, but here coh_mode is some driver defined value and
not the value from the spec.

To avoid any confusion, revamp this to just to pat.valid directly.

Assisted-by: LLM
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c        |  8 ++++++++
 drivers/gpu/drm/xe/xe_pat.h        |  9 +++++++++
 drivers/gpu/drm/xe/xe_vm.c         | 10 +++-------
 drivers/gpu/drm/xe/xe_vm_madvise.c |  8 ++------
 4 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index d1ba2325d9e2..d239693b803b 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -295,9 +295,17 @@ static const struct xe_pat_table_entry xe3p_lpg_pat_table[] = {
 	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),
 };
 
+bool xe_pat_index_is_valid(struct xe_device *xe, u16 pat_index)
+{
+	WARN_ON(pat_index >= xe->pat.n_entries);
+	return xe->pat.table[pat_index].valid;
+}
+
 u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
 {
 	WARN_ON(pat_index >= xe->pat.n_entries);
+	WARN_ON(!xe->pat.table[pat_index].coh_mode ||
+		xe->pat.table[pat_index].coh_mode > XE_COH_2WAY);
 	return xe->pat.table[pat_index].coh_mode;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index 6398c3ab4805..10adaa6fca34 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -56,6 +56,15 @@ void xe_pat_init(struct xe_gt *gt);
 int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
 int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p);
 
+/**
+ * xe_pat_index_is_valid - Check whether the given pat_index is valid.
+ * @xe: xe device
+ * @pat_index: The pat_index to query
+ *
+ * Return: true if the pat_index entry is valid, false if reserved.
+ */
+bool xe_pat_index_is_valid(struct xe_device *xe, u16 pat_index);
+
 /**
  * xe_pat_index_get_coh_mode - Extract the coherency mode for the given
  * pat_index.
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 095f762bbb6f..320bcb7013d2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3811,17 +3811,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 
 		pat_index = array_index_nospec(pat_index, xe->pat.n_entries);
 		(*bind_ops)[i].pat_index = pat_index;
-		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
-		comp_en = xe_pat_index_get_comp_en(xe, pat_index);
-		if (XE_IOCTL_DBG(xe, !coh_mode)) { /* hw reserved */
+		if (XE_IOCTL_DBG(xe, !xe_pat_index_is_valid(xe, pat_index))) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
 
-		if (XE_WARN_ON(coh_mode > XE_COH_2WAY)) {
-			err = -EINVAL;
-			goto free_bind_ops;
-		}
+		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
+		comp_en = xe_pat_index_get_comp_en(xe, pat_index);
 
 		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 5c7aefc641ee..f2c70657460c 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -393,17 +393,13 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 		break;
 	case DRM_XE_MEM_RANGE_ATTR_PAT:
 	{
-		u16 pat_index, coh_mode;
+		u16 pat_index;
 
 		if (XE_IOCTL_DBG(xe, args->pat_index.val >= xe->pat.n_entries))
 			return false;
 
 		pat_index = array_index_nospec(args->pat_index.val, xe->pat.n_entries);
-		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
-		if (XE_IOCTL_DBG(xe, !coh_mode))
-			return false;
-
-		if (XE_WARN_ON(coh_mode > XE_COH_2WAY))
+		if (XE_IOCTL_DBG(xe, !xe_pat_index_is_valid(xe, pat_index)))
 			return false;
 
 		if (XE_IOCTL_DBG(xe, args->pat_index.pad))
-- 
2.56.0

