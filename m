Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71589CCD1BC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 15:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F53710E918;
	Thu, 23 Oct 2025 15:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RM8BQKIQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E203B10E918
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 15:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761232742; x=1792768742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7//418vS3skzlK6iPo3Yz3u+PCWkeMLu2FTglBOW+70=;
 b=RM8BQKIQOyKcYr4QxZF7aZNtKKSQ32znZTvArkVGdS6q6vG6xyLqBfGH
 WnwAOjkvEoPuHZhv+BLbVisnrvTTvU9oo0o3NV4RWlCrfyyehXvZC/FkQ
 FPLkUQ839nbY9g2n0Gm7vpo5V8JzpNM2j8z6PcXk4Fzpv5STZBpu1curm
 /TbblTeDVvirBFWPJL5fgQvWKSPMy+zoYDEu6fAqNNmaNzKKddupeb0xT
 +zD7rIug2Qh0hWF7C8akSzKaLFypN+FBTiTpI3JX2+OhcuaaJ6a/lukPp
 mIr1EGkRxw9QLAHZ5+xpgHcUmM2Viy07RgU2PpgX+hVoKAoVuawoqHm1V w==;
X-CSE-ConnectionGUID: 40Sn6tCUQDKlmlEC5Wp2kw==
X-CSE-MsgGUID: V2c9apyOQ6eB1KcWsMUY4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88871907"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="88871907"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 08:19:02 -0700
X-CSE-ConnectionGUID: MSTdRnV/QOC2bv8ozsA0wg==
X-CSE-MsgGUID: XA86/IOvSA6wTgN3QnZpjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184077380"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa007.jf.intel.com with ESMTP; 23 Oct 2025 08:19:00 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v2 2/2] drm/xe/vf: Use fault injection for testing VF double
 migration feature
Date: Thu, 23 Oct 2025 21:06:12 +0530
Message-ID: <20251023153616.3790-6-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023153616.3790-4-satyanarayana.k.v.p@intel.com>
References: <20251023153616.3790-4-satyanarayana.k.v.p@intel.com>
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

The VF migration process sends a marker to the GUC before starting
resource fixups, and sends the same marker with the RESFIX_DONE
notification. This prevents the GUC from submitting jobs to hardware
during double migration events.

Testing double migration requires triggering a second migration while the
first migration's fixups are in progress. Since fixups complete quickly,
this scenario is difficult to reproduce reliably. Use fault injection
framework to add a 10-second delay in xe_should_delay_vf_post_fixups()
during the post-fixup phase, creating a reliable testing window for
triggering subsequent migrations.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

---
V1 -> V2:
- New commit
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 8c1448d6c81d..63d43553ae4f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bsearch.h>
+#include <linux/delay.h>
 
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
@@ -1183,6 +1184,30 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
 	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
 }
 
+#if defined(CONFIG_DRM_XE_DEBUG) && defined(CONFIG_FUNCTION_ERROR_INJECTION)
+static noinline int xe_should_delay_vf_post_fixups(void)
+{
+	return 0;
+}
+ALLOW_ERROR_INJECTION(xe_should_delay_vf_post_fixups, ERRNO);
+
+static void vf_post_migration_fixup_delay(struct xe_gt *gt)
+{
+	int err = xe_should_delay_vf_post_fixups();
+	unsigned long delay = 10 * USEC_PER_SEC;
+
+	if (err == -ETIME) {
+		xe_gt_sriov_dbg(gt, "Delaying fixups by %ld secs\n",
+				delay / USEC_PER_SEC);
+		fsleep(delay);
+	} else {
+		return;
+	}
+}
+#else
+static inline void vf_post_migration_fixup_delay(struct xe_gt *gt) { }
+#endif
+
 static int vf_post_migration_fixups(struct xe_gt *gt)
 {
 	void *buf = gt->sriov.vf.migration.scratch;
@@ -1196,6 +1221,8 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 	if (xe_gt_is_main_type(gt))
 		xe_sriov_vf_ccs_rebase(gt_to_xe(gt));
 
+	vf_post_migration_fixup_delay(gt);
+
 	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
 	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
 	if (err)
@@ -1304,6 +1331,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	if (err)
 		goto fail;
 
+	vf_post_migration_fixup_delay(gt);
+
 	vf_post_migration_rearm(gt);
 
 	err = vf_post_migration_notify_resfix_done(gt, marker);
-- 
2.51.0

