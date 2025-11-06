Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FDACCFA13
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 15:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F21710E921;
	Thu,  6 Nov 2025 15:21:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dqu+S81y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57B310E921;
 Thu,  6 Nov 2025 15:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762442473; x=1793978473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/3Qc/gPX5haOKUHGA+TXarmEJ1uuZI40uojSDLg2Q4U=;
 b=Dqu+S81y6bt2EbuyOJ5dmU1kVFOTULY+07dDX+jmQkWcj8kXyCrvaeF+
 pzC8nKIoFqEHTrWW8nPTxBuUnZvB2Lhy46MaqhndAhyfje8ovFxc+Bh6e
 p2bXREMZ0WUkraJ08iYgVqSYaBwq4gwvFB6xOQJ3a1wppCo95GmpJeA8z
 qbVMlth6tDmpUrDKecVyVO3LA+4K+L7lmdEZqgXY1Sni3QTrJ8u96W2rW
 8gfJOqiyVNqAHB+D4mzH62gG0tDiiB8apHwXu2XfwoO3/9JBXXoX3+X4q
 vrMeBpeEJIOo7KLTuCQCbxWR3diKimbJcgaOBKauWVwUHnJnA/+4kO/8w A==;
X-CSE-ConnectionGUID: Li/ucBPgRlSIfM+XeKiEpQ==
X-CSE-MsgGUID: 45fY6htpQTSZRUynnxetwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64617700"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="64617700"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 07:21:12 -0800
X-CSE-ConnectionGUID: po2wJEQSR/qfZUym4gZoIA==
X-CSE-MsgGUID: hG0AFuJ5RXGQhsZcsk0JaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="211240561"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.213])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 07:21:11 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 05/10] drm/i915/cx0: Get rid of
 XELPDP_MSGBUS_TIMEOUT_FAST_US
Date: Thu,  6 Nov 2025 17:20:44 +0200
Message-ID: <20251106152049.21115-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251106152049.21115-1-ville.syrjala@linux.intel.com>
References: <20251106152049.21115-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

XELPDP_MSGBUS_TIMEOUT_FAST_US looks to be just an obfuscated version
of the default 2 microsecond fast timeout used by
intel_wait_for_register(). Get rid of it to make it clear what's going
on here.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c      | 3 +--
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index e8a96a60fdd6..ddcfdf45bd38 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -168,8 +168,7 @@ int intel_cx0_wait_for_ack(struct intel_encoder *encoder,
 				 XELPDP_PORT_P2M_MSGBUS_STATUS(display, port, lane),
 				 XELPDP_PORT_P2M_RESPONSE_READY,
 				 XELPDP_PORT_P2M_RESPONSE_READY,
-				 XELPDP_MSGBUS_TIMEOUT_FAST_US,
-				 XELPDP_MSGBUS_TIMEOUT_SLOW, val)) {
+				 2, XELPDP_MSGBUS_TIMEOUT_SLOW, val)) {
 		drm_dbg_kms(display->drm,
 			    "PHY %c Timeout waiting for message ACK. Status: 0x%x\n",
 			    phy_name(phy), *val);
diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h b/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
index 62db0fd99f4a..f031de40f6c6 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
@@ -75,7 +75,6 @@
 #define   XELPDP_PORT_P2M_ERROR_SET			REG_BIT(15)
 
 #define XELPDP_MSGBUS_TIMEOUT_SLOW			1
-#define XELPDP_MSGBUS_TIMEOUT_FAST_US			2
 #define XELPDP_PCLK_PLL_ENABLE_TIMEOUT_US		3200
 #define XELPDP_PCLK_PLL_DISABLE_TIMEOUT_US		20
 #define XELPDP_PORT_BUF_SOC_READY_TIMEOUT_US		100
-- 
2.49.1

