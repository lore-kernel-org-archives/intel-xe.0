Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20479D59D65
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 15:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D407110E7B9;
	Fri, 12 Dec 2025 15:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqvtPkyW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3418A10E7B9;
 Fri, 12 Dec 2025 15:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765553336; x=1797089336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A9mXamkE9lYCvlmDq076Qh/BlSa2MRxmYxCEryNtX1I=;
 b=cqvtPkyWgSUW60Pi2thsTaFPOTmF/p0OOdWcU4E3lBQ90uShOYj4c2cO
 GxQX8eBQKN0FJ7AdNm2KTjkYSxe9e6M1wEeMiA2A2jpqrYaqyExS2qSjp
 TI0lgIBDOJmx1oyOX+hHD6NaRARmcMKLQDLz9cl7vDgdGjvF+uYr2u7RK
 DenFiJAuVGKa7nVYvMCkrQx45T2msc9XtphEPrOd83XYVuiifiiwAU5IP
 lDOvn6bGOOTJRNpz2mGnlGtYUO8Q9DWwhSi0eODZp2KHUTbv5WKrXqlHK
 i3M8zsP4bpMxAvcEcBRx1ADMWBNJT+wTk9zoo3Xia6nS8bjCn278VL14s w==;
X-CSE-ConnectionGUID: /nq/qr3gStajHxqj9LaMUQ==
X-CSE-MsgGUID: WcPESyuhQ02cDfPETbxaUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67716370"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="67716370"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:28:55 -0800
X-CSE-ConnectionGUID: +Wg8CVO7S/6EqLZne/W9rw==
X-CSE-MsgGUID: gAPHp9NmTVC9mScPEFjJcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="197935038"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.152])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:28:54 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 01/13] drm/i915/flipq: Don't initialize flip queue on pre-LNL
Date: Fri, 12 Dec 2025 17:28:35 +0200
Message-ID: <20251212152847.13679-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251212152847.13679-1-ville.syrjala@linux.intel.com>
References: <20251212152847.13679-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

We only support flip queue on LNL+. Don't initialize the flip queue
stuff on pre-LNL to avoid leaving confusing debug messages in dmesg.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_flipq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_flipq.c b/drivers/gpu/drm/i915/display/intel_flipq.c
index 1e9550cb66a3..a07b3ec4242c 100644
--- a/drivers/gpu/drm/i915/display/intel_flipq.c
+++ b/drivers/gpu/drm/i915/display/intel_flipq.c
@@ -129,6 +129,9 @@ void intel_flipq_init(struct intel_display *display)
 {
 	struct intel_crtc *crtc;
 
+	if (DISPLAY_VER(display) < 20)
+		return;
+
 	intel_dmc_wait_fw_load(display);
 
 	for_each_intel_crtc(display->drm, crtc)
-- 
2.51.2

