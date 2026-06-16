Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38B9CD98F0
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 16:23:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DCB10ECAD;
	Tue, 16 Jun 2026 16:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZtpIXzZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E6010EC83;
 Tue, 16 Jun 2026 16:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781626995; x=1813162995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CmLmXM37YZQAUNc26P0DWBhkoIDUS7J4kTHrtaSpXwI=;
 b=UZtpIXzZELmGFcdqFiAwjywUiqzki2FW0GjJv/5KAF8C6YZQReNI0M2g
 XeUVoi1rV7MQQ2S+DH6Bb7y1pLZH+k57Wz5FVTGEbJ8KMfh7To4Syeq5w
 G9NCCmN+ymU/f4jtt19JwcuSda3+pGiHAidIeZoAP2eqOgyudsx6s63Y6
 w5oEwVnDUQ1mrmN+Mkw3nbhPMiz/2QaHdFWoBsL+hkgp/OEDGiplHsFG8
 Om8gEYuq9Na+F8VEi7AprJs3E4xwFUTlUkQ1ZPGqG7WapZVzhjcsCztC2
 vMEiplES6uo+rZkFurrGXs1L3OE6ckel7J6ZHxS1kAq/ive41amLgCIEt w==;
X-CSE-ConnectionGUID: LA9FAmVlSwKxZVo5y4fTpw==
X-CSE-MsgGUID: j7O86xe0SPO2p8gsNfkBJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93781302"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="93781302"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 09:23:14 -0700
X-CSE-ConnectionGUID: 9PsRbf+eQxullmsXZC4OEA==
X-CSE-MsgGUID: wuMRzHqLSTyhSS4Kd1VX/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247693500"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 09:23:13 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, animesh.manna@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v6 05/16] drm/i915/display: Add HAS_DC3CO() macro
Date: Tue, 16 Jun 2026 21:51:43 +0530
Message-ID: <20260616162154.2630995-6-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616162154.2630995-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616162154.2630995-1-dibin.moolakadan.subrahmanian@intel.com>
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

