Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F0EC79F9D
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 15:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C5E10E425;
	Mon,  5 Jan 2026 15:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FI9yQJ9B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D6C10E425
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 15:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767625248; x=1799161248;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ponmUfSRRtCkdXUM7RAKssdaCretuUpu2MmdThYM7s8=;
 b=FI9yQJ9B2KMogWzl5I9vTudl/FN07jKcLMprniPum8EPwk7+bz5O1Deu
 Noz5QsO6n4KCr59c6HAYJ5wJGQ0XeMUWdQUkHpMV/GFSGdTj2AA2OOJ7o
 vz6i3mFMaAeMc/dnI04jydbJCe89SvHPobSB84H1C3TGB5wANh5jKdEi8
 cfxrjR34B1uF9MTp6fJye3EN5BYJAsrtzLk0Zk4nDRDseR8c91Gx8R1VN
 uE8S0kdKqzJCRNu+Y4lJYMBSTUXzzlLDXxTKIFxXp8k4UljCWBSuZi8mc
 HrdIcCC9h0U1AbwicVZo6FV4LyoiW/el2xoQjJ6CTVUDMnygZhydRXUwD Q==;
X-CSE-ConnectionGUID: uEHw/9pwQs+mgf3QhNlnGw==
X-CSE-MsgGUID: hcax8+kBQoar4BEHCbdMeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="79294458"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="79294458"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 07:00:48 -0800
X-CSE-ConnectionGUID: l82xN64cQE+DTi3e4rcdUA==
X-CSE-MsgGUID: qGarIV9oSRCDpJMTa9u0zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="201645874"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO uxy.intel.com)
 ([10.245.244.159])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 07:00:47 -0800
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: [PATCH] drm/xe: put COMMON_SLICE_CHICKEN3 on the allowlist for UMD
Date: Mon,  5 Jan 2026 17:02:22 +0200
Message-ID: <20260105150222.462293-1-lionel.g.landwerlin@intel.com>
X-Mailer: git-send-email 2.43.0
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

Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access")

A recommended tuning setting for both gen12 and Xe_HP platforms
requires that we grant userspace r/w access to the
COMMON_SLICE_CHICKEN3 register.

Bspec: 73993, 73994, 31870, 68331
Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 1391cb6ec9c62..4dcbc42574bf5 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -45,6 +45,11 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(WHITELIST(COMMON_SLICE_CHICKEN1, 0))
 	},
+	{ XE_RTP_NAME("allow_common_slice_chicken3"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
+                       ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(WHITELIST(COMMON_SLICE_CHICKEN3, 0))
+	},
 	{ XE_RTP_NAME("1806527549"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(WHITELIST(HIZ_CHICKEN, 0))
-- 
2.43.0

