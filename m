Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364AFC25B7D
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 15:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A8D10E43F;
	Mon, 20 May 2024 15:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XfTwP4+k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4DA10E315
 for <intel-xe@lists.freedesktop.org>; Mon, 20 May 2024 15:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716219942; x=1747755942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yCAe/C4lDcpSw14KNslZOsBTieCZ2RF9dF3iebX0Db4=;
 b=XfTwP4+kDPM4kmbihIJiGm0FokptCsZR+p2Ovti1STIMLEefPudk79nx
 Cf9LCrrEIl4sQqjhhIMj19I8VhJ/g8LZ8DKs8pShNODsMJH0PraevaLI8
 lQqDNshSnuDPzK2E1fBPI4jitsXX8NGwEvuD4OlrNQzTXvNgdGh9O778Z
 fTZmGiI299DUW6AXsScUelj/lRkhZ7q/nzUuN0n0mKuZ/W9y6edAdQc53
 GKI61Gxhce8zAf+SuV910km3uSxIDop85MIyc+pbPRimTGM/4SxsHw8yF
 ud2j2lVMRqfNW7R9rgL+Gqy7zT9NyfPp1FfMv9hYmZypKza62h/eNUBkj w==;
X-CSE-ConnectionGUID: REaZych7SzSdpGhsOKDwGQ==
X-CSE-MsgGUID: kyvQeCH/S+uc75hyguEAqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="34873145"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="34873145"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:41 -0700
X-CSE-ConnectionGUID: n2qsunjJQNyFnx/a+8afQg==
X-CSE-MsgGUID: BEo7a45gSGaK7/smzKM1ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32610453"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:41 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [CI v2 06/18] drm/xe/guc_pc: move pc_fini to devm
Date: Mon, 20 May 2024 16:42:55 +0100
Message-ID: <20240520154249.52888-24-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520154249.52888-19-matthew.auld@intel.com>
References: <20240520154249.52888-19-matthew.auld@intel.com>
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
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d10aab29651e..4164dab1ab66 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -893,7 +893,7 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
  * @drm: DRM device
  * @arg: opaque pointer that should point to Xe_GuC_PC instance
  */
-static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
+static void xe_guc_pc_fini(void *arg)
 {
 	struct xe_guc_pc *pc = arg;
 	struct xe_device *xe = pc_to_xe(pc);
@@ -941,5 +941,5 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	pc->bo = bo;
 
-	return drmm_add_action_or_reset(&xe->drm, xe_guc_pc_fini, pc);
+	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini, pc);
 }
-- 
2.45.1

