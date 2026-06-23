Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFCECDB479
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 12:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908CB10EB35;
	Tue, 23 Jun 2026 12:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifTOoYo6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DAC10EB27;
 Tue, 23 Jun 2026 12:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782219087; x=1813755087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uvBFSqPOViFcrixOd1HED1hUiwja2GamcZzqArHGNO4=;
 b=ifTOoYo6C0eL2UYvMy95V9qQno7n2bwfCFfW1nEqgD+023RUSp9n57M/
 u5SVc4cS+h485oXu/ZhWFQgRQFj/hC6ntuICaTu+dxSXpuLINxAVFH/Hv
 2+tIAnXSiG9da+PjyjtYqtCjd2WAcPov6D9zfM2uSxm5jjTq6HLSBMARL
 I54ryfJzlKB1tjmdKEsFfS/OmGLXtfh0tgfUbvYFXFNhjeJGx5hXI8YSq
 SR5bzI+PUt/zyBwZ3TzExmzkwk9H3Jg89B1PlMsPPHdOIGXZPbTLbszbz
 iEs7Ff+vhZus9sUf6u9rhSwYkvDJoGo/MitrBLJJLQrDHvqffm9H9S7JP A==;
X-CSE-ConnectionGUID: 0YYGzaSBSvyu+gX9cO3fQQ==
X-CSE-MsgGUID: 8eAbmBtvQVq7fJsmO3pFtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="100387502"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="100387502"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 05:51:26 -0700
X-CSE-ConnectionGUID: Fi8UMJ2CRu+7ldES+44fYw==
X-CSE-MsgGUID: EiRUqXNFQrSdf2Kx5EDQdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="249624917"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.67])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 05:51:25 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/6] drm/i915/gmbus: s/gmbus_pins_bdw/gmbus_pins_lpt/
Date: Tue, 23 Jun 2026 15:51:07 +0300
Message-ID: <20260623125111.6632-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623125111.6632-1-ville.syrjala@linux.intel.com>
References: <20260623125111.6632-1-ville.syrjala@linux.intel.com>
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

The GMBUS pin pair <-> GPIO mapping is purely a property
of the PCH (on the platforms where GMBUS lives in the PCH).
So rename gmbus_pins_bdw[] to gmbus_pins_lpt[] and extend
it to cover all platforms with LPT/WPT PCHs.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_gmbus.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 9990e6391b03..2869ec23e1ec 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -86,7 +86,7 @@ static const struct gmbus_pin gmbus_pins[] = {
 	[GMBUS_PIN_DPD] = { "dpd", GPIO_5 },
 };
 
-static const struct gmbus_pin gmbus_pins_bdw[] = {
+static const struct gmbus_pin gmbus_pins_lpt[] = {
 	[GMBUS_PIN_VGADDC] = { "vga", GPIO_0 },
 	[GMBUS_PIN_DPC] = { "dpc", GPIO_3 },
 	[GMBUS_PIN_DPB] = { "dpb", GPIO_4 },
@@ -178,9 +178,9 @@ static const struct gmbus_pin *get_gmbus_pin(struct intel_display *display,
 	} else if (DISPLAY_VER(display) == 9) {
 		pins = gmbus_pins_skl;
 		size = ARRAY_SIZE(gmbus_pins_skl);
-	} else if (display->platform.broadwell) {
-		pins = gmbus_pins_bdw;
-		size = ARRAY_SIZE(gmbus_pins_bdw);
+	} else if (HAS_PCH_LPT(display)) {
+		pins = gmbus_pins_lpt;
+		size = ARRAY_SIZE(gmbus_pins_lpt);
 	} else {
 		pins = gmbus_pins;
 		size = ARRAY_SIZE(gmbus_pins);
-- 
2.53.0

