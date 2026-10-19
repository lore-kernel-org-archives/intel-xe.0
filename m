Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9811CCCF2D6
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 09:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0E210E8ED;
	Mon, 19 Oct 2026 09:16:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E37C10E8ED
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 09:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792401375; x=1823937375;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eGqRyDBsCeAwaTLHB7LqwQRbwDblqSceAN5vUHoa8FQ=;
 b=ku3feg2Q5sj+T9vg9tMw/rLaHLwUTMQW6RHIoLmXXr8IwZM/5jECe2fU
 lq/f9s56cYLS7WMKw/71mG6rcBFo55HaoN/XYm1bEirlDIfHGhuab3XMQ
 r2S5dDrg6bqQiwpu0goocLhvnMVkyMcSn/NRx3fQhXepx3JLlWaCvLout
 PzpW/ABuilx2+XSU6WQNACPNYjVY4QyBKZkiLNNOrxul0z5i7luOcKu7R
 SNHb9peKmZ3pWMq99wl+3o93DKPyTIsvPzXhSOe5orp5q22JJ7+m62akD
 jORKBb42M1polSj4QAmVaiN1HASSQbGbqM3fBQlfitOBcpMyrtmjLLc6w g==;
X-CSE-ConnectionGUID: vFtnwtBpRUCIod1+6lAVQw==
X-CSE-MsgGUID: PtR0hUB3RSOGqF6NPqD2YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1088305"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1088305"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 02:16:14 -0700
X-CSE-ConnectionGUID: vivIx8tnQbGWm0CdmUWJkw==
X-CSE-MsgGUID: SziE95QuTGyjL7EgnM9wXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2492590"
Received: from suja-super-server.iind.intel.com ([10.190.238.52])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 02:16:12 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Subject: [PATCH] drm/xe/guc: Reset GuC before unmapping its post-hwconfig
 buffers
Date: Mon, 19 Oct 2026 15:34:48 +0530
Message-Id: <20261019100448.759503-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.34.1
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

guc_fini_hw() resets the GuC on teardown, but it is registered before
xe_guc_init_post_hwconfig() (re)allocates most of the GuC buffers. As
devm actions run in reverse order, these buffers get unmapped from the
GGTT while the GuC is still running and may still access them. When
unmapped GGTT entries are left invalid, this results in a GuC page
fault on unbind or probe failure.

Re-register guc_fini_hw() after all the GuC buffer allocations, so the
GuC is reset before any of them is unmapped. Keep GuC submit and RC
teardown running before the reset, as they still need to stop or talk
to the GuC.

Assisted-by: LLM
Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 6c35474ab843..14ae73844d76 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -882,9 +882,10 @@ static u32 guc_additional_cache_size(struct xe_device *xe)
  */
 int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 {
+	struct xe_device *xe = guc_to_xe(guc);
 	int ret;
 
-	if (IS_SRIOV_VF(guc_to_xe(guc)))
+	if (IS_SRIOV_VF(xe))
 		return vf_guc_init_post_hwconfig(guc);
 
 	ret = xe_guc_realloc_post_hwconfig(guc);
@@ -897,28 +898,41 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 
 	guc_init_params_post_hwconfig(guc);
 
-	ret = xe_guc_submit_init(guc);
+	ret = xe_guc_pc_init(&guc->pc);
 	if (ret)
 		return ret;
 
-	ret = xe_guc_db_mgr_init(&guc->dbm, ~0);
+	ret = xe_guc_engine_activity_init(guc);
 	if (ret)
 		return ret;
 
-	ret = xe_guc_pc_init(&guc->pc);
+	ret = xe_guc_buf_cache_init_with_size(&guc->buf,
+					      guc_additional_cache_size(xe));
 	if (ret)
 		return ret;
 
-	ret = xe_guc_rc_init(guc);
+	/*
+	 * The GuC keeps accessing its GGTT-mapped buffers until it is reset,
+	 * so move guc_fini_hw() after all GuC allocations above to have the
+	 * reset done before any of them is unpinned and its GGTT PTEs cleared.
+	 * Teardown actions that must run before the reset, either because they
+	 * still talk to the GuC (like GuC RC) or because they stop the CT and
+	 * submission (like GuC submit), must be registered after this point.
+	 */
+	devm_remove_action(xe->drm.dev, guc_fini_hw, guc);
+	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
 	if (ret)
 		return ret;
 
-	ret = xe_guc_engine_activity_init(guc);
+	ret = xe_guc_submit_init(guc);
 	if (ret)
 		return ret;
 
-	ret = xe_guc_buf_cache_init_with_size(&guc->buf,
-					      guc_additional_cache_size(guc_to_xe(guc)));
+	ret = xe_guc_db_mgr_init(&guc->dbm, ~0);
+	if (ret)
+		return ret;
+
+	ret = xe_guc_rc_init(guc);
 	if (ret)
 		return ret;
 

base-commit: 5bc00022b24f8a7bc6630609e9fd93dd977a87d3
-- 
2.34.1

