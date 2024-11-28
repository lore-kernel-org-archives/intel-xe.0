Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D42D70DF5
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 21:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A3C10E252;
	Thu, 28 Nov 2024 21:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lHwugn25";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2529A10E252
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Nov 2024 21:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732830956; x=1764366956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NzCnjP4GV+vPyRtcUhB7015oUsT3wnilOCT+yid48vU=;
 b=lHwugn25oFXJMGFY6cnWxpLvgWRT+z9k8jnLK+cr6J4qi4VPTJEW2o6J
 2YSdw6l64P6JXKNqUxtr1QmSwtNzGDRC/YxHTcNJZ9M3TYiVwbZPFyIRy
 N2UC+zH9p49pQl5bLnyUEQGcP7xFMEKZtMMj2nQQS9EjxByC6u1AZRN12
 yOACGxABYSuX0XywXxsi91hQ2bPOWrOL/qWJYuoZQ19C6FAld88DofTFT
 PAP0kfTdPPhcnOHJCagf3KSXwOIEfNNPyI8eI9YQVogRm+1xjBpi78oHI
 SHMTJzeiT9ESe9x1CIFRn51Vb9QHzxt0z6ZKqZAXNB3unFnuO9DLdmKBD A==;
X-CSE-ConnectionGUID: 3PHVE/RDSuu40UIWAb4iqA==
X-CSE-MsgGUID: ZiggjQf2S/euoWMHWangkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33199814"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="33199814"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 13:55:55 -0800
X-CSE-ConnectionGUID: y7pChc14STCoXW07b23Iqg==
X-CSE-MsgGUID: FCKY8d+rRWeSEycNw8n23A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="93171648"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 13:55:54 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com
Subject: [PATCH 3/3] drm/xe: Print vm parameter in xe_vma trace
Date: Thu, 28 Nov 2024 17:09:26 -0500
Message-Id: <20241128220926.1826427-3-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20241128220926.1826427-1-oak.zeng@intel.com>
References: <20241128220926.1826427-1-oak.zeng@intel.com>
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

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_trace_bo.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 5600dff4f8189..c6d3140542cff 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -87,6 +87,7 @@ DECLARE_EVENT_CLASS(xe_vma,
 		    TP_STRUCT__entry(
 			     __string(dev, __dev_name_vma(vma))
 			     __field(struct xe_vma *, vma)
+			     __field(struct xe_vm *, vm)
 			     __field(u32, asid)
 			     __field(u64, start)
 			     __field(u64, end)
@@ -96,14 +97,16 @@ DECLARE_EVENT_CLASS(xe_vma,
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

