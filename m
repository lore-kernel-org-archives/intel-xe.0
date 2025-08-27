Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA9FCA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 21:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A9310E6C1;
	Wed, 27 Aug 2025 21:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F2J6SOGl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F40910E6C1
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 21:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756331540; x=1787867540;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mu+lRgprTOpe9hju2KrTEcZ4agUO5ZK/XN9UGyisQ7Y=;
 b=F2J6SOGlnoaDsQcjrHc41IEXjej9jwzeFNEip5LtsIDrWyia3uR+7Myv
 zAvmMyn0/DtU/h9bgq5F/7jU7pfkKEl+jwvayMHlswUWY6V/67jUwpVNi
 PyNy2kKE+M9Du7XTAvLuSOqRRDeN+zUbn4qbBh65OSLAAd0vZN6pLcOPV
 x3wVxSQvfOX2xwugUsDM0ZjhNuQWreVNg2JrwAk31rB2Xav8tVobbTB3h
 CC3qVIsMfimX2A6zkGWtSE5+C/DcopECTUvQXpDJJtmYSoWeYMVVckPMB
 LViU5qKUH7v7z5mXc1IGyLnax0jwzHY7LAprKDvMW/5l4l49Q6WS/QMHP Q==;
X-CSE-ConnectionGUID: E4Uu30XSRDC4QyebWRKu8A==
X-CSE-MsgGUID: xQX+cpW7TSqgBOQJStmWtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="68865103"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="68865103"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 14:52:19 -0700
X-CSE-ConnectionGUID: e1xzk3w8QHyjpo+6nKkXEQ==
X-CSE-MsgGUID: BTEtblQQQpiFKlgHd5+Geg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170111313"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa008.jf.intel.com with ESMTP; 27 Aug 2025 14:52:19 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH] drm/xe/guc: Update GuC log buffer type value
Date: Wed, 27 Aug 2025 17:52:17 -0400
Message-Id: <20250827215217.1030775-1-zhanjun.dong@intel.com>
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

Update GuC log buffer type value, make buffer types equal to
guc_log_buffer_type in intel_guc_fwif.h.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_log_abi.h | 2 +-
 drivers/gpu/drm/xe/xe_guc_log.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
index c01ccb35dc75..470c83ead543 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -330,7 +330,7 @@ u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_typ
 	enum guc_log_buffer_type i;
 	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
 
-	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
+	for (i = 0; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
 		if (i == type)
 			break;
 		offset += xe_guc_get_log_buffer_size(log, i);
-- 
2.34.1

