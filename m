Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16509C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 10:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF09510E744;
	Mon, 25 Mar 2024 10:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HSzLQaVL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC77610E743;
 Mon, 25 Mar 2024 10:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711363060; x=1742899060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5dDNRUhaGbYis9x/2BC62q8/K2N+ob6nmKTgvekqWBE=;
 b=HSzLQaVLxptCtR70LvYpl39jVODblvEuH5SzzuLSrGYJDa89b9h93Cqy
 xLmUdGDrrWTEgqL5ON9TBGbUsH4CkQr+E20X6rO0riusRAH5N5yvHFl0T
 DmPb30ro3iu5uruARd2COK3d/4KHFQdGmhA6WTvI3dKU3XU3tts+OuUFE
 NkGdzCGwCxuFA1CO6H1wQ9IIqwx5l41yQA0yCjCT002yD65Z+cpNzxePC
 Kvb0evMJbJpBdH3ryPLUHpgpSt4/jYrSnWzYjSXo1gHAdGbEFY1XYG51u
 rfjky/75CMdnGpMRf16phJtX5WMA7kBkTG+/XX9GHtOQaZaqXcgrqV+mx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6955444"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6955444"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 03:37:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="20121022"
Received: from lwaern-mobl1.ger.corp.intel.com (HELO hazy.ger.corp.intel.com)
 ([10.249.33.10])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 03:37:37 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, gustavo.sousa@intel.com, james.ausmus@intel.com
Subject: [PATCH v3] drm/i915: limit eDP MSO pipe only for display version 20
 and below
Date: Mon, 25 Mar 2024 12:37:13 +0200
Message-Id: <20240325103713.1814043-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
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

The pipes that can be used for eDP MSO are limited to pipe A (and
sometimes also pipe B) only for display version 20 and below.

Modify the function that returns the pipe mask for eDP MSO so that
these limitations only apply to version 20 and below, enabling all
pipes otherwise.

Bspec: 68923
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: James Ausmus <james.ausmus@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---

In v3:
   * go back to unrestricing only for > 20, since the change for
     versions 14 to 20 should be tested separately;
   * simplify the if blocks [Ville].

In v2:
   * allow pipes A and B from ver 14 to 20 [Gustavo]

drivers/gpu/drm/i915/display/intel_ddi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index a3d3d4942eb1..8ab4fff1b5fb 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2336,10 +2336,15 @@ static void intel_ddi_power_up_lanes(struct intel_encoder *encoder,
 	}
 }
 
-/* Splitter enable for eDP MSO is limited to certain pipes. */
+/*
+ * Splitter enable for eDP MSO is limited to certain pipes, on certain
+ * platforms.
+ */
 static u8 intel_ddi_splitter_pipe_mask(struct drm_i915_private *i915)
 {
-	if (IS_ALDERLAKE_P(i915))
+	if (DISPLAY_VER(i915) > 20)
+		return ~0;
+	else if (DISPLAY_VER(i915) >= 14 || IS_ALDERLAKE_P(i915))
 		return BIT(PIPE_A) | BIT(PIPE_B);
 	else
 		return BIT(PIPE_A);
-- 
2.39.2

