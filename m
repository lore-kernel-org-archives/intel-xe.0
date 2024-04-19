Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFC2C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 15:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88CB910E26B;
	Fri, 19 Apr 2024 15:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tc9z0xWI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F50B10E26B
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 15:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713540869; x=1745076869;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zfpyzj1TlBskJB4KrGjYkuTCDADGy3BiRUwTuDezWCg=;
 b=Tc9z0xWILIRBV0ntJoN3n0jJOOo9kdsULid8TfWUJ/ESSmlx5Ew9tnry
 rnPI2cAVX/vSGHV8oIdU36XUy4u090R/8yr6PpsmWw6d9a4E5vtt7RRpL
 a/Nr5Gsxf0pfFmGXVbFx8OvfJpabH1u65oPJcadjuAtAHGxWsmQJwcend
 fTTi4eT3FA71CabhTqumt+VZBQg48348DKSHkDWPEXYoLpGvN5USJ9srq
 tShTrjXuLzSka13N+Ab+VnEenrzlqqs8hJN9st4vSJhge/iuJg0Bcw7Cu
 ccN9Q88j/lo+m1CFsPO9slmnjYRY3zZWePclb75hDtl/YshsZ6xStSfiI w==;
X-CSE-ConnectionGUID: +nXDt6C+QOySPgGLhL33KA==
X-CSE-MsgGUID: eY6Uf1LjSZmr1rNMWRdpSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="20539238"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="20539238"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 08:34:18 -0700
X-CSE-ConnectionGUID: K9yAW0AETqCvEGY06q+pRw==
X-CSE-MsgGUID: QLxIXZZzQB2RhHtVmozsYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23435821"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.63.117])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 08:34:17 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Improve GuC doorbell/context ID manager intro
 message
Date: Fri, 19 Apr 2024 17:34:07 +0200
Message-Id: <20240419153407.402-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

We can use recently added str_plural() helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_db_mgr.c | 3 ++-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_db_mgr.c b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
index 8d9a0287df6b..6767e8076e6b 100644
--- a/drivers/gpu/drm/xe/xe_guc_db_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_db_mgr.c
@@ -106,7 +106,8 @@ int xe_guc_db_mgr_init(struct xe_guc_db_mgr *dbm, unsigned int count)
 	if (ret)
 		return ret;
 done:
-	xe_gt_dbg(dbm_to_gt(dbm), "using %u doorbell(s)\n", dbm->count);
+	xe_gt_dbg(dbm_to_gt(dbm), "using %u doorbell%s\n",
+		  dbm->count, str_plural(dbm->count));
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index 0fb7c6b78c31..cd0549d0ef89 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -97,7 +97,8 @@ int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
 	if (ret)
 		return ret;
 
-	xe_gt_info(idm_to_gt(idm), "using %u GUC ID(s)\n", idm->total);
+	xe_gt_info(idm_to_gt(idm), "using %u GUC ID%s\n",
+		   idm->total, str_plural(idm->total));
 	return 0;
 }
 
-- 
2.43.0

