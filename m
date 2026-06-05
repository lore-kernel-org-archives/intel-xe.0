Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBF1CD6E5D
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 08:45:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E36811A5D3;
	Fri,  5 Jun 2026 08:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRpW+aaN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F9011A5D2;
 Fri,  5 Jun 2026 08:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780649115; x=1812185115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8BZral/ufZYm5MOkiCtN6K3rXp5dSJHd9NZk5DEnxv4=;
 b=ZRpW+aaNUMqBKwdd2lJSKINhycCDOaBUnzHJSV1ZIkUfvRgaeCqL+orV
 HefBtUO2gUY9Gw9a5Nk+vzqc5424VMDNCqtWC7uVI57ao+8q79d7XbR/Q
 5bb4qjv9JRlIGm19HKeF40NhlMKeQ4DArVq8Pna7+x9frN0Jf1avRHb/x
 72AiPUpqCnxt/iIXNu5HzpQkBQerZtgegbzDBJ71DyX0mwJ3FPde6INo+
 EU6kvB4l2mor2uCTwWGDsnbQ4lxosS7g9hLLUBHP9UUyM56pddU/8tMCM
 DIS87FCjDH2KRnD05DL9gQAZNrl9OpLQVAzLrhSXqs9TqR8RIkBRyeL+A w==;
X-CSE-ConnectionGUID: doFmhLLLQn2XzNAQ/RlMnw==
X-CSE-MsgGUID: nElTjIq9Te2+y4/D1zgKnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81666415"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="81666415"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 01:45:15 -0700
X-CSE-ConnectionGUID: oISHyb1ZRPismPoFWPRaVw==
X-CSE-MsgGUID: RzO6VdrmTl+3wgiW7pTijQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="246624157"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 01:45:13 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v5 05/14] drm/i915/display: Add HAS_DC3CO() macro
Date: Fri,  5 Jun 2026 14:14:12 +0530
Message-ID: <20260605084421.3912865-6-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605084421.3912865-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260605084421.3912865-1-dibin.moolakadan.subrahmanian@intel.com>
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
index 12e5a522a299..f61c930ab079 100644
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

