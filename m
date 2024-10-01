Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3A7CE7CF5
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 08:44:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA66710E18E;
	Tue,  1 Oct 2024 08:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X+1IqR6u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63E910E18E
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 08:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727772254; x=1759308254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=db3UHJh35L4cGJx/Hqhgo2aQFFxUN/bvEq43r+t7vBs=;
 b=X+1IqR6u+U5ujBchlKpLG+o6koD7mlgsTc7AFq7rV4wk1x5rp836pKsq
 /YzsdVL8B1w6MDvRqiI48hJUIBpismd9wzWuqOGxQMQ+MJxuza5NT+APM
 5Ri+zzZVsmUPpv9B55GueEUVA5UYS5QVy+Fc+UwCXkIOJV1GgFvLLIChq
 7XjF7Z6RJLW04r3mPZf5YQQOPejoPyt20rJC4Mqvhq3eIZ4WVOYqeKAun
 96LZMktUJWekuEAiGNG5e3RpQXakFsW7bqWiN6qdR0u1UNG4Ubp9rCfEm
 0OiSmOktW6Xhv/gUy9C9V+pAeb1uv4LBD99GKsSBGfjc4WhPVJP9BWEoO A==;
X-CSE-ConnectionGUID: tXtNefzdQAK3MPXrmNxdfQ==
X-CSE-MsgGUID: 0OGsCwIAQDqNfpbPnPkcFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="27020721"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27020721"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 01:44:14 -0700
X-CSE-ConnectionGUID: Ogcyf97HQdOlcyHn+TliRQ==
X-CSE-MsgGUID: GqqBy7ZvSiWq7pinIBnF6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="104413738"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO mwauld-desk.intel.com)
 ([10.245.245.112])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 01:44:12 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, stable@vger.kernel.org
Subject: [PATCH v2 3/4] drm/xe/guc_submit: fix xa_store() error checking
Date: Tue,  1 Oct 2024 09:43:49 +0100
Message-ID: <20241001084346.98516-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241001084346.98516-5-matthew.auld@intel.com>
References: <20241001084346.98516-5-matthew.auld@intel.com>
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

Looks like we are meant to use xa_err() to extract the error encoded in
the ptr.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 80062e1d3f66..8a5c21a87977 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -393,7 +393,6 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa
 static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	int ret;
-	void *ptr;
 	int i;
 
 	/*
@@ -413,12 +412,10 @@ static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
 	q->guc->id = ret;
 
 	for (i = 0; i < q->width; ++i) {
-		ptr = xa_store(&guc->submission_state.exec_queue_lookup,
-			       q->guc->id + i, q, GFP_NOWAIT);
-		if (IS_ERR(ptr)) {
-			ret = PTR_ERR(ptr);
+		ret = xa_err(xa_store(&guc->submission_state.exec_queue_lookup,
+				      q->guc->id + i, q, GFP_NOWAIT));
+		if (ret)
 			goto err_release;
-		}
 	}
 
 	return 0;
-- 
2.46.2

