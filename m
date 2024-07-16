Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFA3C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 22:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3D210E8F4;
	Tue, 16 Jul 2024 22:01:17 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB0B10E8F4;
 Tue, 16 Jul 2024 22:01:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Convert_live_tests_to_par?=
 =?utf-8?q?ameterized_style?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Jul 2024 22:01:16 -0000
Message-ID: <172116727637.253641.799305630015431056@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240716213901.398-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240716213901.398-1-michal.wajdeczko@intel.com>
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

Series: Convert live tests to parameterized style
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
commit f31158ea55657f2ca2312d2242bc8e04510d0372
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Jul 16 23:39:01 2024 +0200

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
+ /mt/dim checkpatch 49a697d7731bfbd13087d4167151cc91ec613f13 drm-intel
35a4bceb12f8 drm/xe: Introduce const cast helper
4a6cd6b36667 drm/xe/tests: Add helpers for use in live tests
c7a5b1070a65 drm/xe/tests: Convert xe_bo live tests
e6a4177eabee drm/xe/tests: Convert xe_dma_buf live tests
3dce3b46d774 drm/xe/tests: Convert xe_migrate live tests
ee51330c7583 drm/xe/tests: Convert xe_mocs live tests
f31158ea5565 drm/xe/tests: Skip xe_mocs live tests on VF device


