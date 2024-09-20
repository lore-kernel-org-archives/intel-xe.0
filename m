Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36E8C78850
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 13:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C249510E04D;
	Fri, 20 Sep 2024 13:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJ4V4FMq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58B710E04D
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 13:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726840084; x=1758376084;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ws9YOuOPqXiGQQsP7XsCaa2oJb3Gmuoow/TR24Mdrd8=;
 b=kJ4V4FMqJzIDKNJbeDkJg0Iw8FEiJWmwxFCqUklvOIr4bbGSy1e4oAlx
 3pX1VC52faIQNHlHap1eR6Guc5o/L1J0NmUL24taMNkXMJ58lqmcocXs6
 P01ah5nnnh7i2VJO14dT51dK/OD+8cY0Y5OwSPfbqnpYUVNkriSOQB112
 VuQ/4RcxYHFta+Ra39PPtaYyzcayVq/9Tzb2pQ9VP5UYqZ5x3/DNEgg2O
 g6kCDxptP3KFnJUvX/DYZeMi8wy6g10Rc1PDIHxdgXdAf+KVOcs6Zl9bP
 N5kO28gb47RMB17pp/FVu/NuOSgy8G3UwKU7nhf0bfMlXe8RrPmMO5SvC g==;
X-CSE-ConnectionGUID: 1pQ1FP/xSPOkVI2bYoITbw==
X-CSE-MsgGUID: h6Q44/MyT2m3bo81nfvFcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25363787"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="25363787"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 06:48:04 -0700
X-CSE-ConnectionGUID: AyG6RfaDR92ZMD6FkfHkgQ==
X-CSE-MsgGUID: /SOcjG5bQryv9oehl825LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="74684738"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 06:47:10 -0700
From: bnilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com,
	john.c.harrison@intel.com
Subject: [[CI] 12/12] [For CI] Debug prints/logs to debug G2H timeout issue
Date: Fri, 20 Sep 2024 19:36:46 +0530
Message-Id: <20240920140646.618008-13-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920140646.618008-1-badal.nilawar@intel.com>
References: <20240920140646.618008-1-badal.nilawar@intel.com>
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

Debug print and GuC log in dmesg to debug possible G2H irq delay / miss

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c    | 4 +++-
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 41ff4fe65f8b..00c0550fb80f 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1094,8 +1094,10 @@ int xe_guc_self_cfg64(struct xe_guc *guc, u16 key, u64 val)
 
 void xe_guc_irq_handler(struct xe_guc *guc, const u16 iir)
 {
-	if (iir & GUC_INTR_GUC2HOST)
+	if (iir & GUC_INTR_GUC2HOST) {
+		xe_gt_dbg(guc_to_gt(guc), "G2H IRQ GT[%d]\n", guc_to_gt(guc)->info.id);
 		xe_guc_ct_irq_handler(&guc->ct);
+	}
 }
 
 void xe_guc_sanitize(struct xe_guc *guc)
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 5546d4f87ebb..8f2d046bf1b5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1026,6 +1026,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x",
 			  g2h_fence.seqno, action[0]);
 		xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
+		xe_guc_log_print_dmesg(&ct_to_guc(ct)->log);
 		return -ETIME;
 	}
 
@@ -1141,6 +1142,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		xe_gt_warn(gt, "G2H fence (%u) not found!\n", fence);
 		CT_DEAD(ct, NULL, PARSE_G2H_UNKNOWN);
 		g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
+		xe_guc_log_print_dmesg(&ct_to_guc(ct)->log);
 		return -EPROTO;
 	}
 
-- 
2.34.1

