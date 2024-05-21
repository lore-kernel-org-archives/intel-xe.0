Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65251C25B7A
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 14:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C113210EB92;
	Tue, 21 May 2024 14:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V5woc1uC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECE010EB36
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 14:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716301396; x=1747837396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=758Zpy9OqGMdGlFOND9paSa4ig9AJn2wu9iNk1AqDWE=;
 b=V5woc1uCBqNeszcw1RNIh5jf7+XpMyy9Y98bgdxoZ7wv+YSCK9X+BeJK
 WH43ZdKY1YOhgdwocnVw4ka0JZjPUnLyuEiN2CrubhxWpNU43wHE0Fgsy
 uR04MxeeE+LAWQlPE2nvG2dO4xwB6EyLHI+7RNn40Ya2KrPNT01ZjHES/
 QDxZtyh9jvLjGtUiXy465eREP7HZo2onN2b9bR5U9kDMOvk+S6IFa9Jb5
 WNgBXX22qeobMXJfMYZ/LLz3fvBcbwfQM/Nm3DZpU51objyceGiqwqyKJ
 x7beKdNtUGLtH+OLKUeHr+1/CBElQJ38FM9kDR3hQ5zrWP6uUwpxkIkJy Q==;
X-CSE-ConnectionGUID: 7jbXpqokQ8CiHkiIdIMp0Q==
X-CSE-MsgGUID: 8WBduKoiSgWdgmi9+Groeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23075842"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="23075842"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 07:23:15 -0700
X-CSE-ConnectionGUID: Y+vuK2xXRMGVpGw470xrQw==
X-CSE-MsgGUID: JKiDIL0pTS++X9gwtbJ2fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="37711488"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.128])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 07:23:14 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/3] drm/xe: Use platform name in xe_assert()
Date: Tue, 21 May 2024 16:22:57 +0200
Message-Id: <20240521142257.756-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240521142257.756-1-michal.wajdeczko@intel.com>
References: <20240521142257.756-1-michal.wajdeczko@intel.com>
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

We can now use more user-friendly platform name instead of
previosly used magic platform enumerator value:

  [ ] xe 0000:00:02.0: [drm] Assertion `false` failed!
      platform: ALDERLAKE_S ...
  [ ] xe 0000:03:00.0: [drm] Assertion `false` failed!
      platform: DG2 ...

vs

  [ ] xe 0000:00:02.0: [drm] Assertion `false` failed!
      platform: 3 ...
  [ ] xe 0000:03:00.0: [drm] Assertion `false` failed!
      platform: 7 ...

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_assert.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index 34c142e6cfb0..8b0cc1bc9327 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -109,11 +109,11 @@
 #define xe_assert_msg(xe, condition, msg, arg...) ({						\
 	const struct xe_device *__xe = (xe);							\
 	__xe_assert_msg(__xe, condition,							\
-			"platform: %d subplatform: %d\n"					\
+			"platform: %s subplatform: %d\n"					\
 			"graphics: %s %u.%02u step %s\n"					\
 			"media: %s %u.%02u step %s\n"						\
 			msg,									\
-			__xe->info.platform, __xe->info.subplatform,				\
+			__xe->info.platform_name, __xe->info.subplatform,			\
 			__xe->info.graphics_name,						\
 			__xe->info.graphics_verx100 / 100,					\
 			__xe->info.graphics_verx100 % 100,					\
-- 
2.43.0

