Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118B8CCD1A5
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 20:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95D610E514;
	Mon, 20 Oct 2025 20:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IKaGV2xp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FF110E512
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 20:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760993815; x=1792529815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=StwmZuHE4U7bBJx1IQqsHSyCgjzAVJnm6naJbDeYjww=;
 b=IKaGV2xp5vEQvJrXFfHT69zaOiUWJr3H3qJ/AyY440aH4c23KQsVNpNh
 f9FIEpA2+dzN/8KzPqSTqL043Jb1VNrpsBzcr1uJF36khsE89olt8T/qa
 x7ZGPrHqE/5M+Zc9WfRIofUz6eJiYmMOKo508aoJ5RmM5cXs22M8N8K4E
 HqRV0lEj83+ksixrCAIpUEPr23ZDzhrVW1Inr8AI9ZTrraxcoG0bgIiYH
 BX76kLW+E96Fit1apvORrHGLcGCIDpjN6KYAxAmRgwlMhTUjIXuK1vwKW
 j8Ih2oohM4v4ReRdzpa6WZ2Kq81a+WNFCQoeyV+FfZuxmHV6Q2aChOhuU Q==;
X-CSE-ConnectionGUID: fRiwQbo1Q32ALamHCxE/Jw==
X-CSE-MsgGUID: NDLPdHl9Q4GJQSnnzMsLvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63036092"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63036092"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 13:56:55 -0700
X-CSE-ConnectionGUID: F2j8AZWhTL2mjCbSuwmLSQ==
X-CSE-MsgGUID: xz43miHgTZWWT3kcKO9kPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="184196602"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa010.fm.intel.com with ESMTP; 20 Oct 2025 13:56:53 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v4 4/4] drm/xe/vf: Do not disable VF migration on ATS-M
Date: Mon, 20 Oct 2025 22:58:08 +0200
Message-Id: <20251020205808.1187308-5-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251020205808.1187308-1-tomasz.lis@intel.com>
References: <20251020205808.1187308-1-tomasz.lis@intel.com>
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

v3: Remove platform version check, as only 12+ are supported by Xe
 driver anyway (Michal)

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 3a3cd9c35aa8..75760da247f4 100644
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
 
 	xe->sriov.vf.migration.enabled = true;
 }
-- 
2.25.1

