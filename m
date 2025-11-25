Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C433CFD36C
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 01:42:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5922310E339;
	Tue, 25 Nov 2025 01:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EKHSPzum";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526B610E339
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 01:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764034923; x=1795570923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FPUGx0QVH30RQGiXL7e8psTTu9qTSSmLEw9eKPoHJ64=;
 b=EKHSPzumVaqCbAgMF62PmL22+iy9fxpAuaPQpXnkrq/YXO/1PhES5t8P
 fTMEe0b+SF2mqNr0h0rwMZoisGC6kOuL41ITR+xiYbye2DCW4nzTtZm1C
 e4TcJLI9vgahLnXqAsPb3I5MPidKv8DmHgQ/KEcYdHQnAAhCfhoh/p5Fm
 BEwjD3i/9nJenW8deSBL4xbdOl1FrJBvEza1Gjq7V9qpSXtOXMgjqQUBL
 4vKIS0BumUcgyi8Odb/HfwEguGRlQQ2iDfd9qZ4+VD5c66REwX1dgf4Wn
 TqnfMwkcL3V2Z6E/0WRypCGxMl3fcjJsgHw5LcrI1X6SCgGLZNx32uR3j A==;
X-CSE-ConnectionGUID: P7vuItM2SkyQe0UCNAc8eg==
X-CSE-MsgGUID: wXVYlVigQv+N8XONNwwHMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="83437196"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="83437196"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 17:42:03 -0800
X-CSE-ConnectionGUID: FN10bmitTYCDIlkOb0OIuQ==
X-CSE-MsgGUID: ZQUl4f/JQbeywSSgO41c8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="196960930"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 17:42:02 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 1/8] Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware
 for CRI"
Date: Mon, 24 Nov 2025 17:41:36 -0800
Message-ID: <20251125014134.2075988-11-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125014134.2075988-10-julia.filipchuk@intel.com>
References: <20251125014134.2075988-10-julia.filipchuk@intel.com>
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

This reverts commit da39e07e72ce7927980f9eada791aa74cd2c9717.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index b4cd6226ad31..e589c7e38f12 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 49, 4))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 49, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 49, 4))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 49, 4))	\
-- 
2.51.0

