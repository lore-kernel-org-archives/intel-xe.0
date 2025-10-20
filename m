Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C148CCD1A2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 21:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1716710E52D;
	Mon, 20 Oct 2025 21:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UAy2jx4T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255C810E52B
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 21:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760996733; x=1792532733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g6wQHDqM/l1n16EmnhJ3NJnEajkPhM0hz4bpTTQa0jo=;
 b=UAy2jx4TV5GvdDLiBqiTRzjXUUBg0OL1MhvuM6bJyQxa76yfGUTH9aV4
 NgLC6GNyggSBG673nUSRKV567ECYDNVWDF6x/CRFFYn6obTruQKaW1M4T
 26jDKvvChvko5w/iu6RxrnLkaERPPdyfrxlDp2TIe5LogYI1K0Ob1VLyV
 /ODfbZz6nDeptc7woTdjl2dhYRJtwAVjQcnwCGIgu0YfJOJL1dLuiC6nj
 6KUH3NQcXHaXlFLIYReX2994pqLw0RK+P5d6oyxSR2t6ZZcTpeeDeGZ8A
 +7RftyFiinEYcOD1ZfBEcb/e+pUjcfYdtXrRtP5ReULK8zLzy/krChmcl Q==;
X-CSE-ConnectionGUID: a0N4uMvOSO+4bv1WmXv7tw==
X-CSE-MsgGUID: FUtJ2V6qRFOO4uK5ASYSyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63160724"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63160724"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 14:45:32 -0700
X-CSE-ConnectionGUID: tAHqD1SlTRGEo2uWHUGT8Q==
X-CSE-MsgGUID: ikgkGlRmQT6HEY76rilRfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183451183"
Received: from dut4084arlh.fm.intel.com ([10.105.10.142])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 14:45:32 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 niranjana.vishwanathapura@intel.com, zhanjun.dong@intel.com,
 shuicheng.lin@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 3/7] drm/xe: Add the BO pointer info to the BO trace
Date: Mon, 20 Oct 2025 21:45:25 +0000
Message-Id: <20251020214529.354365-4-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251020214529.354365-1-stuart.summers@intel.com>
References: <20251020214529.354365-1-stuart.summers@intel.com>
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

Just a little extra detail to make BOs easier to track
through the trace event log.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_trace_bo.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 238311cfb816..0d795733e0f0 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -27,6 +27,7 @@ DECLARE_EVENT_CLASS(xe_bo,
 
 		    TP_STRUCT__entry(
 			     __string(dev, __dev_name_bo(bo))
+			     __field(struct xe_bo *, bo)
 			     __field(size_t, size)
 			     __field(u32, flags)
 			     __field(struct xe_vm *, vm)
@@ -34,13 +35,14 @@ DECLARE_EVENT_CLASS(xe_bo,
 
 		    TP_fast_assign(
 			   __assign_str(dev);
+			   __entry->bo = bo;
 			   __entry->size = xe_bo_size(bo);
 			   __entry->flags = bo->flags;
 			   __entry->vm = bo->vm;
 			   ),
 
-		    TP_printk("dev=%s, size=%zu, flags=0x%02x, vm=%p",
-			      __get_str(dev), __entry->size,
+		    TP_printk("dev=%s, %p, size=%zu, flags=0x%02x, vm=%p",
+			      __get_str(dev), __entry->bo, __entry->size,
 			      __entry->flags, __entry->vm)
 );
 
-- 
2.34.1

