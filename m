Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E83AC04FFF
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 03:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30AF61129A6;
	Tue, 16 Apr 2024 03:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PmliC1R5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389BC1129A2
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 03:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713236707; x=1744772707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YoCHSHm8Dws3XmWCjdPoeE+1AEbKdYYqjQMTL47z7mI=;
 b=PmliC1R5/dMqa2BHNpChXIx/7ESRXvPkLX3p5ytJISfYLf0F2vobcdMe
 NPz8TnRJG0fmr1EQKC4pPX1Y1YUPO1ymqSY2PFDV1WDLw7qUpfNjLTKk4
 XL4NSIhhluaD6FHd1NLsfqXInRrWl/mainHSHBMHcQIIXWinEFYzn2PZk
 F2uJFK6vmk5M/8GoLPeLB9kXysgJhAtw8WO7qWjPUSbryG7uXmDAe8Rxn
 Wv/R8VtIuvTlTzObsoXUvk6exC3W57B6366W/YstaoUMht+s/bp5O8bF+
 07EXjPZdlB4LPsI4l1+5oyqZCSh+rGPfBUdJF3iDj/cmsXtdXZUXOaW2w g==;
X-CSE-ConnectionGUID: WI2B5duKTRm0cm+RqQiJdA==
X-CSE-MsgGUID: zVPBwluMR1mr5BXG49FWyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19213825"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="19213825"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 20:05:06 -0700
X-CSE-ConnectionGUID: 2h5/39iZSgiJ9rct/I8H6A==
X-CSE-MsgGUID: 8WcDS0kgSqi0n9ANj2lwjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="26895707"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 20:05:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 4/7] drm/xe: Add XE_ENGINE_CLASS_OTHER to str conversion
Date: Mon, 15 Apr 2024 20:04:51 -0700
Message-ID: <20240416030454.3739862-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240416030454.3739862-1-lucas.demarchi@intel.com>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
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

XE_ENGINE_CLASS_OTHER was missing from the str conversion. Add it and
remove the default handling so it's protected by -Wswitch-enum.
Currently the only user is xe_hw_engine_class_sysfs_init(), which
already skips XE_ENGINE_CLASS_OTHER, so there's no change in behavior.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 8f72f324eee7..ab227fa8984a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -971,9 +971,13 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
 		return "vecs";
 	case XE_ENGINE_CLASS_COPY:
 		return "bcs";
+	case XE_ENGINE_CLASS_OTHER:
+		return "other";
 	case XE_ENGINE_CLASS_COMPUTE:
 		return "ccs";
-	default:
-		return NULL;
+	case XE_ENGINE_CLASS_MAX:
+		break;
 	}
+
+	return NULL;
 }
-- 
2.43.0

