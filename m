Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB6EC54F54
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 14:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C642410F2C0;
	Fri, 31 Jul 2026 14:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O6O4jshJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A959710F2C0
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 14:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785509122; x=1817045122;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lC0KoJjyPInOTc0glWAHgvUwPRQ9BnaNSwIKytX/OCA=;
 b=O6O4jshJM42QmHRZj2e1ur5QBlWIrnWP1qSxgBJ0Ik8wOUkrI4WBNmDS
 QjHiLd75B2R4gs65akQ4wqJhmqi60r+cTPBWehetfZGvC/SPrDZYEx6IT
 4WcYE12a7jjlGoqhopYsYnh5A7wMFuzD5s5eUxg930IGUdhZkc4wCAIOT
 8UYJM0ZrTQ8RPhz2mIKf6bbad9M7CfKB7yw19wwHvuh2lI5gPbf4yJyN8
 p9UkDbrW1GyHj0ZTTesBSDUyCilNHDz7BUT8i8ahAx2ltCVtzbYp58w1W
 ParmGUx0kL2T058/P/mH1EBy+yjOzlZ3wqhhnc2n05Npn76v1efswC4N7 g==;
X-CSE-ConnectionGUID: n+tExz22RXKd03MtQ2iDQw==
X-CSE-MsgGUID: sAs6tDOwQVqAbUDg/Y9hKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="88667403"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="88667403"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 07:45:21 -0700
X-CSE-ConnectionGUID: hzXFUnHaRKSTfvIecM4y5Q==
X-CSE-MsgGUID: 4P8wh7NzTcCLBiE4a+azGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="298805545"
Received: from rknop-desk.igk.intel.com (HELO rknop-desk.ger.corp.intel.com)
 ([172.28.178.99])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 07:45:19 -0700
From: Ryszard Knop <ryszard.knop@intel.com>
To: Akira Yokosawa <akiyks@gmail.com>,
	linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Subject: [PATCH] scripts/kernel-doc: Fix kdoc for Python 3.9-3.11
Date: Fri, 31 Jul 2026 16:45:08 +0200
Message-ID: <20260731144508.912049-1-ryszard.knop@intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

The syntax used by the excess description suggestion change works on
Python 3.12+, while we need to support 3.9+.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 tools/lib/python/kdoc/kdoc_parser.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 884f42584667..9cba20f827c4 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -601,7 +601,8 @@ class KernelDoc:
         if not suggestions:
             return ""
 
-        return f"(did you mean one of: '{"', '".join(suggestions)}')"
+        joined_suggestions = "', '".join(suggestions)
+        return f"(did you mean one of: '{joined_suggestions}')"
 
     def check_sections(self, ln, decl_name, decl_type):
         """
-- 
2.55.0

