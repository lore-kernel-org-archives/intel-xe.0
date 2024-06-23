Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9614BC2BA18
	for <intel-xe@archiver.kernel.org>; Sun, 23 Jun 2024 20:31:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AB910E31F;
	Sun, 23 Jun 2024 20:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1Eb5ye4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A75610E31C
 for <intel-xe@lists.freedesktop.org>; Sun, 23 Jun 2024 20:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719174685; x=1750710685;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rm937muC4AuwfPyKjsfM4KfKmxC8W1e8LmpkPRRqFuM=;
 b=Y1Eb5ye4MrrgQfKNJXnxaTo2NQMlEBtEUI9u+g1OFFNB82l9Uo6X3Bvk
 IFXw5CI54J1HBER3aBGk1W3hrQibt1xKQEoxULEm+SmOw1Irt2RhuqJst
 qNE9iZ7fjF0jyTylVTvnybdiYcHSzAkcEXTDCVfur0qP90NLf5C7RF37E
 otu3h6mROD9cvqo90NFsRp7C1oRPevUWocIcQ/X9LOuZUG5iyDKp7maVQ
 73IFULIuqvMjhtNg7U6CbD5R/ISruwFrXouhoYap8ZzH9HoqkOmcFMn/T
 hW4pPuIa1kAjD256yv6u6T1xW+eeQcxpzvX86iZW1Ib2e+Vsg6BbRKoOw g==;
X-CSE-ConnectionGUID: NfsWylOTRe+S7IkOfFiyHA==
X-CSE-MsgGUID: JAnyhByeROW9NEbqBigNog==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="20018791"
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; d="scan'208";a="20018791"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2024 13:31:23 -0700
X-CSE-ConnectionGUID: 3sLpgwvqT4KuQxcr2KcXSQ==
X-CSE-MsgGUID: exvSM2d4T+mbaBDJogDMfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; d="scan'208";a="43779805"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2024 13:31:23 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3] drm/xe/oa: Fix kernel doc warnings in xe_drm.h
Date: Sun, 23 Jun 2024 13:31:19 -0700
Message-ID: <20240623203119.3840283-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Fix kernel doc warnings in xe_drm.h. Also eliminate private/non-abi enum
definitions.

v2: Remove __DRM_XE_PERF_TYPE_MAX since it is unused (Michal)
v3: Also remove DRM_XE_OA_PROPERTY_MAX since it can also be eliminated (Michal)

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 3 ++-
 include/uapi/drm/xe_drm.h  | 5 +----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 4168b51cf7b5..9263ae9a864e 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1684,6 +1684,7 @@ static const xe_oa_user_extension_fn xe_oa_user_extension_funcs[] = {
 	[DRM_XE_OA_EXTENSION_SET_PROPERTY] = xe_oa_user_ext_set_property,
 };
 
+#define MAX_USER_EXTENSIONS	16
 static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number,
 				 struct xe_oa_open_param *param)
 {
@@ -1692,7 +1693,7 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number
 	int err;
 	u32 idx;
 
-	if (XE_IOCTL_DBG(oa->xe, ext_number >= DRM_XE_OA_PROPERTY_MAX))
+	if (XE_IOCTL_DBG(oa->xe, ext_number >= MAX_USER_EXTENSIONS))
 		return -E2BIG;
 
 	err = __copy_from_user(&ext, address, sizeof(ext));
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 93e00be44b2d..b410553faa9b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1379,8 +1379,8 @@ struct drm_xe_wait_user_fence {
  * enum drm_xe_perf_type - Perf stream types
  */
 enum drm_xe_perf_type {
+	/** @DRM_XE_PERF_TYPE_OA: OA perf stream type */
 	DRM_XE_PERF_TYPE_OA,
-	__DRM_XE_PERF_TYPE_MAX, /* non-ABI */
 };
 
 /**
@@ -1611,9 +1611,6 @@ enum drm_xe_oa_property_id {
 	 * pass along with @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
 	 */
 	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
-
-	/** @DRM_XE_OA_PROPERTY_MAX: non-ABI */
-	DRM_XE_OA_PROPERTY_MAX
 };
 
 /**
-- 
2.41.0

