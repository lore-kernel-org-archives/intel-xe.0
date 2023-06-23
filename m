Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AB8EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jun 2023 11:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EE410E046;
	Fri, 23 Jun 2023 11:30:11 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DF210E046
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jun 2023 11:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687519809; x=1719055809;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p0fSU4NpjrGCcTZx4E+YKy98CoVq9U4RMhx6GP8FRO0=;
 b=E0TnAaEUfMkDmqhyQ/Gp0xkWFcdUu8MHlZ3JIBASknZrY9CQMx/iQMsi
 rINEhwV0mXPUovQDELdCk9V9jdIccpGn6unrH90ZJJXc0cx/Iq1IrNRCa
 LV7rUk8A+uEAasCfrE9MAtFHykb7zpyCUw9ecD3tGEjhEz2yp/LuauOD1
 Bta/imcKTM0bs+CN0G/RtXVDFw7oUJagCmOQXzBvYWsK7mctz2HjfN1up
 y0VPxlOcqDaN0Mj7D0b4Z9wpz5s5EkKelNFBJ8jj6NyFpsROmdUZzGEmD
 kqssCCFsH3zgsFtYp3Vkmn6pHDQ/3jr0/CzQBc0gz+wTWCd9XFJY/BL3A A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="363298617"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; d="scan'208";a="363298617"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 04:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="780594228"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; d="scan'208";a="780594228"
Received: from aelizaro-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.24.92])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 04:29:39 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 23 Jun 2023 12:29:21 +0100
Message-ID: <20230623112920.147748-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/uapi: silence kernel-doc errors
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

With the idea to include the uapi file in the pre-merge CI hooks when
building the kernel-doc, so first make sure it's clean.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/uapi/drm/xe_drm.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 432bd87ca401..5da6a04bb478 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -228,7 +228,7 @@ struct drm_xe_query_config {
 	__u64 info[];
 };
 
-/**
+/*
  * struct drm_xe_query_gts - describe GTs
  *
  * If a query is made with a struct drm_xe_device_query where .query
@@ -242,7 +242,7 @@ struct drm_xe_query_gts {
 	/** @pad: MBZ */
 	__u32 pad;
 
-	/*
+	/* TODO: convert to proper kernel-doc.
 	 * TODO: Perhaps info about every mem region relative to this GT? e.g.
 	 * bandwidth between this GT and remote region?
 	 */
@@ -852,8 +852,9 @@ struct drm_xe_mmio {
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

