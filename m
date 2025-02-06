Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24937C0219B
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 23:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF19210E9BC;
	Thu,  6 Feb 2025 23:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OeQtRoDb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4784510E9B5
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 23:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738884236; x=1770420236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cTvX1+r18hj/45QyT5Q3cscQuBZupF1VM/H70kIM9XM=;
 b=OeQtRoDbTy4AVznbjMB86hBRJfW8/zvYZyNS6WBAKBUQHH8EGa9rmiEv
 tPom+1qvk2bB5VjYd8mh6CNih1XmZmiVATXQbvCrOMd5pf3/p7zhIXDvm
 9RvOLhVVk/lwMNrlwM6A9cNQ9qMVZv+2vDKWvrG9Sonvr9q42m7GZ4JGv
 d42OB8te3YxBRXIS1v1QlKpqBNCpBrnF9NRB3f9opUvIQ//tWMrKHUOWr
 F97FakPIsE+Y4OSJlLrILHF0IS696QmsSLw9QEzAZL98ojRzbLpoSm1wF
 3xphPRqkKC1UmNLJsc2EC0aDNmv0wHUzy0URryTy2cAcubiv7iXoeQXjC g==;
X-CSE-ConnectionGUID: FeUCh0y9RgWQbHiEuBaVmw==
X-CSE-MsgGUID: wswGhgR8T8Oe8FvLoKCHZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61993720"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="61993720"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 15:23:55 -0800
X-CSE-ConnectionGUID: C29ywHCHQa6+EmHl4ULN4w==
X-CSE-MsgGUID: HyMrIr3nS5qd5ybG8xVKKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134594789"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 15:23:54 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 03/14] drm/xe: Fix xe_tile_init_noalloc() error propagation
Date: Thu,  6 Feb 2025 15:23:21 -0800
Message-ID: <20250206232333.2660325-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206232333.2660325-1-lucas.demarchi@intel.com>
References: <20250206232333.2660325-1-lucas.demarchi@intel.com>
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

