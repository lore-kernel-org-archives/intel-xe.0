Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFB0CCD1BF
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 09:08:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D82110E36D;
	Thu, 23 Oct 2025 09:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbzx5Eb+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F3D10E36D;
 Thu, 23 Oct 2025 09:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761210534; x=1792746534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vP75UYqStUxfUAo0NRPUUDcI0zbU9+UhrUWVpbfhTnE=;
 b=lbzx5Eb+AGvcFjca/Yjd/WvnAqxbBeYB8ZYEI67WIHOx8YnW1KkRqzOz
 wt6xldBP26KeW4WBixYLwRpEg/RTIkrIwPG/l7htXewQyJiw/2ScqkZqW
 Ryuy+/Yrqag1r1SpF5TnnIFjOasGW6RELMgeX6XxPAWxJO4SmMK0oo78i
 aaf/amBsYLLUVYap/A0bFcXrluJuU+abMCIexa8Ie6vANgJlgyoECtiM9
 wqp64EKbvCUxoNgCrTas5aY49iToKeSWrPJSKsS1y7EB/0DHs9+Ui5Zc2
 BOHz8gcFtfPUqH/yz7M6HnR+Ijdh+KwJlB+ijuhJfb7sCi+7mreIal1pB Q==;
X-CSE-ConnectionGUID: VEIf7/i+QDGnYF9O8PObxQ==
X-CSE-MsgGUID: /cjGW7wNQJWxe0RNqQexzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67020594"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="67020594"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:08:54 -0700
X-CSE-ConnectionGUID: TTDiRy6zS4+tP2c5Yso0lQ==
X-CSE-MsgGUID: SW4dyZeATl6lqSen0d7qzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="183329384"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa010.jf.intel.com with ESMTP; 23 Oct 2025 02:08:52 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 1/8] drm/i915/alpm: Add dpcd definition for DP2.1 alpm
 capability
Date: Thu, 23 Oct 2025 14:11:40 +0530
Message-Id: <20251023084147.572535-2-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251023084147.572535-1-animesh.manna@intel.com>
References: <20251023084147.572535-1-animesh.manna@intel.com>
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

Add required dpcd address which will be needed to enable DP2.1 alpm.

Cc: Jouni Högander <jouni.hogander@intel.com>
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

