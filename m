Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC02C52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 16:52:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4534E10E99D;
	Fri,  9 Aug 2024 16:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+tj5aGT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D433A10E99B
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 16:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723222349; x=1754758349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kAA8AJpJ7tit9mM6vf0I2qr3cCVtGwo4nfO2zXVbLtI=;
 b=n+tj5aGTMhqdstC2mBZfZg3RiQAp7dYjB/xxMhzHtF2Z94w/MA7uxpUp
 qsZCNfTC1AHMCO6hNm95SHkWZO49svSrh8exxAM/4tOSrwFuWqQextdts
 pmrHqI7RZ3Qg7bfUlh6Oy4lG8QQqirDq3vEUlctFpRrXTHY9aDqXWPAuY
 HMkiaKmAgXWPfQAAgGILLVsIkdxNmNCK5arBK1I5XDpLiaY3pqPAnvGZr
 OTT6aRKE9MaORRLOXwn396ZuCaoBGGJfpnMmTdsXI5EghgMXbEmdI2Q5d
 3DPmBceieQ2vqFl4sq5zYfuojaW82gYSoW77fxjeepSKghh6wIM08iEYd g==;
X-CSE-ConnectionGUID: 24/06ZMCRnGijCXgknotPw==
X-CSE-MsgGUID: WAEybmYtTKmu4Yl/q0ZDmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21379436"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21379436"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:29 -0700
X-CSE-ConnectionGUID: w6NwP3WMSf2gu9WhpX5H8w==
X-CSE-MsgGUID: teKzp1tqSeOJ8oGLpLZ8iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57569342"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:28 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 08/12] drm/xe/guc: Define stub for xe_guc_ct_send_recv()
Date: Fri,  9 Aug 2024 18:51:55 +0200
Message-Id: <20240809165159.662-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240809165159.662-1-michal.wajdeczko@intel.com>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
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

For some advanced KUnit test cases we may want to use replacement
function instead of the real xe_guc_ct_send_recv().

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c       | 2 ++
 drivers/gpu/drm/xe/xe_guc_ct_types.h | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index beeeb120d1fc..30536f7021fc 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -938,6 +938,8 @@ int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			u32 *response_buffer)
 {
 	KUNIT_STATIC_STUB_REDIRECT(xe_guc_ct_send_recv, ct, action, len, response_buffer);
+	XE_TEST_REDIRECT(ct->send_recv, ct, action, len, response_buffer);
+
 	return guc_ct_send_recv(ct, action, len, response_buffer, false);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index 761cb9031298..50c024b0227d 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -13,6 +13,7 @@
 #include <linux/xarray.h>
 
 #include "abi/guc_communication_ctb_abi.h"
+#include "tests/xe_test.h"
 
 struct xe_bo;
 
@@ -128,6 +129,10 @@ struct xe_guc_ct {
 	u32 msg[GUC_CTB_MSG_MAX_LEN];
 	/** @fast_msg: Message buffer */
 	u32 fast_msg[GUC_CTB_MSG_MAX_LEN];
+
+	XE_TEST_DECLARE(int (*send_recv)(struct xe_guc_ct *ct,
+					 const u32 *action, u32 len,
+					 u32 *response_buffer));
 };
 
 #endif
-- 
2.43.0

