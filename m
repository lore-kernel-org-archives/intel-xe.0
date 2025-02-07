Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E4BC021A1
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 22:22:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D529B10EBC1;
	Fri,  7 Feb 2025 22:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1rdDSM1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1C810EBB9
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 22:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738966802; x=1770502802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cTvX1+r18hj/45QyT5Q3cscQuBZupF1VM/H70kIM9XM=;
 b=P1rdDSM1jfmKM+pZGzbEUj3aPyGFs93islIYrX8fdx/bl8F0jOXWjJci
 vAEeuBlQH66bDhL6+nAlsYa0OJKg4tGn5/hc7IdkUFxW8Qb74uB5mx2z4
 Cx2zoLb2Rhj807DbZJcKOrgSS+vyDekCmQlKye8DZT0iOSzw2i1KtoDEx
 SRBPv39jsTo9ejpNpX3O6Mcn0u64NOaGPxbCARqkr4rrVns2PQTjfWKoC
 JlUxaUiT0inUh/U3znacxJnqdXjV8uXDRelOUyJm1aPSsANU+Ic6I+Mz6
 vVHSctH042zRgZlb8zkT/8ZqJSkTIx1UKkdNCglHPyLtMnc4HqkUolpBV w==;
X-CSE-ConnectionGUID: PoNzJLvUSsqzQ/bQREYFgw==
X-CSE-MsgGUID: r+V+I4ilR9G6zdqOKt71Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51050683"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51050683"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:20:01 -0800
X-CSE-ConnectionGUID: 5JLKICwQQCCRPICCKdyUMg==
X-CSE-MsgGUID: /9Xa2iXiRXe6y6xkR2bO0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="112158406"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 14:20:01 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 03/13] drm/xe: Fix xe_tile_init_noalloc() error propagation
Date: Fri,  7 Feb 2025 14:19:35 -0800
Message-ID: <20250207221945.2878241-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207221945.2878241-1-lucas.demarchi@intel.com>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
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

Propagate the error to the caller so initialization properly stops if
sysfs creation fails.

Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_tile.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 2825553b568f7..377438ea6b838 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -172,9 +172,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 
 	xe_wa_apply_tile_workarounds(tile);
 
-	err = xe_tile_sysfs_init(tile);
-
-	return 0;
+	return xe_tile_sysfs_init(tile);
 }
 
 int xe_tile_init(struct xe_tile *tile)
-- 
2.48.1

