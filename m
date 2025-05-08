Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E60BC3ABCB
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 01:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5E110E2C1;
	Thu,  8 May 2025 01:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nNT2Z/el";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D885810E2B8
 for <Intel-Xe@lists.freedesktop.org>; Thu,  8 May 2025 01:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746668079; x=1778204079;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cbD+3ifdRKXuwKAgVXB2EHiKbXrUFLvyt0FEkrF87Sk=;
 b=nNT2Z/elnFFTxRjJM6uWNaJacPjZj4fpV97bx6XBdwE3ckG9b8tCeEHp
 0AqSwcpsEOSCUIlw1yTGJL953O/TguDyaCROWcL4HOHN7HpSqWNU5w52H
 bQywkRnquoY5f83eqhM3VXOryoAyB/+ZapK161XZxypDJvKrNscsV6cPz
 iaM89Nhu/2/xCOF+8zm+qBS6oAN/anfPX16KnQP9gsU3VnbxLIGbhvJc7
 V7aikGyRKhaYmiObt+C3bU+zERIM7rtplt4BWwajS96OVJAEpJolrCH98
 TWVY8TyoTecTEnmhM+UQuDwzojvt8Ajw8eWStQ3LrtET5orkkNeI50etX A==;
X-CSE-ConnectionGUID: rpjWJMTITgq9hY3zvg0lsg==
X-CSE-MsgGUID: 89fpIEEgSv21I66Nz3yIkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48538280"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="48538280"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 18:34:38 -0700
X-CSE-ConnectionGUID: Am242UZbRgCFAnYZjbo6rg==
X-CSE-MsgGUID: 2DYGqEtTRDm6vlCztCC3cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="136094250"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa006.fm.intel.com with ESMTP; 07 May 2025 18:34:37 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 3/4] drm/xe/guc: Rename CONFIG_XE_LARGE_GUC_BUFFER
Date: Wed,  7 May 2025 18:34:36 -0700
Message-ID: <20250508013437.652982-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508013437.652982-1-John.C.Harrison@Intel.com>
References: <20250508013437.652982-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Rename XE_LARGE_GUC_BUFFER to XE_DEBUG_GUC to allow for more debug
only code (in subsequent patch) without adding more config defines
that each control only a single thing.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug | 8 +++++---
 drivers/gpu/drm/xe/xe_guc_log.h  | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 0d749ed44878..db063a513b1e 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -86,12 +86,14 @@ config DRM_XE_KUNIT_TEST
 
 	  If in doubt, say "N".
 
-config DRM_XE_LARGE_GUC_BUFFER
-        bool "Enable larger guc log buffer"
+config DRM_XE_DEBUG_GUC
+        bool "Enable extra GuC related debug options"
+        depends on DRM_XE_DEBUG
         default n
         help
           Choose this option when debugging guc issues.
-          Buffer should be large enough for complex issues.
+          The GuC log buffer is increased to the maximum allowed, which should
+          be large enough for complex issues.
 
           Recommended for driver developers only.
 
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 5b896f5fafaf..f1e2b0be90a9 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -12,7 +12,7 @@
 struct drm_printer;
 struct xe_device;
 
-#if IS_ENABLED(CONFIG_DRM_XE_LARGE_GUC_BUFFER)
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
 #define CRASH_BUFFER_SIZE       SZ_1M
 #define DEBUG_BUFFER_SIZE       SZ_8M
 #define CAPTURE_BUFFER_SIZE     SZ_2M
-- 
2.49.0

