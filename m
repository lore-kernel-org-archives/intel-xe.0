Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1808C001DE
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 15:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635158926F;
	Fri, 28 Jul 2023 15:45:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BEE88D18;
 Fri, 28 Jul 2023 15:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690559129; x=1722095129;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WiBMoGQQC4NhBoCp+ki275V6Cbp6pdJOqJCv6Im1MbM=;
 b=NGZ+3KlzIh3mjxy4GMcD+Dk/AlChoILmA1SRcd5RqEmbEg6d2r1FbuPG
 rwDwEa43Os+onCfQoODW5Y0F1ya8x0upK0hEuzlqNZPFw2lsqvXxKEh62
 elB4lQwdm2yicXTojwYzhuBQ3bJx2nchQ28XT2Wvxo9DZk82BB6x2qtE+
 473WbF89FYsTLSLfkNExbqlQzRMDcTUHYcuhc9sqI3kTaIDj9wd1swSsV
 yAtXhd+p0oBlfFfQbiLUVLJXe0jWDCHEaiercdb6ncihjvdpCZRjlZmkn
 +iR4goWVxLzElBaofF8s/H766ezBQsBRefPrrZ8Jd8ECi3O2c0vS15Ay6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="371323324"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="371323324"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 08:45:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="817557438"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="817557438"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO jkrzyszt-mobl2.lan)
 ([10.213.24.93])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 08:45:26 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>
Date: Fri, 28 Jul 2023 17:44:20 +0200
Message-ID: <20230728154419.1810177-5-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] kunit: Expose some built-in features to
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

Janusz Krzysztofik (3):
  kunit: Report the count of test suites in a module
  kunit: Make 'list' action available to kunit test modules
  kunit: Allow kunit test modules to use test filtering

 include/kunit/test.h | 14 +++++++++++
 lib/kunit/executor.c | 51 ++++++++++++++++++++++-----------------
 lib/kunit/test.c     | 57 +++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 99 insertions(+), 23 deletions(-)

-- 
2.41.0

