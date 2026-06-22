Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353D1CDB46F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 12:23:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64E410E67D;
	Mon, 22 Jun 2026 12:23:25 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4273C10E67D;
 Mon, 22 Jun 2026 12:23:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_add_page_size_a?=
 =?utf-8?q?llocation_mode_control_and_coverage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Jun 2026 12:23:24 -0000
Message-ID: <178213100426.101402.13523850829226626764@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
In-Reply-To: <20260622070031.2445502-1-naresh.kumar.g@intel.com>
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

Series: drm/xe: add page size allocation mode control and coverage
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
commit f795027b106407a832da3957850b3035958b66ba
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Date:   Mon Jun 22 12:30:31 2026 +0530

    drm/xe/tests: add live KUnit coverage for BO page-size allocation modes
    
    Add a live KUnit suite to exercise the debug-controlled BO page-size
    allocation modes.
    
    The new tests cover forced 2M mode, forced 1G mode, and mixed mode.
    They verify that user BO creation applies the expected NEEDS_* flags,
    that no unexpected page-size flags are added, that min_align matches the
    selected leaf size, and that the resulting resource contains a
    contiguous block large enough for the requested leaf where applicable.
    
    The mixed-mode test also checks repeated allocations across the rotation
    sequence and validates per-BO alignment behavior.
    
    Skip unsupported platforms and transient -ENOMEM cases so the tests can
    run in varying live environments without producing false failures
    
    Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
+ /mt/dim checkpatch 2fbc193c1eb519d338e9ca77449569e55d82ee6a drm-intel
b09704f1c85a drm/xe: add page size allocation control state to xe_device
f371bf2e3484 drm/xe: add helper for multi page-size support
030ad09f157d drm/xe/debugfs: add page size allocation mode knob
185149642039 drm/xe: add 1G BO page-size alignment flag
a9c750f4e9b6 drm/xe: apply debug page-size policy to user BO creation
778814785bea drm/xe/vm: apply debug page-size policy to VMA map flags
aa00a9b5cb0c drm/xe/vm: validate large-page user BO bind alignment
eca5ec3d3606 drm/xe/pt: limit page-table walk depth for large-page mappings
f795027b1064 drm/xe/tests: add live KUnit coverage for BO page-size allocation modes
-:273: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#273: FILE: drivers/gpu/drm/xe/tests/xe_live_test_mod.c:14:
+extern struct kunit_suite xe_bo_page_size_alloc_suite;

total: 0 errors, 1 warnings, 0 checks, 249 lines checked


