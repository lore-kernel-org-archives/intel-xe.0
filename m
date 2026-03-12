Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91687105A591
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 12:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4938510E9E2;
	Thu, 12 Mar 2026 12:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ijD0CL6j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3C210E9E2
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 12:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773319996; x=1804855996;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UnJuwaBBDuviLSH7W3ESpAS8kp9rB1rT63n3WZm6QCo=;
 b=ijD0CL6jyJEp36ol68h6TqZI2CbYn50n9r9AwRp5fnteWbHE9jSNauYM
 r0Vz4zVpdlIBhdjYT1xYbPxUV5ttk8KnLh+KERxLRWp2elg9O8JbsNXXi
 u9A1LgKmq+fvXlhOEGEK4FZJjilH+Q2sYckum8U3wKtOBVoh8xj6HgcME
 eWJaIultID+UvGgj8ZdcV22NyisaaFk1xgHS0eu0VSiQNmw7DBbdzZsOK
 ToFORtjEfgypv6ooBV/6aCVYKp6aS4N/zdq/+GuDghE+SHi6dPnpUIIC2
 KtlEHss70R0CFJbfQ5oSzfelSU+3VZI9tl+3ycP/HLssYt1RR5SzD2Wpt Q==;
X-CSE-ConnectionGUID: Bfwi3TWWQbWd7P132QNUqg==
X-CSE-MsgGUID: wblzMfL8Q0qRGQtVd3ixHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="73597696"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="73597696"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 05:53:15 -0700
X-CSE-ConnectionGUID: uhNnXaoyTJ6W/tmTXj0RdA==
X-CSE-MsgGUID: +xQaS6K9TTuX+Oa9EQQ2Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="220875368"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 05:53:14 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/lrc: Fix uninitialized new_ts when capturing context
 timestamp
Date: Thu, 12 Mar 2026 05:53:09 -0700
Message-ID: <20260312125308.3126607-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
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

Getting engine specific CTX TIMESTAMP register can fail. In that case,
if the context is active, new_ts is uninitialized. Fix that case by
initializing new_ts to the last value that was sampled in SW -
lrc->ctx_timestamp.

Flagged by static analysis.

v2: Fix new_ts initialization (Ashutosh)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index aa26c71ae34f..04304dff45b0 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2563,14 +2563,14 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
  * @lrc: Pointer to the lrc.
  *
  * Return latest ctx timestamp. With support for active contexts, the
- * calculation may bb slightly racy, so follow a read-again logic to ensure that
+ * calculation may be slightly racy, so follow a read-again logic to ensure that
  * the context is still active before returning the right timestamp.
  *
  * Returns: New ctx timestamp value
  */
 u64 xe_lrc_timestamp(struct xe_lrc *lrc)
 {
-	u64 lrc_ts, reg_ts, new_ts;
+	u64 lrc_ts, reg_ts, new_ts = lrc->ctx_timestamp;
 	u32 engine_id;
 
 	lrc_ts = xe_lrc_ctx_timestamp(lrc);
-- 
2.51.0

