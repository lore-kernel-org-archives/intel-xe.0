Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F41C021B5
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 19:01:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B672C10E1E6;
	Fri, 21 Feb 2025 19:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+8lAg8Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C324110E1E6
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 19:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740164462; x=1771700462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bt0Tkbu/oDZq4J3HW1veBSvnmbOFcVrbMRaK4qKOuJs=;
 b=g+8lAg8QV8rTfWhtY11ZoYsGT73eHsaCLZSXw1zsXeo6aPPI16rR749A
 XKYKk9zVZtBu6EoYpEq65/xOdRSCec6LqMjw8Uj62B5PH51yYtf+d2rjj
 W7s2wpyisXf1SaJk5TZ28rcL1zOVRHmsi+99UR15Cq7eKB2BYhVZj0MZY
 XTPQyLhd2Lgor6/507AQE3ZtFQ7SKcY0PzM/Zl4H7CunSIGvU/0J3kA4J
 rywyUWg2uKPwRocXNzidpATeAOhOJAsT/OMoJxJa5Q7ZARdxhJthF015V
 Px2Ud0w5K3v2yyRzUdt3zb3tjVDZSw4NDc0IetWwK1T/j7DPRgIQGhPD6 w==;
X-CSE-ConnectionGUID: JPjvAkx1RuG0ywZOPZV29Q==
X-CSE-MsgGUID: y4gdOOv+RHKvMC1fmsF55Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41257646"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="41257646"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 11:01:02 -0800
X-CSE-ConnectionGUID: 7Y8IhqjnQWi5+p3KgzZK7w==
X-CSE-MsgGUID: 3NIqpq6GQEOm3VdbW34IIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120549682"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.217])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 11:01:00 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/4] drm/xe/kunit: Export xe_step_name for KUNIT
Date: Fri, 21 Feb 2025 20:00:36 +0100
Message-Id: <20250221190038.1734-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250221190038.1734-1-michal.wajdeczko@intel.com>
References: <20250221190038.1734-1-michal.wajdeczko@intel.com>
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

We use xe_step_name() inside the xe_assert() that in turn could
be used in our kunit test modules so it must be exported.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_step.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index c77b5c317fa0..db600cc9c5f2 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -6,6 +6,7 @@
 #include "xe_step.h"
 
 #include <linux/bitfield.h>
+#include <kunit/visibility.h>
 
 #include "xe_device.h"
 #include "xe_platform_types.h"
@@ -255,3 +256,4 @@ const char *xe_step_name(enum xe_step step)
 		return "**";
 	}
 }
+EXPORT_SYMBOL_IF_KUNIT(xe_step_name);
-- 
2.47.1

