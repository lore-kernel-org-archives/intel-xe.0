Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22DAC3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 22:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642FC10E74C;
	Wed, 14 May 2025 22:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvSMWsfZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898E710E74C
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 22:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747260863; x=1778796863;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rSAobSSphpw5eeCi9zPG9Qih1DawsHg/levpn4yTknQ=;
 b=bvSMWsfZ4jWP0hNsvcHpLaocymomhm/I7U1dd3HioEs/QPwJs6RGHDvG
 bOl4hJIoo7/HF94a2oWb4a4F6H+FKvO8TPBEvQEuAv2AkJbv4xyRiBMmF
 L3w2MoGkndMGcCTpTGwM8XyDIlRtBUtYaQa85j0PJDVTePQomu+pyBuLJ
 7bN5mw6mrkPI7D7uKh6qeiAtxPII3obn9AlqYPfcP3ZUdJdUik0s9qHoV
 GiN+zWNBo5MC+ZABdf98pWcU0NddtX0DYMAPNTc0QvsptgjEMOSwJ+h8K
 4is/FmmUBLNNlzZMuZqh1agEmW7/RyV7nBzCuDzSzB4a4u3Ewjk4fF0NV A==;
X-CSE-ConnectionGUID: X0jIqyB4RRyHWlqasTksyg==
X-CSE-MsgGUID: z5EEG5PBSsSEAMdBnuO5Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48292779"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="48292779"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:14:20 -0700
X-CSE-ConnectionGUID: lIuVlySMRSW+WdrzUaPp3A==
X-CSE-MsgGUID: G1SXmMXfQ6i9TC0n79Q3Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="138589259"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa008.fm.intel.com with ESMTP; 14 May 2025 15:14:18 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2] drm/xe/vf: Fail migration recovery if fixups needed but
 platform not supported
Date: Thu, 15 May 2025 00:14:17 +0200
Message-Id: <20250514221417.810606-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
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
  perform any recovery steps if the reovery is bound to fail

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 2674fa948fda..bb069e4b3823 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -123,6 +123,15 @@
  *      |                               |                               |
  */
 
+static bool vf_mgration_supported(struct xe_device *xe)
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
@@ -132,6 +141,10 @@ static void migration_worker_func(struct work_struct *w);
 void xe_sriov_vf_init_early(struct xe_device *xe)
 {
 	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
+
+	if (!vf_mgration_supported(xe)) {
+		drm_info(&xe->drm, "vf migration not supported by this module version\n");
+	}
 }
 
 /**
@@ -236,6 +249,11 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 		goto defer;
 	if (unlikely(err))
 		goto fail;
+	if (!vf_mgration_supported(xe)) {
+		drm_err(&xe->drm, "vf migration not supported by this module version\n");
+		err = -ENOTRECOVERABLE;
+		goto fail;
+	}
 
 	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
 	/* FIXME: add the recovery steps */
-- 
2.25.1

