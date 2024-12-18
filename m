Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB34E7718A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 16:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E0B10EC02;
	Wed, 18 Dec 2024 16:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBA1I9gB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0547810E445
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 16:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734539667; x=1766075667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vt6tfo3rhR/AozZCt9ag4TcpdXTMMNb/PPndNPgCuks=;
 b=BBA1I9gBSTwZxiyR2xysZmH0JH8Gi/sotm1psUecbUn40L/gwAo00BGl
 kOQqDKrTCXIu2jS/aDYXzHULof5Yocf/ZUoSY/SMdysg/Gz0TRC943ENr
 vZLz1S8AOu7sEuHz14mu8sIZ3AqZOmq4pqu2m3tAXtFTbgLpQuDcqz62F
 m0dfKm4IglEbIrfaVVoRSp3Gt5VcFekuiGsvmvyXGZ9S6Ka7GGJ2vygKy
 TqaU1mgktcXWN7SByBQim0xXPsJ42rHjHO1xs6hwNgRsOSvEQxGapp93I
 QQndnz+yw/zoKph68mDbmYCcgvLyHmGjDuUwwH0/+1DqWoR2QBWWls4yf Q==;
X-CSE-ConnectionGUID: Gq2Wp/UlQg6/IVDaxL+tFw==
X-CSE-MsgGUID: t7gEW+63T4aFNi3YP5WHdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34914890"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="34914890"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 08:34:26 -0800
X-CSE-ConnectionGUID: +01inf/4Qq2rTrj9H6ibbw==
X-CSE-MsgGUID: nxTYpwT7QPKlsjje30FAaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98397204"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 08:34:26 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH 1/3] drm/xe: trace bo create
Date: Wed, 18 Dec 2024 11:48:31 -0500
Message-Id: <20241218164833.2364049-2-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20241218164833.2364049-1-oak.zeng@intel.com>
References: <20241218164833.2364049-1-oak.zeng@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

