Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2703CC5CFCF
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 23:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FE410EDD7;
	Tue, 11 Aug 2026 23:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AtdBE/vn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7921010E3A7
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 23:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786492386; x=1818028386;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=v7DK7qEBe7rGmkNtXNVa9z9KUDXuhNmXvat/1hM7Wr0=;
 b=AtdBE/vneZvBSP5NmXrz0vVMwaNhk95jfFs3AsR2Lfn7iZv6SUawo4Pz
 P7JLIF5J4bfxBxKM91Nyr6pkAvcWgO+ST/xJJce4K/hT4QnT3X3VF5d7A
 Wr5wKp9zS5aj9ripzfeLDOplU0hHfyLRlTm9bBKtZ1BU29cCgC5e1Jbud
 TQqzhh8S4C7m7WgDpjCrf+Tq8pOfADecXWCMM36dDwP72InIWVu49RyH5
 ldyDQf5qQgZ4ASSiQjT2NV34N+4WDvpZgbNIzCcjpJ4UNWAh33nZWv3Xz
 QYvURyDDKhHZcfLDewINonkP8fxh+flkube2gIalPQ5r6PHyPbPz3Q2gK Q==;
X-CSE-ConnectionGUID: gu7lAJesT/ehdZlGa/H8Sg==
X-CSE-MsgGUID: RGo8zD1ZRvaapLJqv4O5tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98183267"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="98183267"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 16:53:05 -0700
X-CSE-ConnectionGUID: k3agcKodSzK8QO5gzzev8A==
X-CSE-MsgGUID: Xo9XQ/zRRFywI7KqGLVBAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="261729329"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 16:53:05 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, mallesh.koujalagi@intel.com
Subject: [PATCH 3/4] drm/xe/pcode: Report pcode errors using SIGID
Date: Tue, 11 Aug 2026 16:52:58 -0700
Message-ID: <20260811235254.153783-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260811235254.153783-6-umesh.nerlige.ramappa@intel.com>
References: <20260811235254.153783-6-umesh.nerlige.ramappa@intel.com>
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

Use xe_log_err() to report pcode errors using SIGID.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index e9125341481b..b35c1a77effd 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -14,6 +14,7 @@
 #include "regs/xe_pmt.h"
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_log.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
 #include "xe_pm.h"
@@ -61,9 +62,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
 	}
 
 	if (err) {
-		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
-			err_decode, err_str);
-
+		xe_log_err(tile, PCODE, err_decode, "Mailbox failed: %s\n", err_str);
 		return err_decode;
 	}
 
@@ -225,6 +224,9 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
 				true, 50 * 1000, true);
 	preempt_enable();
 
+	if (!status && ret)
+		xe_log_err(tile, PCODE, ret, "Request timed out on retry");
+
 out:
 	mutex_unlock(&tile->pcode.lock);
 	return status ? status : ret;
@@ -319,8 +321,8 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
 		mutex_unlock(&tile->pcode.lock);
 
 	if (ret)
-		drm_err(&xe->drm,
-			"PCODE initialization timedout after: 3 min\n");
+		xe_log_err(xe, PCODE, -ret,
+			"Initialization timed out after: %d min\n", timeout_us / 60000000);
 
 	return ret;
 }
-- 
2.51.0

