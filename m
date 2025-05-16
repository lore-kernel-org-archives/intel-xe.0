Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7F8C3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 15:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A148E10EAFB;
	Fri, 16 May 2025 15:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iTTEapcN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FA510EAFE
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 15:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747409903; x=1778945903;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RrQK0mYIRTwIPC0hd3atm2eP6Qah9qyWGLSZZNr/yq4=;
 b=iTTEapcNBd0zoprFoN9zVtutvBjdgBmm/6AZwixbv0homvNeC7h84Pkk
 m81sIkTJVIwhWhW7Cg61NNWDCDGw3vuSQbaCwD/jFft47xVS33zdsaMoP
 jVwfK/7rmDsxVJ6RWOf0HgpfIJSyrGV1O2dv7bHa1Q8URXvi7Rt0pXEV8
 2Oi6p4UPfNmAXA4VPZgQMfKDe4iX7KP5VnVxD6g0TG86vZv+k5sZBsUVh
 uaH3X9VW0r7wjcTBnzmdIMPo4g5CacXGah/X1oAFdG8zTfno7RICLl9C+
 fABplrfRv85ejFm2JU89icEVftSgo5CAeudAKIikXGNQg0XI1qoTGTWAO A==;
X-CSE-ConnectionGUID: Em+6iEq5Q4SwEaAR6FiN3g==
X-CSE-MsgGUID: p8Y2he2MSEyoBrNAOCp9pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60046532"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="60046532"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 08:38:23 -0700
X-CSE-ConnectionGUID: kJ5AohL7Q+S2uM/ODBDLdQ==
X-CSE-MsgGUID: 4D5cHV2cSHeIwqQ+jQTFSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="143498879"
Received: from slindbla-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.176])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 08:38:22 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/bo: optimise CCS case for WB pages
Date: Fri, 16 May 2025 16:38:11 +0100
Message-ID: <20250516153810.223530-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Dealing with CCS state is significant on LNL+, where we end up clearing
the compression state on every page alloc using the blitter for user
buffers, including also saving and restoring it when moving between
domains, plus we need to alloc extra pages to hold the raw CCS state for
the save step.

However all compression PAT modes, on platforms like LNL, also require
coh_none, meaning that only WC memory can use compression in the first
place. With this we can be sneaky and completely ignore CCS for WB
buffers, which is likely the common case anyway. This would then skip
all blitter moves/clears between sys <-> tt and then also means we can
drop the extra CCS pages.

This should be safe since there is no way to interact with the
compression state (potentially uncleared) without using a PAT enabled
index (which is rejected at bind), including if trying to be malicious
and copy the raw CCS state from userpace, which should give back all
zeroes if the src surface (indirect) is lacking compressed PAT index.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c  | 8 ++++++++
 drivers/gpu/drm/xe/xe_pat.c | 3 ++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d99d91fe8aa9..3fafdcb8d95b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2982,6 +2982,14 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
 	if (IS_DGFX(xe) && (bo->flags & XE_BO_FLAG_SYSTEM))
 		return false;
 
+	/*
+	 * Compression implies coh_none, therefore we know for sure that WB
+	 * memory can't currently use compression, which is likely one of the
+	 * common cases.
+	 */
+	if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)
+		return false;
+
 	return true;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 30fdbdb9341e..38a6a49c1b2a 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -103,7 +103,8 @@ static const struct xe_pat_table_entry xelpg_pat_table[] = {
  *
  * Note: There is an implicit assumption in the driver that compression and
  * coh_1way+ are mutually exclusive. If this is ever not true then userptr
- * and imported dma-buf from external device will have uncleared ccs state.
+ * and imported dma-buf from external device will have uncleared ccs state. See
+ * also xe_bo_needs_ccs_pages().
  */
 #define XE2_PAT(no_promote, comp_en, l3clos, l3_policy, l4_policy, __coh_mode) \
 	{ \
-- 
2.49.0

