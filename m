Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BC8EB64DD
	for <intel-xe@archiver.kernel.org>; Mon,  7 Aug 2023 10:28:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EC210E204;
	Mon,  7 Aug 2023 10:28:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8E810E205;
 Mon,  7 Aug 2023 10:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691404111; x=1722940111;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dkHorrBffv4xQS+bxgJDmsQVKSSR++utvuao/xqLQqw=;
 b=B4sNCurke9e89w0REaMrmtlPV1348yKdV1frZXhx1nZIfbE6LMc97jFI
 TY3Z0OhquW/iBxBPxICj7vvZN6bGZfBC4Zj6c+gMO/B9fVuB5j6lH3eKl
 CBoksq3blkj0bGMZuOFMK14ScGvnz35SG1JLO0xir272SxkkYq1UYYRbd
 cSG9r9KHLxTQcNiQtVNHQQBNxHSGnNS3meyduDFB55WKQ+5LZLsrQGcS9
 1GH/9ZUgfbXhurB1FCjWns7S5Ro3p/zYAeCY6JOAWEg8GhdpvEy/gq2gZ
 fgkh0y5sDwos/HPIZZTXJTlZeq+UVTh6mehZ2zyGEMYvR4+8f7jwp6HLP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="350818180"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; d="scan'208";a="350818180"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 03:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="730909195"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; d="scan'208";a="730909195"
Received: from kornelo-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.ger.corp.intel.com) ([10.213.30.73])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 03:28:22 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>
Date: Mon,  7 Aug 2023 12:23:53 +0200
Message-ID: <20230807102352.4607-5-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 0/3] kunit: Expose some built-in features to
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
    
v5: Fix new name of a structure moved to kunit namespace not updated in
    executor_test functions (lkp@intel.com),
  - refresh on tpp of attributes filtering fix.
v4: Use kunit_exec_run_tests() (Mauro, Rae), but prevent it from
    emitting the headers when called on load of non-test modules, 
  - don't use a different list format, use kunit_exec_list_tests() (Rae),
  - refresh on top of newly introduced attributes patches, handle newly
    introduced kunit.action=list_attr case (Rae).
v3: Fix CONFIG_GLOB, required by filtering functions, not selected when
    building as a module (lkp@intel.com).
v2: Fix new name of a structure moved to kunit namespace not updated
    across all uses (lkp@intel.com).

Janusz Krzysztofik (3):
  kunit: Report the count of test suites in a module
  kunit: Make 'list' action available to kunit test modules
  kunit: Allow kunit test modules to use test filtering

 include/kunit/test.h      |  21 +++++++
 lib/kunit/Kconfig         |   2 +-
 lib/kunit/executor.c      | 115 ++++++++++++++++++++++----------------
 lib/kunit/executor_test.c |  36 ++++++++----
 lib/kunit/test.c          |  37 +++++++++++-
 5 files changed, 149 insertions(+), 62 deletions(-)


base-commit: 1c9fd080dffe5e5ad763527fbc2aa3f6f8c653e9
-- 
2.41.0

