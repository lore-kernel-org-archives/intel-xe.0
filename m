Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D15AC02193
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 20:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD7C10E032;
	Tue,  4 Feb 2025 20:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQ6FljFp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB74710E032
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 20:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738699316; x=1770235316;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4rAQCQyiOh40ojUgwyKDb7rl2mvAhDJR5pun7SayQx0=;
 b=LQ6FljFpSonqDsEMMZs5jURG/tIIaYZmc9eP+btwYL12UNrygqryk/pe
 eJie943V+G6sVfqeH3I9e+5w/MWBWRRmX2aHaMo7eKVpz0B7/XAWacLQY
 GvlBgnp6Jm7BL6QR+2b2L9CC1HIX3NqypZot6xCPwAK6+vGZmLMjtJ9Pr
 eW/AR3ZAJXBlEXURGqm65x0MSvMGmPMXu5SBtJ+YpoI71fMWSjhllcVh3
 US9UDa7j832qkV8wEdgUXSOCoDDA/onEOjGdxsLLAotaOznklGHvrOZ4+
 jrpGcgBIiliMPYEGLXRzelozL4lucnbg5nUKiieNhKkUnyTB+tMGRbB+B Q==;
X-CSE-ConnectionGUID: 3kTN9GO6T+WwfwEk6fclEQ==
X-CSE-MsgGUID: BT+q0awYSrqC5KN1eqRTSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50638169"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="50638169"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 12:01:55 -0800
X-CSE-ConnectionGUID: 6ewE3oYMSiGB31vZyDtpSg==
X-CSE-MsgGUID: 3ODAvN//SDqNStIR+AfTFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="115680313"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 12:01:55 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/pxp: Don't use 0 to indicate NULL
Date: Tue,  4 Feb 2025 12:01:44 -0800
Message-ID: <20250204200144.1445800-1-daniele.ceraolospurio@intel.com>
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

Explicitly using NULL is the correct approach.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502050322.VUBMyUHc-lkp@intel.com/
Fixes: dcdd6b84d9ac ("drm/xe/pxp: Allocate PXP execution resources")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_pxp_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
index b50fe037c74b..d92ec0f515b0 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.c
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
@@ -54,7 +54,7 @@ static int allocate_vcs_execution_resources(struct xe_pxp *pxp)
 	 * Each termination is 16 DWORDS, so 4K is enough to contain a
 	 * termination for each sessions.
 	 */
-	bo = xe_bo_create_pin_map(xe, tile, 0, SZ_4K, ttm_bo_type_kernel,
+	bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K, ttm_bo_type_kernel,
 				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
-- 
2.43.0

