Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9EBD70DF6
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 21:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90C310E284;
	Thu, 28 Nov 2024 21:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DJG4gnxK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B2110E273
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Nov 2024 21:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732830956; x=1764366956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MybBx2ZgL7Q5sX2Z4XqYavYXQAz9BVnEhghuX8Vuh+Q=;
 b=DJG4gnxKnEpcdCq3d5DpAyY4IqwPPx+8tyvh8rFXMiaQd3tq+9dVgiEb
 Ekh+yoKW0A3WprMxHg3eGeaCQp75bHcKdNtViVvirkpcYMtRNBA4zAFyf
 UXTKIbX2cAgqiJ4nRwYco8RasWO1OxrGNBpe92R6If5t6GA2tzi/ZIOI+
 wOnwGd62L+FJy4KPWy0LT/KNcUa/MG97+aeTgMX6ObBxR+7cRK+87D0U/
 U9baSUmItWOwURNMGV2ItWB87EUErYZkWszhRKsWhVyBxYfgjzaRDjy+I
 eeHPRqosO+uZWuQFO2Yyyz7x6KBHIlbOixz0YBIPRkYh3kJTh9ey7J9NU w==;
X-CSE-ConnectionGUID: 9MOj0XY0Tiqm0yaK6i021Q==
X-CSE-MsgGUID: tLiSULW5QM6n9oHpJfiXpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33199813"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="33199813"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 13:55:55 -0800
X-CSE-ConnectionGUID: XwUEonEuTta21KwEkqcGzw==
X-CSE-MsgGUID: PTt9xCWTQ4uWn0ObeiEQIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="93171647"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 13:55:54 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com
Subject: [PATCH 2/3] drm/xe: Print vm flags in xe_vm trace print
Date: Thu, 28 Nov 2024 17:09:25 -0500
Message-Id: <20241128220926.1826427-2-oak.zeng@intel.com>
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

Print vm flags in xe_vm trace print.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_trace_bo.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 3691897148c36..5600dff4f8189 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -185,16 +185,19 @@ DECLARE_EVENT_CLASS(xe_vm,
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

