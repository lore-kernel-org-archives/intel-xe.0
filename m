Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6459FCCFA18
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 13:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD65F10E57D;
	Tue, 11 Nov 2025 13:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GgsODqbT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA1210E567;
 Tue, 11 Nov 2025 13:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762866647; x=1794402647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=94tKXuOQfC27mOeuPLaZiWIjBgBkhzUfNIPNaQxCMKQ=;
 b=GgsODqbTFa0FeMd14ySMH9uZMdGoDpmSR0GMyIpP4rJyARgviZZm7SYS
 rGXLnWeb7SyD7/evcS1yk/EfZU2vGJJT6/gB1PIf+pBzhAL25JiZfMtxH
 cQpmmmm16ux/JrWwA/OEotSI9MuLaKfhmVIbciLX4WLCy/cEBfPz7/mqS
 +NNJqQ4IjzWEkaOGbRFBNPYq6ShN/X8COCrlxGAuZre9aDr7yZaV2PX6A
 MfiD9H92WsOPwU+Xg/GMKQU1zfK01hOKqw/YfHK4iQz8l1jYmWC6TL94r
 /lMBX1z0Em29aspvsJCZhUJFfwJ8DDLr01wFlWr6uz8eThok1kBrA16aX Q==;
X-CSE-ConnectionGUID: tRZsPy7ORpKor70TCWT6Ag==
X-CSE-MsgGUID: 7IzY6gBVSe+tPqUNePx2Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64967459"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="64967459"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 05:10:47 -0800
X-CSE-ConnectionGUID: qM6+pG1iTzqZq5lJ8cwiQQ==
X-CSE-MsgGUID: 8mzky0jPTvSKUoFkRRFx0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="189129210"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa008.jf.intel.com with ESMTP; 11 Nov 2025 05:10:44 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v3 01/10] drm/i915/alpm: Add DPCD definition for DP2.1 ALPM
 capability
Date: Tue, 11 Nov 2025 18:13:07 +0530
Message-Id: <20251111124316.1421013-2-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251111124316.1421013-1-animesh.manna@intel.com>
References: <20251111124316.1421013-1-animesh.manna@intel.com>
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

Add required DPCD address which will be needed to enable DP2.1 ALPM.

Cc: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 include/drm/display/drm_dp.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index e4eebabab975..b4bacbcf130e 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1512,6 +1512,8 @@
 /* See DP_128B132B_SUPPORTED_LINK_RATES for values */
 #define DP_PHY_REPEATER_128B132B_RATES			    0xf0007 /* 2.0 */
 #define DP_PHY_REPEATER_EQ_DONE                             0xf0008 /* 2.0 E11 */
+#define DP_LTTPR_ALPM_CAPABILITIES                          0xf0009 /* 2.1 */
+#define DP_TOTAL_LTTPR_CNT                                  0xf000a /* 2.1 */
 
 enum drm_dp_phy {
 	DP_PHY_DPRX,
@@ -1691,7 +1693,7 @@ enum drm_dp_phy {
 #define DP_DSC_BRANCH_CAP_SIZE		3
 #define EDP_PSR_RECEIVER_CAP_SIZE	2
 #define EDP_DISPLAY_CTL_CAP_SIZE	5
-#define DP_LTTPR_COMMON_CAP_SIZE	8
+#define DP_LTTPR_COMMON_CAP_SIZE	10
 #define DP_LTTPR_PHY_CAP_SIZE		3
 
 #define DP_SDP_AUDIO_TIMESTAMP		0x01
-- 
2.29.0

