Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0F0E7718C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 16:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8751F10EC16;
	Wed, 18 Dec 2024 16:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dh2vpFOL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6E210E445
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 16:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734539667; x=1766075667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JyTJmej4KfF2pYvF4EsVWsM3FuYCfXMmYpiutDKpH+I=;
 b=dh2vpFOLV1k5++4f1QTI4SDi1haLcJo70N2rfl0DMd9rp/gs28XSymGA
 SVxZoOunxJvEeY35D+uP/28DQ6ubJ1L0N/B+tUtkG2Fq4I13+K71PB+Sy
 JxNCV8oDo5x5RhVt8aSYvDqT7+dNBT3kyIU4ew1BCklN1D+7zXx99w+1x
 TGdJuJbFPWE++28FADjHle8GOyFtR4iWASYEI2rK8GyH4jbypd2UNEKO3
 l3yIg6m5ZIaH+d14YYESZEFVVH6wWy6m/CC3VL9YAvjo+EutzwiZc19yh
 u748+alVR2JQO33c0dmYjWEllpQWjikgs010TYeKaljKvBYvb0hdCHACs w==;
X-CSE-ConnectionGUID: krQ7FtRRT1SD6Vy84JJPgQ==
X-CSE-MsgGUID: 95SQ9gF0QEqpqNEucOSBng==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34914893"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="34914893"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 08:34:26 -0800
X-CSE-ConnectionGUID: tlH6Wq3XR9urIBxoTEDRRA==
X-CSE-MsgGUID: hLihWcIkR6Wba0UzbN3vVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98397209"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 08:34:27 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH 3/3] drm/xe: Print vm parameter in xe_vma trace
Date: Wed, 18 Dec 2024 11:48:33 -0500
Message-Id: <20241218164833.2364049-4-oak.zeng@intel.com>
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

Print the vm that the vma belongs to in the vma trace.
This is useful to correlate VMA operations to the VM.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_trace_bo.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index a46f7cfd92c6f..ce4d0d7e81017 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -92,6 +92,7 @@ DECLARE_EVENT_CLASS(xe_vma,
 		    TP_STRUCT__entry(
 			     __string(dev, __dev_name_vma(vma))
 			     __field(struct xe_vma *, vma)
+			     __field(struct xe_vm *, vm)
 			     __field(u32, asid)
 			     __field(u64, start)
 			     __field(u64, end)
@@ -101,14 +102,16 @@ DECLARE_EVENT_CLASS(xe_vma,
 		    TP_fast_assign(
 			   __assign_str(dev);
 			   __entry->vma = vma;
+			   __entry->vm = xe_vma_vm(vma);
 			   __entry->asid = xe_vma_vm(vma)->usm.asid;
 			   __entry->start = xe_vma_start(vma);
 			   __entry->end = xe_vma_end(vma) - 1;
 			   __entry->ptr = xe_vma_userptr(vma);
 			   ),
 
-		    TP_printk("dev=%s, vma=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, userptr=0x%012llx,",
-			      __get_str(dev), __entry->vma, __entry->asid, __entry->start,
+		    TP_printk("dev=%s, vma=%p, vm=%p, asid=0x%05x, start=0x%012llx, end=0x%012llx, userptr=0x%012llx",
+			      __get_str(dev), __entry->vma, __entry->vm,
+			      __entry->asid, __entry->start,
 			      __entry->end, __entry->ptr)
 )
 
-- 
2.26.3

