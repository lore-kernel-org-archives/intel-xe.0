Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52A8C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B307110EA04;
	Fri,  3 Nov 2023 14:35:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7018910E9F8
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022124; x=1730558124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CHc0epshUtplbWg8Mr6wR6Pqf41q+wegPRBr5XNnzLs=;
 b=JYa8XqXtORrI0w9wfkMQr85M/uaCYSXnNXZY8/KQ+a+y26uHRq7OBZX+
 jq+N4X7UAr+w9s/oos8cQ00XDDQFICJYuOQfpGJUvlVXQpKSpEdkXs8BD
 Emid7UZDqjNAy9Hnq36y8nVb4OOQB9JEWCf/ttOxAAzV5yE7if2JqjGc8
 +hAQwVh851qhoU+AD9BFVwhPtFn++ePYGFEfxwwkFq+PvJBaUPsMZxsg6
 Silr1zNLkdIGy2ky5p4tqvgUQxVVVkGHXGePfYQusk36/uYSC+IYgLGwz
 5W8NGq5FUk9Jx0zWMdnLGDZDXDTip8FpBANoJr9pDxoCYaNKXivS2iEba A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843358"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843358"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832441"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832441"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:23 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:18 +0000
Message-Id: <20231103143456.7-13-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 12/50] fixup! drm/xe: Correlate engine and cpu
 timestamps with better accuracy
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Change rsvd to pad in struct drm_xe_class_instance to prevent the field
from being used in future.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 5 ++++-
 include/uapi/drm/xe_drm.h     | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index d8416fb93327..3eef4160074e 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -215,7 +215,10 @@ static int query_engines(struct xe_device *xe,
 				xe_to_user_engine_class[hwe->class];
 			hw_engine_info[i].engine_instance =
 				hwe->logical_instance;
-			hw_engine_info[i++].gt_id = gt->info.id;
+			hw_engine_info[i].gt_id = gt->info.id;
+			hw_engine_info[i].pad = 0;
+
+			i++;
 		}
 
 	if (copy_to_user(query_ptr, hw_engine_info, size)) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 8687ef7db71a..05714068c637 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -159,8 +159,8 @@ struct drm_xe_engine_class_instance {
 	__u16 engine_instance;
 	/** @gt_id: GT ID the instance is associated with */
 	__u16 gt_id;
-	/** @rsvd: Reserved */
-	__u16 rsvd;
+	/** @pad: MBZ */
+	__u16 pad;
 };
 
 /**
-- 
2.34.1

