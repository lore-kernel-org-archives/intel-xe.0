Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817A6C4450A
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 11:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF5310F87F;
	Fri, 10 Jul 2026 11:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="HGZwEkWN";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A008D10F879;
 Fri, 10 Jul 2026 11:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1783682101;
 bh=FhWnln2x5ZsoqS5+DJezj3L6bEYUD7ALmsG56Z9yjwM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HGZwEkWNbebm+Wl72c7CS5DDSeAVv7Cnz8rrpoBpJUyblM2KeYFuVl9GRzQV2C2Me
 tz1kZc2XN3fgdg+TjsTRg9JJX2OJDcrgrWaAmj38Z0dk99gBHwFaHIUeqpQGLP/JHq
 WBK6WbGarhPLgpSClIyWA+R+iVJMEpWd+EI7c6S6tnSi2BipFL8tGi5rmtuSc26/RH
 h7sbc6sF0vEK82TMkGuZMEiNHZHQrSF1VYwnBhdQd1k24ac7Awi8jcoDjvZ2P3BqJw
 kbVYV/Nz4X13IFQzfsK+gRSL9CojaVeHJR8q0+IoANdUtVpv/w3puUnxEwVxjAtoFk
 RuLJKXvw5cL/w==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 06/11] drm/xe: Print a debug message if we have no stolen
 for the initial FB
Date: Fri, 10 Jul 2026 13:15:33 +0200
Message-ID: <20260710111539.1274555-7-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260710111539.1274555-1-dev@lankhorst.se>
References: <20260710111539.1274555-1-dev@lankhorst.se>
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

Inform the poor sop reading the logs why the initial FB was rejected
if there is no stolen memory.

Technically this should perhaps be an error since the plane is known
to be enabled at this point, and if there is no stolen then it clearly
can't be scanning out from anywhere. But maybe there are some
virtualization passthrough cases and whatnot where we might not be
able to get access to stolen, so keep it as debug (same as i915).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patch.msgid.link/20260511214122.8468-9-ville.syrjala@linux.intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index feb979cca12af..a62e5394c3f7d 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -68,10 +68,14 @@ initial_plane_bo(struct xe_device *xe,
 			    "Using phys_base=%pa, based on initial plane programming\n",
 			    &phys_base);
 	} else {
-		struct ttm_resource_manager *stolen = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
+		struct ttm_resource_manager *stolen;
 
-		if (!stolen)
+		stolen = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
+		if (!stolen) {
+			drm_dbg_kms(&xe->drm, "No stolen for initial FB\n");
 			return NULL;
+		}
+
 		phys_base = base;
 		flags |= XE_BO_FLAG_STOLEN;
 
-- 
2.53.0

