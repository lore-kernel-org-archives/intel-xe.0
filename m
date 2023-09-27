Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6BDE82CB0
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 16:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D830A10E575;
	Wed, 27 Sep 2023 16:50:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEDA10E577
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 16:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695833413; x=1727369413;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=k338hY1hN07ZUMUNJWSnpoxQLxteBoYA6LMHlowVBxI=;
 b=cXOZluj5kW+eex9FfWYc6hmJaxlPfIvymjmxmY9hqMZsCBv2pfmbmfju
 6M2lsujQ+kFnXWe9UwCiETIwAEB8GQn7PthWss2K5dlY4gRMl2p41HABc
 PkIGyS0FmVtTiuThUhCkgik6T1dodZMaDo/kJy2XGm2c8yy1Jp3OBSS/e
 3Ma1rYlwtOueKNpGSJrKFeHC6jDzoQmexDKz1EwE3JnskKW73ZaxsOfBC
 dNUOYOmlEEQNheBdaT0f3CuDjftjPwcVY7rnZBzmuf9h9Rs3YjnAuhvNi
 ps+fNb69SA1p3gNOWrjrFMor6bTXufgATArCn5llXGOl580FwqJ+vm9VE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448367992"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="448367992"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 09:50:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="839520062"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="839520062"
Received: from dut125tglh.fm.intel.com ([10.105.23.10])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Sep 2023 09:50:12 -0700
From: Bommithi Sakeena <bommithi.sakeena@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 16:50:12 +0000
Message-Id: <20230927165012.9048-2-bommithi.sakeena@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927165012.9048-1-bommithi.sakeena@intel.com>
References: <20230927165012.9048-1-bommithi.sakeena@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Add a missing mutex_destroy to
 xe_ttm_vram_mgr
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

Ensure that the mutex is destroyed at fini function.

Fixes: e777edb47dc2 ("drm/xe: Implement stolen memory.")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 06a54c8bd46f..285791eb4a79 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -328,6 +328,8 @@ static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 	ttm_resource_manager_cleanup(&mgr->manager);
 
 	ttm_set_driver_manager(&xe->ttm, mgr->mem_type, NULL);
+
+	mutex_destroy(&mgr->lock);
 }
 
 int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
-- 
2.34.1

