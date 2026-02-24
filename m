Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A5CEFB7EF
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 03:45:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F1610E4AC;
	Tue, 24 Feb 2026 03:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLK5X4dB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8326210E4A9;
 Tue, 24 Feb 2026 03:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771904744; x=1803440744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FNL5GpEFF3IWd8vsecUluyK1p6kZ2nrv2YqjHeH2h3Q=;
 b=OLK5X4dBBTZ73PA5csOBwMyIQZe5EnTtgoT+xUpMDvkU7qhynRVqCnJT
 yVZNo1wV9wJM/kFMQIJ8895fUzFoB46fVLzeR6op+VKL+Enj5whVPNtzg
 TerG0CcqDtvHi2MbHZOgrygPrFta24ik2poAJUPzQzL4pBs6EXTi/DgTF
 Wcwng8ze7XLVkdDWqVECpeCG5PWkvXv5kVEvV8MYVVrrDWHTi43Fkqdwe
 qiy8R5Nw7nvWTe39Qi5UjVSXDmExM9jHnbuxzShrI0jwb7ty4A5EeLD6G
 0EfGnSlTgCthmsDe0HItdUcWRUgHLdCjkeo1KsvzKyp9PVXMzKgc3hISS A==;
X-CSE-ConnectionGUID: mkV2kp1MRcCCG8j5X5ycQg==
X-CSE-MsgGUID: amvW5MjUScCXBLdJAQ20tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72817869"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72817869"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 19:45:43 -0800
X-CSE-ConnectionGUID: CGzO2Ti3Q5+M2OK4pWfXfQ==
X-CSE-MsgGUID: 8XTrj1+PS3eSPAU9wxxHYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="215010647"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 23 Feb 2026 19:45:42 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 8/8] drm/i915/backlight: Use default/max brightness for
 INTEL AUX HDR backlight init
Date: Tue, 24 Feb 2026 09:15:26 +0530
Message-Id: <20260224034526.2730130-9-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224034526.2730130-1-suraj.kandpal@intel.com>
References: <20260224034526.2730130-1-suraj.kandpal@intel.com>
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

If the brightness fetched from VBT/previous state is 0 on backlight
initialization, then set the brightness to a default/max value.
Whenever the minimum brightness is reported as 0 there are chances
we maybe sometimes end up with blank screen. This confuses the user
into thinking the display is acting weird. This occurs in eDP 1.4b
when we use proprietary INTEL AUX HDR DPCD registers to manipulate
brightness via luminance values.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
v1 -> v2:
- Let users set brightness to 0, make it so that it's just not
done by default (Arun)

v1 -> v2:
- Update commit header & message (Arun)

 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index aac6cdb5b69b..725370bcfa3b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -442,6 +442,8 @@ intel_dp_aux_hdr_setup_backlight(struct intel_connector *connector, enum pipe pi
 
 	panel->backlight.level = intel_dp_aux_hdr_get_backlight(connector, pipe);
 	panel->backlight.enabled = panel->backlight.level != 0;
+	if (!panel->backlight.level)
+		panel->backlight.level = panel->backlight.max;
 
 	return 0;
 }
-- 
2.34.1

