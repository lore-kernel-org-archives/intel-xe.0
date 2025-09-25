Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65986CAC5B3
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 15:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B7210E983;
	Thu, 25 Sep 2025 15:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UkmZF2EB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA3A10E982
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 15:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758815332; x=1790351332;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DhHH9xwSTsKlqtgWUBVui7DrVy63Jj10h0v8eLOhx/4=;
 b=UkmZF2EBNadRCPZFazLgREJ0llbuxtbCCrJKBgcWLLQq2ei2prA4/1YJ
 /VaCXRP8DEHePb+9hFkWFCr2msYcIkt3zfrMHxf5fBDrQl/tF0L9bXYaQ
 IaIN+n+9WQZdq0K9qMhMD62s9bUy0Dc3HwdJysl9/S9RpDKrieffEUG9+
 zObOFAuAquiwPmSgDQm1Av66x05JX5FMTnzbASmy8d091Od3vhmAcWfL6
 NimXocL3X8S7939GAd/G0OCLEDItJoKQjHZ/2E2IcKS9rLCBWb8niYyZS
 3wpfCmG20sSgAAx1pAmbjok/+HCyyBsxltAaVlbQCkD0BEIa2swaoRTey g==;
X-CSE-ConnectionGUID: dWUId/iBTFyQJG3CFNzldw==
X-CSE-MsgGUID: yzw50SqJQT+7J6g1vJcvQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="64773608"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="64773608"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 08:48:52 -0700
X-CSE-ConnectionGUID: gF6rhWJUQY2F5zHJFHmrCQ==
X-CSE-MsgGUID: ClUOTsGqScGfLpAkLBjYAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="182528127"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa005.jf.intel.com with ESMTP; 25 Sep 2025 08:48:52 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v3] drm/xe/guc: Update GuC log buffer type value
Date: Thu, 25 Sep 2025 11:48:49 -0400
Message-Id: <20250925154849.681901-1-zhanjun.dong@intel.com>
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
v3: Update comments
v2: Use SZ_4K, instead of PAGE_SIZE
    Expand for loop with switch and fallthrough
---
 drivers/gpu/drm/xe/abi/guc_log_abi.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c      | 24 ++++++++++++++----------
 2 files changed, 15 insertions(+), 11 deletions(-)

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
index c01ccb35dc75..9017abf112bf 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -50,15 +50,15 @@ static size_t guc_log_size(void)
 	 *  |     Capture state header      |
 	 *  +-------------------------------+ 96B
 	 *  |                               |
-	 *  +===============================+ PAGE_SIZE (4KB)
-	 *  |        Crash Dump logs        |
-	 *  +===============================+ + CRASH_SIZE
+	 *  +===============================+ 4KB
 	 *  |          Debug logs           |
 	 *  +===============================+ + DEBUG_SIZE
+	 *  |        Crash Dump logs        |
+	 *  +===============================+ + CRASH_SIZE
 	 *  |         Capture logs          |
 	 *  +===============================+ + CAPTURE_SIZE
 	 */
-	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
+	return SZ_4K + DEBUG_BUFFER_SIZE + CRASH_BUFFER_SIZE +
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

