Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537A6CD6E6E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 13:59:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249DF10E84B;
	Wed, 11 Oct 2023 13:59:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC3510E849
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 13:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697032794; x=1728568794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qZOH7G00LKpi8J+6oa6zn6bxGA4VJVMlqwx5Moqk6/A=;
 b=g/su5IfWIY5xbYJyaCKG/XUVSNbpSplahZe/X/446rdD8a7o82qU40ZK
 piXiEd9EkrSDyvm70ve7dEY1yjPJhs/vAxQP6b3givo06qCbaV5pZ/h7V
 UnZgiknDf9hinLAHUXaDy0rpk2fGj4Ksj6plC6TeiTzD8rsmqlbD+amUf
 MPRB6XiucOqVmuMl8qSbXaO0Ms/9NpF/VQC1rQ6SCXrLR2KPs56cOBM6+
 Z53Lcz/P/lLV0H43yvTVRElN3NZLz6IFcZV6tgNvtSmV+pYCp9/YRnoUk
 bpNJtFKsVQhI+EO+rSHH9BOVn0RFWjvI1Q+jxL+mKN75b/ZlCge0kQ8nl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451156271"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="451156271"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="753829191"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="753829191"
Received: from stahadie-mobl4.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.249.36.91])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:50 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 13:59:21 +0000
Message-Id: <20231011135926.7-13-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011135926.7-1-francois.dugast@intel.com>
References: <20231011135926.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v1 12/17] fixup! drm/xe: Correlate engine and cpu
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
index ab9c061784c7..063a224492eb 100644
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
index 307abad33710..2c5bf02c9b0b 100644
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

