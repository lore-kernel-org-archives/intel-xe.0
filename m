Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2228FEA807
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 05:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E37A10E787;
	Wed, 25 Mar 2026 05:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJQx8+zY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10B010E77A;
 Wed, 25 Mar 2026 05:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774414812; x=1805950812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+EeLryiloyCxo0Xs1PQ3VWC3qLYvKrlGnPpYJ7DueKQ=;
 b=EJQx8+zYJ8HZSm/KKihCxFpN2DnemtQnbwFu34hLApUngKiNjR4IUjZ/
 1HZ+Q8Nado8OBPSxIze27LjTHc3BczUwo8bRYKsDfdSzSAMmLkB+1l8d2
 Rte5mP3oGK4jser4SoV1xhack5U4rytzmpoWjKyT5/hPeTP2vhf5taF17
 t0hEvLxEh35aE8AnjcIxSIIJn76okmX+OgdARzAW7Ve4Z6+ZlAcLy794p
 6OwDWZxWWSfvZx4ArB4ALp7TTxX6TtXEIuJ02RL/k3mJhakKwZvFdHDW9
 AW8oNCiWS1i6+IN2uh/YJsOvJ5B4UZC1V+AGY9Hmnrac1jLaxpfnJbMa8 w==;
X-CSE-ConnectionGUID: c8ZsLdLQS3qAl+KTy0TZ3w==
X-CSE-MsgGUID: sdeVrWAWSK+FMJ8QFejcXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86922331"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="86922331"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 22:00:07 -0700
X-CSE-ConnectionGUID: zokLUz32SIKOrfZyBf5YYg==
X-CSE-MsgGUID: L4FMelJRQBawpToq1UzuKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="224580724"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 24 Mar 2026 22:00:05 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: sowmiya.s@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com,
 chaitanya.kumar.borah@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 16/26] drm/i915/writeback: Add writeback to xe Makefile
Date: Wed, 25 Mar 2026 10:29:06 +0530
Message-Id: <20260325045916.984243-17-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325045916.984243-1-suraj.kandpal@intel.com>
References: <20260325045916.984243-1-suraj.kandpal@intel.com>
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

Add a intel_writeback.c to xe so that it builds for xe.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 50608312bc66..e2fab320b2ca 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -326,6 +326,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_vga.o \
 	i915-display/intel_vrr.o \
 	i915-display/intel_wm.o \
+	i915-display/intel_writeback.o \
 	i915-display/skl_prefill.o \
 	i915-display/skl_scaler.o \
 	i915-display/skl_universal_plane.o \
-- 
2.34.1

