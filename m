Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF69EF99ED
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D69A10E852;
	Fri, 13 Feb 2026 22:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzOoTFjl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE20010E84A
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021959; x=1802557959;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=jBR0kziVLSgGmQdMC7X20oEeYRPD9dnGSlxGBOnJu0g=;
 b=YzOoTFjlkWA66d4jr+oxEsCehQEQGWnVmHZmMphFQ43SyUZWD7pJCy+y
 JfOmTqShMwTVJ0jhdf7aWnOd5/IWlaOmqC9aHr0B6q66fmsGiFz7EnEOG
 DACWJ87g1VneLb624d8AikTAv5bXJ9LkfTY4ANb4tidMYzifvZyM1JWi7
 m6nTJy3JxLBIst0/W9IatSTevYuBM012mnvGAi+KjoT19qil5KH34ReMj
 XGJLKk+9TvxFq3hdfdQbloCZPjkKNHUvCzQ+jCqZ0cp3FU7t+m/y2dinW
 jHx+jJuXxYBi9/znp8Hp87917XyHHO72yaU1OqEM2SiLEXT+GYi8LDvTx A==;
X-CSE-ConnectionGUID: r1fOukggRcSEBFhzAc6rGg==
X-CSE-MsgGUID: Q6x2wEjHR4W0OwSYPzXTaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654449"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654449"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:38 -0800
X-CSE-ConnectionGUID: hKicod+2Tuiqdw7z30IbJw==
X-CSE-MsgGUID: b674XnypTWydXImxJtKi5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705683"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:56 -0800
Subject: [PATCH 21/22] drm/xe/xe2_hpg: Drop invalid workaround Wa_15010599737
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-21-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1577;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=jBR0kziVLSgGmQdMC7X20oEeYRPD9dnGSlxGBOnJu0g=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aDxDTZUIXfxc1zLWD6teyLu551uESMhERML
 SjXmYnwvpmJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mgwAKCRBNeSQFyHKQ
 BPZ2D/9O95l4aPz+J6+2y8ltBp0OUYnPcLF3+th8ruJ8TBlHp9MQRsxmyWGzO+i6AX7todSrM7d
 ZofXoo4pbn73dtirvkyDuY+sRqbSYHlZSRrC7ZKCxuA5C1+RfJ56MIdng0hFHQBhqfWeku+YjLy
 9hsSnvrUZcibgT81SJLXI3QeXhknrwbWh9tVMTpvE3nHfg+NgPEGTqI0+2Vd2gtbA0M3gazRlcu
 7CkEk8YNKuI9d1v3q09Pv0D8er1ek7yuVUPbngPybJeG3ozpbCSlRdhKzc4cpH4C7pnOEdC6qSc
 5r+seOgHGHhjAxJI0odgwzZ45k4amuCs31g3fMhWcfw5wHewSx7u2VrIYXiMhUkZVYWV/Ha06nU
 p2a9BzlwWfKYAWvPHNigbGt1573yJavEWCCdS+X70rwjbqREkF7JVDhjoReC5viVPno3ZFRhwIT
 95UC/YdHjjiOaHeezCbbJLo4cbklO2v+eCGCCMeg+duPAZg9o9WnV/D/lQZQdFqLzP2dYbinzIE
 jWbJDrloTMhc5RSDSsYK08zTCKLWo86zKN/0x9DygkB2m4TkzO1S8j3lXRda7LrY0+O69DR6f+4
 tEpyiRWWpKKOcMUPJSL7RV1Z7FXgmHap/T3sJ44a20XmBJ2SDPN/jDxVJ3YgUF2dKruMm4IVS9B
 1JQfBZXjjJfu5+Q==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Wa_15010599737 was a workaround originally proposed (and ultimately
rejected) for DG2-G10.  There's no record of it ever being relevant or
even considered for any other platforms.

The specific bit this workaround was setting is documented as "This bit
should be set to 1 for the DX9 API and 0 for all other APIs" which means
that it should almost always be left at the default value of 0 on Linux.
The register itself is directly accessible from userspace, so in the
special cases where it might be relevant (e.g., Wine/Proton running
Windows DX9 apps), the userspace drivers already have the ability to
change the setting without involvement of the kernel.

Fixes: 7f3ee7d88058 ("drm/xe/xe2hpg: Add initial GT workarounds")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index fb123117d1a86082393fc214ee8658eca85d4005..185f37e3a2cc3ccc27df424f745f0d8bfb87c54f 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -734,10 +734,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	},
 
 	/* Xe2_HPG */
-	{ XE_RTP_NAME("15010599737"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
-	},
+
 	{ XE_RTP_NAME("14020756599"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))

-- 
2.53.0

