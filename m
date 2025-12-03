Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4564D116F3
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 03:58:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C36010E0AD;
	Wed,  3 Dec 2025 03:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i77hSmJB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C222210E0AD
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 03:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764734290; x=1796270290;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2cCZE/y6+X+B/ssJDQNQpJKusO6RwMx6YSxqSiQDizA=;
 b=i77hSmJBTC4Ynkvk4zNGkkzuGkX4VaKc6cqywJB4OCDyA7g+MbR39AmA
 LjfqkEJbxVGXhs+QvlosbNYpkW4YmRNtNUxD5CbWzLRYpo9Aq9z7Zm3MW
 MhPmnDfYltyn3MiFmwWw+bjeI7zbMQY7onjXdtoKLxrMt/UXlanip/GcM
 ZClsov8vHem4c49GWloonCi4N7BPbulUHDqpbgCM1kdbtB42tDkvKtcoy
 2icGbxmZAdY4hkAf1sPUL17X4Cm1JZ4gkEcCRdCIS0oJBAGP3vYlQxxGV
 XgffEouf0UacDA04rvPDewGqRV8J1HgTqWacwXXjrFtxoGqyf9orD9vl6 w==;
X-CSE-ConnectionGUID: Z2GVPB/HSZ6GlcluHL32rA==
X-CSE-MsgGUID: mljWbkOeSy62MtBAZvCKqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="89372987"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="89372987"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 19:58:09 -0800
X-CSE-ConnectionGUID: 8mJWrZVMQJux9b1P7BEmaA==
X-CSE-MsgGUID: Wm0IC6e/RIqqLkLMdfbPvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="199508935"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 19:58:09 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/xe3p_xpc: Enable Indirect Ring State for xe3p_xpc
Date: Tue,  2 Dec 2025 19:58:01 -0800
Message-ID: <20251203035800.1086089-2-niranjana.vishwanathapura@intel.com>
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

The xe3p_xpc platform supports Indirect Ring State and
it is required for the upcoming multi-queue feature.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 75e3588242c7..fbee83dc347a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -108,6 +108,7 @@ static const struct xe_graphics_desc graphics_xe2 = {
 
 static const struct xe_graphics_desc graphics_xe3p_xpc = {
 	XE2_GFX_FEATURES,
+	.has_indirect_ring_state = 1,
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
-- 
2.43.0

