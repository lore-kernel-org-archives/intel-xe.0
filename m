Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9BDC25B7E
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 15:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027C910E55F;
	Mon, 20 May 2024 15:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LlDHeyND";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0518210E7B5
 for <intel-xe@lists.freedesktop.org>; Mon, 20 May 2024 15:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716219954; x=1747755954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1k+HrhOaQNOcD1XinUfrdR+K1Ud/c1Vd5Dk9hyPRJDA=;
 b=LlDHeyNDIQf8L8dmleNsfLvuUwW0cfrVSOFi4RXivA73QUI5Pt0GRbbT
 jAtVhNb/eGnDlTWO2jSgrri/JlurkKJ0CAOUwakYOjHENS0pjyVjKY1YJ
 SAcHuHpKAe6nBpIJVjtNe8SyQPzxnCHGAOxGhLLjFrc8oJpCUs1kmGCsa
 YjOs1rVdooqXM3yEoxyGuRKEnA4+yHCUsuJnLIag3m2VLt65PLEa+uPt6
 xeqOiFBumGh1MEkBiW9qH6cdVWgk8wEP3fIeWEGgpTu/xXzyt6u1mGXrU
 EM4OgSub6GVcQPXAQ2k3cngBq+4qv1RHHgY0hU94Pw4G47jO+Z3Bqnufi w==;
X-CSE-ConnectionGUID: mQwDFEnQT7aysiTlYjwjEQ==
X-CSE-MsgGUID: eAdKReynSfSNkpmon+vJnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="34873240"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="34873240"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:54 -0700
X-CSE-ConnectionGUID: ESAOdtrWQUWLcjM6qMSFHw==
X-CSE-MsgGUID: j+odOceYRaOZPoGbYxNVAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32610529"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:53 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [CI v2 16/18] drm/xe/display: move display fini stuff to devm
Date: Mon, 20 May 2024 16:43:05 +0100
Message-ID: <20240520154249.52888-34-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520154249.52888-19-matthew.auld@intel.com>
References: <20240520154249.52888-19-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Match the i915 display handling here with calling both no_irq and
noaccel when removing the device.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index a2c39bcc7677..18fffa894f7d 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -123,9 +123,9 @@ int xe_display_init_nommio(struct xe_device *xe)
 	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_nommio, xe);
 }
 
-static void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
+static void xe_display_fini_noirq(void *arg)
 {
-	struct xe_device *xe = to_xe_device(dev);
+	struct xe_device *xe = arg;
 
 	if (!xe->info.enable_display)
 		return;
@@ -160,12 +160,12 @@ int xe_display_init_noirq(struct xe_device *xe)
 	if (err)
 		return err;
 
-	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_noirq, NULL);
+	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini_noirq, xe);
 }
 
-static void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
+static void xe_display_fini_noaccel(void *arg)
 {
-	struct xe_device *xe = to_xe_device(dev);
+	struct xe_device *xe = arg;
 
 	if (!xe->info.enable_display)
 		return;
@@ -184,7 +184,7 @@ int xe_display_init_noaccel(struct xe_device *xe)
 	if (err)
 		return err;
 
-	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_noaccel, NULL);
+	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini_noaccel, xe);
 }
 
 int xe_display_init(struct xe_device *xe)
-- 
2.45.1

