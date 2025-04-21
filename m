Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B94AC369AB
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 22:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26AE10E059;
	Mon, 21 Apr 2025 22:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g94ZEp2V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0AC10E059
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 22:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745273472; x=1776809472;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c50qmaQy5buxS03nSg2Z+I9HnydPjw9AZtKxTJ8vsYw=;
 b=g94ZEp2Vy4TvliJVoHmzZ7qMmgdvIwMmYBhxnRntuHbYn/nUFX3DzQGQ
 +YqwtHl3Ag8+09Rx5qsQHaYMOfCjWn1sc5NQDROTGrD+0WjvIO1hRSmTv
 qPgL5oNLV2EOLoleic0aMqZaV/wNKN8cK6S52FPx5DIlWHHwelPX6vMIC
 NWUPsJi0u/ZUhMyJ3QIIy9H6CgFOLE0rLGyTLmd6j28jma529Dl+uZdcU
 G5xN3S9WjIu6PCHe99ugHiN5jsRZWZFD88jTT+rm+ul4Uehbs69cqHLuu
 UU83CGltKrs8VS5QGBu1lFumMmLgPG+ahJY8mt5DBDbxJikbEA3mHT3k1 A==;
X-CSE-ConnectionGUID: AEHcAXRTQ8eROh/oakB6SA==
X-CSE-MsgGUID: 0T6anuRrRYWnwuJDuCm4eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="57463086"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; d="scan'208";a="57463086"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 15:11:10 -0700
X-CSE-ConnectionGUID: f+UJHg7aQn2/KcySuCUj0g==
X-CSE-MsgGUID: FBUfKbNPRDmYXLvFFURRBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; d="scan'208";a="132143961"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa008.fm.intel.com with ESMTP; 21 Apr 2025 15:11:10 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/ptl: Extend GuC Wa_13011645652
Date: Mon, 21 Apr 2025 15:10:31 -0700
Message-Id: <20250421221031.1781629-1-vinay.belgaumkar@intel.com>
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

Apply Wa_13011645652 to all PTL GT steppings.

Fixes: dddc53806dd2 ("drm/xe/ptl: Apply Wa_13011645652")
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 9efc5accd43d..de8958a46ff8 100644
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

