Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C84C7EE30
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 17:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1906F10E8DC;
	Thu, 26 Jun 2025 17:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bxupvdxg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811FA10E8DA;
 Thu, 26 Jun 2025 17:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750959801; x=1782495801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+k2u28B20gDIlakZtdPu9Rc/s8+sA1Q2lf1xc36V9SE=;
 b=bxupvdxgg7CK/CgNOTDdygtO1O3vIDyTUi+oTDTfDhYDAQmcj6YEkorz
 9DnhYAko3criEB+ieDY34TndmtLaGKSnJNGAJoGJbFWflkjrR8dkh4pdA
 5BbHnZgZVgRTxH971iAbWmysrMl+Nzq7PXDhesCQWFk8JA1926WnlaS4r
 FFfQKFns7vifcntoMpvjPxThRvZdQd1pxJdFKLqhYtGTizAWyXI5qUeNo
 oK32gilKbal22tshhyTcTO5Ci1vIqvLNg85b5rEZTYpJjlD1oL30kSOFB
 9h6xdNbAxpszCA/71s5qhplkkD7phG/wqFcWSg8k0tIu6/cBeeCo8ytdD g==;
X-CSE-ConnectionGUID: +goDQ6vGRvuGPaT4MsUDLQ==
X-CSE-MsgGUID: QL7EJZdPTR2TW/pNh0CGWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53141083"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53141083"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 10:43:21 -0700
X-CSE-ConnectionGUID: 1NIHVOlDRG6HAsK948MPjw==
X-CSE-MsgGUID: +UZPXA7/QMmsB4aZUq2ukQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="152207965"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.120])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 10:43:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 1/8] drm/i915/hdmi: use intel_de_wait_for_set() instead of
 wait_for()
Date: Thu, 26 Jun 2025 20:42:59 +0300
Message-Id: <051b36670be526033e49c2a8caf682a4ba3bac67.1750959689.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1750959689.git.jani.nikula@intel.com>
References: <cover.1750959689.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Prefer the register read specific wait function over i915 wait_for().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 9961ff259298..8ba61259336e 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1582,9 +1582,9 @@ bool intel_hdmi_hdcp_check_link_once(struct intel_digital_port *dig_port,
 	intel_de_write(display, HDCP_RPRIME(display, cpu_transcoder, port), ri.reg);
 
 	/* Wait for Ri prime match */
-	if (wait_for((intel_de_read(display, HDCP_STATUS(display, cpu_transcoder, port)) &
-		      (HDCP_STATUS_RI_MATCH | HDCP_STATUS_ENC)) ==
-		     (HDCP_STATUS_RI_MATCH | HDCP_STATUS_ENC), 1)) {
+	ret = intel_de_wait_for_set(display, HDCP_STATUS(display, cpu_transcoder, port),
+				    HDCP_STATUS_RI_MATCH | HDCP_STATUS_ENC, 1);
+	if (ret) {
 		drm_dbg_kms(display->drm, "Ri' mismatch detected (%x)\n",
 			    intel_de_read(display, HDCP_STATUS(display, cpu_transcoder,
 							       port)));
-- 
2.39.5

