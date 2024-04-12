Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ACAC04FF8
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 15:03:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D985310F6B8;
	Fri, 12 Apr 2024 15:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOQqu9Cb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042E310EC3F
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 15:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712934210; x=1744470210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RHrYO8b1knYwGySjC0luyksF19Gqze1idPqnomKSrNs=;
 b=WOQqu9Cb+w8IDsbLrAir1fg3aabBXd6B/dnMvVvVDMTHPyOhRnrF/cGe
 IZzeIPDCrtJozFdUOAKpJk54a3la6lwWs1vOd9zFwK1nOePHr2bMjc5eC
 +pp2stOu0x9AVwZXrghm+5+fVUNsbCYLJbZ8Ys0fSwP3vq/BAm3+E+LvT
 nxVszzvotA9fCsXiWes0so8LoiSD4LeJFNLZs9OtIuC04V6ruimV1l/bN
 RWKhwmwGyktZv+nmvDM4MEINSKChBAjNKHeK4L8S5AypDV5a3k7RLDNsn
 yCYF696YmGZT+UXof+9KLf76w6P6Pm8lJ1tjwHn8tmVvK2m6a7+d3xNRJ w==;
X-CSE-ConnectionGUID: pWEJ4eDWQImSvSHwHijOzw==
X-CSE-MsgGUID: cx4rRoT1Q5aga26PphDIdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8947085"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8947085"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 08:03:30 -0700
X-CSE-ConnectionGUID: NGnccnL8T3Kj72YAwbOgJA==
X-CSE-MsgGUID: 1L+pyuQURWGgNBHNp1WT8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21821752"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.44])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 08:03:29 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 2/2] drm/xe/stolen: ignore first page for FBC
Date: Fri, 12 Apr 2024 16:03:03 +0100
Message-ID: <20240412150301.273344-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412150301.273344-3-matthew.auld@intel.com>
References: <20240412150301.273344-3-matthew.auld@intel.com>
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

We have observed underruns on some platforms if the CFB offset is within
the first page of stolen. Just like i915 skip the first page.

v2 (Maarten)
  - Also align the start.

BSpec: 50214
Reported-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
index b4ccc4231e7d..cb6c7598824b 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
@@ -19,8 +19,13 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
 	int err;
 	u32 flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
 
-	if (align)
+	if (start < SZ_4K)
+		start = SZ_4K;
+
+	if (align) {
 		size = ALIGN(size, align);
+		start = ALIGN(start, align);
+	}
 
 	bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
 				       NULL, size, start, end,
-- 
2.44.0

