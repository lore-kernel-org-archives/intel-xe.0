Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76404C5AD49
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 12:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1709010E12B;
	Thu, 29 May 2025 12:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hN2uY2ZG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC5D10E12B
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 12:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748520340; x=1780056340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YAEepf3PELPrhqWuQa/ZVqN7bXNhaUkZ2Q35PPyW5j8=;
 b=hN2uY2ZGcOhiycF4tx/C6DOzansQMfTP11LbFg/lxpXCbzsfbaITd3Sl
 zu1vVxvQD11dJ0lkFMZHksYoYFLDhEof4ILzI+E3+OAfOxEiYa2SazdU9
 SdmGDOlbiH7/MWx3c62n4uUux9jSyDbmoxDtsW3WkJrfNiq2j2uOv4C5K
 NjDipPsy8MRYBdMwpwMuJwYew+3WQtTpyECsmX8/gNnMjljzhuKRRwZYT
 sELy69pP9elXX3h49wQFG0g0B2B3GIx6lSzP35v6qSc8gVUk+Em/DRTDT
 gPukGAZ9a6/PULifjfh4NJKGAzRXDYlWNUFyjoWpspHYx+2UdxJe395/h w==;
X-CSE-ConnectionGUID: kK5HlO1rQxCZRanlb9dm4w==
X-CSE-MsgGUID: h7odwn03TZO76hI3fpH+7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50461480"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="50461480"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 05:05:40 -0700
X-CSE-ConnectionGUID: FKm8L7+4TWqMj2Q+vb7fYA==
X-CSE-MsgGUID: /Xlc4iu7TMOvb6GNO8NJJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="148585593"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa004.jf.intel.com with ESMTP; 29 May 2025 05:05:39 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 2/3] drm/xe/xe2_hpg: Add PCI IDs for xe2_hpg
Date: Thu, 29 May 2025 17:35:33 +0530
Message-Id: <20250529120534.531237-3-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529120534.531237-1-dnyaneshwar.bhadane@intel.com>
References: <20250529120534.531237-1-dnyaneshwar.bhadane@intel.com>
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

From: Shekhar Chauhan <shekhar.chauhan@intel.com>

As per updated Bspec, Sync PCI IDs for BMG.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 include/drm/intel/pciids.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index a7ce9523c50d..129c3172aa5f 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -852,8 +852,11 @@
 	MACRO__(0xE210, ## __VA_ARGS__), \
 	MACRO__(0xE211, ## __VA_ARGS__), \
 	MACRO__(0xE212, ## __VA_ARGS__), \
-	MACRO__(0xE215, ## __VA_ARGS__), \
-	MACRO__(0xE216, ## __VA_ARGS__)
+	MACRO__(0xE216, ## __VA_ARGS__), \
+	MACRO__(0xE220, ## __VA_ARGS__), \
+	MACRO__(0xE221, ## __VA_ARGS__), \
+	MACRO__(0xE222, ## __VA_ARGS__), \
+	MACRO__(0xE223, ## __VA_ARGS__)
 
 /* PTL */
 #define INTEL_PTL_IDS(MACRO__, ...) \
-- 
2.34.1

