Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966E5E7718A
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 23:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F29510E304;
	Tue, 17 Dec 2024 23:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nXSCf9Vb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C047D10E2E9
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 23:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734476415; x=1766012415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lMYyeS1wAZXWfPzOCb2FEXzwsEcuktxRgB3q3ZwpsW0=;
 b=nXSCf9VbYjhGZtzfbVah+r2+3fDOv73hZDxP9WUaVpc59vzwjR5Rfa2E
 GbV2ZZeP85OLNk9iuAnx7v4NabFsAxqGOHu/AFUGrHDxFvv8wIevgPD25
 /av0Kzv7mV8Ho5cEjqXLGWK2k3YLKVjfgY9/2aA4oxWV8pUQdTmeZMoDb
 /D2y0MC/X5mfxSfkQVWigVf+EPFTsCMkpopKjCEEJz+ckcZy7SmzoRsF7
 N0zqpry9boHrUOP7UsoIMs8jlxfglmy3UumwtpdXaz4rLnh6PDbcIkHDO
 rEr84H/hnm8mZ2PWmzkMsV+l7z3UZF3tOxoxO5Wjjh/3w27s6IKsB1La/ w==;
X-CSE-ConnectionGUID: 4/Nmv7ReR6uZpUtaWX530A==
X-CSE-MsgGUID: zncTu1Z6SwWS0qy6BjSpSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35072201"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="35072201"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:00:15 -0800
X-CSE-ConnectionGUID: PwhPPcbqRJCMdVT+HdmNtg==
X-CSE-MsgGUID: pIOVXlxwS8G6ny7PdVp1Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="97901082"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:00:13 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH 3/3] drm/xe: Print vm parameter in xe_vma trace
Date: Tue, 17 Dec 2024 18:14:20 -0500
Message-Id: <20241217231420.2361302-4-oak.zeng@intel.com>
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

Print the vm that the vma belongs to in the vma trace.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
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

