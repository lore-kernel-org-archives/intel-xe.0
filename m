Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071FFD46C08
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 22:27:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AED10E2EC;
	Wed, 28 Jan 2026 22:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hSYIUrVa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7400110E2EC
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 22:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769639252; x=1801175252;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7sNHHooI3LRPpAaffGYOwuxzc/webETKVbA5tY+YXcs=;
 b=hSYIUrVarN2WKE8to80dUVObUWZU9Cx6awptc5pGwuQjdIFxoS7QLrtQ
 HnEIQR4Y4KbaTxYwHYfvFDhgIOPaNtFIv28PQQDOWVaXD7Qos9NK8nDqd
 E6ZfrH/9MCpTnbLZ8cg2gEnvZU1NlwR+NV34S3N17a60SS5AfdXGweAHG
 Ko2aToUAyEbo1cT2ZGljc6XHRtK2HuOjARgBseh0Qr9xcEiUQN4IS6q4l
 bmgFjfOSR+JngC5cT63JdqGO445NntFPhf7nTSs6ZXF47ucHX4GPtm+Nt
 wBQB8AFo8qgtbIt4qU6+oHOa3NMhjy+NDgmbR93kAi8PUzUF1OcdoL9Sf A==;
X-CSE-ConnectionGUID: QtX6J93FSkq0P2M8yhnFPQ==
X-CSE-MsgGUID: ZqmfYUekSLiQYpPcpjhOdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="96328647"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="96328647"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 14:27:32 -0800
X-CSE-ConnectionGUID: zPpVaGhzRV6/3kgqElkKoQ==
X-CSE-MsgGUID: yyQoh2ngTdWAQRjdKSSpYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208821911"
Received: from shankars-mobl1.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.16.241])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 14:27:31 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Simplify IS_SRIOV_PF macro
Date: Wed, 28 Jan 2026 23:27:13 +0100
Message-ID: <20260128222714.3056-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Instead of two having variants of the IS_SRIOV_PF macro, move the
CONFIG_PCI_IOV check to the xe_device_is_sriov_pf() function and
let the compiler optimize that. This will help us drop poor man's
type check of the macro parameter that fails on const xe pointer.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index 6db45df55615..72e55543c30e 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -28,7 +28,8 @@ static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe
 
 static inline bool xe_device_is_sriov_pf(const struct xe_device *xe)
 {
-	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_PF;
+	return IS_ENABLED(CONFIG_PCI_IOV) &&
+		xe_device_sriov_mode(xe) == XE_SRIOV_MODE_PF;
 }
 
 static inline bool xe_device_is_sriov_vf(const struct xe_device *xe)
@@ -36,11 +37,7 @@ static inline bool xe_device_is_sriov_vf(const struct xe_device *xe)
 	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_VF;
 }
 
-#ifdef CONFIG_PCI_IOV
 #define IS_SRIOV_PF(xe) xe_device_is_sriov_pf(xe)
-#else
-#define IS_SRIOV_PF(xe) (typecheck(struct xe_device *, (xe)) && false)
-#endif
 #define IS_SRIOV_VF(xe) xe_device_is_sriov_vf(xe)
 
 #define IS_SRIOV(xe) (IS_SRIOV_PF(xe) || IS_SRIOV_VF(xe))
-- 
2.47.1

