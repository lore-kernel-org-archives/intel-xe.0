Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D852C02183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 18:50:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1B310E20E;
	Thu, 16 Jan 2025 18:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HUZLw0D6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCEA10E1E5
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 18:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737053421; x=1768589421;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2ST4bumAFuZ7iVGoqPF7QAwSJiqTH6A7nU0QICgC/2U=;
 b=HUZLw0D6vSyJMFnsWrzv23wqn8PLZnf5AlmHBsfn2FEOQsgHirM+eGkF
 1S0s7H34O90KOXpaOsBTuYnor28Ac3bUiWtO1gGxLes8ba1bXt/irqUu4
 giJtMR0SF/jUxhuwHyQdugFSS4aporKtJJhHoQrEQAawoZbpqGf5Ht3Z+
 5VAv0IsKDLJFs2rbvA3KOD+SPeux3IlQSEeLebd6+e5q0xXF7DDti629w
 7zEroEowCut/WcEttuEK8XZWcafIqQ87AAMFTaPECVp6v9+3gLFD0W8Az
 faTwtYa5jY8IZYTjx6FBwvtb5WB4XCj4hNClt8OmPy+3o0PuKdjv2rM2t g==;
X-CSE-ConnectionGUID: wOI8Mt2sTXuRp3Odmnt8Tg==
X-CSE-MsgGUID: hk0vHGU3Q9qVM47g4uV1Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="54874371"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="54874371"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 10:50:20 -0800
X-CSE-ConnectionGUID: 0sTJKou8T9WwaD9ldQI2TQ==
X-CSE-MsgGUID: CtXVPUeOTrCoO5iMjZJqOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106050518"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa007.jf.intel.com with ESMTP; 16 Jan 2025 10:50:20 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH] drm/xe/ptl: Apply Wa_13011645652
Date: Thu, 16 Jan 2025 10:46:59 -0800
Message-Id: <20250116184659.384874-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Extend Wa_13011645652 to PTL. This WA requires PTL GuC version
70.37.1. Update to GuC version is posted in this series-
https://patchwork.freedesktop.org/series/143630/

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 40438c3d9b72..228436532282 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -28,6 +28,7 @@
 16022287689	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
 13011645652	GRAPHICS_VERSION(2004)
+		GRAPHICS_VERSION(3001)
 14022293748	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
 22019794406	GRAPHICS_VERSION(2001)
-- 
2.38.1

