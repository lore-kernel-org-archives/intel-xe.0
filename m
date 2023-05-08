Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C95C77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 14:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E44910E2E8;
	Mon,  8 May 2023 14:46:39 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D88E10E2C2
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 14:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683557197; x=1715093197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jdPpVgz9mu4xck2uFl3vinOOeknvo8ChvZkkWqVjGy4=;
 b=SEltfczityD7C3uxcSWxXf9Wc1OJ3/UiK1PKHrCnn/l0Cej1ejkhVCGW
 JZAM8uvNdtnLz5T+WpGP8xjuZKUS9CIw05D1Utnnmm5YNtOdjRhRkId9L
 p60ln5s0CBXwcVNyREr1n2QIyOIHjUqYDN+4VKDLfsVaZ/eWQIh90n9QT
 sLOGBSUnADnLpbSwMr5O1sOa8ziKWeU0l/8KaQJ9ko63xN2WfpJs9Y6wK
 neiaJMzFuF8u1OGm0BmVN28v3hjFs4Jj0eoMD9d3fp0NTkb3nlEsBnN5p
 hu1ySM/4wqBUuWUpYI6obc6ws9w3Fd3CZ5AcKacswZTdu6FxFxDA4O0bG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="349697543"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="349697543"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 07:46:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="788121972"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="788121972"
Received: from heid-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.62.78])
 by fmsmga003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 07:46:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 17:46:01 +0300
Message-Id: <20230508144618.162140-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508144618.162140-1-jani.nikula@intel.com>
References: <20230508144618.162140-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 01/18] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add struct fake_uncore, mostly to allow getting at struct xe_device when
&i915->uncore is used.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 4 ++++
 drivers/gpu/drm/xe/xe_display.c      | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 3a11caaf874b..6490a04614ce 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -311,6 +311,10 @@ struct xe_device {
 	bool display_irqs_enabled;
 	u32 enabled_irq_mask;
 
+	struct fake_uncore {
+		spinlock_t lock;
+	} uncore;
+
 	/* only to allow build, not used functionally */
 	struct {
 		unsigned int hpll_freq;
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 69e223c9a1cc..77a158ecf4cb 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -140,6 +140,9 @@ int xe_display_init_nommio(struct xe_device *xe)
 	if (!xe->info.enable_display)
 		return 0;
 
+	/* Fake uncore lock */
+	spin_lock_init(&xe->uncore.lock);
+
 	/* This must be called before any calls to HAS_PCH_* */
 	intel_detect_pch(xe);
 	intel_display_irq_init(xe);
-- 
2.39.2

