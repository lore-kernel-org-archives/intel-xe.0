Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA67C02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 04:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6B310EA35;
	Fri, 17 Jan 2025 04:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEvVSEuX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FB610EA35;
 Fri, 17 Jan 2025 04:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737087198; x=1768623198;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UsLMzggisSoz4DtXP2oq8Ef4QS9Vwd2RhDqLl3izmgU=;
 b=nEvVSEuXZUTFym6og5WYrOhnvtpZQVdy8ZG5vkq77V/DD3W5buhcZyia
 f+vysRA1VB2Mo1GdAaMgtPrl6SdhzFDyaMh6gxG31AzUg97IVhZ34fcEb
 zX8rRyrNTSeN/mo8YSiUD9ejhxpkTdS2toYjuoGhuvF6xYIHcTnXG2hDi
 26MQWhvKE3+i0YhciT9b2SfuH8dhILaJo7C5B4two3z7++dLCj/iLjYg4
 M/pujH2bO8zJTQZYugDKcDNM9Majsz/1Pue/JATIo37R+QVVMQw9L0xfV
 76oFRXq6NrE7vo5zo5KSYJxrV7b1hgBU28j2h9ixDZSTRmdLtr6Qcxk6R A==;
X-CSE-ConnectionGUID: rmN4pLFrSsqitH+Xh+Fzwg==
X-CSE-MsgGUID: HVZBZXsaRKOM12FDtApeJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="36718744"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="36718744"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 20:13:18 -0800
X-CSE-ConnectionGUID: qAF/o8WzRdKBQM3XwcB4vw==
X-CSE-MsgGUID: E27fzBYmQ8W1mjc6WomWpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="105751742"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa006.jf.intel.com with ESMTP; 16 Jan 2025 20:13:16 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, ankit.k.nautiyal@intel.com,
 dnyaneshwar.bhadane@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/hdcp: Use correct function to check if encoder is
 HDMI
Date: Fri, 17 Jan 2025 09:42:48 +0530
Message-Id: <20250117041247.1084381-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

Use intel_encoder_is_hdmi function which was recently introduced to
see if encoder is HDMI or not.

--v2
-Add Fixes tag [Jani]

Fixes: 6a3691ca4799 ("drm/i915/hdcp: Disable HDCP Line Rekeying for HDCP2.2 on HDMI")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 7464b44c8bb3..91d5629cd9f9 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -41,7 +41,7 @@ intel_hdcp_adjust_hdcp_line_rekeying(struct intel_encoder *encoder,
 	u32 rekey_bit = 0;
 
 	/* Here we assume HDMI is in TMDS mode of operation */
-	if (encoder->type != INTEL_OUTPUT_HDMI)
+	if (!intel_encoder_is_hdmi(encoder))
 		return;
 
 	if (DISPLAY_VER(display) >= 30) {
-- 
2.34.1

