Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A04EEEE261
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 20:38:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98FF10EC4D;
	Thu, 12 Sep 2024 20:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcZU3kCE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2077310EC4A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 20:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726173512; x=1757709512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uj/R0NCvL7ae1TpIpanY9oL6Vxfk9okDCE3BqPHYxU8=;
 b=LcZU3kCEYDrnfQbCKkCg3YSSoP1Z33Z5wtYNEljGQxSwOutyo/OwsP6Z
 GhIrNspZ/kK6GI5dag2AULCmDUDT3iTwEzV35p5v+c6ljccDlJaBNf1BC
 HgjPeeApEiNdUF2vYoOfWglyt8TGsbgNedllXNhyJSHvSsL3rVvflM8f7
 vWddH2rx2uAiWqolxYZjejJYZ8MF6Fw0EYV2KGwjBsALugYM/Ob0aiyCJ
 Wqd6pOnXM9mTj4WGFWIxUVb/XfxOh/9YwVl1z7xOzxmZY7UV5sou+f5rY
 2m+LvBb24wWruUmxfgpzMi6RiztMOop4wZ7brfJOiiF0Vg+zOiHpgOTEM g==;
X-CSE-ConnectionGUID: jBeYXrCYReKelBwcxxfefw==
X-CSE-MsgGUID: gIhenoqKRcWUzNzUvXwObA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35725112"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="35725112"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 13:38:32 -0700
X-CSE-ConnectionGUID: 04V1C5xdQDGoPblE9FP9mg==
X-CSE-MsgGUID: JBvO2S9HQ8CGgQu8+T5jSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="68126776"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.117])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 13:38:31 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 1/6] drm/xe/guc: Fix GUC_{SUBMIT,FIRMWARE}_VER helper macros
Date: Thu, 12 Sep 2024 22:38:12 +0200
Message-Id: <20240912203817.1880-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240912203817.1880-1-michal.wajdeczko@intel.com>
References: <20240912203817.1880-1-michal.wajdeczko@intel.com>
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

Those macros rely on non-existing MAKE_VER_STRUCT macro, while the
correct one that should be used is named MAKE_GUC_VER_STRUCT.

Fixes: 4eb0aab6e443 ("drm/xe/guc: Bump minimum required GuC version to v70.29.2")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index c3e6b51f7a09..42116b167c98 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -18,8 +18,10 @@
  */
 #define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
 #define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
-#define GUC_SUBMIT_VER(guc)		MAKE_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
-#define GUC_FIRMWARE_VER(guc)		MAKE_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_RELEASE])
+#define GUC_SUBMIT_VER(guc) \
+	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
+#define GUC_FIRMWARE_VER(guc) \
+	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_RELEASE])
 
 struct drm_printer;
 
-- 
2.43.0

