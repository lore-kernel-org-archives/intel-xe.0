Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D2AE6FE49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 20:56:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04E510E87C;
	Fri,  6 Sep 2024 20:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bcJJcMYV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB4E10E87C
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 20:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725656178; x=1757192178;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d49dc/Xdj3QHYPGbzaK4xnr7k9bK8G+LX9m5iW4xSpo=;
 b=bcJJcMYVfoPDd+AkO6F6xC5fy1vQNKT/hSdOn/KhjIjouBgPb7wg0E4b
 kaTmn76ubtf6359Ig7d+KEEkL2MMsUIe0fOTsgzr9qPR4dNJthUMihtpe
 ytspSLjp7/pkdgl9OzrwTQ3TrP6KekZwHX6c1msqCVQbK8r/yAXh8a6Cq
 8jg2af0adM8pTbAl7P/RbHaK3q7OEnzxRyRcwCHBW1yezAPuo2wdzuEBC
 LqjHjIZS2r0jWEG5SjKskx/y8mtP27N/jnUjSMlSGB/dMOlyhvYW9cdXg
 sakC0ag/wkHqMLi9d6gPutP2tBjg3aUbS/4cVdIVP2qvaUBtlPjOfSDnd g==;
X-CSE-ConnectionGUID: MRjzt6j5QN6QAv/6TI2VYA==
X-CSE-MsgGUID: o8sXk9tgQeahaBIkWs4z+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24304339"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="24304339"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 13:56:17 -0700
X-CSE-ConnectionGUID: PRXjyzfGSpyHq6wxqGXA2Q==
X-CSE-MsgGUID: 6eDA44hoRfCRb8dnr/IDtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="66092751"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 13:56:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH] drm/xe: Mark reserved engines in snapshot
Date: Fri,  6 Sep 2024 13:56:09 -0700
Message-ID: <20240906205609.3131330-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When printing <debufs>/gt*/hw_engines, it's useful to mark
what engines are reserved so it doesn't mislead developers
while debugging.

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c       | 3 +++
 drivers/gpu/drm/xe/xe_hw_engine_types.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index c9c3beb3ce8d..ce180faf2592 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -903,6 +903,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 	snapshot->forcewake.ref = xe_force_wake_ref(gt_to_fw(hwe->gt),
 						    hwe->domain);
 	snapshot->mmio_base = hwe->mmio_base;
+	snapshot->kernel_reserved = xe_hw_engine_is_reserved(hwe);
 
 	/* no more VF accessible data below this point */
 	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
@@ -1025,6 +1026,8 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
 		   snapshot->logical_instance);
 	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
 		   snapshot->forcewake.domain, snapshot->forcewake.ref);
+	drm_printf(p, "\tReserved: %s\n",
+		   str_yes_no(snapshot->kernel_reserved));
 	drm_printf(p, "\tHWSTAM: 0x%08x\n", snapshot->reg.ring_hwstam);
 	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n", snapshot->reg.ring_hws_pga);
 	drm_printf(p, "\tRING_EXECLIST_STATUS: 0x%016llx\n",
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 8be6d420ece4..be60edb3e673 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -173,6 +173,8 @@ struct xe_hw_engine_snapshot {
 	} forcewake;
 	/** @mmio_base: MMIO base address of this hw engine*/
 	u32 mmio_base;
+	/** @kernel_reserved: Engine reserved, can't be used by userspace */
+	bool kernel_reserved;
 	/** @reg: Useful MMIO register snapshot */
 	struct {
 		/** @reg.ring_execlist_status: RING_EXECLIST_STATUS */
-- 
2.43.0

