Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE53BD61014
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 12:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCC110E85B;
	Thu, 29 Jan 2026 12:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vp7i2VLO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163A810E857
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 12:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769691124; x=1801227124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3tm7NGiJP2eFchAeMdK+VoknASCBrzRvBpYAqa4awSM=;
 b=Vp7i2VLOpv23e+Uim1PGuAbQ9erfqML6Hq6q4KqD+u30x2UKI+mVLjU5
 EAwsvnVRSoHUOrUYxEG4puV0UtVQSBGmOGNSzlExbflIovj715cyGA1/g
 abgmonkCndtxPsaW9jHuM6vNgQTK5PlFDcK6SXCA6PloqnBzhBAdL80N2
 hZy+Lg53VaVe78C9GsDk4p3ipuTZZ1QW4ZcDguB2OGhtzG8as0U0f7mxD
 F8VPnXMtlpKbBM6cRb61gWn+r3UyIj6WN31r5a1L/v/Rnb9K4O3iUoeNB
 OcacJIa5ZnAw9kTT8BDfJzUE6Q2racQ5x50C9Ymlfk4jjBinsgMg7//ct w==;
X-CSE-ConnectionGUID: DfgMSmqxS9Kq2mrJ2gozvQ==
X-CSE-MsgGUID: LXiSIf8kRkiKwk9MsTMpTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70129159"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="70129159"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 04:52:04 -0800
X-CSE-ConnectionGUID: zr5LfbJTSdeirAvfT6ZxkQ==
X-CSE-MsgGUID: P/TbFrzAS7Cuuvy10AuQvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208995101"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by fmviesa009.fm.intel.com with ESMTP; 29 Jan 2026 04:52:01 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 2/2] drm/xe/sa: Add lockdep annotations for SA manager
 swap_guard
Date: Thu, 29 Jan 2026 12:51:44 +0000
Message-ID: <20260129125141.523087-6-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129125141.523087-4-satyanarayana.k.v.p@intel.com>
References: <20260129125141.523087-4-satyanarayana.k.v.p@intel.com>
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

Annotate the SA manager init path to model taking swap_guard while under
reclaim context. This helps lockdep catch potential circular dependencies
between fs_reclaim and swap_guard in debug builds.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_sa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index b738102575d4..5efbb5a09f77 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -89,6 +89,12 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
 		if (ret)
 			return ERR_PTR(ret);
 
+		if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
+			fs_reclaim_acquire(GFP_KERNEL);
+			might_lock(&sa_manager->swap_guard);
+			fs_reclaim_release(GFP_KERNEL);
+		}
+
 		shadow = xe_managed_bo_create_pin_map(xe, tile, size,
 						      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 						      XE_BO_FLAG_GGTT |
-- 
2.43.0

