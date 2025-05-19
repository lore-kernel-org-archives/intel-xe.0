Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8696EC3DA6D
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 23:00:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503FE10E295;
	Mon, 19 May 2025 23:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPz7/NrZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F66010E295
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 23:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747695641; x=1779231641;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tdNKKyvLU7r8km9hBHu+sFIy133KE15tvhc/mFw9Jy0=;
 b=gPz7/NrZHWfcwd+I1iRSVMAbOrNMUrdfXV0vbl9aqwjlxeJXOHEtGKu6
 fTf3hvGf/51Ro7ISRKViru728InYp5j/qi+5kBnEaqe2zDBGdU2ZbP+aL
 4wH4HCjuRZXVzSLJ9E6j34CWcxWhP8aNP4UyFvMEVbLrDcOgk3vWUu0ly
 zkAHnXsLoqITpDkgsa3O3M5cAAqs5HBTg/IZGLqeQ6Hj5wxq8VDrZuI2y
 1SpNq7WBaBWBfd7UJw6NQGlNKh78xZW8O/QhdghMz3uMPlpd7/AJ5oW0q
 892zf7T7Z5JvcfCtqRiHrveA4UfnQfj6/mwTIIReqgy+xHox5+Ru+5XUg g==;
X-CSE-ConnectionGUID: gda3U++mQsa2u5FOF19x5g==
X-CSE-MsgGUID: LfUOKkgOTkK+eeTigz/vaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49676039"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49676039"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 16:00:40 -0700
X-CSE-ConnectionGUID: yGdUJO3tQI2E6suI+TbUkA==
X-CSE-MsgGUID: VuKie13YTq2/s2TNGNupAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="140408634"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa008.jf.intel.com with ESMTP; 19 May 2025 16:00:38 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v4] drm/xe/vf: Fail migration recovery if fixups needed but
 platform not supported
Date: Tue, 20 May 2025 01:00:35 +0200
Message-Id: <20250519230035.3143966-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The post-migration recovery needs to be fully implemented for a
specific platform in order to make continuation of workloads
possible.

New platforms introduce changes which affect the recovery procedure,
and without a clear verification of support this leads to errors
with no straight forward error message explaining the cause.

This patch fixes that issue - it introduces a message to be logged
when the current driver is known to not support the current platform.

Wedging the driver immediately also decreases the amount of
additional errors which would come afterwards if the driver continued
operation.

v2: Show the message during probe as well as during recovery; do not
  perform any recovery steps if the recovery is bound to fail
v3: Use SRIOV-specific logging, fix typos
v4: XE_DEBUG_SRIOV to XE_DEBUG check switch, to make testing more
  straightforward

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Acked-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 2674fa948fda..46466932375c 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -123,6 +123,15 @@
  *      |                               |                               |
  */
 
+static bool vf_migration_supported(struct xe_device *xe)
+{
+	/*
+	 * TODO: Add conditions to allow specific platforms, when they're
+	 * supported at production quality.
+	 */
+	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
+}
+
 static void migration_worker_func(struct work_struct *w);
 
 /**
@@ -132,6 +141,9 @@ static void migration_worker_func(struct work_struct *w);
 void xe_sriov_vf_init_early(struct xe_device *xe)
 {
 	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
+
+	if (!vf_migration_supported(xe))
+		xe_sriov_info(xe, "migration not supported by this module version\n");
 }
 
 /**
@@ -236,6 +248,11 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 		goto defer;
 	if (unlikely(err))
 		goto fail;
+	if (!vf_migration_supported(xe)) {
+		xe_sriov_err(xe, "migration not supported by this module version\n");
+		err = -ENOTRECOVERABLE;
+		goto fail;
+	}
 
 	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
 	/* FIXME: add the recovery steps */
-- 
2.25.1

