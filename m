Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E611ECA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 21:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B225210E910;
	Wed, 10 Sep 2025 21:41:00 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B07310E910;
 Wed, 10 Sep 2025 21:40:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_test_for_G2G_communic?=
 =?utf-8?q?ations_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.c.harrison@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Sep 2025 21:40:59 -0000
Message-ID: <175754045956.323586.5072930031661229584@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250910210237.603576-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250910210237.603576-1-John.C.Harrison@Intel.com>
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

Series: Add test for G2G communications (rev3)
URL   : https://patchwork.freedesktop.org/series/152101/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 54aaeaf43899c4965af61c265f3f4893509df1dc
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Wed Sep 10 14:02:35 2025 -0700

    drm/xe/guc: Add test for G2G communications
    
    Add a test for sending messages from every GuC to every other GuC to
    test G2G communications.
    
    Note that, being a debug only feature, the test interface only exists
    in pre-production builds of the GuC firmware.
    
    v2: Fix 'default' case to actually use the driver's registration code
    as well as allocation. Add comments explaining the different test
    types. Fix (C) date and an assert. Review feedback from Daniele.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
    Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
+ /mt/dim checkpatch 413003a193543884257e5e6b65f7f3c82e1ab3d2 drm-intel
5a32c7c4613f drm/xe/guc: Update CSS header structures
84b8491c4ac5 drm/xe/guc: Add firmware build type to available info
d97bd6f6b47a drm/xe: Allow freeing of a managed bo
54aaeaf43899 drm/xe/guc: Add test for G2G communications
-:33: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#33: 
new file mode 100644

-:822: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#822: FILE: drivers/gpu/drm/xe/tests/xe_live_test_mod.c:13:
+extern struct kunit_suite xe_guc_g2g_test_suite;

total: 0 errors, 2 warnings, 0 checks, 846 lines checked


