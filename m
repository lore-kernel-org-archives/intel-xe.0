Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70828CA0EE4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 19:20:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C4110E05D;
	Mon, 18 Aug 2025 19:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LD1PiuIu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D205910E05D
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 19:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755544844; x=1787080844;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jiz0pA+mlvs/YwSAFeQyX2c8bJBautCkj8eUgzfdKks=;
 b=LD1PiuIuSaQOWfAIgr2CJwOleSSn0KB9uNltYsDN8ojxYy+P3CL8B5nV
 nSdhwo9wdUGZ61QJIEBCtRRswuLTKHhLBWzzDFcPkqrz4WjoUSUjWAWyK
 CiDnEFVgAx0/iccuSUpUQODWncqcshX8YKDWd4tvtWY5IfIt+0MODRIB4
 O30TcskqdP+FNDCn3l/VB9niUR/qPHuiFe7NPGwbfWdR1QXvBf6etH69r
 bxFmWfSfp+zADtuCtWmTSm6ifrQCfRKGzgWqmJAVVHfk4un+W90JoMr9v
 qn85NO72JutFpZNFNGA26mJV8HF7HIZoTzdU3MB551YJCWDOJ64YIuVJd Q==;
X-CSE-ConnectionGUID: k+4WSFryRQmP/Gd4anaKrw==
X-CSE-MsgGUID: dwRC0/feRUGnZsr707ihoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="56806168"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="56806168"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 12:20:43 -0700
X-CSE-ConnectionGUID: CR+UECzGTUySFJy1PkaGUw==
X-CSE-MsgGUID: h3z+yeXYSO2Rc+KZc2C7IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167161158"
Received: from abaranow-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.83.253])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 12:20:42 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/kunit: Extend platform generator with PTL
Date: Mon, 18 Aug 2025 21:20:32 +0200
Message-ID: <20250818192032.633-1-michal.wajdeczko@intel.com>
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

Our list of typical platforms used to generate test device objects
does not contain any PANTHERLAKE. Add one.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
cherry-picked from https://patchwork.freedesktop.org/series/152440/#rev1
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index c96d1fe34151..416258c193f6 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -75,6 +75,7 @@ static const struct platform_test_case cases[] = {
 	GMDID_CASE(LUNARLAKE, 2004, A0, 2000, A0),
 	GMDID_CASE(LUNARLAKE, 2004, B0, 2000, A0),
 	GMDID_CASE(BATTLEMAGE, 2001, A0, 1301, A1),
+	GMDID_CASE(PANTHERLAKE, 3000, A0, 3000, A0),
 };
 
 static void platform_desc(const struct platform_test_case *t, char *desc)
-- 
2.47.1

