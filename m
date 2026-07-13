Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DFFC43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 02:34:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18B410E2C1;
	Mon, 13 Jul 2026 02:33:59 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C0710E2A4;
 Mon, 13 Jul 2026 02:33:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_add_page_size_a?=
 =?utf-8?q?llocation_mode_control_and_coverage_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Jul 2026 02:33:58 -0000
Message-ID: <178391003873.180334.5173896933963119728@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260713022541.2581814-1-naresh.kumar.g@intel.com>
In-Reply-To: <20260713022541.2581814-1-naresh.kumar.g@intel.com>
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

Series: drm/xe: add page size allocation mode control and coverage (rev2)
URL   : https://patchwork.freedesktop.org/series/168905/
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
commit d620d29be9911aa349b2e3dca77f9c48143aaf73
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Date:   Mon Jul 13 07:55:41 2026 +0530

    drm/xe/tests: add live KUnit coverage for BO page-size allocation modes
    
    Add live KUnit coverage for the debug-controlled BO
        page-size allocation modes.
    
        The new tests cover forced 2M mode, forced 1G mode,
        and mixed mode. They verify that user BO creation applies
        the expected NEEDS_* flags, that no unexpected page-size flags are
        added in the forced modes, that BO size is rounded as expected, and
        that page_alignment matches the selected leaf size.
    
        The mixed-mode test does not assume a strict per-allocation rotation
        sequence, since the device-global mixed-mode index may be perturbed by
        concurrent BO creation on a live system. Instead,
        it validates that each allocation results in
        one valid mixed-mode page-size outcome.
    
        Treat transient VRAM allocation failures as skipped test cases so the
        tests can run in varying live environments without producing false
        failures.
    
        v3
        - address review comments
        - rework mixed-mode test to avoid assuming strict rotation order
        - reword commit message
        v4
        - skip VRAM-targeted live tests on non-dGFX devices
    
    Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
+ /mt/dim checkpatch 67aa8ad5c4c59cd1a7c379ad70feec4c04caebaf drm-intel
4fb7de3b1acc drm/xe: add page size allocation control state to xe_device
4cdacea8cdbf drm/xe: add Kconfig option for debug page-size allocation control
cd3303e13caf drm/xe/debugfs: add page-size allocation mode knob
da2d7b4d946d drm/xe: add XE_BO_FLAG_NEEDS_1G for minimum page-size sizing
a025e2788d57 drm/xe: apply debug page-size allocation policy to user BOs
bb020d376827 drm/xe/vm: propagate BO page-size requirements to VMA map flags
1eb5472b6538 drm/xe/pt: allow selecting the bind leaf PTE level
d620d29be991 drm/xe/tests: add live KUnit coverage for BO page-size allocation modes
-:305: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#305: FILE: drivers/gpu/drm/xe/tests/xe_live_test_mod.c:14:
+extern struct kunit_suite xe_bo_page_size_alloc_suite;

total: 0 errors, 1 warnings, 0 checks, 270 lines checked


