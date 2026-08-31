Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED785C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 08:36:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBBC10E775;
	Mon, 31 Aug 2026 08:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mL8MrfAH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB30510E742
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 08:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788165378; x=1819701378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d+adU9rY83Q7BArHYh+tr7h+Rm9wR/M6+UUJGgahjE0=;
 b=mL8MrfAHJsURbTEbhLc+cWmYkkwBB99HewkjtLIPZCHXX8RJjyBA/NV4
 TMWbahxqV9rK+jzKDkWXSKCr1yD8qMGnknj+g15HS0SCHwhMZRYFLxtcL
 R9WUrggdjz/5CW/MrA5g2Dhx5Gg8B0vrtH6VfPr27NgrXuoAyfDIQIQAP
 3vVyxE5w9sj1zOWHdfQv/S+KpE6pzX+LhbaLBJPZem2Kc0Ah6mf98sKDx
 w2Q09urpOKaUHNXOP602WMyj3RcGIyqhtSW/MAZAM4VPQiXlSKX1nnt3z
 HqFBNekm4cJyiAFvmq1PBk2FkEUo+wqqbe781Ax+N2ut6HGmp6ouUizyT A==;
X-CSE-ConnectionGUID: r7h0XCiMTPuKcE7md1v/+w==
X-CSE-MsgGUID: x1pcLT13RHWzj/Km+K37Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106089691"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106089691"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 01:36:17 -0700
X-CSE-ConnectionGUID: 3g3/iKrCTyqN8xkXfph9OQ==
X-CSE-MsgGUID: uIxoXDtLR5GLdMdMCxrLbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="293546318"
Received: from unknown (HELO ksatya-dev.iind.intel.com) ([10.190.229.72])
 by fmviesa001.fm.intel.com with ESMTP; 31 Aug 2026 01:36:16 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v7 01/10] drm/xe/guc: Allow to replace xe_guc_mmio_send_recv()
 with KUNIT stub
Date: Mon, 31 Aug 2026 14:06:03 +0530
Message-ID: <20260831083605.2115328-13-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831083605.2115328-12-satyanarayana.k.v.p@intel.com>
References: <20260831083605.2115328-12-satyanarayana.k.v.p@intel.com>
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

