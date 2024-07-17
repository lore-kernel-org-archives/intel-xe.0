Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E489CC3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 19:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D22210E3D9;
	Wed, 17 Jul 2024 19:59:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E8410E3D9;
 Wed, 17 Jul 2024 19:59:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Convert_live_tests_to_par?=
 =?utf-8?q?ameterized_style_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jul 2024 19:59:00 -0000
Message-ID: <172124634080.270701.11895302702031321726@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240717195155.442-1-michal.wajdeczko@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Convert live tests to parameterized style (rev2)
URL   : https://patchwork.freedesktop.org/series/136163/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 59a7e03c79cad273448e8ea91e034b184b6a1cc3
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Jul 17 21:51:55 2024 +0200

    drm/xe/tests: Skip xe_mocs live tests on VF device
    
    There is no point to run those tests on VFs devices as they can't
    access any of the MOCS registers. Skip testing on the VF device.
    
      [ ] =================== xe_mocs (1 subtest) ====================
      [ ] ================ xe_live_mocs_kernel_kunit  ================
      [ ] [PASSED] 0000:4d:00.0
      [ ] [SKIPPED] 0000:4d:00.1
      [ ] ============ [PASSED] xe_live_mocs_kernel_kunit ============
      [ ] ===================== [PASSED] xe_mocs =====================
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch bd2a84d801982bd4a899a29916b458a8f82cb01f drm-intel
dc58c9fccad4 drm/xe: Introduce const cast helper
48fb0625ac2e drm/xe/tests: Add helpers for use in live tests
f1ae7cc066e2 drm/xe/tests: Convert xe_bo live tests
be6885d1dd1d drm/xe/tests: Convert xe_dma_buf live tests
5387f04a943f drm/xe/tests: Convert xe_migrate live tests
55d245927e46 drm/xe/tests: Convert xe_mocs live tests
59a7e03c79ca drm/xe/tests: Skip xe_mocs live tests on VF device


