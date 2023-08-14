Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620FBC04A94
	for <intel-xe@archiver.kernel.org>; Mon, 14 Aug 2023 22:37:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367BB10E236;
	Mon, 14 Aug 2023 22:37:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA6F10E133
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Aug 2023 22:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692052662; x=1723588662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ClTxi13ghH0HS8+fz+IGZpG9rUQ0BIC2gWYBD3lksJo=;
 b=Bs2uhIorVmikLmdKlRkVBCSIscVrBzujrXFagjTRwKE6gIdaIj6BNpKV
 z0BtVIxeIKxYo/D7RXI/XQ12wZKVBWZjeAbuE+w1FZUKGLtwniC6QC8QE
 hQx8XxwjgPi/3r9RCku440RsK8PJMnFGYk1zcEby7dTqAK/BYwFLlwbqk
 ErJT6uc7/WvPnhZNGD+Mk//8WqgXB6AiCNy82q7P8p4KPTdeOGjz+9WiR
 nXTkmxEpBqWj4nu4Y0+StIrT2QvTVhXiuCFsFPYHMGOeFmJzKZaUn0yVx
 LtveufJXSA28Cl9vIbfsViVHhaC9WCxeEhpTSb8wJFY61tjRKXEzgXs0i w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403130429"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="403130429"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 15:37:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="1064239881"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="1064239881"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 15:37:41 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 14 Aug 2023 15:37:33 -0700
Message-Id: <20230814223734.375449-4-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230814223734.375449-1-umesh.nerlige.ramappa@intel.com>
References: <20230814223734.375449-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/4] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

struct drm_xe_engine_class_instance might get padded for 64-bit
alignment based on compiler used. Since engine information is kmalloced
in the query and drm_xe_engine_class_instance may be padded, it could
potentially leak some kernel memory to user.

Add a rsvd field to struct drm_xe_engine_class_instance to make it
64-bit aligned and zero out the field before returning to user.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 7 +++++--
 include/uapi/drm/xe_drm.h     | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 99a4800c7c53..b9d565264ceb 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -65,7 +65,7 @@ static int query_engines(struct xe_device *xe,
 		return -EINVAL;
 	}
 
-	hw_engine_info = kmalloc(size, GFP_KERNEL);
+	hw_engine_info = kzalloc(size, GFP_KERNEL);
 	if (!hw_engine_info)
 		return -ENOMEM;
 
@@ -78,7 +78,10 @@ static int query_engines(struct xe_device *xe,
 				xe_to_user_engine_class[hwe->class];
 			hw_engine_info[i].engine_instance =
 				hwe->logical_instance;
-			hw_engine_info[i++].gt_id = gt->info.id;
+			hw_engine_info[i].gt_id = gt->info.id;
+			hw_engine_info[i].rsvd = 0;
+
+			i++;
 		}
 
 	if (copy_to_user(query_ptr, hw_engine_info, size)) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 86f16d50e9cc..53cd57342620 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -753,6 +753,7 @@ struct drm_xe_engine_class_instance {
 
 	__u16 engine_instance;
 	__u16 gt_id;
+	__u16 rsvd;
 };
 
 struct drm_xe_exec_queue_create {
-- 
2.38.1

