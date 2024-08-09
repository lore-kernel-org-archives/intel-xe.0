Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3EFC52D7F
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 16:52:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED2D10E99A;
	Fri,  9 Aug 2024 16:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iv1vbRlk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31FA10E999
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 16:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723222347; x=1754758347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wNxghpNY0RQHC4lonNC7nds5cfgI25p2OzPNznI+NwI=;
 b=Iv1vbRlkmDXDeeLOjdTyeHH7xlqk6+qPQlUYq7rcdkoR4R/FxJPTfpW3
 9OvnDZEOsKGsz5d5q6QYqnHaORrY6mJLWsg6PNADHKHiGNFA/CjMMv8bV
 ASxL6t8jS7doZKQb9P2n07cq3TvwV066rXWEmHTHN9ydscOqbbtd/kgur
 ww3f0+pshI8Ptzefzz1oB1qP51dHULdvm/aTAtDxeymGY1sJoqsc0Cadx
 4KTNF3lj1TMlR6+itSLl3JWCnEbXG6otINcKxmCUVvlgs/m9ZhMdFhaHM
 hi38QX3/ApAOrZUw/qv/37N7gml7savkB+IzZDnhxdPS9LmeJnK7DxmsO Q==;
X-CSE-ConnectionGUID: EQBPAUPmTEiMLh0dpwXGwQ==
X-CSE-MsgGUID: b+qpcCcNTzutWPy8PM8JaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21379424"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21379424"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:26 -0700
X-CSE-ConnectionGUID: w5SwWJNrTkuNPIIzE0/tgA==
X-CSE-MsgGUID: 73OF6WY7TA+bU3drRL44gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57569320"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 06/12] drm/xe/tests: Add helper macro to detect if KUnit is
 running
Date: Fri,  9 Aug 2024 18:51:53 +0200
Message-Id: <20240809165159.662-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240809165159.662-1-michal.wajdeczko@intel.com>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
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

In upcoming patch we will add some functionality that will be
used by the KUnit test code but outside of the KUnit context,
while still should be activated only when the KUnit test is
running. Add simple helper to hide implementation details.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_test.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_test.h b/drivers/gpu/drm/xe/tests/xe_test.h
index 9c23ad9dba8d..b8fa409ce2b1 100644
--- a/drivers/gpu/drm/xe/tests/xe_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_test.h
@@ -31,6 +31,7 @@ struct xe_test_priv {
 
 #define XE_TEST_DECLARE(x) x
 #define XE_TEST_ONLY(x) unlikely(x)
+#define XE_TEST_RUNNING() static_branch_unlikely(&kunit_running)
 
 /**
  * xe_cur_kunit_priv - Obtain the struct xe_test_priv pointed to by
@@ -57,6 +58,8 @@ xe_cur_kunit_priv(enum xe_test_priv_id id)
 
 #define XE_TEST_DECLARE(x)
 #define XE_TEST_ONLY(x) 0
+#define XE_TEST_RUNNING() false
+
 #define xe_cur_kunit_priv(_id) NULL
 
 #endif
-- 
2.43.0

