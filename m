Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44F7C3DA49
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jul 2024 14:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BEC89F71;
	Sat, 20 Jul 2024 14:31:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F062689F71;
 Sat, 20 Jul 2024 14:31:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Convert_live_tests_to_par?=
 =?utf-8?q?ameterized_style_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 20 Jul 2024 14:31:36 -0000
Message-ID: <172148589698.308938.16838837112682237652@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240720142528.530-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240720142528.530-1-michal.wajdeczko@intel.com>
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

Series: Convert live tests to parameterized style (rev3)
URL   : https://patchwork.freedesktop.org/series/136163/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 34a05d10bd8871247887ef41d3784e2483966488
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Sat Jul 20 16:25:28 2024 +0200

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
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 51eaf1afceb400cf4fe9ed1147dffccc4cc8204f drm-intel
098f3e35eff7 drm/xe: Introduce const cast helper
a40829bc099f drm/xe/tests: Add helpers for use in live tests
f5be35615581 drm/xe/tests: Convert xe_bo live tests
0b240d6230d3 drm/xe/tests: Convert xe_dma_buf live tests
871c6ee75daf drm/xe/tests: Convert xe_migrate live tests
a26fc3988553 drm/xe/tests: Convert xe_mocs live tests
34a05d10bd88 drm/xe/tests: Skip xe_mocs live tests on VF device


