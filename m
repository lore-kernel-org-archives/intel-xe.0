Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D9CD1BDE0
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 21:10:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C6410E80B;
	Wed,  3 Dec 2025 21:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bt9o9hy/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5569F10E80B
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 21:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764796230; x=1796332230;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g+iYQFj2c6quthhj5Porb+iBmVI/ctAAUyltbNzqhmk=;
 b=Bt9o9hy/IcXEH+sw8SckUVv2LsoeZGjV9QcgLd1QVc7qd9MWZQsD9ANP
 tsDV7vpg1wFW3lxYkYKtXA2MrrBCm0VomQjISVpFGrQn1M0phU8mjXEFB
 TecOa9ZJWq4ZEAIYoGdFmJV9rZXYHNEW4WR/m19v3mprBE91HSYdonMrB
 WHYvtNtYeFGRrG5NOraVhV6+fpGg5L5vbTNk9qDg2X89Nwiks46pp8gFX
 STsvmLaojVyyklvX41U4r5JNCewMK4mUtKTpdIQJ+YXSviUdAWvZPoTzD
 u3nKOgLgWUxhZGMG8RYYJ9jylbtcKmenGGWFZtSDJ7JRBRIPruyLYKZ9J g==;
X-CSE-ConnectionGUID: 7lAwnBouSJacPyDBRsn8Bw==
X-CSE-MsgGUID: BRwP7eM5SxGPpm2hm0BMvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="65995189"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="65995189"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 13:10:30 -0800
X-CSE-ConnectionGUID: FO1/o6U8Tj6G0ylaQ+5asQ==
X-CSE-MsgGUID: VB38ReoMSLS9sq3LoRyUWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="194458812"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 13:10:30 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/xe3p_xpc: Enable Indirect Ring State for xe3p_xpc
Date: Wed,  3 Dec 2025 13:10:25 -0800
Message-ID: <20251203211024.1097968-2-niranjana.vishwanathapura@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 8dd0ea9d1d56..c8188a5b0f76 100644
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

