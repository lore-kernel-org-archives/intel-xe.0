Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB780CE7A8A
	for <intel-xe@archiver.kernel.org>; Sun, 24 Sep 2023 14:57:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EED310E12C;
	Sun, 24 Sep 2023 14:57:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA5210E1AF
 for <intel-xe@lists.freedesktop.org>; Sun, 24 Sep 2023 14:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695567410; x=1727103410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bx7738siXVtPJHL82Ompp0gMUhSg9K8ZH7S30gFY+gw=;
 b=CE46v0KNPCKwzQC+us9JL5ONs03bwE80I67vZdcHsWuirz6xJgRSFzrU
 vdYDGMpqrRNOmJ13otJbNxxL5Lxef9x+b0BO4lhPbNpTLywgmP/7z9QrW
 SyY2wtEqIp7G5TOm8ZAhjMaphP4PpmbWSpiDE5DMI8GkzFSG05O2y263m
 hh6hiQKXKDEt4px3LzfKbgwXjT/PlVKw6VgE+cQsa25dceZI4upozUFS+
 i7s7MNjyKT6zJG7SvPhS4FDSnU1rjw0yUej/zI5qrHhgH6+tpJk4F60RK
 S36/oLzzWWSK58D6kUdkmJ7xIOMuW1F0AMCQEBJLejtobtC5VU2yFdZyp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="467383725"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; d="scan'208";a="467383725"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2023 07:56:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="741641677"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; d="scan'208";a="741641677"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orsmga007.jf.intel.com with ESMTP; 24 Sep 2023 07:56:48 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sun, 24 Sep 2023 20:17:51 +0530
Message-Id: <20230924144751.446446-2-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230924144751.446446-1-arun.r.murthy@intel.com>
References: <20230924144751.446446-1-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] Revert "FIXME: drm/i915: xe doesn't have
 fastboot module parameter"
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fastboot module parameter has been added to xe driver.

This reverts commit e1d816044a2feb4aab2592c840e999bd9a13f0a8.
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index b2e16cb8d026..46a166b9ae43 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4986,7 +4986,6 @@ pipe_config_mismatch(bool fastset, const struct intel_crtc *crtc,
 
 static bool fastboot_enabled(struct drm_i915_private *dev_priv)
 {
-#ifdef I915
 	if (dev_priv->params.fastboot != -1)
 		return dev_priv->params.fastboot;
 
@@ -5000,9 +4999,6 @@ static bool fastboot_enabled(struct drm_i915_private *dev_priv)
 
 	/* Disabled by default on all others */
 	return false;
-#else
-	return true;
-#endif
 }
 
 bool
-- 
2.25.1

