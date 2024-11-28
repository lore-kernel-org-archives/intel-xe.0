Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A374D70DF1
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 21:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B480710E273;
	Thu, 28 Nov 2024 21:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MzxUo51e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE5F10E252
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Nov 2024 21:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732830956; x=1764366956;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FnapmUGd7Rl/r2P1HNv4NxCzViRV4LJ8Mz6lBgAdrp4=;
 b=MzxUo51eNPeiU5lhholRS/9Pz2FfA900UxyMEbrwewRguCjgYxC9z4j4
 yLpoQaO5R0mhU/rMvPPQuhCZYY2ozegn5Q1XavDd8VMkfoWI6UqhOOHls
 a/9o+X0WB/LIFltOAq1aWmoE9WfTDFdOKcTEfJ3nDP/fLRnz7AmAvxMp9
 ILyBWtqf62Uumq11MqnovOSPzZbGNfACcoBm5Vm3POCtJ+UWr2d4L/VQB
 2KonFJayrow4FHcXrJ+qyp61Up/bIlFrD8BHJLXHX4lgju51SV0y/4AnM
 TmWSpEmk6GBfhNb1/FtqRFTZtWDr5BiaIf+8pAH5V5PIIv72e++txeW58 Q==;
X-CSE-ConnectionGUID: 1qDXlg5hRE+T4irVXp0qeA==
X-CSE-MsgGUID: nH/nhsEpSZe3ePPUWYU8ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33199812"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="33199812"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 13:55:55 -0800
X-CSE-ConnectionGUID: n7iGnIx3Rx2qnrJc5f6UBA==
X-CSE-MsgGUID: h4hVqNg7TROzxfBkZuwzjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="93171646"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 13:55:54 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com
Subject: [PATCH 1/3] drm/xe: trace bo create
Date: Thu, 28 Nov 2024 17:09:24 -0500
Message-Id: <20241128220926.1826427-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

Add a tracepoint to trace bo create.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 1 +
 drivers/gpu/drm/xe/xe_trace_bo.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 634a1b54ca60d..885d348d23e10 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1613,6 +1613,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 		}
 	}
 
+	trace_xe_bo_create(bo);
 	return bo;
 
 err_unlock_put_bo:
diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 30a3cfbaaa094..3691897148c36 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -48,6 +48,11 @@ DEFINE_EVENT(xe_bo, xe_bo_cpu_fault,
 	     TP_ARGS(bo)
 );
 
+DEFINE_EVENT(xe_bo, xe_bo_create,
+	     TP_PROTO(struct xe_bo *bo),
+	     TP_ARGS(bo)
+);
+
 TRACE_EVENT(xe_bo_move,
 	    TP_PROTO(struct xe_bo *bo, uint32_t new_placement, uint32_t old_placement,
 		     bool move_lacks_source),
-- 
2.26.3

