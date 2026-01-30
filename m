Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEE5E6BF39
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 21:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFDF10E956;
	Fri, 30 Jan 2026 21:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QzwjtUXN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0BB10E956
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 21:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769806901; x=1801342901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IuC7XURrzYB3d5znHzzBCNJSkegynUsozaC9QbLVTmM=;
 b=QzwjtUXN504vTDr90PobMSmJIhLmHQhstCgf8OVYZA7mzqazriC1Lwuq
 VfsPOPu3SGdvB/1Xhu0WThnHkQKGR48MOlKSMa5gM6R4FBikb2SxCbzhn
 y86X1J9M56jh8le2+od3rzhqxQLeIxVIaq3opBU2AXBaujfSBLpkxZZAQ
 oZuOROK4GNYMoTNNvHx7R0ugZqQdi4wGjr+8blAJZyDfnxnAwBpJPc6Gk
 a4bRaCjSygN8fLJVCqEWvLukjYILaww3gXz+SvoHmf648bsZMtgztqmQm
 2evLWMXIX9kUjYsP1Cs4dRBG4Vd33JScPDsQ7lHbvq8WSX+yAm/zRoTdt Q==;
X-CSE-ConnectionGUID: d//YAmX1QlSbp4LX94G8dQ==
X-CSE-MsgGUID: u+vJKkHYTuqotfoR2lyxiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71041377"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="71041377"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 13:01:41 -0800
X-CSE-ConnectionGUID: VbJvVOw3T4WJVQa5ueiIng==
X-CSE-MsgGUID: QxGZtHfXRWu3PRv29DiRiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="208064958"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 13:01:41 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 2/3] Revert "drm/xe/xe3p_xpc: Enable Indirect Ring State
 for xe3p_xpc"
Date: Fri, 30 Jan 2026 12:50:34 -0800
Message-ID: <20260130210120.2682085-7-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130210120.2682085-5-julia.filipchuk@intel.com>
References: <20260130210120.2682085-5-julia.filipchuk@intel.com>
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

This reverts commit 81e77c028848b7131d7653dd443a4049334a920b.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b5e8935fff1d..779546ec8836 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -108,7 +108,6 @@ static const struct xe_graphics_desc graphics_xe2 = {
 
 static const struct xe_graphics_desc graphics_xe3p_xpc = {
 	XE2_GFX_FEATURES,
-	.has_indirect_ring_state = 1,
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
-- 
2.51.0

