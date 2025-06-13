Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBACC71150
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 19:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FF910EA4D;
	Fri, 13 Jun 2025 19:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="erMSnz1N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF1310EA4B
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 19:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749843122; x=1781379122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5m3Kfbcdbq/qlkFX6Se6hwde/ld59UJQlRmKnu+iBvU=;
 b=erMSnz1NmaKA4dBs16vWfiK27YbJcBPdk1T7pheb0p2FL9+OOdRYL2ch
 XhvYZCi4yKVXlvd2O2BsLU3+E04n7nNq18aGwoBgi4sRXemMu7bJ6XF7y
 9qiWUIdx/kOJ+RO0WWEvU/32O1Zkn4OUFgMrSgbt/6qp81ToSCf2Y3bb4
 a+Ump62/JIhlDWViXf+AC8smR1PGoNRaYOXepHVc467gn6IiMMV11tDBO
 N4IXKymJGlE3we+Lxsjn7Z9FRicoynaXObFZLFfmOHompXmEMyxEfDi8w
 du6K8Ah84whVM3mOP1RzRSp7qIloAT9ILuV09vR+iEWERY5w5vvGXFo7J g==;
X-CSE-ConnectionGUID: FMWTHsVxQK2pK101Fp24+w==
X-CSE-MsgGUID: pb4pXBx6RRWHJGI1U7z7Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69510522"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="69510522"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 12:32:02 -0700
X-CSE-ConnectionGUID: cUsxFcSUSHK5zBHn+Fua3g==
X-CSE-MsgGUID: Mu9wKFmeT1WBTTjPkKEqKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="151722674"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2025 12:32:01 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Subject: [PATCH v6 9/9] drm/i915/xe3lpd: Extend WA 16023981245 for display
 30.02
Date: Sat, 14 Jun 2025 01:01:46 +0530
Message-Id: <20250613193146.3549862-10-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
References: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
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

wa_16023981245 need to be extended for display version 30.02

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 15ede7678636..e0336c79c294 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -1085,7 +1085,8 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
 
 		/* Wa_16023981245 */
 		if ((DISPLAY_VERx100(display) == 2000 ||
-		     DISPLAY_VERx100(display) == 3000) &&
+		     DISPLAY_VERx100(display) == 3000 ||
+		     DISPLAY_VERx100(display) == 3002) &&
 		     src_x % 2 != 0)
 			hsub = 2;
 	} else {
-- 
2.34.1

