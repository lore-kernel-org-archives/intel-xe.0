Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB734C001DF
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 15:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E89310E340;
	Mon, 24 Jul 2023 15:58:18 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B7C10E33B;
 Mon, 24 Jul 2023 15:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690214296; x=1721750296;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7ThdMlGSh5lvUE0wvbAKVqKI+3MwbEs718cQ28Rxb8Y=;
 b=Du29MDPy2kNsGcJXJ8n6XmGFf3UolvrYC7OQ+zI3x8mu7UJtBCa7Cfz1
 jsxOt6hSY4N67NdnGoJVbMoFga6JEVXIbQwLqTnfBpfG93SvkWbfjV6Aj
 L8hBAwePJdEfxss+Sewf1HwyWmkAVKjuAInnu0ja3Kk6wLBTdC+l7O8SJ
 iX5TZrRJqXr47GQhQSx6FV7dqJNT0WhqTpLJ5J96P2wAR9vukXaMXfAn+
 4gnRtkhHPfbyyXbnIycNJRJJ56WSE3oETLILlpwTPe41Ur4EeUjtaEE6g
 ymgZvUKg8yVlVOT0Hx2oQ0zBJfHnDpZjwfj0ZggOvmos+4C1eve1F959f g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="433721305"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="433721305"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 08:58:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="702944064"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="702944064"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 08:58:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 24 Jul 2023 08:57:05 -0700
Message-Id: <20230724155705.3700630-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH igt] tests/xe_create: Bump max time
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For our kernel with debug and kasan enabled, 2 seconds is not enough to
create 2048 engines. In CI we are seeing it failing sometimes for ADL-P:

	CRITICAL: Creating 2048 engines tooks too long: 2 [limit: 2]

And for ATS-M:

	CRITICAL: Creating 2048 engines tooks too long: 3 [limit: 2]

Let's bump it to 5 to cover all cases and give it some room for
early-enabling platforms.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/xe/xe_create.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c
index 2e29efc90..e39e89f7a 100644
--- a/tests/xe/xe_create.c
+++ b/tests/xe/xe_create.c
@@ -120,7 +120,7 @@ static uint32_t __xe_engine_create(int fd, uint32_t vm,
 }
 
 #define MAXENGINES 2048
-#define MAXTIME 2
+#define MAXTIME 5
 
 /**
  * SUBTEST: create-engines-%s
-- 
2.40.1

