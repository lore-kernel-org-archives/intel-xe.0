Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7DACEE34C
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 19:08:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D2310E4FF;
	Tue, 18 Nov 2025 19:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PIRzyP24";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07F010E1E9
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 19:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763492933; x=1795028933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kkuvldVXERFE72Asnf7S8mCnwdNcAL3Pvr/dIhFfr5o=;
 b=PIRzyP24xticDwe4urO8YILr+0iUl+i2n4IZSuEjfc1KwxqCS+EZHeSl
 0argLgusu8nLFffzBcbsfuBAlSpDR2CZPfHDxf3ONnhqgE9k+y1ga3z4I
 uT/1wD2Pev1HQTcHeVfokBfVwF3mMGUGunUm8PR/2wuz5hi5NBEK0Dii7
 6ELMDPFXYdMrZicYFRXPUKVyVDTDNESuBRUv/8tVfPlm/ZxvJhxMCENyA
 zO0RWZ5Zp8VZOBpkX7tr9JsdKIoQ96e8VxIyXCj6BOMrmTzb7DCXjYc1m
 tbuMERnJbH6quXMrcAnrtEC4R4ADnYAC3R4r40uUX22LjktW50Ba4eNFR w==;
X-CSE-ConnectionGUID: aiPNSvvYQwuG4xtyT9C1Bg==
X-CSE-MsgGUID: N3RehWwlSCmQCe7Zmgk+OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="68132373"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="68132373"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 11:08:52 -0800
X-CSE-ConnectionGUID: 0e2VV+z2TSS0Zr875llZBA==
X-CSE-MsgGUID: wsG1DUp2RKalDs5awkSxRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="191627280"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 11:08:51 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Sagar Ghuge <sagar.ghuge@intel.com>,
 Stuart Summers <stuart.summers@intel.com>, stable@vger.kernel.org
Subject: [PATCH 1/2] drm/xe/guc: Fix stack_depot usage
Date: Tue, 18 Nov 2025 11:08:11 -0800
Message-ID: <20251118-fix-debug-guc-v1-1-9f780c6bedf8@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251118-fix-debug-guc-v1-0-9f780c6bedf8@intel.com>
References: <20251118-fix-debug-guc-v1-0-9f780c6bedf8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-50d74
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

Add missing stack_depot_init() call when CONFIG_DRM_XE_DEBUG_GUC is
enabled to fix the following call stack:

	[] BUG: kernel NULL pointer dereference, address: 0000000000000000
	[] Workqueue:  drm_sched_run_job_work [gpu_sched]
	[] RIP: 0010:stack_depot_save_flags+0x172/0x870
	[] Call Trace:
	[]  <TASK>
	[]  fast_req_track+0x58/0xb0 [xe]

Fixes: 16b7e65d299d ("drm/xe/guc: Track FAST_REQ H2Gs to report where errors came from")
Tested-by: Sagar Ghuge <sagar.ghuge@intel.com>
Cc: <stable@vger.kernel.org> # v6.17+
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 2697d711adb2b..07ae0d601910e 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -236,6 +236,9 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 	spin_lock_init(&ct->dead.lock);
 	INIT_WORK(&ct->dead.worker, ct_dead_worker_func);
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
+	stack_depot_init();
+#endif
 #endif
 	init_waitqueue_head(&ct->wq);
 	init_waitqueue_head(&ct->g2h_fence_wq);

-- 
2.51.2

