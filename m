Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C18DC001DC
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 06:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4268910E1A9;
	Mon, 31 Jul 2023 06:16:47 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A8D10E1A7;
 Mon, 31 Jul 2023 06:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690784204; x=1722320204;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KRtFQ2+1X4QJ3GHF5S3ruCx9W9SpVuuAs5HerfEdF1I=;
 b=WwdeY4CvMcWrjVMsXrAyHdbnkCVKE2RYJ3J+T/Bkoiz9bu7wq+2XQkbn
 NfwSHnIAFXCiOKq/13HjLkVXzSlZZGyomPzSfO9T4NqsP0C2lVwyogV81
 wK+l19ZUuq5b6XriUA+J9MZw7hbe2+Gvcxardg8KfxltbjDq9lvncaJQc
 bnENp9+fSrO1igDYr07uYJUjWWOtV9cNa5OvXhNkZsnLp4CfNTO7Fo2wy
 kot08NwG4kQdn+a4j8UR6IVV2UC5j7W1MHZ6lcZDjONy/bzPSSuZ7dv0d
 UyliAPyMKx0435d4tZvlPQxnkBh6IDFO8w27vmq0E7Z53K7V/C0CHjCRs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="435231334"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="435231334"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2023 23:16:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="1058827619"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="1058827619"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.1.128])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2023 23:16:41 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>
Date: Mon, 31 Jul 2023 07:45:53 +0200
Message-ID: <20230731054552.2145292-5-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/3] kunit: Expose some built-in features to
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
 linux-kselftest@vger.kernel.org, intel-xe@lists.freedesktop.org,
 kunit-dev@googlegroups.com
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

v2: Fix new name of a structure moved to kunit namespace not updated
    across all uses.

Janusz Krzysztofik (3):
  kunit: Report the count of test suites in a module
  kunit: Make 'list' action available to kunit test modules
  kunit: Allow kunit test modules to use test filtering

 include/kunit/test.h | 14 +++++++++++
 lib/kunit/executor.c | 57 +++++++++++++++++++++++++-------------------
 lib/kunit/test.c     | 57 +++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 103 insertions(+), 25 deletions(-)

-- 
2.41.0

