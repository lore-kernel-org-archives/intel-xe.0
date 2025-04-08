Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35685C3600C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 13:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1454710E686;
	Tue,  8 Apr 2025 13:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OuN8n6Uu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742AA10E686
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Apr 2025 13:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744117634; x=1775653634;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MYJ0ImCgGFIxA7Zf1MjVx6TsQpr9Ph0m0QlwyvNKRK4=;
 b=OuN8n6Uu6SEULmDLo2Ui2V2c0WuKlbGZUxXRAmjOle81FSlOGKS0H5wY
 ACJfUSuDkAWpystvpRCzJuonqF4oHJfYX7FRwn6sojkqzzNC7yDAhj5bX
 7hRm4DSbqjrFgX/mcntBllwKp3N7xhlfzgMTnoV6bzzTd0wOx5LmAxo0w
 gFjAZenjZUFo4vEzk0wBfv+A/dA3mrRr3qH5d2QwGRcF9aN+R/vynYZy5
 r+S5J6nChcwZ9caBRxSbX9oshRe7HGVRe4uVXIYW8Pvtus0psGfKwWDSu
 8NkGIaB7qgFcW9KrgtG9orD7yM6dPc9hwJrkfxZllnTpwt5oR3+IFIm+i g==;
X-CSE-ConnectionGUID: cs+Cy/EGRgSIcdIV4+Dx+g==
X-CSE-MsgGUID: ZvOs1GUgSoql4CgWCCVEsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="70925860"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="70925860"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 06:07:14 -0700
X-CSE-ConnectionGUID: HIhxakhwS32C1GvRNXdS9Q==
X-CSE-MsgGUID: fryqlAEAQdSvvWxgXlrnDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128597223"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 06:07:14 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: Extend WA 14018094691 to BMG
Date: Tue,  8 Apr 2025 06:07:02 -0700
Message-ID: <20250408130702.679403-1-daniele.ceraolospurio@intel.com>
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

This WA is applicable to BMG as well.

Note that this is a GSC WA and we don't load the GSC on BMG, so
extending the WA to BMG won't do anything right now. However, it helps
future-proof the driver so that if we ever turn the GSC on we won't have
to remember to extend this WA.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 9b9e176992a8..956beafe6c86 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -21,7 +21,7 @@
 		GRAPHICS_VERSION_RANGE(1270, 1274)
 		MEDIA_VERSION(1300)
 		PLATFORM(DG2)
-14018094691	GRAPHICS_VERSION(2004)
+14018094691	GRAPHICS_VERSION_RANGE(2001, 2004)
 14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
 18024947630	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
-- 
2.43.0

