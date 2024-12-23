Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED4AE7718B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Dec 2024 13:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3606310E328;
	Mon, 23 Dec 2024 13:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sc6CkpDw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F5E10E328
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Dec 2024 13:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734961394; x=1766497394;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=92ZDyQHA4dMNZej5iFoSYeJ4l4LHK4HwwqkmzHeinU0=;
 b=Sc6CkpDwaDiy/8XCVe5ndkVoykz1/96vD30zOXKq4p/6g0aIIgZXh407
 kCwoJzaOroxqUMRVGe6es49fQXhaDDxaxqj9rh/2Pxq6WfF/VQWoND2fk
 DqCA9KJ9h4vX1S6Py2txnloyVHQUcfngWNMD+Pq/WT7M8+FegbiS6K3yl
 p5G6HF5AYA87I21ubKHJ/oeSXyRlidCyu2468T65T/VocmXs4Q4tGKbvg
 mn0dMrzoiBn58plGUMG42RYiJFBKY1MzdYhRX8s7XR9QzzPkmA3JKicBR
 PJiBT1fjIEaWdzRLPkaVzusvFE/fo6wwHLmg8fgn2OPqG/AXvCzAZT48f g==;
X-CSE-ConnectionGUID: ebDoGwQDTpqpPXUa5uEHCA==
X-CSE-MsgGUID: Y3BUS2mxT+KC6y6F7JCc0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="46432767"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; d="scan'208";a="46432767"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 05:43:13 -0800
X-CSE-ConnectionGUID: YYPPGDHXQGmWQcjhNSzS+g==
X-CSE-MsgGUID: 9znoT5lrRkmdynp1fN0i/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="104274567"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.74])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 05:43:10 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe/tracing: Fix a potential TP_printk UAF
Date: Mon, 23 Dec 2024 14:42:50 +0100
Message-ID: <20241223134250.14345-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The commit
afd2627f727b ("tracing: Check "%s" dereference via the field and not the TP_printk format")
exposes potential UAFs in the xe_bo_move trace event.

Fix those by avoiding dereferencing the
xe_mem_type_to_name[] array at TP_printk time.

Since some code refactoring has taken place, explicit backporting may
be needed for kernels older than 6.10.

Fixes: e46d3f813abd ("drm/xe/trace: Extract bo, vm, vma traces")
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.11+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_trace_bo.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 1762dd30ba6d..ea50fee50c7d 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -60,8 +60,8 @@ TRACE_EVENT(xe_bo_move,
 	    TP_STRUCT__entry(
 		     __field(struct xe_bo *, bo)
 		     __field(size_t, size)
-		     __field(u32, new_placement)
-		     __field(u32, old_placement)
+		     __string(new_placement_name, xe_mem_type_to_name[new_placement])
+		     __string(old_placement_name, xe_mem_type_to_name[old_placement])
 		     __string(device_id, __dev_name_bo(bo))
 		     __field(bool, move_lacks_source)
 			),
@@ -69,15 +69,15 @@ TRACE_EVENT(xe_bo_move,
 	    TP_fast_assign(
 		   __entry->bo      = bo;
 		   __entry->size = bo->size;
-		   __entry->new_placement = new_placement;
-		   __entry->old_placement = old_placement;
+		   __assign_str(new_placement_name);
+		   __assign_str(old_placement_name);
 		   __assign_str(device_id);
 		   __entry->move_lacks_source = move_lacks_source;
 		   ),
 	    TP_printk("move_lacks_source:%s, migrate object %p [size %zu] from %s to %s device_id:%s",
 		      __entry->move_lacks_source ? "yes" : "no", __entry->bo, __entry->size,
-		      xe_mem_type_to_name[__entry->old_placement],
-		      xe_mem_type_to_name[__entry->new_placement], __get_str(device_id))
+		      __get_str(old_placement_name),
+		      __get_str(new_placement_name), __get_str(device_id))
 );
 
 DECLARE_EVENT_CLASS(xe_vma,
-- 
2.47.1

