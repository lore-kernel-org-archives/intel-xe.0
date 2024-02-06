Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A64C4829D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 10:15:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A8C10EAE9;
	Tue,  6 Feb 2024 10:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZOueEkD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A80510EAE9;
 Tue,  6 Feb 2024 10:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707214546; x=1738750546;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AvUoBxjR+d3YXvVASEASAVOyWNUDvV2hSxdmkO5mNkA=;
 b=KZOueEkDQZSIHoo2ilwlnjFTNhChYP1CRuKtyOllM710R2mcoDwEeXXO
 9DtQBof+iazqvPd8YtOGZT6FAEqsHPmeQ4kocNYxHEhpiHDl/fYPZ+YFt
 sWxNY0outY2dqBfw6se1DeSM01nx04cT3z0C/gzbavFWoK0KyKXY4218U
 XhpMGLbPCdNgqDW5DmxR79mFWWxHd/0HHs07ClSCMjIpQS0+lNUmgxOwc
 CzlcO0HL6a4qn/2QIA4mw0h6QOoGhZFo9MnwzL5/d9Is0N5H39nj0De1W
 PJFQBXeloMg6wQSGQO9IrYlAnxJUHvBtv0Z6EnfH9c4g8ni8IMzKZJsLS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="4525560"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="4525560"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 02:15:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; d="scan'208";a="38405681"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.2.162])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 02:15:43 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v4 0/8] lib/kunit: Support writable filter* parameters
 of kunit module
Date: Tue,  6 Feb 2024 11:00:24 +0100
Message-ID: <20240206101514.6897-10-janusz.krzysztofik@linux.intel.com>
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

Instead of wasting resources on reloading the base Kunit module each time
a different set of filter parameters is needed, try to write the required
values to sysfs representation of those parameters.  If that fails (e.g.
on older LTS kernels with read-only filter parameters), fall back to
reloading the module.

This change also provides a workaround for the issue of impossibility to
unload the base Kunit module on Xe platforms, available as soon as the
module supports writable filter parameters.

While being at it, fine tune processing of skips on errors during test
case list collection phase.

v4: Replace patch v3 1/6 "lib/kunit: Skip on empty list of test cases" 
    with "lib/kunit: Enter legacy path only if applying filters fails",
  - return early when opening module parameters directory fails (Lucas),
  - use error unwind pattern on errors from sysfs writes,
  - replace "human-readable" with "non-NULL" in comments about strings
    used as equivalents of default NULLs,
  - use empty string as filter_action NULL equivalent, but verify if
    successfully applied when critical,
  - refresh commit description by removing a statement that addressed an
    update to a comment on legacy path, no longer in scope of this patch.
  - add a patch that fixes inline documentation of IGT KUnit API,
  - add a patch that optimizes test suite filtering.
v3: Don't read-compare-write, just write the values (Lucas),
  - skip calling igt_sysfs_set() when the string to be written to
    filter_action is empty (Lucas),
  - warn if we leave the filter_action set to "skip" while setting a non-
    default value of the filter parameter,
  - transform generic kunit_set_params() to kunit_set_filtering().
v2: Work around ineffective writes of empty strings to sysfs module
    parameter files (Lucas) by using human readable non-empty strings that
    give the same results as default NULLs,
  - drop fallback to reload of base Kunit module method if assigning new
    values to module parameters via sysfs fails (Lucas), instead use the
    existing fallback to blind execution like if getting a list of test
    cases was not supported at all,
  - split move of open_parameters() helper up in the source file as well
    as cleanup of base KUnit module unloading to separate patches (Kamil),
  - skip on empty list of test cases (new patch),
  - address the issue of commit description suggesting two separate
    changes combined in one patch (Kamil).

Janusz Krzysztofik (8):
  lib/kunit: Enter legacy path only if applying filters fails
  lib/kmode: Prepare open_parameters() helper for reuse by kunit
  lib/kunit: Unload base KUnit module only before reloading it
  lib/kunit: Support writable filter* parameters of kunit module
  lib/kunit: Report early kernel taints explicitly
  lib/kunit: Process module remove error after list errors
  lib/kunit: Fix API documentation
  lib/kunit: Perform test suite filtering on the kernel side

 lib/igt_kmod.c | 196 ++++++++++++++++++++++++++++---------------------
 1 file changed, 114 insertions(+), 82 deletions(-)

-- 
2.43.0

