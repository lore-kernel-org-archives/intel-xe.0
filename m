Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71CCE92FFB
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 10:38:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9758910E0B5;
	Fri,  6 Oct 2023 10:38:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F58010E0C2
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 10:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696588713; x=1728124713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EprG3VytRGb6Qw4uFlccYDscgcBDLX9MlPAWAMC0LQ0=;
 b=j7Ekb1QTtbpkcnvjwSkNcu4oF6jHAyvmOMRKG3Q3yRgFCw3BjmNuqgzT
 PgjxINp/hCsfsLyC3E/iO/67MzMCeXIEMknAiGgvXUOA5RQI3iduOTBb4
 Y2VxyF71j99iQIjCS9FGkSUHxeDcgQKN2hhmeIStQrTGXUYe+oMDxWM+h
 nJN8VNe7V8Dzsa8hPbmU7DKFkZVE3o8Bmf8wEa6lZczHo86iSG3ZSV806
 buQ+fgEdWIvWH7vrggxweMnHSIXrHS4VGvaGvHHb5FqiJx06ltTk1Vjwa
 Su42NNTgkLgMJ5EFszpXsy/senAmlZw4d1+ddoIAZj0z6pdlSvcq4/s50 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="374070247"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="374070247"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:38:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="787348403"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="787348403"
Received: from lvroom-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.239])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:38:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 13:38:00 +0300
Message-Id: <06dc0061a436646c11db7b635cb2613d30f0202f.1696588392.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1696588392.git.jani.nikula@intel.com>
References: <cover.1696588392.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/6] fixup! drm/xe: Introduce Xe assert macros
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Do not log or reference display details in xe_assert(). xe_assert() is
not used in display code, and referencing display details in xe core
just makes the code juggling with display integration more difficult.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_assert.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index 035e6a44afe6..34c142e6cfb0 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -112,7 +112,6 @@
 			"platform: %d subplatform: %d\n"					\
 			"graphics: %s %u.%02u step %s\n"					\
 			"media: %s %u.%02u step %s\n"						\
-			"display: %s step %s\n"							\
 			msg,									\
 			__xe->info.platform, __xe->info.subplatform,				\
 			__xe->info.graphics_name,						\
@@ -123,8 +122,6 @@
 			__xe->info.media_verx100 / 100,						\
 			__xe->info.media_verx100 % 100,						\
 			xe_step_name(__xe->info.step.media),					\
-			str_enabled_disabled(__xe->info.enable_display),			\
-			xe_step_name(__xe->info.step.display),					\
 			## arg);								\
 })
 
-- 
2.39.2

