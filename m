Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01876CCF2D6
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:00:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B250F10ECE6;
	Mon, 19 Oct 2026 13:00:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E5110ECE2;
 Mon, 19 Oct 2026 13:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792414829; x=1823950829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kaIt3RyusLC2xWJBSADuOT3FigJCq1K49+SAYj4VnDI=;
 b=B3AZj9If+CtAog5QTBG/alAlsj1XhUX2tI3mvmOplz+hp4Ob/riFNbsM
 uioPRHaj5QQi/1aUoAP0Ab//wHaNpR2OVmh98s0MPoZ7UrsgwlC2NYacF
 CkWGQwrvtBomIv7f2e0724Q3yc3GB7BPXHW+E3ECZHyQYypZ0QzGuIEXO
 g7zvAREZ/y6RyMb94WSNhbrq6nt9o/z5iBXTKm43LXaGkfV7vaxS3k5zg
 No5l1h/bRTtjLKJsAIG/9dkOO9PPcmNI9qRDGyJYWrISI4Lbn4uXdVgeP
 oYmhTaN0QgJa8sihkTol35K/ehckiSLAYFpGidKfp/AlV1s27mkWHZPAR g==;
X-CSE-ConnectionGUID: 0JxTwuLVRuy+DrzPTwq3Mw==
X-CSE-MsgGUID: 5I+WsNW2TZ+xd0IbnhMBXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="964592"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="964592"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:00:29 -0700
X-CSE-ConnectionGUID: tjXlsSBVQL+6OqsduuvVsg==
X-CSE-MsgGUID: R0hLRLciSu2ARyE9lQLIyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4315207"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:00:27 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915: Document which platforms have VT-d
Date: Mon, 19 Oct 2026 16:00:14 +0300
Message-ID: <20261019130014.8851-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019130014.8851-1-ville.syrjala@linux.intel.com>
References: <20261019130014.8851-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Document which platforms may or may not have VT-d support.
Avoids having to trawl all the CPU/chipset docs yet again.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_utils.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_utils.c b/drivers/gpu/drm/i915/display/intel_display_utils.c
index 04d010f7c23e..53de5b90239d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_utils.c
+++ b/drivers/gpu/drm/i915/display/intel_display_utils.c
@@ -22,6 +22,12 @@ bool intel_display_run_as_guest(struct intel_display *display)
 #endif
 }
 
+/*
+ * Notes on VT-d support:
+ * - Q35,Q45,GM45,GS45 are the only GMCHs that support VT-d
+ * - VLV and CHV do not support VT-d
+ * - ILK+ VT-d support varies based on CPU SKU
+ */
 bool intel_display_vtd_active(struct intel_display *display)
 {
 	if (device_iommu_mapped(display->drm->dev))
-- 
2.55.0

