Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1054FCCFA1F
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B970F10EB80;
	Fri,  7 Nov 2025 18:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZBriVwGB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D6D10EB79
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539209; x=1794075209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EgR23LyMjmDO0jCpxMT1/dQ6mP7+kLbxl5ZlD8We65I=;
 b=ZBriVwGBigTN79NSyZLE+Y7sgITkcGca/9hX+DtHJCKewjZzJxJAJJXw
 XkMTWV8mLxg+Gk1Kl9dXN7j5WsDIBeYuDR0tOCXuzY2uG1rAUcZ39Magv
 OaFAXEtAuO7ubec4mUPZUWsf/Syfttd8+QilrHXmSRbSXr3C2qhKp2yXf
 M6otVQCArY6sqTDAXGmGmvAt0uyAmbFT1uJwRHz+j1VaO6cfE63EfJaKl
 fj1Fy4YDZ+YxwwRHHajLQ00YUy6YIA25NjYAm0v34AcRMzDovHB0qeBod
 6adH1rCpVZ/OTFQxlymhGbG0+1OTG9hu7urO+IEF4KAI2WxelxumYf68m Q==;
X-CSE-ConnectionGUID: CrW5b6JzQB+umaYtlj+JYg==
X-CSE-MsgGUID: c5E00LknQUGRmdz8/Wwmaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64730187"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64730187"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:29 -0800
X-CSE-ConnectionGUID: ox5SNKOvQvmUVbi9AuniuQ==
X-CSE-MsgGUID: d0+jDOmkS0OgRTTSbRxAmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271167"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:29 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 07/33] drm/xe/forcewake: Add scope-based cleanup for forcewake
Date: Fri,  7 Nov 2025 10:13:23 -0800
Message-ID: <20251107181315.631642-42-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

Since forcewake uses a reference counting get/put model, there are many
places where we need to be careful to drop the forcewake reference when
bailing out of a function early on an error path.  Add scope-based
cleanup options that can be used in place of explicit get/put to help
prevent mistakes in this area.

Examples:

   CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);

       Obtain forcewake on the XE_FW_GT domain and hold it until the
       end of the current block.  The wakeref will be dropped
       automatically when the current scope is exited by any means
       (return, break, reaching the end of the block, etc.).

   xe_with_force_wake(fw_ref, gt_to_fw(ss->gt), XE_FORCEWAKE_ALL) {
        ...
   }

       Hold all forcewake domains for the following block.  As with the
       CLASS usage, forcewake will be dropped automatically when the
       block is exited by any means.

Use of these cleanup helpers should allow us to remove some ugly
goto-based error handling and help avoid mistakes in functions with lots
of early error exits.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 86e9bca7cac9..14f32bdaa10e 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -62,4 +62,16 @@ xe_force_wake_ref_has_domain(struct xe_force_wake_ref fw_ref,
 	return fw_ref.domains & domain;
 }
 
+DEFINE_CLASS(xe_force_wake, struct xe_force_wake_ref,
+	     xe_force_wake_put(_T), xe_force_wake_get(fw, domains),
+	     struct xe_force_wake *fw, unsigned int domains);
+
+/*
+ * Scoped helper for the forcewake class, using the same trick as scoped_guard()
+ * to bind the lifetime to the next statement/block.
+ */
+#define xe_with_force_wake(ref, fw, domains) \
+	for (CLASS(xe_force_wake, ref)(fw, domains), *done = NULL; \
+	     !done; done = (void *)1)
+
 #endif
-- 
2.51.1

