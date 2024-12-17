Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B6CE77188
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 23:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D73610E2FE;
	Tue, 17 Dec 2024 23:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGQDqMxa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3AA10E27C
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 23:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734476415; x=1766012415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kMdCPxTLE+YqsqzYoC7LTtBnGwkA+5CxSO4bYtKwaxY=;
 b=eGQDqMxaDL4QwrWTkXxp3cy4lqFit186UIoLzWQ29XVn20dpzbVwbaRf
 Cvv4kJyerSrvF4ILFsXHox3qde9YZfxVI5I2E+18DK+w5V/5byjhd72XY
 AJAZH0ruXJBQvCVfiICXkLGcjDzwZOj+qv9eZdqV5uLLAUjhGq+hjykG7
 u0J2Iol4ftzAQV3EEMN9tHC1Hb/hGBmPNmt6VT5jpVgdePWXJREZtoHKI
 VBojh8Q/Gksmqcu7m0kpyYSRw33Zphue7Sjq68HIVH+XXUdCPJfmpYFSj
 RDin/Agr4X8K7fK4GslZjUnn0N4Hvgji5Phpg0crBS0eE4PJIXOB8TVV/ g==;
X-CSE-ConnectionGUID: U9Sv86XWQ2SC8HzsNGZ8Uw==
X-CSE-MsgGUID: nhfwNwFpT5aHx2NvtJMOGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35072200"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="35072200"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:00:15 -0800
X-CSE-ConnectionGUID: /Y32xKX0QCaKgKFHdsjU1Q==
X-CSE-MsgGUID: aTxryatVSr2j0vlkdIqxkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="97901079"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:00:13 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH 2/3] drm/xe: Print vm flags in xe_vm trace print
Date: Tue, 17 Dec 2024 18:14:19 -0500
Message-Id: <20241217231420.2361302-3-oak.zeng@intel.com>
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

Print vm flags in xe_vm trace print.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
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

