Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBC5606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 12:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jlF8p94r
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8D010E3F0;
	Thu, 22 Oct 2026 12:09:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F8511252D
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 12:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792670976; x=1824206976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e/2gAlscRP4ycwQdHM5nMUrRLMI5cBpMMLXVXCpKQaU=;
 b=jlF8p94rG1/KSaDtyD/zFv93totVDMsziSNO7ZhDpOdA/iATdx5ROZsK
 j2kwX5TXgVCvZsxEpqaLH5jsTTV8/c1/D0i4CDkF8pbT4x6CxYcc00Ml5
 E8ATSIIN5DQvnN1Rf30qwL2UlcFY5p91GzsLNCYqetdAQtMNJct2sr+sL
 XyLR9UstOXY8e+0+afyMUFmUL4SS4VTmnYu4itu04u0hWPQDJ+YiLz2u1
 b96itoViDdCvwUmfXZir8tJ4fksgw625vNh05XO+0INRXuxis2SzdfTJ8
 tEpccGUw8GayCccesauqFywsK6b/G0b9l6NL5TA4p19LaB/g7r5lBDMD3 g==;
X-CSE-ConnectionGUID: uLMfJSJQRkSCZa1OWQ+WSQ==
X-CSE-MsgGUID: GrwYTWzBR/+7hdt16sEvoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1452245"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1452245"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:09:36 -0700
X-CSE-ConnectionGUID: +Z/BUd6qThOqqvzYYOLKvg==
X-CSE-MsgGUID: pGIOMHdyQlOXWeIvLYOoNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3293743"
Received: from abityuts-desk1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.243])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:09:34 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 2/3] drm/xe: revamp hw reserved PAT index checking
Date: Thu, 22 Oct 2026 13:09:18 +0100
Message-ID: <20261022120915.138606-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022120915.138606-5-matthew.auld@intel.com>
References: <20261022120915.138606-5-matthew.auld@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index d12365b11186..4c0a6fe96476 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3840,17 +3840,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 
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
index a835cc55658f..875c00563f91 100644
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

