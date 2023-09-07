Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDFEEC872A
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 13:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBB110E0C5;
	Thu,  7 Sep 2023 13:59:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AC210E0C5;
 Thu,  7 Sep 2023 13:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694095186; x=1725631186;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ATV8qe3n98IRaoBgSCa1IMPeDCwrVmvKABOEuNqiIN8=;
 b=alDiyGbbfKf/Cy58XF6LPr+yvdtaRqtYlNLKEjVO0pkI0lQTx1S1k497
 +WUd0xpybHFEaQr+U/maK95ytEVYh9I+FmC/OGTBPpTgFJ3Sw0JezUb6n
 14jKsbbXKhotA4d5QuLahQ6u6W4X1mf317d8aHHn/TuS3dRx95Xn9cdYR
 8Ozk9o0lNQq1SmQJ84KyghF7l0zNDOWibmFLXu6UidtvWHwWRMD9Ag6z8
 QeSsj41of0TzD91uuqGwb++lOs5WWQAXb0ISREuqieEijIe7CGOngYazU
 KXvtj2akYGA0z64qTJDdXIAgAC99QSzhDwYOWRq6TvQHqBSuqjfqLNHaZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="367599040"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="367599040"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 06:53:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="856845167"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="856845167"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO fedora..)
 ([10.249.254.26])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 06:53:50 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Thu,  7 Sep 2023 15:53:37 +0200
Message-ID: <20230907135339.7971-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/2] drm/tests: Fix for UAF and a test for
 drm_exec lock alloc tracking warning
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Maxime Ripard <mripard@kernel.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


While trying to replicate a weird drm_exec lock alloc tracking warning
using the drm_exec kunit test, the warning was shadowed by a UAF warning
from KASAN due to a bug in the drm kunit helpers.

Patch 1 fixes that drm kunit UAF.
Patch 2 introduces a drm_exec kunit subtest that fails if the conditions
      for the weird warning are met.

The series previously also had a patch with a drm_exec workaround for the
warning but that patch has already been commited to drm_misc_next_fixes.

v2:
- Rewording of commit messages
- Add some commit message tags
v3:
- Remove an already committed patch
- Rework the test to not require dmesg inspection (Maxime Ripard)
- Condition the test on CONFIG_LOCK_ALLOC
- Update code comments and commit messages (Maxime Ripard)

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Christian König <christian.koenig@amd.com>

Thomas Hellström (2):
  drm/tests: helpers: Avoid a driver uaf
  drm/tests/drm_exec: Add a test for object freeing within
    drm_exec_fini()

 drivers/gpu/drm/tests/drm_exec_test.c | 82 +++++++++++++++++++++++++++
 include/drm/drm_kunit_helpers.h       |  4 +-
 2 files changed, 85 insertions(+), 1 deletion(-)

-- 
2.41.0

