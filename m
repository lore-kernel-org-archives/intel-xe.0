Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F24CDB47F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 19:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7737910E100;
	Wed, 24 Jun 2026 19:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TTQ/wfvA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B5210E100
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 19:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782330779; x=1813866779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e6I5AcvDmvKhwMY+jYY5ZTMbtfK5Ii6WF1JLMdLGkRQ=;
 b=TTQ/wfvA0UCD1BPvNSWtdeQpVX3UAuqS4jD/T7cZmYiOWQkSrlAK0eTW
 0Vusf+XMoKLyhL9QnEtC6xSQlOzp2YvPXJYJO5S/ZE+V6k32EZE7sD0V0
 9vnol7rkTn789MSEVMYF4tYZwhLQ1DaT+wJyJI3EK2vxSkIMOHI8S85fE
 4//Sz1VH4S6mIvq6t6IKEQsNPUdrAcrFeyZzwE63tnQDecHNTFyOxS1iP
 3SEZQOX803wEWT0fETMK/m09AqiWZ2NRof0GHstl2BfPpBUaRGzP2RyAD
 JDvKFZeDQhEjZdfTrlkiJ+dD322gFgG6/9Z45Sj7kiIGBlFJOzqa7AXKx Q==;
X-CSE-ConnectionGUID: 7CEsL5FiSFGo9l9AT5RfHQ==
X-CSE-MsgGUID: QADOU3SPR3Ovm+eIDu4izg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83107536"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="83107536"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 12:52:59 -0700
X-CSE-ConnectionGUID: kXSO2BNUSwmHRpEqj9xTzw==
X-CSE-MsgGUID: 5VP2N++UT/uzN39K3bM2gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="247074845"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 12:52:55 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2 2/2] drm/xe/guc: fix activity stats error message format
Date: Thu, 25 Jun 2026 01:16:21 +0530
Message-ID: <20260624194618.2793571-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624194618.2793571-4-sk.anirban@intel.com>
References: <20260624194618.2793571-4-sk.anirban@intel.com>
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

Use ERR_PTR() to print the error code symbolically.
This makes the failure easier to spot from IGT,
e.g. when the device is wedged.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_engine_activity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
index 2b99c1ebdd58..f43ca1c76f75 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
@@ -473,7 +473,7 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
 
 	ret = enable_engine_activity_stats(guc);
 	if (ret)
-		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
+		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats: %pe\n", ERR_PTR(ret));
 	else
 		engine_activity_set_cpu_ts(guc, 0);
 }
-- 
2.43.0

