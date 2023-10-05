Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B38E92FC8
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 21:52:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2861F10E3F1;
	Thu,  5 Oct 2023 21:52:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BF088CFA
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 21:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696542734; x=1728078734;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wtip0HaFOFhEplg+Nvtrva3Wuat8Oh+VeOQ58cbiPlc=;
 b=me2T3AxTdNrC0LTT8W8zK8uOTQALlJvmtDrYDjIn63ViSodWhhHd8DK7
 aiE4tBuqZogtCYICfvo4XOh0h3GkAihNMNBov2kQkBFPj7ovFjES23VWR
 fbX0w9saIeQbyTrQBRJnI6yqHUg40B9Mn0SFXMRa4XPfnVF5Q1+E7r5ks
 V0FCiXY4rJF/+a/6o6S3LzjOA+aTgaX1LgSKoGW83PfYp72ohYXLSM+fg
 MZ/GvFDbFpPmqF51/0fa1RDe78Osh67CSf6CzPwozi7MSTy8KusJIlOyP
 55sxcyua5q4e/Zswj4jNBIfffyhYF/gqHj6LC/+9OqltZHgmY6ZkciHXI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="450122848"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="450122848"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 14:50:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="728609448"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="728609448"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 14:50:43 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, francois.dugast@intel.com,
 jose.souza@intel.com
Date: Thu,  5 Oct 2023 14:50:40 -0700
Message-Id: <20231005215040.3260151-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Correlate engine and cpu
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Change rsvd to pad in struct drm_xe_class_instance to prevent the field
from being used in future.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 5 ++++-
 include/uapi/drm/xe_drm.h     | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 95a6aa5cba54..e726366870be 100644
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
index 079213a3df55..b74c8d2e2c46 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -144,7 +144,7 @@ struct drm_xe_engine_class_instance {
 
 	__u16 engine_instance;
 	__u16 gt_id;
-	__u16 rsvd;
+	__u16 pad;
 };
 
 /**
-- 
2.38.1

