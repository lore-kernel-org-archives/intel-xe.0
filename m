Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17980C61CE7
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 19:51:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBC110ECA5;
	Fri,  6 Jun 2025 19:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7QmK31u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E0B10ECAA
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 19:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749239479; x=1780775479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wiiV/EG7qPMGSJnDv3rlg5tSgPAZi49+Pmz/QHDLmns=;
 b=H7QmK31ui+H1TpdLDu9Fg/yxHyleItkU+zXWq4g6pgUSDr4it2Zl9sN1
 1urFdjYc/HBEaUp9VHSmfn/pZqRhqykv4L5W5xs0IOR52kS6mieMow5MT
 0eEb1HN7pp4uoKpXu7UQ1yQ7jB0qoQvYgojQ6nymESuARvo0Od1iOrFRo
 Ai6+7+z738r9zI1ApowAFJKESCrZplPZ/j3er9LdesuCzJB/+McMhN7a7
 q6npyuX5bFO4ux5MugKNNNpBV+pn669B98eRBIF8mplekip0CKdYUH9O3
 Jfr1rrq+qkb26ypUZe1vWZFmN2tHJTKs1EUasrNFZsUZqGyAwbuFRcfpU Q==;
X-CSE-ConnectionGUID: ptVYy/TMTn6OWxinkBGyyA==
X-CSE-MsgGUID: qu6TZsoBTxK3QhUYzzGAAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51277302"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="51277302"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 12:51:19 -0700
X-CSE-ConnectionGUID: VtjVxWpmRhqY2mF9av5p1A==
X-CSE-MsgGUID: 2+m29IRRSySKq7RKD8OMCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="145796090"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa006.fm.intel.com with ESMTP; 06 Jun 2025 12:51:18 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 9/9] drm/i915/xe3lpd: Extend WA 16023981245 for display 30.02
Date: Sat,  7 Jun 2025 01:21:04 +0530
Message-Id: <20250606195104.1771715-10-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
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

wa_16023981245 need to be exteded for display version 30.02

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
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

