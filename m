Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEBCCCD194
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 12:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75BC10E9C9;
	Thu, 16 Oct 2025 12:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cGLcP+Vj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF6110E9C9
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 12:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760616245; x=1792152245;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sij3zU+/mjuT6wb0q9Xlbbnf1QjE0/yOLknQAaEpXY0=;
 b=cGLcP+VjNh4dxe9HlAqpKiwGUFeFHzU4KrRouq9gv1QSEWDn37n+Qhxi
 dXO9F9Ma3kTB7PLi99DUDlbz3BUGnKwQfFePg9NPg1VETmngG4fQyQSHi
 8aGWfonfHyWl1JQUr66C+nKBJYob4M1MfGUBSWanwyjsUMiR1YT7FUnkF
 VNlhYx7fBPfv8tvW7X9L9Rp19h7D47nJMrDjJ79Qwh25P2K4LThqQzSOm
 83X9sbG32dtP97Cu0HLu5cKW5M5faenUiToccZAAwDGhzSjn9Vmcqrfth
 rC71fXS4KBt0z8YhWACuXY4zq7Rsoy65p8Vh1eHo1bMAX+v6Q8i7AoSZj w==;
X-CSE-ConnectionGUID: PBDZZ7TfT46To9zdjvwPsg==
X-CSE-MsgGUID: 64Gzp8AKS1iaE2Y9RyGwWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62899723"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62899723"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 05:04:05 -0700
X-CSE-ConnectionGUID: orBB+av1SfqX0AiT3ZxW9A==
X-CSE-MsgGUID: bVk+LIqoSsGzY6CFFN65bQ==
X-ExtLoop1: 1
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa003.fm.intel.com with ESMTP; 16 Oct 2025 05:04:03 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v3 5/5] drm/xe/vf: Do not disable VF migration on ATS-M
Date: Thu, 16 Oct 2025 14:05:11 +0200
Message-Id: <20251016120511.856792-6-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251016120511.856792-1-tomasz.lis@intel.com>
References: <20251016120511.856792-1-tomasz.lis@intel.com>
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

