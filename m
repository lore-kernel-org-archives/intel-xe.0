Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706F0CD13CF
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFFB10E464;
	Mon, 10 Nov 2025 23:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BMMHskrE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5C210E444
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762816833; x=1794352833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BnBIqTlq0eR0Q89p6YXa2KILcg70M3yNh+94wruq6vs=;
 b=BMMHskrEIddLRYuVwACes2Fqn8EfqaVbrz4QA+LC+5tEFn6TwuMV2bXy
 ZZ4WB1htFtk8cLIuH/jIjsNn7SsclNSzWlZQnnDDMC+9YhwhL0GKfcUHK
 8IuKIHb1xQH2aN4rkFoEucpOcQkDFz5ECovv3dgobeWbVJ6ewB0oDKnox
 CH1JGoLDN77sjtAsKcqkwYvaJ1nd5yYC3nF2dXuliPKESSdsNhFVY90dB
 dMPygtplxf2AvMzwLlJG+S/7B8z6dLJhv58vKbuQ1iTMg75hxF8CQZnZ2
 3w7n0y03PJ8QtIZ06gklJ8AzXxaLk36I3XWGu7yOKJzyJn4YJ7V1jRrno g==;
X-CSE-ConnectionGUID: XxUG+5V5QAW2l/fG2JICfg==
X-CSE-MsgGUID: 5IRmkvO6RuKcvrhvelaLKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="67480249"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="67480249"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
X-CSE-ConnectionGUID: HeKY2CnuS7ep8PkSFzim4g==
X-CSE-MsgGUID: sLNVFNvJR56O6PTBItxu+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189243957"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 04/30] drm/xe/forcewake: Add scope-based cleanup for
 forcewake
Date: Mon, 10 Nov 2025 15:20:22 -0800
Message-ID: <20251110232017.1475869-36-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110232017.1475869-32-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
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

v2:
 - Create a separate constructor that just wraps xe_force_wake_get for
   use in the class.  This eliminates the need to update the signature
   of xe_force_wake_get().  (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 0e3e84bfa51c..0204503b53a0 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -61,4 +61,32 @@ xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains dom
 	return fw_ref & domain;
 }
 
+struct xe_force_wake_ref {
+	struct xe_force_wake *fw;
+	unsigned int domains;
+};
+
+static struct xe_force_wake_ref
+xe_force_wake_constructor(struct xe_force_wake *fw, unsigned int domains)
+{
+	struct xe_force_wake_ref fw_ref = { .fw = fw };
+
+	fw_ref.domains = xe_force_wake_get(fw, domains);
+
+	return fw_ref;
+}
+
+DEFINE_CLASS(xe_force_wake, struct xe_force_wake_ref,
+	     xe_force_wake_put(_T.fw, _T.domains),
+	     xe_force_wake_constructor(fw, domains),
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

