Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B11C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC2110E8F0;
	Thu,  9 Nov 2023 15:46:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25DA10E8E2
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544762; x=1731080762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IyzyKui+LC1isei5hKIhj3bF9YDAtIy2ghhM3pzl1yY=;
 b=KPqN/LCRtA4SeYANwFC7cs4T0vdfWqYRB38PF+iGW5S9A8Cger8PUQ6b
 kEvUMQcR7enczalFlGIOKdLE+K7M9qb/WXwrlOrIP0CvMwvaYKCz2yIeq
 wn3VApmgGi6EGfBoydU1A25XClgngai3bYVfM0JTmaksmdI0Tf1+ox4QD
 itzaQgqssFiTeYOnxMHJo44kMi+up20gqm8r5jGngg2lGlS003Pqxiqer
 WvVlw0txbQuTClrSM9dMwwHtpYYywy87SLpk24MI9I1kalW+iyaf7cXzm
 ZmfEROjXzKJpALZGPIKJSbHyAEPUxm5yshpQMKippPKC3liSdxB4BtY53 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556678"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556678"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936885991"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936885991"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:23 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:24 +0000
Message-Id: <20231109154457.7-11-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 10/43] drm/xe/uapi: Change rsvd to pad in
 struct drm_xe_class_instance
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Change rsvd to pad in struct drm_xe_class_instance to prevent the field
from being used in future.

v2: Change from fixup to regular commit because this touches the
    uAPI (Francois Dugast)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 5 ++++-
 include/uapi/drm/xe_drm.h     | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 995930e47ea2..808244e668a3 100644
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
index 697973fff24c..5d7836f8137d 100644
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

