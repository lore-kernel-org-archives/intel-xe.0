Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6483EB7EA1
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 08:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5534510E97B;
	Wed,  4 Mar 2026 08:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Gdf7iAgX";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A3C10E150;
 Wed,  4 Mar 2026 08:45:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E1E7C600AD;
 Wed,  4 Mar 2026 08:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C985C19423;
 Wed,  4 Mar 2026 08:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772613466;
 bh=qOZfFUlUOEVKoYXfHRfZIknRLCKlJk0u8y49Q5mlMhA=;
 h=From:To:Cc:Subject:Date:From;
 b=Gdf7iAgXEPqFOG+Jmz13KtJoBIC6+erQteO+lxEZVpL7qLioqwGfwiHgTER+TcNvR
 TxNbnH+Rdd/UIiwGC0gjMBLVNenc1q0JpMVkwbdFNe6Sdwz2XMU7ERJ3KA7bIZ1jr5
 g6nN1B+s8ypsjl6ivDlwuWQ14m2ealh605vKPr5FR1BJv8FSD/jv8PSAwvuRjRQa+n
 O6lYcn75/j3ux4ZD+jUiXRcKAMYEsqls3XBXOxjii9/TU3axtVmPTR99wARI5RXrHy
 L2VginSP3/dWvjQMJ0BYWMMsxMjOe6C/3N7VlMjlyT592hkgkai1m7VBpWfISnfUU2
 e2+SBAYcPkang==
From: Arnd Bergmann <arnd@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe/tests: avoid build warning on 32-bit targets
Date: Wed,  4 Mar 2026 09:37:32 +0100
Message-Id: <20260304083741.725121-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

Building the test case on 32-bit targets produces an integer overflow warning,
as a constant value is assigned to a 32-bit resource_size_t variable:

In file included from drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:3329:
drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c: In function 'pf_gt_config_test_init':
drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:14:25: error: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '14940110848' to '2055208960' [-Werror=overflow]
   14 | #define TEST_VRAM       0x37a800000ull
      |                         ^~~~~~~~~~~~~~
drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:71:29: note: in expansion of macro 'TEST_VRAM'
   71 |         vram->usable_size = TEST_VRAM;
      |                             ^~~~~~~~~

Shut up the warning with an extra cast that marks this truncation as intentional.
This is probably not the right fix here, but I could not figure out where the
constant value actually comes from, or if a smaller number would be appropriate
on a 32-bit system. It's possible that the test case or the driver is just not
useful on 32-bit machines because of other parts of the logic here.

Fixes: cbe29da6f7c0 ("drm/xe/tests: Add KUnit tests for new VRAM fair provisioning")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
If there is a better way to fix this, please treat this as a bug report and
just add a Reported-by tag in the commit.
---
 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index 305dbd4e5d1a..86cd15834bac 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -11,7 +11,7 @@
 #include "xe_pci_test.h"
 
 #define TEST_MAX_VFS	63
-#define TEST_VRAM	0x37a800000ull
+#define TEST_VRAM	(resource_size_t)0x37a800000ull
 
 static void pf_set_admin_mode(struct xe_device *xe, bool enable)
 {
-- 
2.39.5

