Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A1ECCD184
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 00:26:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0819410E24C;
	Wed, 15 Oct 2025 00:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A4kLFa3+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F3210E6C3
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 00:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760488009; x=1792024009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sij3zU+/mjuT6wb0q9Xlbbnf1QjE0/yOLknQAaEpXY0=;
 b=A4kLFa3+lFI1y18JNzYBpkcmzZ/QgvCz+/DNFnxKlUkr3hrZgYIhz2HH
 usLoBG10RSyK9+DmtXyzTwnkN844s7+VuHOW1WhWBcftkDIabu2BJwXbz
 mmBa6zo5SJfVULZCfD5DQB3FBPvdQXMcm5Xa4mqmp7D6XIZ/WJqhPly8b
 qhn3gkCHZOKNw514XJtXjxqThjeWngl9FiRcOk9zsmV8iXVd8Lh39hsMr
 G2cDcXLQvFIuyUaC5eOBmLcRsE+HWK1WXfVAIFTBVBZN8r1DXFjUUUKks
 a1Nkg5+rocFsNENjEkhwYco/G5HFEYv9FGfvDLsGNvt2JneYAhNxr1oF1 g==;
X-CSE-ConnectionGUID: Kmn0R16sRDewDxbkSvA1DQ==
X-CSE-MsgGUID: zb9It9J7S1uQwyWGawABGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62551506"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="62551506"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 17:26:48 -0700
X-CSE-ConnectionGUID: FtKXQdFrQoSZQTMtVSn6Og==
X-CSE-MsgGUID: APGQOUhjRjepKxNq91RARQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="181239947"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa010.jf.intel.com with ESMTP; 14 Oct 2025 17:26:47 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 4/4] drm/xe/vf: Do not disable VF migration on ATS-M
Date: Wed, 15 Oct 2025 02:27:55 +0200
Message-Id: <20251015002755.720992-5-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251015002755.720992-1-tomasz.lis@intel.com>
References: <20251015002755.720992-1-tomasz.lis@intel.com>
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

The ATS-M does support VF migration, and it has graphics ver below
the currently allowed range. Experimental support of this platform
should therefore be available.

This change allows experimental VF migration support on ATS-M. It
is also explicitly not allowing ADL, by adding condition on MEMIRQ.
Supporting VF migration through MMIO interrupts would require
some special handling in order to achieve reliability.

v2: Add MEMIRQ condition

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 5fb042c05112..fb2b3d41c610 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -159,10 +159,13 @@ static void vf_migration_init_early(struct xe_device *xe)
 		return vf_disable_migration(xe,
 					    "experimental feature not available on production builds");
 
-	if (GRAPHICS_VER(xe) < 20)
-		return vf_disable_migration(xe, "requires gfx version >= 20, but only %u found",
+	if (GRAPHICS_VER(xe) < 12)
+		return vf_disable_migration(xe, "requires gfx version >= 12, but only %u found",
 					    GRAPHICS_VER(xe));
 
+	if (!xe_device_has_memirq(xe))
+		return vf_disable_migration(xe, "requires memory-based IRQ support");
+
 	xe->sriov.vf.migration.enabled = true;
 	xe_sriov_dbg(xe, "migration support enabled\n");
 }
-- 
2.25.1

