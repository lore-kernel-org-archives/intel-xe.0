Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B10E7AD58
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 14:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2C810E2A9;
	Tue,  3 Oct 2023 14:35:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DB610E2A9
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 14:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696343725; x=1727879725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3qY4fwj6z1r+/crRDq2kZWWkWPuzp0i5de1Ux3saMrg=;
 b=VKPVqWmo0KIcqqkOY8BKkawUJ9/aR3UHizp00uHQgroB3DUgDccmtcWC
 p07UsfraEM+xLeyp0hL3ScMXaDY1HgteS2skCQHdbpfT1lQzXO6a9fjPB
 R1uQi4K0gdw8pChSiJCMz+q1t8U5lu2UkMJlPXf5Apl/Mxhl9guFndNmn
 kpzyiPQMLICeJ3MAqRAWyMDq7KUSEaEd7Av34lDjtEXVo5qvYy3OBjujC
 VjdiDKlHPIJt1M0XkbH1kDECCstf8pNLQe1nAg3S896NSFa44pluWDXCG
 j7FW4cRUqG8vCAHBrR2gV3aKTFjVnWSr04LgadwckQj1WhHUKHF1xIYaU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="413799632"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="413799632"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="1082041670"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="1082041670"
Received: from akorotox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.199])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 17:34:51 +0300
Message-Id: <023995e12cd373ba59ca09ff522e67cc87cb9f58.1696343521.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1696343521.git.jani.nikula@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 04/10] fixup! drm/xe: Introduce Xe assert macros
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

