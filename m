Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B746CDB474
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 04:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F407310E57C;
	Fri, 20 Oct 2023 04:48:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4182410E57C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 04:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697777329; x=1729313329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fp+KkvYlRXtGUvQPwxocUBTNsyO1gsEPt5Cv9xiHzUk=;
 b=V77vBDSMKWk/L2UTn78/iRRKovBnaM4wAYCFpW1pPg3RkY419kcK45yr
 KigMJQOB1US8QnUQh+vCcSgQmKlTwyzTCLfrznUuCzxqfWSYfOJnSy0MX
 FzPDMwZaNhXQgL4O4Kw0yC6Zx/FdwjJ5Ww3svcNgLgrRvGsl/EH3ZNZ+i
 x4NeWG6cx1mWxrZQDaJWWeFNtW/f8ZfEq1LJxcmzIdyNoQVYpp16yU8v6
 9553O1nwiOQwqnayEBAbkZqBxGuyfAeGrXSRxnZUCmWpJFJbeZfX8//s1
 jRCdFNLz0iiySzrb5p0iZAgL3H1tAkZNsuZL1W1eLi/3GdO8MZie0o56t w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="390310792"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="390310792"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 21:48:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="847959734"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="847959734"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Oct 2023 21:48:47 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 20 Oct 2023 10:25:23 +0530
Message-Id: <20231020045533.1425375-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020045533.1425375-1-himal.prasad.ghimiray@intel.com>
References: <20231020045533.1425375-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 02/12] drm/xe: Add new helpers to log hardware
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

v2
- use _gt and _fmt instead of gt and fmt.
- Messages should be same.

Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index 5991bcadd47e..a7507e74882a 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -43,4 +43,11 @@
 #define xe_gt_WARN_ON_ONCE(_gt, _condition) \
 	xe_gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
 
+#define xe_gt_log_hw_err(_gt, _fmt, ...) \
+	drm_err_ratelimited(&gt_to_xe(_gt)->drm, HW_ERR "GT%d reported " _fmt, \
+			    (_gt)->info.id, ##__VA_ARGS__)
+
+#define xe_gt_log_hw_warn(_gt, _fmt, ...) \
+	drm_warn(&gt_to_xe(_gt)->drm, HW_ERR "GT%d reported " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
 #endif
-- 
2.25.1

