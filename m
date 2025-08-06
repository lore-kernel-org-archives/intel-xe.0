Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4889C87FCB
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 00:58:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B84F10E135;
	Wed,  6 Aug 2025 00:58:15 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D695910E135;
 Wed,  6 Aug 2025 00:58:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_test_for_G2G_communic?=
 =?utf-8?q?ations_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Aug 2025 00:58:13 -0000
Message-ID: <175444189387.215234.8293117215275942279@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250805234256.1021020-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250805234256.1021020-1-John.C.Harrison@Intel.com>
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

Series: Add test for G2G communications (rev2)
URL   : https://patchwork.freedesktop.org/series/152101/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 14f765983dcdffe55fe11f9a37893552e4106ae4
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Tue Aug 5 16:42:55 2025 -0700

    drm/xe/guc: Add test for G2G communications
    
    Add a test for sending messages from every GuC to every other GuC to
    test G2G communications.
    
    Note that, being a debug only feature, the test interface only exists
    in pre-production builds of the GuC firmware.
    
    v2: Fix 'default' case to actually use the driver's registration code
    as well as allocation. Add comments explaining the different test
    types. Fix (C) date and an assert. Review feedback from Daniele.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch b61343d3704885afd253795a1e1084febbf7f354 drm-intel
682dfdf09b8a drm/xe/guc: Update CSS header structures
fa7eeb694e3a drm/xe/guc: Add firmware build type to available info
735e9b03785f drm/xe: Allow freeing of a managed bo
14f765983dcd drm/xe/guc: Add test for G2G communications
-:32: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#32: 
new file mode 100644

-:821: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#821: FILE: drivers/gpu/drm/xe/tests/xe_live_test_mod.c:13:
+extern struct kunit_suite xe_guc_g2g_test_suite;

total: 0 errors, 2 warnings, 0 checks, 846 lines checked


