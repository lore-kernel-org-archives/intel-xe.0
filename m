Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9B7CD5BB4
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 08:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75B810E60B;
	Tue, 26 May 2026 08:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QCj7EPnK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3324510E60B
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 08:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779784052; x=1811320052;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ioEZ6WvefOjoITTdAiBFdAudrLo+b9riw8aqcjV15xE=;
 b=QCj7EPnKD9B90tOH9M20Emn7ilWHbLqVSubj1etTfkTjYdbgJaQSCbid
 yLtQyQr5fSBihLQnPvbyLmphGhrHOjl5QkgiuEcuXq0WI+jQ2zsf6UlA1
 gxTWueuc/voiyQvlPYhm9K0a5vkH5LyrSEslkNnAcpRKLyBOTd2+k7hLt
 Z/Vi4viSESWhzmgIxlskmPY8+FBgdXjaSN7PdlKur3rH4k0/FWq9nNTtc
 pBiBx2ctSPuDT+cShJRkh9PTq5+pXLCO+BS3x8GpWZv1t/L90Dgp5G5Kp
 Lwpcre42uaTdCGBReiB34W67Cn4to1T+aib+44AR/jtN+yhf4vbt3piXY w==;
X-CSE-ConnectionGUID: YaXiSoluSoGkVfPAdO28iQ==
X-CSE-MsgGUID: jluXFmY5QyGMSy6zuY8sPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91698414"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="91698414"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 01:27:32 -0700
X-CSE-ConnectionGUID: Lbjjs2BtRSmkDW9Wk47abQ==
X-CSE-MsgGUID: c8Zd7BuKTX+WQgdraIcjrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="239251755"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa008.fm.intel.com with ESMTP; 26 May 2026 01:27:29 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, matthew.d.roper@intel.com,
 thomas.hellstrom@intel.com, daniele.ceraolospurio@intel.com,
 matthew.auld@intel.com, stuart.summers@intel.com, x.wang@intel.com,
 brian3.nguyen@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 4/5] drm/xe: add exec queue suspended ops callback
Date: Tue, 26 May 2026 13:56:59 +0530
Message-ID: <20260526082700.1383831-5-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260526082700.1383831-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260526082700.1383831-1-tilak.tirumalesh.tangudu@intel.com>
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Add a suspended callback to xe_exec_queue_ops and a generic
xe_exec_queue_is_suspended() helper.

Hook up exec queue suspended-state callback for GuC.

This allows callers to query suspended state through exec queue ops

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.h       | 5 +++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 8 ++++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 0225426c57b0..b66637325a11 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -116,6 +116,11 @@ static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_
 
 bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
 
+static inline bool xe_exec_queue_is_suspended(struct xe_exec_queue *q)
+{
+	return q->ops->suspended ? q->ops->suspended(q) : false;
+}
+
 bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
 
 void xe_exec_queue_kill(struct xe_exec_queue *q);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 2f5ccf294675..0cb7d49a1c83 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -320,6 +320,8 @@ struct xe_exec_queue_ops {
 	bool (*reset_status)(struct xe_exec_queue *q);
 	/** @active: check exec queue is active */
 	bool (*active)(struct xe_exec_queue *q);
+	/** @suspended: check exec queue is suspended */
+	bool (*suspended)(struct xe_exec_queue *q);
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 787a02c46652..2d7f25880cfb 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2217,6 +2217,13 @@ static bool guc_exec_queue_active(struct xe_exec_queue *q)
 		!exec_queue_pending_disable(primary);
 }
 
+static bool guc_exec_queue_suspended(struct xe_exec_queue *q)
+{
+	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+
+	return exec_queue_suspended(primary);
+}
+
 /*
  * All of these functions are an abstraction layer which other parts of Xe can
  * use to trap into the GuC backend. All of these functions, aside from init,
@@ -2237,6 +2244,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.resume = guc_exec_queue_resume,
 	.reset_status = guc_exec_queue_reset_status,
 	.active = guc_exec_queue_active,
+	.suspended = guc_exec_queue_suspended,
 };
 
 static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
-- 
2.46.0

