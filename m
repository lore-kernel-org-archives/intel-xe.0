Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB07C001E0
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 14:12:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69DB10E14B;
	Mon, 31 Jul 2023 14:12:43 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACF110E14B;
 Mon, 31 Jul 2023 14:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690812761; x=1722348761;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8lJQW7XtYIZJGUpSg5bDxxZ5nMixXPpf80t0cGGyY2I=;
 b=iFOLej+3Gi4EcqvZla2V8O8GivIhFXW062mjL1Hz1WPAJOK6oObhtYud
 f9eNwqfzO7IgKYKcUEHPoswLNY0DiptA0aCMDFLP2QtDxAkcTxJldOKVc
 CLLoBS6KqYFSOO/I8UZYa6jtBmJDTvuMlofollJbRaykBY0Gng8ZWaoGp
 GgKK8zTvKDSrSWS+EUVQQPw6ql/45P7OnGorOsI1+XL5MCwpXNb7QlTW6
 K/EDd9sRAAlpM7v/VOTY5vs977qrKXB6NIkuc2T5I2GJvYUijvnHZlhFV
 JJF59oIS2ngeU+pGmjy3HhNZGDNETbys/ZRnFHi7gqDhSAjI5+LCgpv6Y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="455403612"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="455403612"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 07:12:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="728324343"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="728324343"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.1.128])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 07:12:38 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>
Date: Mon, 31 Jul 2023 16:10:22 +0200
Message-ID: <20230731141021.2854827-5-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/3] kunit: Expose some built-in features to
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
Cc: linux-kernel@vger.kernel.org, igt-dev@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org,
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

v3: Fix CONFIG_GLOB, required by filtering fuctions, not selected when
    building as a module.
v2: Fix new name of a structure moved to kunit namespace not updated
    across all uses.

Janusz Krzysztofik (3):
  kunit: Report the count of test suites in a module
  kunit: Make 'list' action available to kunit test modules
  kunit: Allow kunit test modules to use test filtering

 include/kunit/test.h | 14 +++++++++++
 lib/kunit/Kconfig    |  2 +-
 lib/kunit/executor.c | 57 +++++++++++++++++++++++++-------------------
 lib/kunit/test.c     | 57 +++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 104 insertions(+), 26 deletions(-)

-- 
2.41.0

