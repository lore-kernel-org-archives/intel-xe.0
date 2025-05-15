Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C373AC3ABC9
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 11:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897A710E83A;
	Thu, 15 May 2025 11:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gy6t46Xx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9FE10E83A
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 11:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747307552; x=1778843552;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fRroAT2ClGh8rjTS4dEQFL8TPV8RPNC36nn0JIvi/Gw=;
 b=gy6t46XxqgpIc8tdo5e7l7R1FkmZRcfFPxVKQpUvzs+d3ODwgXsO94oO
 LSwgY9utGgS19BboPPwmgIEGZtX2TA9qDv8CQ3syKunjLqiwEW2vYt+qM
 PNQsHZP7EO3cvv1pi6DjkOOzqQ2lOy/sMzj39qzdDQ7+5iTXiKwBW7yBp
 rWtiPZHcSPtEFiG5kw2ll2C3+YrlFdRYv9RCUDm4sQt/oLyGjVtbAuITf
 XacWRExR6UKUPi9YzKUsJ2PFTcP272wzoyreUtVhtXFtrrkfSDe48SwOe
 L5/NfSPUplLpStcpPApU4RjaCY0LwDKfD7ak0MjjM+71Fpe5Agy4eCUH+ A==;
X-CSE-ConnectionGUID: NXb8gfMgShGYRdoMMDS7dw==
X-CSE-MsgGUID: H+5kwlPCSVWkO+C3W172Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49350346"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="49350346"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 04:12:32 -0700
X-CSE-ConnectionGUID: Y4pvG7N6SV+dKmj7O+73Dg==
X-CSE-MsgGUID: vxp8K56IRFebpKOjIn+qfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="142346687"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa003.fm.intel.com with ESMTP; 15 May 2025 04:12:31 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v3] drm/xe/vf: Fail migration recovery if fixups needed but
 platform not supported
Date: Thu, 15 May 2025 13:12:29 +0200
Message-Id: <20250515111229.815047-1-tomasz.lis@intel.com>
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

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 2674fa948fda..b578d171eb83 100644
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
+	return IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV);
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

