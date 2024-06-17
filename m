Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D39C27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 14:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F74C10E3DB;
	Mon, 17 Jun 2024 14:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fmoHCl7t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4AF10E3D4
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 14:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718632898; x=1750168898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Idhg/rilc3Ncu3Vub43xi2zol9u4lMQ2X3XlmRP6Rkc=;
 b=fmoHCl7tUONgaoiiuUMqtlpJzVqdqVgxwke5qmreH2pFELRESO65boqY
 2wpV8Cs9UILTtGxzpY2Elc0BV884FAfW6o5/i5Ko7HMiT7SVk1om9RzUU
 VbQIcnvYZzRLx1ft0qu/f9jnafHftK6mrMP/sn5gmiFpAvolzmUjzX2VA
 H1mYeYeL9XITQZHM68zaZX7W2QR7l0VSUPX5r40d/rkEmydX8Ben3VgxK
 f+e2r6SzFDRqouPen1LmgjK9WbqVtXAJhoiSJEAkuq9kMtMHw5VtIY5xS
 n+qSDP7hT+4P4k0jA10dZIP414ss6Cu0lUhWgVK8E9lD+TyPz/rRPO3DG w==;
X-CSE-ConnectionGUID: Ojnw6iinS4ug9uthf028yg==
X-CSE-MsgGUID: 8snztHtES4K881Ar+csjrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="12109876"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="12109876"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:01:38 -0700
X-CSE-ConnectionGUID: LcItxguSQhmvDyxg9UegOA==
X-CSE-MsgGUID: VoUyEEK0RiyfrvJ49xXEcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="41142197"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:01:36 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [RFC 1/2] drm/xe: Introduce PM guard classes
Date: Mon, 17 Jun 2024 16:01:19 +0200
Message-Id: <20240617140120.597-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240617140120.597-1-michal.wajdeczko@intel.com>
References: <20240617140120.597-1-michal.wajdeczko@intel.com>
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

There is support for 'classes' with constructor and destructor
semantics that can be used for scope-based resource management,
like our device power management.

Use provided macros from linux/cleanup.h to generate required
code definitions.

This should allow us to use:

	scoped_guard(xe_pm, xe)
		foo();
or
	CLASS(xe_pm, var)(xe);

without any concern of leaking the pm reference.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 104a21ae6dfd..26293a3b18af 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -6,6 +6,7 @@
 #ifndef _XE_PM_H_
 #define _XE_PM_H_
 
+#include <linux/cleanup.h>
 #include <linux/pm_runtime.h>
 
 #define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
@@ -33,4 +34,8 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
 void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
 struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
 
+DEFINE_GUARD(xe_pm, struct xe_device *, xe_pm_runtime_get(_T), xe_pm_runtime_put(_T))
+DEFINE_GUARD_COND(xe_pm, _if_active, xe_pm_runtime_get_if_active(_T))
+DEFINE_GUARD_COND(xe_pm, _if_in_use, xe_pm_runtime_get_if_in_use(_T))
+
 #endif
-- 
2.43.0

