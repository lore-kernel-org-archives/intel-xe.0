Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E28D262A0
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 20:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB3C10E24B;
	Tue, 20 Jan 2026 20:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hj6Mv6b5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADA710E097
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 20:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768940184; x=1800476184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7NLaz8e9pQ1E9oZrERqNdc23H6jRoRk3q8OIFrCTw3s=;
 b=Hj6Mv6b5XkNdHsAfn7Zq5IGnLLZMyU3w2/abSjhkGcs/FflRvirm2UuH
 BcUE8c1Svf9wPxWh0dK1WJd+kO+5uYleQQaEF02OQlqjLQxDjcK5DUIJU
 XcyCrrSqyut6IlO5DuTLzk/BDby/V/xHjV5f/ikh1MKvh9GrDHSBQoTW9
 Sws8I4rJ9P/8P3C/O3lHg3Qe6+54Jyw0FlP2Iym4SdVEOcHarhLV5cs9Y
 ex3BZoQBMIRkGscPGF/dGTnqjnFVZ9GAfvjLzB/0SS1ZJdn8382agO1ZX
 nbk+Ao05Wxl6zGcyKO6xMJFy4HE7BLuZDglFyxuQ9mF1o96u6rsdgu1gi Q==;
X-CSE-ConnectionGUID: g6fEN/MjR2+G0G4az5N5Rg==
X-CSE-MsgGUID: wh1LIirhSfqv83m54TdpuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87574660"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="87574660"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:16:24 -0800
X-CSE-ConnectionGUID: YxSPeX/xTbC53lJ+0nDA5A==
X-CSE-MsgGUID: qgoEyjwwSCuTtGSIO0Ugbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="210373507"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa003.jf.intel.com with ESMTP; 20 Jan 2026 12:16:24 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v3 6/6] drm/xe/guc: Fix page fault by moving guc_submit_fini
 to devm
Date: Tue, 20 Jan 2026 15:16:21 -0500
Message-Id: <20260120201621.2442803-7-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120201621.2442803-1-zhanjun.dong@intel.com>
References: <20260120201621.2442803-1-zhanjun.dong@intel.com>
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

guc_submit_fini requires access to device memory. Using a device-managed
action guarantees the correct ordering of cleanup relative to memory
unmapping.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c848615d6057..f29ed62d2b12 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -241,7 +241,7 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 
 static int __xe_guc_submit_reset_prepare(struct xe_guc *guc);
 
-static void guc_submit_fini(struct drm_device *drm, void *arg)
+static void guc_submit_fini(void *arg)
 {
 	struct xe_guc *guc = arg;
 	struct xe_device *xe = guc_to_xe(guc);
@@ -334,7 +334,7 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 
 	guc->submission_state.initialized = true;
 
-	return drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
+	return devm_add_action_or_reset(xe->drm.dev, guc_submit_fini, guc);
 }
 
 /*
-- 
2.34.1

