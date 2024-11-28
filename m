Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67365D66BAF
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 06:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1DE10E254;
	Thu, 28 Nov 2024 06:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kxdI0GDJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F2310E23A;
 Thu, 28 Nov 2024 06:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732775675; x=1764311675;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=18uyQcGAZj65zJKdIW/25jvIAFBzHazy87mw38lCaoA=;
 b=kxdI0GDJ2hqPijpoqro5T6onHuOuaMb1QPH0eLgBoh77vWbuOqFMYmOy
 7K6nMNGAmllSxESRSZouIkFM4e03G/rmAoadKistM6DID8zKi42xmJhCc
 SLWxt4jY5PT2gRnmFQCKMAert0YPGUyZBPE5JlSAjWh+11xBlHsFEvU0h
 NfIa9OPwXbDaBrY9HIyFBsaN4EqAIhgIhsNJchSTUXshWWQLO7KGhM4Gr
 Yb6oO7WTu2gx7LBLBQVoG+r59J2OdWVG8KySgmSP8f2pC4ZhcDQ0OI3T6
 12RNxaOHCC/SSidwyCXojqg7TRVATvaxoVREXydFv1KvVHHrFVSipcBGc g==;
X-CSE-ConnectionGUID: EbUG/JxFSkObC/JNrIim5A==
X-CSE-MsgGUID: gguUIoYyRW65v2RhiSDV/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33143982"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; d="scan'208";a="33143982"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 22:34:35 -0800
X-CSE-ConnectionGUID: /fYz7xOIRaasIUWKzuAgGw==
X-CSE-MsgGUID: wLruRN21SEmibBlODpcJig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; d="scan'208";a="96247620"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa003.fm.intel.com with ESMTP; 27 Nov 2024 22:34:33 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/hdcp: Change log level for HDMI HDCP LIC check
Date: Thu, 28 Nov 2024 12:04:27 +0530
Message-Id: <20241128063427.1792509-1-suraj.kandpal@intel.com>
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

We don't need to shout out loud if there is a Link Integrity
Failure. This does not mean HDCP has failed, it is expected and
taken into account in the HDCP Spec. The real failure happens when
we are not able to reauthenticate and get HDCP running again for
which we already have the right logging.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 23c270a8c4aa..fa679b5d5510 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1607,7 +1607,7 @@ bool intel_hdmi_hdcp_check_link(struct intel_digital_port *dig_port,
 		if (intel_hdmi_hdcp_check_link_once(dig_port, connector))
 			return true;
 
-	drm_err(display->drm, "Link check failed\n");
+	drm_dbg_kms(display->drm, "Link check failed\n");
 	return false;
 }
 
-- 
2.34.1

