Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C770E7F12C
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 21:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676A910E436;
	Tue, 26 Sep 2023 21:21:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8719510E436
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 21:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695763268; x=1727299268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jbb13lM20POb2TuR1fG9vSUWBu+zZMdCFHW4TjKoEAg=;
 b=cetNRlVCaQEy7mYEzcxAc0HBYjfCzKl+GrMmLKnPDElOg+MADAjhGXdl
 xspo5Qb8WpZFec35vHGFMuGQcNrBuv5jIQ76m0GXLrTp4IL55GGpKhRUm
 ks7AGMUeKaRqsqdFYZNOxo5sdyaOsNMJ0B2f32DLwJJb9rQ3rtag8cVgO
 rNPK1Y3oGE4l7eL40WtR3fxeWJFBD0dvBCtnwXovKKsnVMFk1bdKXOagR
 lIlm+wyqWSB4ndHVyNcGu9hJW5YaxJCpI+GmsRukLxuDGGiQ/HvwUCdQ9
 /xAnaaz7s8PVH5E/IDmNIirfgsz8TXkwypytIMzCgQW2PseaMexZcA83Q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="467958429"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="467958429"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 14:21:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="778288839"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="778288839"
Received: from dut027tgly.fm.intel.com ([10.105.19.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 14:21:04 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Date: Tue, 26 Sep 2023 21:20:56 +0000
Message-Id: <20230926212056.40881-2-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926212056.40881-1-stuart.summers@intel.com>
References: <20230926212056.40881-1-stuart.summers@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Add coredump to wa_bb timeouts
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
Cc: stuart.summers@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We're seeing some hangs during driver load on some platforms
in CI which are hard to catch manually. As such, add the dump
at the time of the hang.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 1aa44d4f9ac1..80ea076197e5 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -46,6 +46,7 @@
 #include "xe_vm.h"
 #include "xe_wa.h"
 #include "xe_wopcm.h"
+#include "xe_devcoredump.h"
 
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 {
@@ -187,8 +188,10 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	xe_bb_free(bb, NULL);
 	if (timeout < 0)
 		return timeout;
-	else if (!timeout)
+	else if (!timeout) {
+		xe_devcoredump(q);
 		return -ETIME;
+	}
 
 	return 0;
 }
-- 
2.34.1

