Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABF2C3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 17:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58ACA10E647;
	Fri,  5 Jan 2024 17:20:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E3F10E647
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 17:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704475212; x=1736011212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N569xvAnEBW05JS0k53YOZ0Lf9c9ZQiqOFSo/dqwJDs=;
 b=bRvwNkK+aG0jwrIeKChB4bbqBTPjmNMucMWBf7MvicOcGzG8UdsZ+F3I
 kLzdcO4WXuoaFkhmrrEAq+Wi70FsxYdbFmV8OnkibNTIb4qDF1c/17No9
 JZyuYYNQdEIonO7ReGpNe1HsmRn+MT66p7Uu4N6o33jKGDitkNzEfWB9h
 hAiJQdOTbWl+674uhcoB05kEmde1OsWQGAAfsi6X+wI+MutiZMTVwCwRG
 qgeBYbDcXtKQFrgVyNsFtl8TSwMDTM6oHQoaOQXZFE8vUGDUvKdsniSN9
 sFgf/0BJeGaZ0vtkUIoYmMldaZ8+JVtpWd+9qEHPeL6gxqnkW9ez4l4a0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="396429612"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="396429612"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 09:20:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="773896019"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="773896019"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.132.213])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 09:20:09 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Fix compilation without CONFIG_KUNIT
Date: Fri,  5 Jan 2024 18:19:47 +0100
Message-Id: <20240105171947.321-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

It looks that declaration of kunit_get_current_test() was
available in xe_guc_relay.c only with CONFIG_KUNIT enabled.
If CONFIG_KUNIT is disabled we fail with:

In file included from ../include/linux/build_bug.h:5,
                 from ../include/linux/bitfield.h:10,
                 from ../drivers/gpu/drm/xe/xe_guc_relay.c:6:
../drivers/gpu/drm/xe/xe_guc_relay.c: In function ‘xe_guc_relay_process_guc2vf’:
../drivers/gpu/drm/xe/xe_guc_relay.c:863:52: error: implicit declaration of function ‘kunit_get_current_test’ [-Werror=implicit-function-declaration]
  863 |  if (unlikely(!IS_SRIOV_VF(relay_to_xe(relay)) && !kunit_get_current_test()))
      |                                                    ^~~~~~~~~~~~~~~~~~~~~~
../include/linux/compiler.h:77:42: note: in definition of macro ‘unlikely’
   77 | # define unlikely(x) __builtin_expect(!!(x), 0)
      |                                          ^

Reported-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Fixes: 9a2c2ecb1b77 ("drm/xe/guc: Introduce Relay Communication for SR-IOV")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_relay.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
index b772088979bd..c0a2d8d5d3b3 100644
--- a/drivers/gpu/drm/xe/xe_guc_relay.c
+++ b/drivers/gpu/drm/xe/xe_guc_relay.c
@@ -9,6 +9,7 @@
 #include <drm/drm_managed.h>
 
 #include <kunit/static_stub.h>
+#include <kunit/test-bug.h>
 
 #include "abi/guc_actions_sriov_abi.h"
 #include "abi/guc_relay_actions_abi.h"
-- 
2.25.1

