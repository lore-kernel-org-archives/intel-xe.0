Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6F8103A9A9
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 11:08:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6315D10E870;
	Wed, 25 Mar 2026 11:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/A2m4xX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1417E10E86F;
 Wed, 25 Mar 2026 11:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774436910; x=1805972910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yqu338r41YRr644KD1vFIgMITqMbgOHWs7ETD2YjmAs=;
 b=L/A2m4xXGlvwWhfeVPm0mX8rx0H7kmkgx9jkq3TmZYhD12BvQFxXf+t5
 j6S3bGlUo+JvQTe6G/DRRe4xmdOKYQQFTRU9Nkp3Tjszr8Z6qtvpnnD8Z
 TYYC2Gt+JsiyBi+gcHaQ5i8OPS34Wd+GK1UmZ6HxJj8VoJpesLuBzpSpt
 hTfcvEcagI/UCIHsnglTUTFyINt2XODRbe1V13rEsegcySEXZ4pcYHgu0
 umfy64+8JuwBGom7ATWyhDGyOajk/thiiSsF5WlkPUtlWrNo1CoCa4QZO
 Qyujzq10B4n/McpXEZGe1rw+Oz4JXaJc0AQBDilPr9d56+2NEmC5iMBMT A==;
X-CSE-ConnectionGUID: LU54v/cLQGW1/q/MWs5xfQ==
X-CSE-MsgGUID: 13w9NacCTGG0Wnsycqo68Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93047529"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="93047529"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 04:08:30 -0700
X-CSE-ConnectionGUID: OsdQUtFDRhKcxcTmYOYkgQ==
X-CSE-MsgGUID: 1zwKtSw2QuqGQ5z2rsnNbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="219798395"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 25 Mar 2026 04:08:28 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: sowmiya.s@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com,
 chaitanya.kumar.borah@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 16/26] drm/i915/writeback: Add writeback to xe Makefile
Date: Wed, 25 Mar 2026 16:37:34 +0530
Message-Id: <20260325110744.1096786-17-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325110744.1096786-1-suraj.kandpal@intel.com>
References: <20260325110744.1096786-1-suraj.kandpal@intel.com>
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

Add a intel_writeback.c to xe so that it builds for xe.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 49de1c22a469..2e456070895a 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -327,6 +327,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_vga.o \
 	i915-display/intel_vrr.o \
 	i915-display/intel_wm.o \
+	i915-display/intel_writeback.o \
 	i915-display/skl_prefill.o \
 	i915-display/skl_scaler.o \
 	i915-display/skl_universal_plane.o \
-- 
2.34.1

