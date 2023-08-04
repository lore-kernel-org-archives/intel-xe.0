Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435D1C001DB
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 22:55:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFEF10E16E;
	Fri,  4 Aug 2023 22:55:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A840210E1D0;
 Fri,  4 Aug 2023 22:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691189749; x=1722725749;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=74eJtOZ8h+3nyHZJZk3ePstWB6ItvCo3PtaMJEcyxlA=;
 b=Lrsy7ARu7xoPR0zJXoiYQgolySMT+lcgk2lvOZFS2ki3pdmoXxZ3XN6g
 V2s/41BeLTJ+PWTthWWs30HJ71Wz8pva9vIk3jGK/rCXNfBFJwV1EbfCc
 TcZmBm5QGSAxgSsloEhqZTJlh6mMFIyv5aADIGFj8/YCBYA3v6gdx1rVQ
 55HV40lfUyr2dD7jb0sJwLCmcFGVno5KS/A7Fqv8aWJhSsmpnHvDx+GCN
 S4TCohuE+JJ3CNWLNv2Ky7JTtoyIty1+kyPYVpRreJ/kdjku4RLU9Yd/4
 JBsq50ZOUyQEHsvJef/rq0ivvpW+yQDNIFodIZqJ9YdkYFC6yhMWQeoI8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="360325189"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="360325189"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 15:55:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="733445155"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="733445155"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.4.149])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 15:55:15 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>
Date: Sat,  5 Aug 2023 00:52:21 +0200
Message-ID: <20230804225220.8005-5-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/3] kunit: Expose some built-in features to
 modules
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
Cc: linux-kernel@vger.kernel.org, Rae Moar <rmoar@google.com>,
 igt-dev@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 intel-xe@lists.freedesktop.org, kunit-dev@googlegroups.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Submit the top-level headers also from the kunit test module notifier
initialization callback, so external tools that are parsing dmesg for
kunit test output are able to tell how many test suites should be expected
and whether to continue parsing after complete output from the first test
suite is collected.

Extend kunit module notifier initialization callback with a processing
path for only listing the tests provided by a module if the kunit action
parameter is set to "list", so external tools can obtain a list of test
cases to be executed in advance and can make a better job on assigning
kernel messages interleaved with kunit output to specific tests. 

Use test filtering functions in kunit module notifier callback functions,
so external tools are able to execute individual test cases from kunit
test modules in order to still better isolate their potential impact on
kernel messages that appear interleaved with output from other tests.
    
v4: Use kunit_exec_run_tests() (Mauro, Rae), but prevent it from
    emitting the headers when called on load of non-test modules, 
  - don't use a different list format, use kunit_exec_list_tests() (Rae),
  - refresh on top of newly introduced attributes patches, handle newly
    introduced kunit.action=list_attr case (Rae).
v3: Fix CONFIG_GLOB, required by filtering functions, not selected when
    building as a module.
v2: Fix new name of a structure moved to kunit namespace not updated
    across all uses.

Janusz Krzysztofik (3):
  kunit: Report the count of test suites in a module
  kunit: Make 'list' action available to kunit test modules
  kunit: Allow kunit test modules to use test filtering

 include/kunit/test.h |  21 ++++++++
 lib/kunit/Kconfig    |   2 +-
 lib/kunit/executor.c | 115 +++++++++++++++++++++++++------------------
 lib/kunit/test.c     |  40 ++++++++++++++-
 4 files changed, 128 insertions(+), 50 deletions(-)


base-commit: 5a175d369c702ce08c9feb630125c9fc7a9e1370
-- 
2.41.0

