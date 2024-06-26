Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CB3C30653
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 20:12:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B0C10E064;
	Wed, 26 Jun 2024 20:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVHb7y0U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B03C10E064
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 20:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719432736; x=1750968736;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oKPG9B8VfJk1c+IlI8r6QZehTUbupQLuBYZNY28275Y=;
 b=FVHb7y0UE5B2nhNRMjYvxZ3Eb0+ePOjs33ApamD8FlTZTN1oRCXBoVxL
 pKpYe/OnSSLXGMX+hLPNjJrtQIa7fC3CIXrCAMp5EB/Ns63RtyqSqQ5C1
 2m8+s3ngeJeBzsCebhlntflfcnD8eFGGfIWxS1sXcs4iXHTCACy0vbeeE
 uzLU2T5U++6jwV2o4Rad5+roUCCpXciOFOtvLC47UrAeelk51wpdtO/kd
 olNCpbdIu7YbzvH6Y9MBJg56SQnDB7kVjG/9YUsR0cdRyjuaGoz4nlmjX
 pKLUGwxWIyQjVOWwH02FO1QhY4w2qblD20s6lS7WT3uJfFlqmxUuoLra7 w==;
X-CSE-ConnectionGUID: JEF7lRrwQOa+XL5p18bYOQ==
X-CSE-MsgGUID: WKnZz7O/TH6fv2FH8stbAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20413437"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="20413437"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 13:12:15 -0700
X-CSE-ConnectionGUID: WTx9lM3sRomHqLzT622ARA==
X-CSE-MsgGUID: AtQToTkjRFi3DU9gi3QJZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="49083799"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.34.68])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 13:12:14 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI] drm/xe/guc: Remove spurious line feed in debug print
Date: Wed, 26 Jun 2024 22:12:06 +0200
Message-Id: <20240626201206.1433-1-michal.wajdeczko@intel.com>
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

From: John Harrison <John.C.Harrison@Intel.com>

Including line feeds at the start of a debug print messes up the
output when sent to dmesg. The break actually appears between all the
usefu prefix information and the actual string being printed. In this
case, each block of data has a very clear start line and an extra
delimeter is really not necessary. So don't do it.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
cherry-picked from [1]

[1] https://patchwork.freedesktop.org/patch/598024/?series=134695&rev=2
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 873d1bcbedd7..113e6348c6ac 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1489,7 +1489,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 		drm_puts(p, "H2G CTB (all sizes in DW):\n");
 		guc_ctb_snapshot_print(&snapshot->h2g, p);
 
-		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
+		drm_puts(p, "G2H CTB (all sizes in DW):\n");
 		guc_ctb_snapshot_print(&snapshot->g2h, p);
 
 		drm_printf(p, "\tg2h outstanding: %d\n",
-- 
2.43.0

