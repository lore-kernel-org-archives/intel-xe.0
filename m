Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76BDC001DE
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 15:06:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0AF10E6FF;
	Thu, 13 Jul 2023 15:06:42 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2721F10E6FF
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689260800; x=1720796800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0QhFoqR+nsVJZUzDhv334MUUXBsQnXbyNMCdASLOkV8=;
 b=SF8AfxdmCMD/jYKW0fVc9x5C/liO5D42nB8CeAgYSoZXgf79o1x24NqW
 OsIZPL3VhZSur4HyCDUru5adrVAXVLWKXgLnHDgY+Xzp1DytY5yMXKtyK
 DWpK3t47/y8Y3TAjrwAxUd1MsOAzkQ0FASJBY4EmpEyotRertMjSwaNY5
 738Op7XJS3wb9AkGlCIXh7cdkxm3EVOADzbwSkdvXRT2FiQgKdj7VRYHE
 uJNwizFscyvix5XKFjFDFcP1HucMpU7JndgPQ8BS6LL9TjONPXQ/j2H2T
 0xcr4Ohi2LzcqYsuunw8IM2AE5x6KHWMvcCq04LFsq8fYI7ar07UuXGD8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="367856948"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="367856948"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:06:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="699285580"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="699285580"
Received: from ineznano-mobl1.ger.corp.intel.com (HELO 8817c471bfcd.intel.com)
 ([10.251.221.219])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 08:06:35 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 15:06:10 +0000
Message-Id: <20230713150611.7-7-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713150611.7-1-francois.dugast@intel.com>
References: <20230713150611.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/7] drm/xe: Cleanup COMPLEX_MACRO style issues
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove some style issues of type COMPLEX_MACRO reported by checkpatch.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c  | 2 +-
 drivers/gpu/drm/xe/xe_guc_debugfs.c | 2 +-
 drivers/gpu/drm/xe/xe_huc_debugfs.c | 2 +-
 drivers/gpu/drm/xe/xe_lrc.c         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index b5a5538ae630..d0092d714ffe 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -171,7 +171,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	 * entry and drm_debugfs_create_files just references the drm_info_list
 	 * passed in (e.g. can't define this on the stack).
 	 */
-#define DEBUGFS_SIZE	ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list)
+#define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
 	local = drmm_kmalloc(&gt_to_xe(gt)->drm, DEBUGFS_SIZE, GFP_KERNEL);
 	if (!local) {
 		XE_WARN_ON("Couldn't allocate memory");
diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index 6b72db4d5bb2..0178b1a2d367 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -87,7 +87,7 @@ void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
 	struct drm_info_list *local;
 	int i;
 
-#define DEBUGFS_SIZE	ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list)
+#define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
 	local = drmm_kmalloc(&guc_to_xe(guc)->drm, DEBUGFS_SIZE, GFP_KERNEL);
 	if (!local) {
 		XE_WARN_ON("Couldn't allocate memory");
diff --git a/drivers/gpu/drm/xe/xe_huc_debugfs.c b/drivers/gpu/drm/xe/xe_huc_debugfs.c
index ee3d8315036a..ae3c21315d59 100644
--- a/drivers/gpu/drm/xe/xe_huc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_huc_debugfs.c
@@ -53,7 +53,7 @@ void xe_huc_debugfs_register(struct xe_huc *huc, struct dentry *parent)
 	struct drm_info_list *local;
 	int i;
 
-#define DEBUGFS_SIZE	ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list)
+#define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
 	local = drmm_kmalloc(&huc_to_xe(huc)->drm, DEBUGFS_SIZE, GFP_KERNEL);
 	if (!local) {
 		XE_WARN_ON("Couldn't allocate memory");
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index ddb1b1d6d00d..d5f782f8d2a6 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -483,7 +483,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
 #define __xe_lrc_pphwsp_offset xe_lrc_pphwsp_offset
 
 #define LRC_SEQNO_PPHWSP_OFFSET 512
-#define LRC_START_SEQNO_PPHWSP_OFFSET LRC_SEQNO_PPHWSP_OFFSET + 8
+#define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
 #define LRC_PARALLEL_PPHWSP_OFFSET 2048
 #define LRC_PPHWSP_SIZE SZ_4K
 
-- 
2.34.1

