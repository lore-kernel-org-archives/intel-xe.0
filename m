Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B418E77184
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 23:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB87010E2E9;
	Tue, 17 Dec 2024 23:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mR0anD15";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2E610E2E9
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 23:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734476415; x=1766012415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5bkWY7S4ghJd40Ig9Y4TV1u7iWHoSjMT2M9eN7mlUP4=;
 b=mR0anD15faVVLEm++xlwlX6Z9VJfbkHYx8A/48ZQLiMuiZXLzx/W7Oa2
 lX9uPwruJYet9T4PGfBMg/1HONfDUSiE3hKgC1tCGU5XZHiWl9kF4CQec
 P5ytkbepb4uwxHcjyopxmsLRF7lDr3OI3FC1jd6YGUbsm+1nrWXJst/jy
 wsqKYN1/ZUZcQe9kQigZHUnXhK8SljqnvGdfX1Pg8An4CYPKfHtEfmEdA
 q0ZUUfJqJekkwT7iCz3fMottCzTU7fGd3fG5tK+VTL4CA7imTzl7w7sqM
 hV1LAwCFNHP1LC/0DNhofsECR0QVzp9t2qOqL+DtQ967aRFZVCCvIDXEp A==;
X-CSE-ConnectionGUID: faPJjWU6S+G4fLxJKH1zCg==
X-CSE-MsgGUID: tWiPgW1GRP6IAC/rkFpcFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35072199"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="35072199"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:00:15 -0800
X-CSE-ConnectionGUID: grCNPFvlSOas2QCrzAC2ZA==
X-CSE-MsgGUID: CCzNOTnYRBKd7wP/n1tAbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="97901076"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:00:13 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH 1/3] drm/xe: trace bo create
Date: Tue, 17 Dec 2024 18:14:18 -0500
Message-Id: <20241217231420.2361302-2-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20241217231420.2361302-1-oak.zeng@intel.com>
References: <20241217231420.2361302-1-oak.zeng@intel.com>
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
index abdeed1c325ea..61f4326e96504 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1649,6 +1649,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 		}
 	}
 
+	trace_xe_bo_create(bo);
 	return bo;
 
 err_unlock_put_bo:
diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 1762dd30ba6dc..53807f2ef4808 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -53,6 +53,11 @@ DEFINE_EVENT(xe_bo, xe_bo_validate,
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

