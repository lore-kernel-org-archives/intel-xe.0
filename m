Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3005BC982D1
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 13:51:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBF710E407;
	Thu, 17 Sep 2026 13:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AhyBuzm5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9551010E407
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 13:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789653103; x=1821189103;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m9H15kOzEVfo6OjJGiwDFhcLH08Em2e2qgJc9TZUh5c=;
 b=AhyBuzm5L00hcwv3e0HIik3DhjZ3SWkNWRwwdKu+W9e6wSm8NiSssViC
 NQ5biJjXOhoc8zs/ZBYpfkQFVZ481r6D9gmlOqJF6+cgrL8mQVGJ/kwMz
 /goHGnmCgmo+Z3bKQfac3Fk6zhvFOvBO/hzCKmA5xFQ42pLPcz8jJGZpb
 4sT5tM8FBNjd8gr2IJRZJ5d/liueQA/OSmPnl7J4E4DJoEaJ65nlWRd42
 l/1UYclCKuzMaYFgupf7C2fhpo14z+ZVHJdrLZ/Vr6P8uFM4wlAxOXiDq
 Y+Slaanb5yQFR3SiAUmx0eGbk6AZoZhpoHPBq8T6RZFMqji9vCaTIjRlT Q==;
X-CSE-ConnectionGUID: uwe/ymJtQV6OH6KV1aQhOQ==
X-CSE-MsgGUID: QXOQ69ftQZmLNlLXfEOwbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77641369"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77641369"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 06:51:34 -0700
X-CSE-ConnectionGUID: fGDqxvbfSHGrTNC8tkq3bA==
X-CSE-MsgGUID: fKAhWBQkQkK/3gArhERuHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="267563498"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 06:51:33 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: zhanjun.dong@intel.com, daniele.ceraolospurio@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH] drm/xe/guc: Demote uncorrectable local error log to info
Date: Thu, 17 Sep 2026 19:21:22 +0530
Message-ID: <20260917135121.3590045-2-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
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

The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
local, queue-level context termination rather than a global device or
driver failure. This can be triggered as part of expected recovery flows,
including intentional fault-injection tests.

Printing this at ERROR level is too noisy and causes false-positive
dmesg-warn failures in CI. Switch the log level to INFO, matching the
adjacent CAT error handler.

Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error notifications")
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f3ba8abfc228..23ccec0adc8c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3495,7 +3495,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(!q))
 		return -EPROTO;
 
-	xe_gt_err(gt,
+	xe_gt_info(gt,
		   "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
		   guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
 
-- 
2.43.0

