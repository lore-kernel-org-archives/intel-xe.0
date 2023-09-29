Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A03E743EA
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 05:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D518110E6B9;
	Fri, 29 Sep 2023 05:04:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E39F10E6BE
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 05:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695963869; x=1727499869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ld2u1IT1oluDfKjJtkTOSgpOnwkmu4TsFaVhWyTXUeg=;
 b=KxvnUrtdhIl4WxfRHmk1Mi8PJ5ea4qJtpS4wjXJ2abkzF6zcjH2qLNGH
 Wb87ouP/N2yuLPj15Q9puixW6lJJl+J+h9xNNfhHHq8wm+awRouiCRtsJ
 ext2Sksd0CM55ReKwBMAPXiG38OONv00Co58ct7wTG70n/w5sOyqBGxqJ
 CFvn5MFOQv3jPL2qRDGa8Ens1vT8TnQjJwF+uLMMkd2U7ZYEKIbasnWwO
 xw0oOq68RPsP2CXtwX2Aee/HbSPjPWCUIMY9tYYklFUysxQZ3/SIqPDDv
 XBD3X0HdO0t7+UlRQROHF0R+KloAhUKdg7wN+u1AUbMvYMFitO+ztTB41 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="413142030"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="413142030"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:04:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="865570973"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="865570973"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:04:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 22:02:53 -0700
Message-Id: <20230929050253.3153804-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230929050253.3153804-1-lucas.demarchi@intel.com>
References: <20230929050253.3153804-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/7] drm/xe/gt: Dump PAT table when failing to
 initialize
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

When failing on early initialization, one cause may be that the PAT
configuration is not correct. Dump it for ease of debugging.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 1aa44d4f9ac1..1a750c88cdd6 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -307,6 +307,17 @@ int xe_gt_init_early(struct xe_gt *gt)
 	return 0;
 }
 
+static void dump_pat_on_error(struct xe_gt *gt)
+{
+	struct drm_printer p;
+	char prefix[32];
+
+	snprintf(prefix, sizeof(prefix), "[GT%u Error]", gt->info.id);
+	p = drm_debug_printer(prefix);
+
+	xe_pat_dump(gt, &p);
+}
+
 static int gt_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
@@ -360,6 +371,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	return 0;
 
 err_force_wake:
+	dump_pat_on_error(gt);
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
-- 
2.40.1

