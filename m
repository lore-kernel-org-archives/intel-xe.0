Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B47D43370
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 15:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056AE10E110;
	Thu,  7 Nov 2024 15:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXJQKZUO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3066F10E032
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730992442; x=1762528442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zOxPcBMWY4aGA27GdKNWck0TYchPixJbrkIGZxuvT1Q=;
 b=YXJQKZUOpph8zCI/SrJCZj85UMoT/VTbz2LPquKJxshmQQM5eT7c3swT
 W6jXmOGsfFkV2ZtOsUEWHSQ8X1JKKGN6A5bOo1pFFSXS/jbXlZQ/zTbTq
 wt9UPlDcWA1WlGC/YBS35UT4KQChUtznM2ljGk0Fy08bSYb6GUldkwhPc
 0Qz08aWL7QJtvb8mB70mNOAJuUYerRh6IjGoCaltcN1XAqxcQ7OE1QZ/w
 3hoaY7W3z6zE9xYt35zmwmITF5DFVa/OPtsv3z05nCJkVsD01tQoJE1Ic
 s75veuuwjuDPQuV3tXd8sQQPtAO9UEcnjfPG2egwl5x6aKS50CQsmK2YO A==;
X-CSE-ConnectionGUID: SpmP3b6LTIuO9QkHlOxHWQ==
X-CSE-MsgGUID: gxzOUVVMQLGhlDACnPFrlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31013252"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31013252"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 07:14:02 -0800
X-CSE-ConnectionGUID: jjA+yWPVTASCABPwR94oSA==
X-CSE-MsgGUID: Qr5O7nNqSrKrNl3K9FTuoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="89922557"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by orviesa003.jf.intel.com with ESMTP; 07 Nov 2024 07:14:01 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v1 1/1] drm/xe/guc: Do not assert CTB state while sending MMIO
Date: Thu,  7 Nov 2024 16:13:57 +0100
Message-Id: <20241107151357.1623733-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241107151357.1623733-1-tomasz.lis@intel.com>
References: <20241107151357.1623733-1-tomasz.lis@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

During VF post-migration recovery, MMIO communication channel to GuC
is used, despite CTB channel being enabled. This behavior is rooted
in the save-restore architecture specification.

Therefore, a VF driver cannot assert that CTB is disabled while sending
MMIO messages to GuC. Such assertion needs to be PF only, or be removed.

This patch simply removes the assertion.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Suggested-by: Michał Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 7224593c9ce9..df1ba94cf4ca 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -945,7 +945,6 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 
 	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
 
-	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
 	xe_assert(xe, len);
 	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
 	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);
-- 
2.25.1

