Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1626CC6B39
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 15:46:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA6B10F3A6;
	Thu, 15 Oct 2026 15:46:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7349F10E57C
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792079169; x=1823615169;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=enD6gKPjx/WDegRWXgavBSym/RXz3AvWAp1IQ3Ufe8g=;
 b=bvI7rthT4wc40iJDujXespTh2w2F2C/U0PsdFuTrcoRRyMJlx9WcZ/O9
 vBMmFTsX/jNsEZDMhi1v/2B1aTsfZBeV46dD1VuYQIaZj4xDOf5ID/Qd2
 3OzkPnYxVrCK5Josfh5zo1OPMSIwO/5Yd84jtNGHILbNwXi6eZ+qyRI1x
 deyOUehYsX+K9p/S59ZnWg86D40sboibkZe9j7lHyYMs4wdHl3mb3OhYY
 O28vTa8OGTEnc0zW0U1ntu3+mS+uecLvyybgssfORUoeOd/IncXer6aR/
 dqT8atP1eWYWfCC3n+iH8KY0fQ6fOJbDPizGj8ZGivWJ5vTsenGXQpdcM Q==;
X-CSE-ConnectionGUID: 2eqwP9hGRu+SmtCR3JAEPQ==
X-CSE-MsgGUID: I74BMIzQRv60+yxAbRgwTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="849792"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="849792"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:46:09 -0700
X-CSE-ConnectionGUID: 1JFn9YChSLK442rhe06o5g==
X-CSE-MsgGUID: QgcCCdtiQNiz4RZTkngnnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="3474824"
Received: from abityuts-desk1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:46:08 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2 2/3] drm/xe: revamp hw reserved PAT index checking
Date: Thu, 15 Oct 2026 16:45:56 +0100
Message-ID: <20261015154553.483229-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015154553.483229-5-matthew.auld@intel.com>
References: <20261015154553.483229-5-matthew.auld@intel.com>
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

v2 (Tejas):
  - Update the kernel-doc for get_coh_mode() to reflect the updated
    behavior.

Assisted-by: LLM
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c        |  8 ++++++++
 drivers/gpu/drm/xe/xe_pat.h        | 11 ++++++++++-
 drivers/gpu/drm/xe/xe_vm.c         | 10 +++-------
 drivers/gpu/drm/xe/xe_vm_madvise.c |  8 ++------
 4 files changed, 23 insertions(+), 14 deletions(-)

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
index 6398c3ab4805..f6b0fac2000a 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -56,9 +56,18 @@ void xe_pat_init(struct xe_gt *gt);
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
- * pat_index.
+ * pat_index. Index must be valid for the hw.
  * @xe: xe device
  * @pat_index: The pat_index to query
  */
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

