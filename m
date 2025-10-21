Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B58CCCD1A7
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 18:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8EF10E63C;
	Tue, 21 Oct 2025 18:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e8A+XanS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7616110E63C
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 18:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761070295; x=1792606295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4SP/cgALr5NfYVOPun/GvAZlftX1ExSx3icuc3jlZrc=;
 b=e8A+XanSwhsn69yDM77I1ULW4SxiZqeBkd+7fg+2iMNkGGRRIKQpAlX1
 YAQo4rEc6iT23C8TWUYqjzP0HBmuYMJFPRduL+mstjcTSblXqTQfKAorl
 70VDqKYQYIXErTs5RdeznO1p5fdtMeVQvnbpvvgmcRQluC+rWgpOkCv6e
 wn2CcfODdmDpjjPxd9LoSdL91uDx6nebDW2aWokulbBGXCq6lDdU2NXk+
 Lf93uOyae+DtK9+TU6iJ82B2oCv83prXJqkIoif38v6/GPs61jVG+oacQ
 vWMhUCWY5IoKyrZwnG/c12LSL/AgmJpgTWP5W1FQXlVOSCF/9EQTxIXlq A==;
X-CSE-ConnectionGUID: Hzd2Ek+ETtSn0QymCkV2Ng==
X-CSE-MsgGUID: lOjK+Fq7SueF1Gw5SWsZBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80644989"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="80644989"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 11:11:34 -0700
X-CSE-ConnectionGUID: 5k7sAo5aRm6h/0FnHRiVPw==
X-CSE-MsgGUID: yHo0cDP3TfKJ6OJ3m0RJfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="183519912"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa007.jf.intel.com with ESMTP; 21 Oct 2025 11:11:33 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v6 4/4] drm/xe/vf: Do not disable VF migration on ATS-M
Date: Tue, 21 Oct 2025 20:12:50 +0200
Message-Id: <20251021181250.1541639-5-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251021181250.1541639-1-tomasz.lis@intel.com>
References: <20251021181250.1541639-1-tomasz.lis@intel.com>
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

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
v2: Add MEMIRQ condition

v3: Remove platform version check, as only 12+ are supported by Xe
 driver anyway (Michal)

 drivers/gpu/drm/xe/xe_sriov_vf.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 13d6c094ae8f..39c829daa97c 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -164,10 +164,9 @@ static void vf_migration_init_early(struct xe_device *xe)
 		return xe_sriov_vf_migration_disable(xe,
 				"experimental feature not available on production builds");
 
-	if (GRAPHICS_VER(xe) < 20)
-		return xe_sriov_vf_migration_disable(xe,
-				"requires gfx version >= 20, but only %u found",
-				GRAPHICS_VER(xe));
+	if (!xe_device_has_memirq(xe))
+		return xe_sriov_vf_migration_disable(xe, "requires memory-based IRQ support");
+
 }
 
 /**
-- 
2.25.1

