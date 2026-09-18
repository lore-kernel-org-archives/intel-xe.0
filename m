Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE74C982DC
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 10:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F26D10F2A2;
	Fri, 18 Sep 2026 10:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RRPG0aVY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF78610F2AD
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 10:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789725943; x=1821261943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d+adU9rY83Q7BArHYh+tr7h+Rm9wR/M6+UUJGgahjE0=;
 b=RRPG0aVY1CT0yi4g2KXlO1FbbLVn05jvH79XceikUoQjrYjAKiV2hSxD
 SZbGJBuqL7nTw7/e5MKMEn7cAd4Jiw2dujwvn1gGd2Chviik1sINeNpDh
 K7CB4Y7IP9fRXmRc25Rq+FwgEl0MWPsuRYJZkFLW7mrBsscF/Vrbvt2J/
 QPq3xxmnDDlMGGtbKt0DW9I2yIS59fqRVxRl5fgwTkONj4amjRbo6yZS5
 rgy/XX6iFz4LLeemSMd5nYSd+Ogn8AKocv8HPGUyYugzXmZzDCeWStB5V
 rAG6yJwwhfWOiF9blx84vZYMqJzK8YjKJ5nQTpbsTKWYlgb79nOGtewKs Q==;
X-CSE-ConnectionGUID: hr60aVw+QtqVjWHJKHMMLQ==
X-CSE-MsgGUID: vJES2qVoS4q5VDjGqSd32Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="737206"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="737206"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:05:43 -0700
X-CSE-ConnectionGUID: EPyPu+KLSjiaoaoErat0pg==
X-CSE-MsgGUID: l+I6tV3DT92y2iSEOgXDuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271003535"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa007.fm.intel.com with ESMTP; 18 Sep 2026 03:05:42 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v9 01/10] drm/xe/guc: Allow to replace xe_guc_mmio_send_recv()
 with KUNIT stub
Date: Fri, 18 Sep 2026 15:35:25 +0530
Message-ID: <20260918100533.567225-13-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918100533.567225-12-satyanarayana.k.v.p@intel.com>
References: <20260918100533.567225-12-satyanarayana.k.v.p@intel.com>
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

Allow to replace xe_guc_mmio_send_recv() with the stub so we can
exercise more code paths on the fake xe device during kunit tests.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index c7f8bbd4cb92..992a69e19332 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -6,6 +6,8 @@
 #include "xe_guc.h"
 
 #include <linux/iopoll.h>
+#include <kunit/static_stub.h>
+
 #include <drm/drm_managed.h>
 
 #include <generated/xe_wa_oob.h>
@@ -1510,6 +1512,9 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	int ret;
 	int i;
 
+	KUNIT_STATIC_STUB_REDIRECT(xe_guc_mmio_send_recv, guc, request, len,
+				   response_buf);
+
 	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
 
 	xe_assert(xe, len);
-- 
2.53.0

