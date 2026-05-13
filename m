Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE4ACD4F21
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 19:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8D310F010;
	Wed, 13 May 2026 19:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ih30ACoT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD8F10F010
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 19:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778699260; x=1810235260;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=o7Dq5i8AnGDBtRE6H0NdnweKw8eo38UoiKuJ3jctcVo=;
 b=ih30ACoTNeBiJoCQ+E6RTagE9JV6/wkhCSGLD/6t+7FfZTRFdccvukUh
 RY8Tl+2FR7AWfh0qkuWIkJ2BBT5DzRzFcr+OaRWQXP9PhktU5uNCYmWvQ
 zWRpE4V/eRtpKqA/5FSDhH2PMCuDxnXk8pqSMsjI0n5fPv3iKReK7n509
 W+rmrtXzXRsgSRlMYbEv0tPGNs99xZawcZNTmnvCuy2987gZf8U9b9udE
 nVt3E8NwV/UtFjAfpZXBLel2MmSRGOjAfcNvc8d7zfHpu+I1K48b/afMN
 jiLuodiSRFeK4Gydpztv2+JW8kzJXsirBHjMhAsq0/rHkf8mIsM+aI6VH g==;
X-CSE-ConnectionGUID: jTtAOpdAQU2ec9xnwjY0MA==
X-CSE-MsgGUID: gEOLwQJzR6KPghzlhlVQ7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79350378"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="79350378"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 12:07:40 -0700
X-CSE-ConnectionGUID: vnAdYdgXSjuD3N5Z4r3eDw==
X-CSE-MsgGUID: CcIUYeNOSoG7Ll5aXE1GRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="242511597"
Received: from jjgreens-desk20.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.107])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 12:07:38 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 13 May 2026 16:07:14 -0300
Subject: [PATCH] drm/xe/guc: Use xe_device_is_l2_flush_optimized()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-guc-l2-flush-opt-use-xe_device_is_l2_flush_optimized-v1-1-36fa866d6ed8@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NUQrCMBAFr1L224UmNoJeRSRo8tIuxLZ0jRRL7
 27o5zC8eRspFoHSrdlowVdUprGCOTUUhufYgyVWJtvaS+vMmfsSOFtOuejA0/zhouAVPtZxgBf
 12frD+mrlLT9ETtcOrkNyJryopucFSdbj9v7Y9z/v/k7BhgAAAA==
X-Change-ID: 20260513-guc-l2-flush-opt-use-xe_device_is_l2_flush_optimized-f94e54ef51cb
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

We encapsulate the logic to check if the platform has L2 flush
optimization feature in xe_device_is_l2_flush_optimized(), but
guc_ctl_feature_flags() is using an open-coded version of that same type
of check.  Fix that by replacing the open-coded check with
xe_device_is_l2_flush_optimized().

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e468b638271b..4023700ff2a9 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -98,7 +98,7 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 	if (xe_guc_using_main_gamctrl_queues(guc))
 		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
 
-	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe) && xe_gt_is_media_type(guc_to_gt(guc)))
+	if (xe_device_is_l2_flush_optimized(xe) && xe_gt_is_media_type(guc_to_gt(guc)))
 		flags |= GUC_CTL_ENABLE_L2FLUSH_OPT;
 
 	return flags;

---
base-commit: e54a14bbf920aa5eefc70aba9927482ebe630f8b
change-id: 20260513-guc-l2-flush-opt-use-xe_device_is_l2_flush_optimized-f94e54ef51cb

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

