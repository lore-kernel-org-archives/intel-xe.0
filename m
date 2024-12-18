Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C65E7718B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 16:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F19310EC15;
	Wed, 18 Dec 2024 16:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UloZimi9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A4910EC02
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 16:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734539667; x=1766075667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+5nvbw7Kh0dNAN1y4/6ySti9HWOS1QnjLhJKPEe4RxI=;
 b=UloZimi9m85Rmp0ms2XuJ+maizns43sG79D7V7xCAx4iUWdyB1KjGTJ8
 SP8jUhmu9VvUC9xpWCiytO0h6cRNJdqe9eS0qqJTaLrnCzJnv47dy5ri0
 JrW96S5RX67jkNgkUiQ7zxlQEOPtDSAEp6GmiWNlKya7IPib0XZAACWuc
 pTP1I4t6cB2p7V/MMIQCqb2csIuBwHmOVwgZkdPp0KovHgJ4QqRqqfSZM
 DujQWxBvlwC1FMupydo4Rwz4AkV2OqH0fJ8jvsoOJ1SK5f/gbwpsOfYdU
 n+MN1G19JUOlcMzexj0k3fEfiIKd/Z0scE9P+fn0p1xQzdBF9WQ0cC1LY A==;
X-CSE-ConnectionGUID: UwPw9P3wQ8ukPpEeZxo/yg==
X-CSE-MsgGUID: 4d174Aw6Q6KTDr3r5pSUDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34914891"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="34914891"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 08:34:26 -0800
X-CSE-ConnectionGUID: luQKftO5RamURyKlj9nRLg==
X-CSE-MsgGUID: gkI4DqcTTVeiU50nCjhEpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98397206"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 08:34:27 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH 2/3] drm/xe: Print vm flags in xe_vm trace print
Date: Wed, 18 Dec 2024 11:48:32 -0500
Message-Id: <20241218164833.2364049-3-oak.zeng@intel.com>
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

Print vm flags in xe_vm trace print. This is helpful
to diagnosis the VM mode of operation.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_trace_bo.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 53807f2ef4808..a46f7cfd92c6f 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -190,16 +190,19 @@ DECLARE_EVENT_CLASS(xe_vm,
 			     __string(dev, __dev_name_vm(vm))
 			     __field(struct xe_vm *, vm)
 			     __field(u32, asid)
+			     __field(u32, flags)
 			     ),
 
 		    TP_fast_assign(
 			   __assign_str(dev);
 			   __entry->vm = vm;
 			   __entry->asid = vm->usm.asid;
+			   __entry->flags = vm->flags;
 			   ),
 
-		    TP_printk("dev=%s, vm=%p, asid=0x%05x", __get_str(dev),
-			      __entry->vm, __entry->asid)
+		    TP_printk("dev=%s, vm=%p, asid=0x%05x, vm flags=0x%05x",
+			      __get_str(dev), __entry->vm, __entry->asid,
+			      __entry->flags)
 );
 
 DEFINE_EVENT(xe_vm, xe_vm_kill,
-- 
2.26.3

