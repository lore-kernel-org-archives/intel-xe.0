Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6308FC0219E
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 22:36:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2844B10EBB5;
	Fri,  7 Feb 2025 22:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CuLFlWco";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC24310E105;
 Fri,  7 Feb 2025 22:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738967547; x=1770503547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cn88Ursnt1X4vFovqVVy8lyyCBvXlsb83eOKKQb5JVc=;
 b=CuLFlWco6hz8fww4hkAkcpnV1UbirDHW9/gigAy/27aQ6OeHfAKTkBfy
 YteJ0G3yX8/DEnzrMrZIuAp9R0+j+hSOPmQ4rVXV8M46ErgFtAHprf+sN
 T/zRKpfJMqDnzOhWloBwpMnVLgb7OjT4jOOd1kkdjW4VuB4YWdydoDF2u
 D23FWQD5ciikjlJGzjZoh4OMMFfXG5NWtY953rBmmbaMhc/NWUCL8pkyL
 0Lo2JF7l19M8y3IeQDeeOdsrlukLb7Z/RwHn4mBM2g2g8y0vdOSrylxi7
 40iPCzbOKZ6DhgmzavoiI3djxwSG29ejev/7n/R+Lkb68HZ/vCQXZm+nd g==;
X-CSE-ConnectionGUID: 2qLucytWQ+6HTf0hlImE+g==
X-CSE-MsgGUID: +TheTSNHRLCAyqTPxxfEJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39313432"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="39313432"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:32:26 -0800
X-CSE-ConnectionGUID: HPqyhIQFRo+UGnl8ufamtw==
X-CSE-MsgGUID: u618OrXoR1SZYr3UV44RyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="111857490"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Feb 2025 14:32:25 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 08 Feb 2025 00:32:24 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 8/8] drm/i915/dsb: Decode DSB error interrupts
Date: Sat,  8 Feb 2025 00:31:59 +0200
Message-ID: <20250207223159.14132-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250207223159.14132-1-ville.syrjala@linux.intel.com>
References: <20250207223159.14132-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Decode the DSB error interrupts into human readable
form for easier debugging.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index aba57ddfbb92..db69b1c676f7 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -860,7 +860,16 @@ void intel_dsb_irq_handler(struct intel_display *display,
 	}
 
 	errors = tmp & dsb_error_int_status(display);
-	if (errors)
-		drm_err(display->drm, "[CRTC:%d:%s] DSB %d error interrupt: 0x%x\n",
-			crtc->base.base.id, crtc->base.name, dsb_id, errors);
+	if (errors & DSB_ATS_FAULT_INT_STATUS)
+		drm_err(display->drm, "[CRTC:%d:%s] DSB %d ATS fault\n",
+			crtc->base.base.id, crtc->base.name, dsb_id);
+	if (errors & DSB_GTT_FAULT_INT_STATUS)
+		drm_err(display->drm, "[CRTC:%d:%s] DSB %d GTT fault\n",
+			crtc->base.base.id, crtc->base.name, dsb_id);
+	if (errors & DSB_RSPTIMEOUT_INT_STATUS)
+		drm_err(display->drm, "[CRTC:%d:%s] DSB %d response timeout\n",
+			crtc->base.base.id, crtc->base.name, dsb_id);
+	if (errors & DSB_POLL_ERR_INT_STATUS)
+		drm_err(display->drm, "[CRTC:%d:%s] DSB %d poll error\n",
+			crtc->base.base.id, crtc->base.name, dsb_id);
 }
-- 
2.45.3

