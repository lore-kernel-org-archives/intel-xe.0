Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0528CC83F26
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 00:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE72610E0E4;
	Fri, 25 Jul 2025 00:27:26 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E906D10E0E4;
 Fri, 25 Jul 2025 00:27:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_test_for_G2G_communic?=
 =?utf-8?q?ations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Jul 2025 00:27:25 -0000
Message-ID: <175340324591.188592.5532437064060622493@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250725002111.3906267-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250725002111.3906267-1-John.C.Harrison@Intel.com>
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

Series: Add test for G2G communications
URL   : https://patchwork.freedesktop.org/series/152101/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63535c743231a7497a612c53f6edbb8a7d14412d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e144d64426a8b39ea2ae90968f7c80af6ff18de2
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Thu Jul 24 17:21:05 2025 -0700

    drm/xe/guc: Add test for G2G communications
    
    Add a test for sending messages from every GuC to every other GuC to
    test G2G communications.
    
    Note that, being a debug only feature, the test interface only exists
    in pre-production builds of the GuC firmware.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch e4a00177f7a294b0e63959774b9ad3e5363cbd12 drm-intel
caa674074283 drm/xe/guc: Update CSS header structures
3eddac6c848e drm/xe/guc: Add firmware build type to available info
8996afc95c07 drm/xe: Allow freeing of a managed bo
e144d64426a8 drm/xe/guc: Add test for G2G communications
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

-:800: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#800: FILE: drivers/gpu/drm/xe/tests/xe_live_test_mod.c:13:
+extern struct kunit_suite xe_guc_g2g_test_suite;

total: 0 errors, 2 warnings, 0 checks, 829 lines checked


