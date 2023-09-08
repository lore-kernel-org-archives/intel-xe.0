Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56733EE7FE8
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 12:34:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374B710E8B2;
	Fri,  8 Sep 2023 12:34:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAF710E8AB;
 Fri,  8 Sep 2023 12:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694176465; x=1725712465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4ALvskPNi3LaMw5KVy7vYqgxxd2v3zPfVa4OMNirJ8E=;
 b=B5gNlxswJNmnzaDHaoqVPajCJ21+B/Hf629CvwjGdDaXN4zc2T96DClb
 /YPFQZqsPhsy1c+xUNsP+xB0oo9Zy6pJZwPsYetsooSxQYKDWt7JKRqGN
 OvmF2vKU0xhQebpOPVLrI9PI7TFBxQ5Ig1d97VtMRTPT35OEmxiGu18dH
 Ya5XwlqzcIqqTlj5h5e58NXvM6wGyME9Kp8/xQLJ61XQOS9pF8Yh6xg2E
 39s2cHPHa+0n2L8fuFR6piVn7wNRjOSPkBWzU6Fnw8CIlfberZ84sZJ6B
 atawzbYHgSn69WL7i4kxzBoreSZJYOpnelceF6zUTMGe6+lVdMRUS+bYw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="375014953"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="375014953"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 05:34:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="857381926"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="857381926"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.28.201])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 05:34:23 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 14:32:37 +0200
Message-ID: <20230908123233.137134-22-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
References: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t v2 03/17] lib/kunit: Fix struct kmod_module
 kunit_kmod not freed
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
Cc: intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Isabella Basso <isabbasso@riseup.net>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We obtain a kmod_module structure for kunit module in order to check if
it is modular or built-in, then we never release that structure.  Fix it.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_kmod.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index faf31afabc..34ddec3fad 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -797,6 +797,7 @@ static void __igt_kunit(const char *module_name, const char *opts)
 	}
 
 	is_builtin = kmod_module_get_initstate(kunit_kmod) == KMOD_MODULE_BUILTIN;
+	kmod_module_unref(kunit_kmod);
 
 	results = ktap_parser_start(tst.kmsg, is_builtin);
 
-- 
2.41.0

