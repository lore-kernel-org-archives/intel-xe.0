Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D554AEB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 08:25:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D9A10E0A2;
	Mon, 26 Jun 2023 08:25:29 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2928210E0A2
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 08:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687767927; x=1719303927;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hbWBPCO66xqB225YFBzET+VsthGs7317XsruyBhv4bA=;
 b=P92/qGqbi4nBw8bxeAhHrRyk/OxKdyuKapaJmhTxBBVihRDpViYzY15r
 3iyqfqoOnZb4hX6bYuRkWkXzNJXc2PCpb2dYEouQcwuDP7ebMRZTBi3nf
 doe7P85Z9I2fWLZi46jFgXuhEenLawST70bRWSa33LwRacrhLKihZUxq/
 SJMIB/TZrpqhS0NmQCdsDYB22JKHwp6dHzju4i6JdM3bExrQGp0EL7ltF
 vAqFaLc1+GcKaKkgQ5fZYFE8Hr+ruyWaHfhvAAwUMzITOh1GHQHkLe23G
 TpLEu9EHDdHIfgpZZABIIaxbPw63hmqTWISGteLJv1u4BTTE1KDskd5lK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="340800968"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="340800968"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 01:25:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="693405176"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="693405176"
Received: from cbrady5x-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.8.226])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 01:25:22 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 09:25:07 +0100
Message-ID: <20230626082506.12638-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe/uapi: silence kernel-doc errors
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

./include/uapi/drm/xe_drm.h:263: warning: Function parameter or member
'gts' not described in 'drm_xe_query_gts'

./include/uapi/drm/xe_drm.h:854: WARNING: Inline emphasis start-string
without end-string.

With the idea to also include the uapi file in the pre-merge CI hooks
when building the kernel-doc, so first make sure it's clean:

https://gitlab.freedesktop.org/drm/xe/ci/-/merge_requests/16

v2: (Francois)
  - It makes more sense to just fix the kernel-doc for 'gts'

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/uapi/drm/xe_drm.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 432bd87ca401..965cd9527ff1 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -242,11 +242,13 @@ struct drm_xe_query_gts {
 	/** @pad: MBZ */
 	__u32 pad;
 
-	/*
+	/**
+	 * @gts: The GTs returned for this device
+	 *
+	 * TODO: convert drm_xe_query_gt to proper kernel-doc.
 	 * TODO: Perhaps info about every mem region relative to this GT? e.g.
 	 * bandwidth between this GT and remote region?
 	 */
-
 	struct drm_xe_query_gt {
 #define XE_QUERY_GT_TYPE_MAIN		0
 #define XE_QUERY_GT_TYPE_REMOTE		1
@@ -852,8 +854,9 @@ struct drm_xe_mmio {
  * struct drm_xe_wait_user_fence - wait user fence
  *
  * Wait on user fence, XE will wakeup on every HW engine interrupt in the
- * instances list and check if user fence is complete:
- * (*addr & MASK) OP (VALUE & MASK)
+ * instances list and check if user fence is complete::
+ *
+ *	(*addr & MASK) OP (VALUE & MASK)
  *
  * Returns to user on user fence completion or timeout.
  */
-- 
2.41.0

