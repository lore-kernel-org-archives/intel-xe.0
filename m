Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCB7C3DA63
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 06:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1542510E17A;
	Fri, 26 Jul 2024 06:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IowVDqbo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F55010E06B
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 06:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721976231; x=1753512231;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XjwNfE/kDjFrgrmtFaUq9NfVnnQjR0SfXX0JRthhhUI=;
 b=IowVDqboXsdqS3Il+j9cGRa/O+RcoYsqUIzL6H8lVnEwhXGkcQTWuy5e
 02jwusSXGAGDEyZoR8w+kgkGU7G0OpjW70a0b0+gATPDHIMOaddIIYGYH
 XfHch6tM7T7vRPBKgWzLzr4EYiXNeC61pjQjIpJLkoHbNvXqJHbdDb6JF
 LZeL+4/O74JbW+GcSLwilsxOLyPpPQzhw74aesZs+6637mqp2XwMHtYLC
 Ynwp1wwpQAFfMZ82si0fIMsP5gAQTH6yG7R0CMK5capOXHlHbKTCKXf4T
 PiG5+Ag2O+auweToQ2FsrPFi8rSVREWqJuIwBr8mXGXQxJCGPpC79rHmY A==;
X-CSE-ConnectionGUID: nO4gInm5RfaRQ4iZtqWJFA==
X-CSE-MsgGUID: vF/IUsziR9qUJhcHeC+Ezw==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="37270581"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="37270581"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 23:43:51 -0700
X-CSE-ConnectionGUID: xWDioE8MQbW8sXpda/ja+g==
X-CSE-MsgGUID: BA9pb6BhTy2y5UXynufcMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="83799460"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 23:43:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 0/7] Fix rtp when processing OOB workarounds
Date: Thu, 25 Jul 2024 23:43:30 -0700
Message-ID: <20240726064337.797576-1-lucas.demarchi@intel.com>
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

Patch 5 is a quick fix for processing rtp entries that is used by
the OOB WAs, i.e. WAs without an action associated. Thanks Gustavo for
spotting the issue while browsing the code. This can be applied
independently of the rest.

Last patch is a refactor so it's more obvious what it's doing.

The rest of the patches improve the kunit tests so the bug described
would have been caught. Now the logic used by OOB WAs is also covered by
the kunit tests. If those tests are executed without the fix provided in
patch 5, the following errors appear:

	# xe_rtp_process_tests: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_rtp_test.c:494
	Expected active == param->expected_active, but
	    active == 30 (0x1e)
	    param->expected_active == 14 (0xe)
	[FAILED] inactive-1st_or_active-inactive
	# xe_rtp_process_tests: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_rtp_test.c:494
	Expected active == param->expected_active, but
	    active == 30 (0x1e)
	    param->expected_active == 14 (0xe)
	[FAILED] inactive-2nd_or_active-inactive
	# xe_rtp_process_tests: EXPECTATION FAILED at drivers/gpu/drm/xe/tests/xe_rtp_test.c:494
	Expected active == param->expected_active, but
	    active == 30 (0x1e)
	    param->expected_active == 14 (0xe)
	[FAILED] inactive-last_or_active-inactive
	[PASSED] inactive-no_or_active-inactive
	# xe_rtp_process_tests: pass:5 fail:3 skip:0 total:8
	============== [FAILED] xe_rtp_process_tests ===============
	    # module: xe_test
	# xe_rtp: pass:1 fail:1 skip:0 total:2
	# Totals: pass:16 fail:3 skip:0 total:19
	===================== [FAILED] xe_rtp ======================

With the fix, all of them pass.

v2:
  - Fix build due to missing change
  - Add tests for xe_rtp_process()

Lucas De Marchi (7):
  drm/xe/kunit: Test WAs for BMG
  drm/xe/kunit: Rename count to sr_entries
  drm/xe/kunit: Test active rtp entries
  drm/xe/kunit: Rename rtp test cases
  drm/xe/rtp: Fix off-by-one when processing rules
  drm/xe/kunit: Test rtp with no actions
  drm/xe/rtp: Simplify marking active workarounds

 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 227 ++++++++++++++++++++++---
 drivers/gpu/drm/xe/tests/xe_wa_test.c  |   1 +
 drivers/gpu/drm/xe/xe_rtp.c            |  16 +-
 3 files changed, 213 insertions(+), 31 deletions(-)

-- 
2.43.0

