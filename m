Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A3BCDB465
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 13:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB9510E4DD;
	Thu, 19 Oct 2023 13:21:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678FB10E4EA
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 13:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697721679; x=1729257679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PcgUPiyweplFYIKttMC2HrFkjfPiNGS6jljVUi/s/D8=;
 b=ZTf3kWKBc+pbky0GM1ONNudmhAkoB2UQwzbXoVjo6Xy8dp+xoKR8rqOY
 wbszplKwICrJqdEHvfebGgwFBQ8x6qdt4Z6JZbonwyF6bfEYwfoU3b14n
 wqJZ6r+m94ptKYDSUvvExiEUTMmtjlBeH0SKou+fVbSWaW0KaT9VNLVc4
 ZuJzLd0Pe8fBmV91XgrAG7y7TiJskB+vXnVhGx2Nm2jfKrL+DF+73sASQ
 xgdc2uV+GfV3CDmmSntYR4jDLBY1IK+7jA0es9FHOj2wbOIMZnfs2Xyt2
 owJJpeLdT/kNVkcK0QHgy41z6pnI1v071dSdYUuskShq24mXGg3hNhBau g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385123994"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="385123994"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 06:18:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="757028170"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="757028170"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga002.jf.intel.com with ESMTP; 19 Oct 2023 06:18:51 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 19 Oct 2023 18:55:25 +0530
Message-Id: <20231019132534.1374903-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019132534.1374903-1-himal.prasad.ghimiray@intel.com>
References: <20231019132534.1374903-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1 02/11] drm/xe: Add new helpers to log hardware
 errrors.
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

Introducing xe_gt_log_hw_err and xe_gt_log_hw_err helper to
report gt specific hardware errors.

Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index 5991bcadd47e..10e5c4a23c34 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -43,4 +43,11 @@
 #define xe_gt_WARN_ON_ONCE(_gt, _condition) \
 	xe_gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
 
+#define xe_gt_log_hw_err(gt, fmt, ...) \
+	drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "GT%d reported " fmt, \
+			    gt->info.id, ##__VA_ARGS__)
+
+#define xe_gt_log_hw_warn(gt, fmt, ...) \
+	drm_warn(&gt_to_xe(gt)->drm, HW_ERR "GT%d detected " fmt, gt->info.id, ##__VA_ARGS__)
+
 #endif
-- 
2.25.1

