Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC90EC6FD1F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 09:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E1710E3C3;
	Tue,  7 Mar 2023 09:25:32 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DD510E3C3
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 09:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678181129; x=1709717129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sto5wQv8ixV/MQXohx0ae3xxcdrhsfM04MEo8+9o4k4=;
 b=fMevXh2RkLGJf736/Zy+gPskpB+wqVL8tywwf39tMx0gkXvOuZv1SahG
 sz/m7nUoTeXvKPg4D06RW8W07z2eHc/N5iwA0iY8vIMjel/4zqs+hVcDx
 7LXzOMvQMTTqTndptOtzlkWHPQoC+H+40KVeuDkYEOnwWcv2QStegHfla
 1sGwTIk30tgDQ0o5XTcSIEKdNr64X2NCUUoz2SptebFouhRsibz2xQH+m
 lzGtfpA61Xt38dsTwbGlduCB50p7Y7Db6llyzkfJnAZS3AA+L/F9Qgj4/
 Gy5FXOiJRSNgfeAIvrkT317y+JUIO3fD7fPp1U3e7IG5ZrUAil6Igu3SV A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="422079113"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="422079113"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005798795"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="1005798795"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:13 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  7 Mar 2023 01:24:29 -0800
Message-Id: <20230307092446.1263266-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307092446.1263266-1-lucas.demarchi@intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 02/19] drm/xe: Allow const propagation in
 gt_to_xe()
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Replace the inline function with a _Generic() so gt_to_xe() can work
with a const struct xe_gt*, which leads to a const struct xe *.
This allows a const gt being passed around and when the xe device is
needed, compiler won't issue a warning that calling gt_to_xe() would
discard the const. Rather, just propagate the const to the xe pointer
being returned.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 5635f2803170..086369f7ee6d 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -49,10 +49,10 @@ static inline bool xe_gt_is_media_type(struct xe_gt *gt)
 	return gt->info.type == XE_GT_TYPE_MEDIA;
 }
 
-static inline struct xe_device * gt_to_xe(struct xe_gt *gt)
-{
-	return gt->xe;
-}
+#define gt_to_xe(gt__)								\
+	_Generic(gt__,								\
+		 const struct xe_gt *: (const struct xe_device *)((gt__)->xe),	\
+		 struct xe_gt *: (gt__)->xe)
 
 static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
 {
-- 
2.39.0

