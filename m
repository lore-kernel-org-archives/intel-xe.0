Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F878C36010
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 00:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A77F10E79E;
	Wed,  9 Apr 2025 00:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1JMv3B5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA6510E79E
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Apr 2025 00:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744157450; x=1775693450;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LMhRNG1tgeObwW2zc5Fgx2K0361n4i9Xo3JysuxbUpA=;
 b=D1JMv3B5omVdMj7rpE15EpFrW1Rm4SsjrI/FFKKlpdoJzJAv7h9GQMKA
 0kL04y/i/VRFtjwPmPlZ5vzMsj67clJva85jajeHspDg3JTjJt+J92Afx
 iFjGPNwdv2jG0nrNvrhBX+TGhJhMJSbRzDPxDoiL6I9UAZ2hEwmwu6pXz
 uUdv/z1AxS9iMDTRz/BSltqN6EEElLy6tgEPdjfqfqYo/f0xWVjAjTAHN
 XAFDaG9p7kHu8n+OJXrfYDkzG/ApvBIc/0EEtE0G/xnbCN6U/I940ggkC
 O8N4v8qUFpy4P4nnXCH2dmoVp6M3hb9UyFmnzI9RgASYYDBejZwM7KYsk A==;
X-CSE-ConnectionGUID: KyQhpKmZS66kS3TR2QmRBg==
X-CSE-MsgGUID: MOUEGd8ARq6L4hhfft+Phg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56983940"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="56983940"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 17:10:50 -0700
X-CSE-ConnectionGUID: 2aqAy3WoQyKyfa3WHy/9mA==
X-CSE-MsgGUID: ccD1vbUqQXyKWVG3oUgPvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="129374321"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa008.jf.intel.com with ESMTP; 08 Apr 2025 17:10:50 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/ptl: Extend Wa_13011645652
Date: Tue,  8 Apr 2025 17:10:13 -0700
Message-Id: <20250409001013.382830-1-vinay.belgaumkar@intel.com>
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

Wa_13011645652 is applicable to PTL A-step as well.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 9b9e176992a8..48491f8af746 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -29,7 +29,7 @@
 16022287689	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
 13011645652	GRAPHICS_VERSION(2004)
-		GRAPHICS_VERSION(3001)
+		GRAPHICS_VERSION_RANGE(3000, 3001)
 14022293748	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
 		GRAPHICS_VERSION_RANGE(3000, 3001)
-- 
2.38.1

