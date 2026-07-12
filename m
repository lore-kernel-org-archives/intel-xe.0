Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD8CC43458
	for <intel-xe@archiver.kernel.org>; Sun, 12 Jul 2026 11:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB6510E2CF;
	Sun, 12 Jul 2026 11:21:03 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6495110E2C9;
 Sun, 12 Jul 2026 11:21:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3Aadd_page_size_al?=
 =?utf-8?q?location_mode_control_and_coverage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 12 Jul 2026 11:21:02 -0000
Message-ID: <178385526240.179389.7220299198245823343@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260712111517.1956177-1-naresh.kumar.g@intel.com>
In-Reply-To: <20260712111517.1956177-1-naresh.kumar.g@intel.com>
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

Series: drm/xe:add page size allocation mode control and coverage
URL   : https://patchwork.freedesktop.org/series/170246/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 04f61f787690b88efffa88cb196a7d1ce4f2ad8f
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Date:   Sun Jul 12 16:45:17 2026 +0530

    drm/xe/tests: add live KUnit coverage for BO page-size allocation modes
    
    Add live KUnit coverage for the debug-controlled BO page-size allocation
    modes.
    
    The new tests cover forced 2M mode, forced 1G mode, and mixed mode. They
    verify that user BO creation applies the expected NEEDS_* flags, that no
    unexpected page-size flags are added in the forced modes, that BO size is
    rounded as expected, and that page_alignment matches the selected leaf
    size.
    
    The mixed-mode test does not assume a strict per-allocation rotation
    sequence, since the device-global mixed-mode index may be perturbed by
    concurrent BO creation on a live system. Instead, it validates that each
    allocation results in one valid mixed-mode page-size outcome.
    
    Treat transient VRAM allocation failures as skipped test cases so the
    tests can run in varying live environments without producing false
    failures.
    
    v3
    - address review comments
    - rework mixed-mode test to avoid assuming strict rotation order
    - reword commit message
    
    Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
+ /mt/dim checkpatch ac29bfba6fb4cff9115a625be2ae449a884cb123 drm-intel
ec2a58324872 drm/xe: add page size allocation control state to xe_device
ee01688334ff drm/xe/debugfs: add page-size allocation mode knob
f0e794e48ad3 drm/xe: add Kconfig option for debug page-size allocation control
7d5c52b51f4b drm/xe: add XE_BO_FLAG_NEEDS_1G for minimum page-size sizing
f15c5b627836 drm/xe: apply debug page-size allocation policy to user BOs
7a46b98bb530 drm/xe/vm: propagate BO page-size requirements to VMA map flags
17bd42ff2744 drm/xe/pt: allow selecting the bind leaf PTE level
04f61f787690 drm/xe/tests: add live KUnit coverage for BO page-size allocation modes
-:292: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#292: FILE: drivers/gpu/drm/xe/tests/xe_live_test_mod.c:14:
+extern struct kunit_suite xe_bo_page_size_alloc_suite;

total: 0 errors, 1 warnings, 0 checks, 260 lines checked


