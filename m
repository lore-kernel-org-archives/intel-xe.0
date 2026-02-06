Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58139EE6B6C
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 22:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175FC10E95C;
	Fri,  6 Feb 2026 22:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ePFi5fXd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E896310E95A
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 22:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770418599; x=1801954599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WLXtzI/MEtLrp374CY2A3QQO0jicUj5eA0WIym0iucA=;
 b=ePFi5fXdge0ky0NaWsc6A1fpB6f5aNavqsuddDzGI1V/9b2YTUDlcpOq
 oTRiKzsDTXgFi005nKrr0Gziah6kfRQA5wd5QR1Q87MzlPj1RO4xgv7TW
 u7/BVcXmc04qcRPMKkyARA+ehGeiyEIVToXairhzeX2/c0Xrlpt5NkCxx
 Nt/JWyHf6bs5aN8vH6XHOm+rmIro4ihAeH+FaT4IhXmx7Ofv5nekTGx8M
 d77XUJJClJQusCsI7Q2ULyQrCgf+e/qJl+Z9lqV1YOnFTNRhwMhIWU2my
 1nKCiCk31yUkAXlQpjB8vjSq75eNBHtbwmGV+XilxVJsiN5Kf1b0BdFcl Q==;
X-CSE-ConnectionGUID: kZqQwZjSQdW63JqpcATcQA==
X-CSE-MsgGUID: 3huVH3gGRMeQPn+a8JuPfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71351666"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="71351666"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 14:56:39 -0800
X-CSE-ConnectionGUID: xQYcTBWCTva6iNTHDXuq5A==
X-CSE-MsgGUID: 5EoOdCfVRfKIpF0Efhcglg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; d="scan'208";a="210762223"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 14:56:39 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v3 3/3] Revert "drm/xe/xe3p_xpc: Enable Indirect Ring State
 for xe3p_xpc"
Date: Fri,  6 Feb 2026 14:55:24 -0800
Message-ID: <20260206225610.3232909-8-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260206225610.3232909-5-julia.filipchuk@intel.com>
References: <20260206225610.3232909-5-julia.filipchuk@intel.com>
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

With indirect ring state now enabled for all XE2+ platforms this setting
is already set by XE2_GFX_FEATURES macro.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2b8d2a2e81d7..7dd50cabbb03 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -117,7 +117,6 @@ static const struct xe_graphics_desc graphics_xe2 = {
 
 static const struct xe_graphics_desc graphics_xe3p_xpc = {
 	XE2_GFX_FEATURES,
-	.has_indirect_ring_state = 1,
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
-- 
2.51.0

