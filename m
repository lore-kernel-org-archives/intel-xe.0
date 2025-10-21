Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD96CCD1AF
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 18:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3334A10E636;
	Tue, 21 Oct 2025 18:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V7gu9ldr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5FC10E61D
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 18:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761070289; x=1792606289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ftrDtWULU+APINDo7afPbKsjZg0M/U6SgRdSizE61CQ=;
 b=V7gu9ldrNEOtbTuZgqP462xaztNIbeZRNl3u+2wG2nasXoVCURAJUl25
 KCF/47Fz2aiiOEcwm3ghMZX6UWbtYw8N+oSNZJpdu95ncWCzbsSxWGKKQ
 CLAWu37EKwhoc5g+TX/otIxmLycMOFAQQ8wsemP6ipLHlrnlbI+kdRk4S
 C0z+9bSEuKLmGSHZWkmiwq6UaNEoTzkYfCYPKlsv8ZVJG5n0LB/+WSdBB
 RDksMOGo6hLkZJOPqI/4DzrsC3ZbL+GusmNWCxHThvnbqCcykCUs4dDKr
 nl1VBouP8/nkVM1/jU3EX1jFo2fd36KnwFdOz4qouUbr552KPc9BN7UKy g==;
X-CSE-ConnectionGUID: 6+do9vaRR5eJUmpe9Ancsg==
X-CSE-MsgGUID: jyNP5sK7TZyWPiSO+Bjjzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80644981"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="80644981"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 11:11:29 -0700
X-CSE-ConnectionGUID: 8s3q6NIITSCZGcJy/UrDzA==
X-CSE-MsgGUID: CBW5mGHfTQ2rxdtL+buyQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="183519901"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa007.jf.intel.com with ESMTP; 21 Oct 2025 11:11:28 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v6 1/4] drm/xe/vf: Revert logic of vf.migration.enabled
Date: Tue, 21 Oct 2025 20:12:47 +0200
Message-Id: <20251021181250.1541639-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251021181250.1541639-1-tomasz.lis@intel.com>
References: <20251021181250.1541639-1-tomasz.lis@intel.com>
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

Convert `enabled` property into `disabled`.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: removed writing false to what is already zeroed out (Michal)

 drivers/gpu/drm/xe/xe_sriov_vf.c       | 7 ++-----
 drivers/gpu/drm/xe/xe_sriov_vf_types.h | 6 +++---
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 911d5720917b..0d8135f3927c 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -130,7 +130,7 @@
 bool xe_sriov_vf_migration_supported(struct xe_device *xe)
 {
 	xe_assert(xe, IS_SRIOV_VF(xe));
-	return xe->sriov.vf.migration.enabled;
+	return !xe->sriov.vf.migration.disabled;
 }
 
 static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
@@ -146,7 +146,7 @@ static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
 	xe_sriov_notice(xe, "migration disabled: %pV\n", &vaf);
 	va_end(va_args);
 
-	xe->sriov.vf.migration.enabled = false;
+	xe->sriov.vf.migration.disabled = true;
 }
 
 static void vf_migration_init_early(struct xe_device *xe)
@@ -172,9 +172,6 @@ static void vf_migration_init_early(struct xe_device *xe)
 						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
 						    guc_version.major, guc_version.minor);
 	}
-
-	xe->sriov.vf.migration.enabled = true;
-	xe_sriov_dbg(xe, "migration support enabled\n");
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
index 6a0fd0f5463e..d5f72d667817 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
@@ -34,10 +34,10 @@ struct xe_device_vf {
 	/** @migration: VF Migration state data */
 	struct {
 		/**
-		 * @migration.enabled: flag indicating if migration support
-		 * was enabled or not due to missing prerequisites
+		 * @migration.disabled: flag indicating if migration support
+		 * was turned off due to missing prerequisites
 		 */
-		bool enabled;
+		bool disabled;
 	} migration;
 
 	/** @ccs: VF CCS state data */
-- 
2.25.1

