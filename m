Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6EDC25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 18:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B201F10EFBC;
	Fri, 10 May 2024 18:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJsTysUR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7E510EF43
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 18:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715364764; x=1746900764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zIeWvPaOJPxN55G72W3Y96rNYZaYbL9LTf3bcGXNlq0=;
 b=gJsTysURo633U6R+TS7dnVx9dPjE4J1Uk982ExgracmlLWA07pvXWyEM
 qK87wvINe4sTofLtnD4OE2kzjDeIrx8ZC4eeN0odcmJ+UEGroLlu+/gW/
 xz0X0PQ9F9daf1kyT5J2IAJLvwJm/QxmfFCXbDbwRGZwLm4lnkaip+MUc
 IxMKbePNzPbcDZDRrTie/YEoLRDKCeZV8vhLUE+G+TBQ+jcsMdyDAz9BR
 DVmRch8ouHYnM9UIGa5GcPK/iuNLOogU38hLLlrM1DP2uhC5TDEcXT/VO
 Y7T7f4FDXIIUd2ka+3QTV/j9syOhVJ7S9ALj2WCAkLjj/tuBe+DosQ9re Q==;
X-CSE-ConnectionGUID: Us4A90KTQFqQXn3GmHYeqQ==
X-CSE-MsgGUID: j0NpoFYcRRCjfqVwztlbuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28844603"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28844603"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:44 -0700
X-CSE-ConnectionGUID: jHyFXroRTWSbgbFkuWrjOw==
X-CSE-MsgGUID: /pDyMhssSOudIaa5xHhgdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60544113"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.149])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:42 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 13/20] drm/xe/coredump: move over to devm
Date: Fri, 10 May 2024 19:12:26 +0100
Message-ID: <20240510181212.264622-35-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240510181212.264622-22-matthew.auld@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
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
2.45.0

