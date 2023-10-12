Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B02CDB482
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 09:43:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E28C10E478;
	Thu, 12 Oct 2023 09:43:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E268710E478
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 09:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697103818; x=1728639818;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J//SVQ+hU30/Psn9TR6SxGwRNBCGk6GnQYwUdJd+vxY=;
 b=hJDb1iIN0oO2zl5srYb9tZbCP253Vp0PjSlBJloV1NW88t+NA+BGc+wB
 9d5QL5x2/hMzz7CA0lkMRe8fRlfrnKlfBVdMzpeOXcF2WKD2rlF6MxXRm
 niEgtJ9J6zdFhEc5ViPGkvjmFc3JvUkaro/hb8Ji+3TSZb3Whzbicowks
 OK8Dvt1++qkMnpiYz0YNTK9naQx1aVfOQwyIKlHWGIr1E2MtsUDJEEAz4
 PccXYv+SHQKmUA/l3ChWmNK3WeZiUfTX8mD4WAiEUqbUJyHFrVZQwagGP
 j+SEKXgIBbkG5YtXC74w1xAe6KPxdN6qWfTI7WQXyLeeoVunnO/cZ1o1H Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="382117471"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="382117471"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 02:43:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="927920506"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="927920506"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orsmga005.jf.intel.com with ESMTP; 12 Oct 2023 02:43:36 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, jani.nikula@intel.com,
 uma.shankar@intel.com
Date: Thu, 12 Oct 2023 15:04:45 +0530
Message-Id: <20231012093446.1332238-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] Revert "FIXME: drm/i915: xe doesn't have
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

The modparam fastboot is removed from i915.

This reverts commit 3c73fdaf8f58b55b0e292fec0929b6502c2b3a3e.
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 4b73db93d23d..e876fa6db285 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4988,7 +4988,6 @@ pipe_config_mismatch(bool fastset, const struct intel_crtc *crtc,
 
 static bool fastboot_enabled(struct drm_i915_private *dev_priv)
 {
-#ifdef I915
 	if (dev_priv->params.fastboot != -1)
 		return dev_priv->params.fastboot;
 
@@ -5002,9 +5001,6 @@ static bool fastboot_enabled(struct drm_i915_private *dev_priv)
 
 	/* Disabled by default on all others */
 	return false;
-#else
-	return true;
-#endif
 }
 
 bool
-- 
2.25.1

