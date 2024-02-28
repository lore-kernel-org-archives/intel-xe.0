Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A75C54E41
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 09:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD5110E87A;
	Wed, 28 Feb 2024 09:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/bYTeAV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8DA10E8A8
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709111424; x=1740647424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tIbSucuXif3rb7k/k3BMpwYLYWYmHNfkVzdz35E91VU=;
 b=n/bYTeAV3xUG5Pk6JrmN9HWUOiE9jyfV5lsaLz02hcn9shzgbx56ohW+
 4gfx5ZJ4KWdl0qpiwlIjti1gfRfUurrX6qV44Kch793o0E8pY/eMgnzSD
 DVC+ownaIUAftvwF+M7lrZxkB1wcpXJUDS1QVkhT/CmquLg62B1NoZ8qq
 iWPqE5ysOuD6leNX/7FcaNM1NoQwhkfFcVmgECup+6GIriiIBmqR7Mbex
 H1bYWkdoUQixrQLz/avDX1JBqXq/2WsfUkkVm86psFIZmvZ8S7Dhhrv62
 B64HB/Z5fYAvHyofa4J9dK1PdHJvIhaDIs9SsmSSD2/LchmGbjyEfbLpM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3618937"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3618937"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 01:10:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7931391"
Received: from pltuser2-ms-7d25.iind.intel.com ([10.190.239.58])
 by orviesa008.jf.intel.com with ESMTP; 28 Feb 2024 01:10:23 -0800
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: haridhar.kalvala@intel.com,
	matthew.d.roper@intel.com
Subject: [PATCH 3/3] drm/xe/arl: Add Arrow Lake H support
Date: Wed, 28 Feb 2024 14:40:04 +0530
Message-Id: <20240228091004.3271151-4-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228091004.3271151-1-dnyaneshwar.bhadane@intel.com>
References: <20240228091004.3271151-1-dnyaneshwar.bhadane@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

ARL-H uses the same media and display IP as MTL, and a version 12.74
graphics IP (referred to as Xe_LPG+). From a driver point of view, we
should be able to just treat the whole platform as MTL and rely on
GRAPHICS_VERx100 checks to handle any spots where ARL's Xe_LPG+ needs
different handling from MTL's Xe_LPG (i.e., workarounds).

Bspec: 55420
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 include/drm/xe_pciids.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index de1a344737bc9..d5aeeee6b9d00 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -179,7 +179,10 @@
 	MACRO__(0x7D45, ## __VA_ARGS__),	\
 	MACRO__(0x7D55, ## __VA_ARGS__),	\
 	MACRO__(0x7D60, ## __VA_ARGS__),	\
+	MACRO__(0x7D41, ## __VA_ARGS__),	\
+	MACRO__(0x7D51, ## __VA_ARGS__),	\
 	MACRO__(0x7D67, ## __VA_ARGS__),	\
+	MACRO__(0x7DD1, ## __VA_ARGS__),	\
 	MACRO__(0x7DD5, ## __VA_ARGS__)
 
 #define XE_LNL_IDS(MACRO__, ...) \
-- 
2.34.1

