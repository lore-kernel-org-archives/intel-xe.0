Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE22C10DCE
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 00:00:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5AD910E05A;
	Wed,  6 Dec 2023 00:00:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB10010E059
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 00:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701820837; x=1733356837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X5OYQdpvqFZcztXV9fdhO0GhDQTWW4ZN42sgsqw0vgA=;
 b=Kou6wg9gxjg+qIjNuxltG1DN70bH+slly0VutrvTwZMLVEDYdSoTxeUg
 hwn2iBaTsvv94zxBaVZW1nBaGlq0Cavekd8aBx6UjF+pzfNiTQom0u7DE
 0SS0/z3L2vSYADCoHo0wCLVgCZaZlpmni+8ZPAOC4dZ+VmN2PK+BJgBL9
 VN/dxFvTZhOwO7V9+C99f7GxctgYsf5C7SYIgWG2AmBWtzEptoO8/SPvr
 9CBHwEcYRuV/u78gsDKm2LZI0NJm169CcQoKgpQzDH/JhzbZHJoWYVAq/
 5TibpQmpG2QSUR7CWcBViakcYnjKKi4UBcUaWqGL/x+n3WVsoRpyFLvQp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="373438572"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="373438572"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 16:00:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1018379924"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="1018379924"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 16:00:37 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 16:00:30 -0800
Message-ID: <20231206000030.3061046-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206000030.3061046-1-daniele.ceraolospurio@intel.com>
References: <20231206000030.3061046-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] fixup! drm/xe: standardize vm-less kernel
 submissions
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

VM-less permanent queues exists for the whole lifetime of the driver, so
they can't hold a wakeref. Given that these queues are never
disabled/deregistered and should never hang, we don't expect any G2H
messages outside of the submission flow and therefore we don't need the
extra ref at all as long as the driver makes sure to hold a wakeref when
submitting.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index cb284c4ad049..85574740bc1e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -95,7 +95,7 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
 	 * can perform GuC CT actions when needed. Caller is expected to have
 	 * already grabbed the rpm ref outside any sensitive locks.
 	 */
-	if (q->flags & EXEC_QUEUE_FLAG_VM || !vm)
+	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !vm))
 		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
 
 	return q;
@@ -172,7 +172,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 
 	for (i = 0; i < q->width; ++i)
 		xe_lrc_finish(q->lrc + i);
-	if (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm)
+	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
 		xe_device_mem_access_put(gt_to_xe(q->gt));
 	if (q->vm)
 		xe_vm_put(q->vm);
-- 
2.43.0

