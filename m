Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113B9606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hUdhCp3R
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0AF11252D;
	Thu, 22 Oct 2026 12:09:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2971F10E3F0
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 12:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792670979; x=1824206979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1aOzCb2HmTuUEvCq6Ndy3ej/WJJWuy3wXkOzG0/NNPg=;
 b=hUdhCp3RMldBtMl1i3uynSVmJIcG7EBma+okznZN9Tj0qAUtHbkRJpYS
 qaECHwB2Cux5Kr26N854WTlIIex3P7lepnGuVMnBSp27/IH5BmXC3c5L7
 RfIkLdB+g+kx3t51/yBh9OvgrtNjUdfd5Rmz6U/91HI7+dE0F/qldYV5j
 6vqBlYRStCxa3eMwNRNsKe1toxK7bfhUjlkgfM8xLxjmEAcJSk5VJ1rRC
 J+Z9RMVVRosR9/B4NAVslC7DQvq9cwZOjJnX6Ypywh3J7+z9gFG6KKt8i
 SwQ19MYiTWe8I84vCbrJKlRCseiO0GDhZyENHgnOo3MzCDUPsOCuSVqKL A==;
X-CSE-ConnectionGUID: CcHqPPjzTtuvC3E2Wj8Yvw==
X-CSE-MsgGUID: gu+XOHmLQGOBS5gGVJFE5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1452248"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1452248"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:09:37 -0700
X-CSE-ConnectionGUID: beyNfvboRhecZCADOt/86g==
X-CSE-MsgGUID: 3yK+Z1DlTQeqp38KeYzmlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3293746"
Received: from abityuts-desk1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.243])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:09:36 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v3 3/3] drm/xe/pat: always check is_valid() when querying an
 index
Date: Thu, 22 Oct 2026 13:09:19 +0100
Message-ID: <20261022120915.138606-8-matthew.auld@intel.com>
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

Make the bevaviour consistent. If trying to extract comp or l3 on an
unknown index, just treat as a programmer error, like we already do for
coh_mode (implicit).

v2 (Tejas):
  - Make is_valid() return false for an index which is out of range, to
    avoid multiple WARNs.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 10 ++++++----
 drivers/gpu/drm/xe/xe_pat.h |  6 ++++--
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index d239693b803b..53c5f4030bf8 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -297,13 +297,15 @@ static const struct xe_pat_table_entry xe3p_lpg_pat_table[] = {
 
 bool xe_pat_index_is_valid(struct xe_device *xe, u16 pat_index)
 {
-	WARN_ON(pat_index >= xe->pat.n_entries);
+	if (WARN_ON(pat_index >= xe->pat.n_entries))
+		return false;
+
 	return xe->pat.table[pat_index].valid;
 }
 
 u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
 {
-	WARN_ON(pat_index >= xe->pat.n_entries);
+	WARN_ON(!xe_pat_index_is_valid(xe, pat_index));
 	WARN_ON(!xe->pat.table[pat_index].coh_mode ||
 		xe->pat.table[pat_index].coh_mode > XE_COH_2WAY);
 	return xe->pat.table[pat_index].coh_mode;
@@ -311,13 +313,13 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
 
 bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index)
 {
-	WARN_ON(pat_index >= xe->pat.n_entries);
+	WARN_ON(!xe_pat_index_is_valid(xe, pat_index));
 	return !!(xe->pat.table[pat_index].value & XE2_COMP_EN);
 }
 
 u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index)
 {
-	WARN_ON(pat_index >= xe->pat.n_entries);
+	WARN_ON(!xe_pat_index_is_valid(xe, pat_index));
 
 	return REG_FIELD_GET(XE2_L3_POLICY, xe->pat.table[pat_index].value);
 }
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index f6b0fac2000a..16beda6db97e 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -57,7 +57,8 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
 int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p);
 
 /**
- * xe_pat_index_is_valid - Check whether the given pat_index is valid.
+ * xe_pat_index_is_valid - Check whether the given pat_index is valid. Index
+ * must be within valid range.
  * @xe: xe device
  * @pat_index: The pat_index to query
  *
@@ -75,7 +76,7 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
 
 /**
  * xe_pat_index_get_comp_en - Extract the compression enable flag for
- * the given pat_index.
+ * the given pat_index. Index must be valid for the hw.
  * @xe: xe device
  * @pat_index: The pat_index to query
  *
@@ -88,6 +89,7 @@ bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
 #define XE_L3_POLICY_UC		3 /* Uncached */
 /**
  * xe_pat_index_get_l3_policy - Extract the L3 policy for the given pat_index.
+ * Index must be valid for the hw.
  * @xe: xe device
  * @pat_index: The pat_index to query
  */
-- 
2.56.0

