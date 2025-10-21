Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57D6CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 12:38:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7B110E5E0;
	Tue, 21 Oct 2025 12:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ri2I0/Ry";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B6A10E5DE
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 12:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761050310; x=1792586310;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CgKjmNpIfO/odGIKnEfHQaUzqzFqGef/g7jtXReAWHk=;
 b=Ri2I0/RyspbaG0b33Y1WM0yjGu5JirluXnqtNtBonGLsBNPqxaIwy60T
 nA2XS8y7S1sRmbHbzKNVvsaNCEzmrdYX432BS4KcQZqTzUkSPZfYqC/H5
 lSaMeDJFi7mG3A+ldiuGoJE3yIHwOSt49Yv2MuZQwsB5OFyUZCSz0h1rP
 v26xhshrI6kaqIMA1cWdNBuGxKDsHeuPIwLoTbKEad5tvp3t6oeS+W+J9
 eUXkFYpRsKsHIj+Lc5usYT7AMEZACSq/fBaofopfk5Jn0fjnt9Qzql7SG
 PQT6N7KoKWq9CXgPwVJqZAwLzs3pxVoJGyIvHWfF5m3swcBB9KhZyLDWK g==;
X-CSE-ConnectionGUID: A/IuloISQtOX+uVSduXjEQ==
X-CSE-MsgGUID: vfERSi0pRH2sCGAiWlYqLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50747441"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="50747441"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 05:38:30 -0700
X-CSE-ConnectionGUID: E6/2T4ghTPa5k3eL/aflgg==
X-CSE-MsgGUID: vNk/OBFcTEan3xoc8Mz1Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="187850369"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa004.jf.intel.com with ESMTP; 21 Oct 2025 05:38:29 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v5 5/5] drm/xe/vf: Do not disable VF migration on ATS-M
Date: Tue, 21 Oct 2025 14:39:43 +0200
Message-Id: <20251021123943.1436375-6-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251021123943.1436375-1-tomasz.lis@intel.com>
References: <20251021123943.1436375-1-tomasz.lis@intel.com>
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

Our current support for the VF migration depends on the availability
of the MEMIRQ rather than specific graphics version 20.

Relax our early migration support checks to allow also use some older
platforms like ATS-M for experiments and testing.

Do not allow ADL, as supporting VF migration through MMIO interrupts
would require additional changes in order to achieve reliability.

v2: Add MEMIRQ condition

v3: Remove platform version check, as only 12+ are supported by Xe
 driver anyway (Michal)

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 0a1331db2a9a..31c3e786b152 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -159,10 +159,8 @@ static void vf_migration_init_early(struct xe_device *xe)
 		return xe_sriov_vf_migration_disable(xe,
 				"experimental feature not available on production builds");
 
-	if (GRAPHICS_VER(xe) < 20)
-		return xe_sriov_vf_migration_disable(xe,
-				"requires gfx version >= 20, but only %u found",
-				GRAPHICS_VER(xe));
+	if (!xe_device_has_memirq(xe))
+		return xe_sriov_vf_migration_disable(xe, "requires memory-based IRQ support");
 
 	xe->sriov.vf.migration.disabled = false;
 }
-- 
2.25.1

