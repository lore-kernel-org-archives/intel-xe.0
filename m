Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEEBCD5BD5
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 05:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE9E10EBF3;
	Thu, 28 May 2026 05:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RquWZYGd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281B410EC02;
 Thu, 28 May 2026 05:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779944530; x=1811480530;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=CmLmXM37YZQAUNc26P0DWBhkoIDUS7J4kTHrtaSpXwI=;
 b=RquWZYGdrLO1LZZHyK48ndeeLL7GG1hnBf9AkizghPOdCpxENPvRY/7X
 gqmC/E5N+xXP1S4FM4pUrXDbqVEGuB7M+JCDrqzeygN/jvqGyfs8VFs6n
 FrrG3AlhRjf5loPzIGkqQ8H7Nqb/XAq5JAkZs/Y+S2f4/LBQAceWMLnQS
 fq8LZu99iv76VTKCfusNokfIWbnJrVYXbY6iCnDws12tI+pUBXqEmV0RI
 hQ9nSCHGpya3J21UeCyLXPcXp/euHW6wJ+cD7F5qi1jFH61i8ZUd5/VDx
 4wTgih7bLaT9463AoVgZ3ybg7uJOdso+TB68t+3y6idsGhKcWZfRYVGlf A==;
X-CSE-ConnectionGUID: ezYQViy+Ql2lRTL5ME9/mQ==
X-CSE-MsgGUID: 5ibWS/1jQTiG15FHe3psyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80895710"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="80895710"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 22:02:10 -0700
X-CSE-ConnectionGUID: RtdPRSiaQW6wtW+KSlE9ww==
X-CSE-MsgGUID: JvaZWkR3TUCSxbtfZVL0vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="238025895"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 22:02:09 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v2 07/17] drm/i915/display: Add HAS_DC3CO() macro
Date: Thu, 28 May 2026 10:31:21 +0530
Message-ID: <20260528050131.466351-8-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528050131.466351-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260528050131.466351-1-dibin.moolakadan.subrahmanian@intel.com>
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

Add HAS_DC3CO() to identify platforms supporting DC3CO.
DC3CO is supported from display version 35 onwards.

BSpec: 75253
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index acb9ca87dda7..f77b3da2cff5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -159,6 +159,7 @@ struct intel_display_platforms {
 #define HAS_CUR_FBC(__display)		(!HAS_GMCH(__display) && IS_DISPLAY_VER(__display, 7, 13))
 #define HAS_D12_PLANE_MINIMIZATION(__display)	((__display)->platform.rocketlake || (__display)->platform.alderlake_s)
 #define HAS_DBUF_OVERLAP_DETECTION(__display)	(DISPLAY_RUNTIME_INFO(__display)->has_dbuf_overlap_detection)
+#define HAS_DC3CO(__display)		(DISPLAY_VER(__display) >= 35)
 #define HAS_DDI(__display)		(DISPLAY_INFO(__display)->has_ddi)
 #define HAS_DISPLAY(__display)		(DISPLAY_RUNTIME_INFO(__display)->pipe_mask != 0)
 #define HAS_DMC(__display)		(DISPLAY_RUNTIME_INFO(__display)->has_dmc)
-- 
2.43.0

