Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F0CC25B7C
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 15:45:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DE310E7BB;
	Mon, 20 May 2024 15:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNDy0tSs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536A110E58D
 for <intel-xe@lists.freedesktop.org>; Mon, 20 May 2024 15:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716219949; x=1747755949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B+J4/P7Rn4wgKHayIY577pl5IoZNbAsvbKokQY+IjFY=;
 b=bNDy0tSspbPQNs/OmK8qwunn9tGRZjbzNP4rvBSKrTPHyunhoM6/t91z
 fTWi0WL1BPBOPlM8ZtsZCS4PcTrSH7XJ33ya21UXBKb+2Nvvd1YB/gxwf
 yHpqyJBaXmAzdB7KHn2oYL5ZBf3htSrEUB9dcSuT8eWjqDjMf+1/oL3zQ
 kTTbEVeGLRpuXx4oqf+c04fNDrsSRnbZFZbVxjrnMb9ZSbWq3+81vuZo6
 v/wq2//kR8ljJDAvBzqkgur4XqNBfvNLOT/p8bC4hO+7lnYYsiEKbAC7n
 ZLJQUt9EKvEXxuXR/H/w7OVnmgZH5vRcYdU4IpxknDEAY1LgGfeajGWqz Q==;
X-CSE-ConnectionGUID: gxIaDa53QLWNfdGzVStinQ==
X-CSE-MsgGUID: rDSyTGFiRoe459bnPBzskg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="34873201"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="34873201"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:47 -0700
X-CSE-ConnectionGUID: BdZKqUCOQ6qUvGMlafeWkw==
X-CSE-MsgGUID: NiKqR+RkTXmmP6BwiNfbwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32610496"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [CI v2 11/18] drm/xe/coredump: move over to devm
Date: Mon, 20 May 2024 16:43:00 +0100
Message-ID: <20240520154249.52888-29-matthew.auld@intel.com>
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

Here we are using drmm to ensure we release the coredump when unloading
the module, however the coredump is very much tied to the struct device
underneath. We can see this when we hotunplug the device, for which we
have already got a coredump attached. In such a case the coredump still
remains and adding another is not possible. However we still register
the release action via xe_driver_devcoredump_fini(), so in effect two or
more releases for one dump.  The other consideration is that the
coredump state is embedded in the xe_driver instance, so technically
once the drmm release action fires we might free the coredumpe state
from a different driver instance, assuming we have two release actions
and they can race. Rather use devm here to remove the coredump when the
device is released.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1679
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 3d7980232be1..e70aef797193 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -238,13 +238,15 @@ void xe_devcoredump(struct xe_sched_job *job)
 		      xe_devcoredump_read, xe_devcoredump_free);
 }
 
-static void xe_driver_devcoredump_fini(struct drm_device *drm, void *arg)
+static void xe_driver_devcoredump_fini(void *arg)
 {
+	struct drm_device *drm = arg;
+
 	dev_coredump_put(drm->dev);
 }
 
 int xe_devcoredump_init(struct xe_device *xe)
 {
-	return drmm_add_action_or_reset(&xe->drm, xe_driver_devcoredump_fini, xe);
+	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini, &xe->drm);
 }
 #endif
-- 
2.45.1

