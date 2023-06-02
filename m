Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFC7C7EE2C
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 11:49:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3C310E66C;
	Fri,  2 Jun 2023 11:49:27 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FA810E66E;
 Fri,  2 Jun 2023 11:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685706565; x=1717242565;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o1D1J6chOKZdX2kvMGDd7Y5haQ2lGfg7f6YVizrX1rQ=;
 b=hOC/IMfVg8v7IcoK9OXXhtkw+9/DyX7axdp6MsCgoeQr8iK8toSF/fVW
 kH3HBZR4i+hi4+kj4Cnjq6zml92KPkt33pr9dmDL/ELoS22gn6XgPX2o6
 vVlvAX3hSW7ulnQSodDIwWmhWrg7NlRDatg2entwoPDq7SWH5qzVVt64G
 Dn46kVIvB+eGggbEgKzE1Rcx1Nk6/quzz9Bmt98uvwDh6iCo3ZBuRLuKB
 LjM+xxFd875f7WeS8VuQiyLli5f0l6mUdN7bGVru8drvmvJhHgzOmfzxB
 68rQrg/+fSeBcu3+07pLRrmgJVOHvoFGQDlGtxzvcIKe2XwhstRVMIuwE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="340477996"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="340477996"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 04:49:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="882055189"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="882055189"
Received: from smoroney-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.20.247])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 04:49:23 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  2 Jun 2023 12:48:17 +0100
Message-Id: <20230602114817.849486-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t] tests/xe/xe_intel_bb: ensure valid next
 page
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Due to over-fetch, recommendation is to ensure we have a single valid
extra page beyond the batch. We currently lack this which seems to
explain why xe_intel_bb@full-batch generates CAT errors.

Currently we allow using the last GTT page, but this looks to be no-go,
since the next page will be beyond the actual GTT, in the case of
full-batch. The i915 path looks to already account for this. However
even with that fixed, Xe doesn't use scratch pages by default so the
next page will still not be valid.

With Xe rather expect that callers know about HW over-fetch, ensuring
that the batch has an extra page, if needed. Alternatively we could
apply the DRM_XE_VM_CREATE_SCRATCH_PAGE when creating the vm, but really
we want to get away from such things.

Bspec: 60223
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/262
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/intel_batchbuffer.c | 6 ++++++
 tests/xe/xe_intel_bb.c  | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 3cd680072..035facfc4 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -881,6 +881,12 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
  * passed in. If this is the case, it copies the information over to the
  * newly created batch buffer.
  *
+ * NOTE: On Xe scratch pages are not used by default. Due to over-fetch (~512
+ * bytes) there might need to be a valid next page to avoid hangs or CAT errors
+ * if the batch is quite large and approaches the end boundary of the batch
+ * itself.  Inflate the @size to ensure there is a valid next page in such
+ * cases.
+ *
  * Returns:
  *
  * Pointer the intel_bb, asserts on failure.
diff --git a/tests/xe/xe_intel_bb.c b/tests/xe/xe_intel_bb.c
index 755cc530e..af8462af5 100644
--- a/tests/xe/xe_intel_bb.c
+++ b/tests/xe/xe_intel_bb.c
@@ -952,7 +952,13 @@ static void full_batch(struct buf_ops *bops)
 	struct intel_bb *ibb;
 	int i;
 
-	ibb = intel_bb_create(xe, PAGE_SIZE);
+	/*
+	 * Add an extra page to ensure over-fetch always sees a valid next page,
+	 * which includes not going beyond the actual GTT, and ensuring we have
+	 * a valid GTT entry, given that on xe we don't use scratch pages by
+	 * default.
+	 */
+	ibb = intel_bb_create(xe, 2 * PAGE_SIZE);
 	if (debug_bb)
 		intel_bb_set_debug(ibb, true);
 
-- 
2.40.1

