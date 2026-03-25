Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42728103A9AC
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 11:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C1510E880;
	Wed, 25 Mar 2026 11:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5EDU0ep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DAA10E87A;
 Wed, 25 Mar 2026 11:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774436928; x=1805972928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ix4PhHgYCkthjeLCb1fkM8kKY8K2PRnNNu5hqmu9JcQ=;
 b=a5EDU0epJQ3Z/zxx776W3hDABdSHZPn+lYoeNCuMfsascNaxVcoqlewI
 kYWr2ewlwCiLZdQxX7W71OYUHYIG0ESa1GF2aoedHK44u9rsNEhdghYz/
 cqH2dvZkM4xf9yT5E1lPush4Qy76D5VR2zsRnW969R7CEVq8PZ1JTlQlW
 2j97wV1kpLo2UEL1jMr8mKGuoBg4VSCXN4TnAniyQah+1uDKewbmbVrCw
 3d464Mebf+FCEQCnK3ZeHZ/wxCMiUrHeMfaDYDq5lhelqNJb5tU4rygTg
 b29ZoT60OqbhHcBBNKjhfdnhFWsIpiLx0+/FgfdpL8tZ1Qtyk2R6vwU7Z A==;
X-CSE-ConnectionGUID: TanVx9sXSr2JXzJxShjUuA==
X-CSE-MsgGUID: XlubFEOoSxGiw4bdPuo5mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93047542"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="93047542"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 04:08:48 -0700
X-CSE-ConnectionGUID: 4ApT65wgSlyxb04ognDvBw==
X-CSE-MsgGUID: moz5x8KhTXmi3xnWZRoXFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="219798445"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 25 Mar 2026 04:08:46 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: sowmiya.s@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com,
 chaitanya.kumar.borah@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 23/26] drm/i915/writeback: Initialize writeback encoder.
Date: Wed, 25 Mar 2026 16:37:41 +0530
Message-Id: <20260325110744.1096786-24-suraj.kandpal@intel.com>
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

Call the init function to initialize the writeback encoder
only for ADLP.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 4cc3e0779e8a..b4cf7153b7c8 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8030,6 +8030,9 @@ void intel_setup_outputs(struct intel_display *display)
 		intel_dvo_init(display);
 	}
 
+	if (DISPLAY_VER(display) == 13)
+		intel_writeback_init(display);
+
 	for_each_intel_encoder(display->drm, encoder) {
 		encoder->base.possible_crtcs =
 			intel_encoder_possible_crtcs(encoder);
-- 
2.34.1

