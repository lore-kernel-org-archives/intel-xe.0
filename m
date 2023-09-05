Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3911CCA0FF6
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 14:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC60210E52D;
	Tue,  5 Sep 2023 14:14:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163DA10E52D
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 14:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693923247; x=1725459247;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NBJP2l7i0HHBMmd+Rwr0c8/usr4uYrMDkU0C/MUTVfg=;
 b=Mvmeb+qEUgH502GCmZHHQceNjyZa6rdZLjfWphUQk3KElTHjDGQ/aEGR
 C+7TgIn05IRWBfKUSfc/AFDj+6ywPRtAHTwvzczwS54hunPZ0p1YRkkka
 wAKojCyOS+YVDxS93smab2SV/Em8B8/2yjd/z0cohs+Ktej8lYtZUSO9I
 e55mdh4S5lD2/J6U5Tzqu5lR+0C3tL1Qz9ZJMDHMzXmsl8n72QTzuVmLr
 8gyh3+CIG9+e5p8k5B/BurbMWJamEdIiBfsexw5luppnLJdqD4v3jmYMi
 4c5L4EuGSaZKqwEc+l3FiR6K86Cw41dj8ygnXbe6BrdS9o19YFX4idFDz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="380611082"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="380611082"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 07:14:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="811245388"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="811245388"
Received: from amyachev-mobl3.ccr.corp.intel.com (HELO localhost)
 ([10.252.60.152])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 07:14:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Sep 2023 17:13:43 +0300
Message-Id: <20230905141347.1027082-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905141347.1027082-1-jani.nikula@intel.com>
References: <20230905141347.1027082-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/5] Revert "FIXME: drm/i915:
 display/intel_display_types.h random whitespace changes"
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
Cc: Jani Nikula <jani.nikula@intel.com>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit d323a84d0d791f2f3006f507efeb0f2cffdbf1c2.
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 9310f8f2d940..23ca68fd359c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -765,7 +765,9 @@ struct intel_plane_state {
 	 * this plane. They're calculated by the linked plane's wm code.
 	 */
 	u32 planar_slave;
+
 	struct drm_intel_sprite_colorkey ckey;
+
 	struct drm_rect psr2_sel_fetch_area;
 
 	/* Clear Color Value */
-- 
2.39.2

