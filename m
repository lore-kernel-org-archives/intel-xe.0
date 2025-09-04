Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BA5CA1013
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 15:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1827510EA7E;
	Thu,  4 Sep 2025 15:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lRje+wvv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC43810EA7E
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 15:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756998850; x=1788534850;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qTnGeS5w9/AxlNmmY608p9719SXihgi8lhca1OXO9gQ=;
 b=lRje+wvv+ZQZOXNt6t3wj38KLq/JtujrkG7/BiWZ+S3jvr2bksRSZUtX
 iYpTPuGSgzzj5b/1Ygd9UQ6ndmjNxHQljh3SF4g4h/e8B6PygvMmH3dB/
 fFb3WcRtvwdi0RkayE4T9LImpNeyVz/uOzVilEDWO/qBTrd3ulfVu3TIN
 ZUIlYH28WZQWCaC8NeDoTI/S3zsBHWnat7myzdCbQwYZIae2Xhx4eAxtk
 QjG9161i0KEM1A4qQlJcLhh9vHMCtxHtUF9EEOp3zyHbSMRzNOU2jk5u0
 tM4cGydB/pGOXyq1X0asl311i1Ym8AxER1UPEERWZ1AxJVHmHDBjONZTT g==;
X-CSE-ConnectionGUID: rHOy9VL0T1qitTgyED325Q==
X-CSE-MsgGUID: RsA5mjn+QB2HrHhE4xVfdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59409089"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="59409089"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 08:14:09 -0700
X-CSE-ConnectionGUID: hFZqDvR9TbC+1dnEYvyjyQ==
X-CSE-MsgGUID: yHt5VxVnRg2sWX+JLQArdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="171154813"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa006.jf.intel.com with ESMTP; 04 Sep 2025 08:14:09 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, john.c.harrison@intel.com,
 michal.wajdeczko@intel.com, Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v2] drm/xe/guc: Update GuC log buffer type value
Date: Thu,  4 Sep 2025 11:14:06 -0400
Message-Id: <20250904151406.736972-1-zhanjun.dong@intel.com>
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

Update GuC log buffer type value, to align with the GuC specification.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
Change list:
v2: Use SZ_4K, instead of PAGE_SIZE
    Expand for loop with switch and fallthrough
---
 drivers/gpu/drm/xe/abi/guc_log_abi.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c      | 20 ++++++++++++--------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
index 554630b7ccd9..b1819679fa35 100644
--- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
@@ -10,8 +10,8 @@
 
 /* GuC logging buffer types */
 enum guc_log_buffer_type {
-	GUC_LOG_BUFFER_CRASH_DUMP,
 	GUC_LOG_BUFFER_DEBUG,
+	GUC_LOG_BUFFER_CRASH_DUMP,
 	GUC_LOG_BUFFER_CAPTURE,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index c01ccb35dc75..6cbb0378d2ba 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -50,7 +50,7 @@ static size_t guc_log_size(void)
 	 *  |     Capture state header      |
 	 *  +-------------------------------+ 96B
 	 *  |                               |
-	 *  +===============================+ PAGE_SIZE (4KB)
+	 *  +===============================+ 4KB
 	 *  |        Crash Dump logs        |
 	 *  +===============================+ + CRASH_SIZE
 	 *  |          Debug logs           |
@@ -58,7 +58,7 @@ static size_t guc_log_size(void)
 	 *  |         Capture logs          |
 	 *  +===============================+ + CAPTURE_SIZE
 	 */
-	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
+	return SZ_4K + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
 		CAPTURE_BUFFER_SIZE;
 }
 
@@ -327,13 +327,17 @@ u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type
  */
 u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
 {
-	enum guc_log_buffer_type i;
-	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
+	u32 offset = SZ_4K; /* 1st section size */
 
-	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
-		if (i == type)
-			break;
-		offset += xe_guc_get_log_buffer_size(log, i);
+	switch (type) {
+	case GUC_LOG_BUFFER_CAPTURE:
+		offset += xe_guc_get_log_buffer_size(log, GUC_LOG_BUFFER_CRASH_DUMP);
+		fallthrough;
+	case GUC_LOG_BUFFER_CRASH_DUMP:
+		offset += xe_guc_get_log_buffer_size(log, GUC_LOG_BUFFER_DEBUG);
+		fallthrough;
+	case GUC_LOG_BUFFER_DEBUG:
+		break;
 	}
 
 	return offset;
-- 
2.34.1

