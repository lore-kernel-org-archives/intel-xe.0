Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACEBC04FFE
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 12:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D6F112C00;
	Mon, 29 Apr 2024 12:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1cxfTSQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9B4112C14
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 12:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714392952; x=1745928952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9NOQyHOf4VIBkzCHFEjknkzexehgONYMlHmKT/csGQs=;
 b=D1cxfTSQyR2ZWfFFzo+6Gj0qi/MRM71186SrP2ucbKGKwwUyvUre26Yy
 BLkmqIbbtb/6Umxk2rOpFN6IXdlhCdO5/TxNBOmmUj1Quo2EZt+x4dqrq
 2dtMY5k8kpZ0cQVHsM25+HcmUYogNZb3BTwIswzx+Nr1fRIMbeDaitClo
 guMXhtojjS3mqP6CglZ3PGiojAfRCdZOnIlGeAm5AaYB4elycRuNLC6WR
 vPULwzL3AnQhD7EyjsGEwkABpDzoT8VkvBMsTBvDHTKztgKyQrhBi2CGB
 fJeXh34duz9pV762L2TC5TTMpgHX+/kIT5rsvH9MW/2IM5NncEe7uglc2 A==;
X-CSE-ConnectionGUID: jtVObjPwQa6ybprlBlitxA==
X-CSE-MsgGUID: mT7s/n/TRsGHPQQhsGz9jg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9878391"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9878391"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:15:52 -0700
X-CSE-ConnectionGUID: yYaS3mrmRK2ORP4W9qTO8w==
X-CSE-MsgGUID: iNaZwgP3RVai1lTdQB0bhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="49303401"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.199])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:15:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 5/8] drm/xe/guc_pc: move pc_fini to devm
Date: Mon, 29 Apr 2024 13:14:41 +0100
Message-ID: <20240429121436.33013-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429121436.33013-9-matthew.auld@intel.com>
References: <20240429121436.33013-9-matthew.auld@intel.com>
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

Here we are touching the HW/GuC and presumably this should happen when
the device is removed. Currently if you hotunplug the device this is
skipped if there is already open driver instance.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 8fc757900ed1..8c855afd1144 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -892,7 +892,7 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
  * @drm: DRM device
  * @arg: opaque pointer that should point to Xe_GuC_PC instance
  */
-static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
+static void xe_guc_pc_fini(void *arg)
 {
 	struct xe_guc_pc *pc = arg;
 	struct xe_device *xe = pc_to_xe(pc);
@@ -940,5 +940,5 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	pc->bo = bo;
 
-	return drmm_add_action_or_reset(&xe->drm, xe_guc_pc_fini, pc);
+	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini, pc);
 }
-- 
2.44.0

