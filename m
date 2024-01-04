Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40562C47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 22:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44FC10E56F;
	Thu,  4 Jan 2024 22:20:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABC510E56E
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 22:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704406850; x=1735942850;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6jrJE2MUF6lZWuLFoIZ+1XUKbOnFH3nM0+i7BKZy5TQ=;
 b=fo1sCs1+XKHY+7NJ1IHX8eOoBXJXMnyL5epcZJrWcujpDM33U7D2+Wcz
 Dbzc46St6LZar8XiZVchmh7+mrACqQFByAV+KiJB136syqgMfbNGNR/9F
 Ps1dWghL6sLsIX/Z3Gx0drKnQrB/cqBaKuvhB8yFUw0GFbIO2QgMGlvFo
 bIGfaROXeSzOZ8GG34MR+8Q4IMUo/6uP4WP08dzTwxm7K9WBy22Z90sRM
 L9iCQiQGixHcYJ4jnze4/BsHoUXuYmH0qlVCu/s652n4kISA7tM371PwN
 9Gz4C29VqTdRNZ9UcmaTUvIPuY0jlqXduYzRGQA2JoEszIg5IhyuNIXPQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="428546880"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="428546880"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 14:20:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="784022817"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="784022817"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.149.125])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 14:20:49 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 08/10] drm/xe/kunit: Allow to replace xe_guc_ct_send_recv()
 with stub
Date: Thu,  4 Jan 2024 23:20:29 +0100
Message-Id: <20240104222031.277-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240104222031.277-1-michal.wajdeczko@intel.com>
References: <20240104222031.277-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We want to use replacement functions in upcoming kunit tests.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 4cde93c18a2d..8f208267ffc6 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -9,6 +9,8 @@
 #include <linux/circ_buf.h>
 #include <linux/delay.h>
 
+#include <kunit/static_stub.h>
+
 #include <drm/drm_managed.h>
 
 #include "abi/guc_actions_abi.h"
@@ -782,6 +784,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			u32 *response_buffer)
 {
+	KUNIT_STATIC_STUB_REDIRECT(xe_guc_ct_send_recv, ct, action, len, response_buffer);
 	return guc_ct_send_recv(ct, action, len, response_buffer, false);
 }
 
-- 
2.25.1

