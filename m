Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2795CC27C55
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 13:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F7510E942;
	Thu,  6 Jun 2024 13:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B/kVCqHT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B788D10E942
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 13:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717679222; x=1749215222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=44Fo53ttvtDDGWAEpyv7kphf6l886qNRtfBiAHIRpCQ=;
 b=B/kVCqHTb669+RiZwMhqMCmpaQHMepbkDvSs4rWPJmPSWcGDfRn8fcOr
 T6d2OFkaRioLIf2nollHNmIAAfR65zq5wsJ8Ny9BxtKFxPTTNbztzmeZU
 1t2xtos5654rF7Ccpba0zfDZchD5RL3r9ZlXa+wvBV60h9db6atBYYgF9
 7MGfetJWZSVXxf/VbE8xVIhEPKGGKrA4nHCxhR19ek3s3ajZEfsevY1vd
 8EBDjlpKl6Fo3RFB8xV/4VUUt483sbIhW4ET+JFuaFc9dP03PvLw/3Koh
 jDxfS+m+c4ZxiSizrWq2DmcJ2Z9O6Tem7y4ilYj1IZ20u/eHNTihfJFcY A==;
X-CSE-ConnectionGUID: 6hAinZIkQPywDZRBRf85cA==
X-CSE-MsgGUID: iQxAK8GdRbuS//RiRDNilg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14464250"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14464250"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 06:07:02 -0700
X-CSE-ConnectionGUID: YhON1I1CTcWxtnIg5dyvnQ==
X-CSE-MsgGUID: LVTqrlVTQxSeMsIOdgU0nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38519339"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.165])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 06:07:01 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 1/2] drm/xe/guc: Split g2h worker function
Date: Thu,  6 Jun 2024 15:06:38 +0200
Message-Id: <20240606130639.1504-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240606130639.1504-1-michal.wajdeczko@intel.com>
References: <20240606130639.1504-1-michal.wajdeczko@intel.com>
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

In the next patch we will want to perform the same steps that
g2h worker function is doing but from the different worker.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c1f258348f5c..08cf355e2e56 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1260,9 +1260,8 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
 	return 1;
 }
 
-static void g2h_worker_func(struct work_struct *w)
+static void receive_g2h(struct xe_guc_ct *ct)
 {
-	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, g2h_worker);
 	struct xe_gt *gt = ct_to_gt(ct);
 	bool ongoing;
 	int ret;
@@ -1311,6 +1310,13 @@ static void g2h_worker_func(struct work_struct *w)
 		xe_pm_runtime_put(ct_to_xe(ct));
 }
 
+static void g2h_worker_func(struct work_struct *w)
+{
+	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, g2h_worker);
+
+	receive_g2h(ct);
+}
+
 static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
 				     struct guc_ctb_snapshot *snapshot,
 				     bool atomic)
-- 
2.43.0

