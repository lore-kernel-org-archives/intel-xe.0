Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7724CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 11:14:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986B410E7A9;
	Wed, 27 May 2026 11:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1c6RI1s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160B610E786
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 11:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779880434; x=1811416434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eUsyElcVWDskUDaf4ujVaffMNVBWr5l9DjBkPbkLJYM=;
 b=N1c6RI1sqE5eUGsEGcxllkog7dAqlAgb4h1eMUg7Pv3ho11G3MJ4Qi5W
 OsswGk8ceaNgrZdmzbvuCE6Kieu26FNRp+ZH8dadcihaA9SQDSD5GjB7n
 JmHtvR2jRcnhtJrQ0y95O/ZwcX4iy7NgV5cyMziqlW5Jz1cyOSmk6bP5K
 QZ9cuxB5vakbHWM4mDISWDOxGCuLFRmJDusmUsw9nRyJ/k6IpmDCsf2mI
 9p3uDz0m6DHxKzCtzK3W+pnx7p/oPy9oV2B0HMXvh2C26s82wzCxZKfcI
 YPTD5RC6M8FxJ3ZyrrjHbhFdf4CIaJIXFT6kEdhOqxIk6q0NdAkreOmJ5 A==;
X-CSE-ConnectionGUID: wg5YN5TTQA6yq30rsuwSXw==
X-CSE-MsgGUID: RSspgnrWRrSxFuxoghaOUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80612990"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80612990"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 04:13:54 -0700
X-CSE-ConnectionGUID: BdjVfli9RL2ExykCK9Ll1Q==
X-CSE-MsgGUID: mMt3uNx+Rh6VgmeLRah9zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="242371097"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.24])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 04:13:53 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v4 04/10] drm/xe/hw_engine: don't open code is_usm_hwe()
Date: Wed, 27 May 2026 12:13:40 +0100
Message-ID: <20260527111335.140000-16-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527111335.140000-12-matthew.auld@intel.com>
References: <20260527111335.140000-12-matthew.auld@intel.com>
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

Prefer is_usm_hwe() here.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 8c66ff6f3d3c..768b0cd4c16a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1037,8 +1037,7 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
 	    hwe->logical_instance >= gt->ccs_mode)
 		return true;
 
-	return xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
-		hwe->instance == gt->usm.reserved_bcs_instance;
+	return xe_gt_is_usm_hwe(gt, hwe);
 }
 
 const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
-- 
2.54.0

