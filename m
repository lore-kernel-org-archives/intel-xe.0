Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2125AE77188
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 16:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D982B10EC18;
	Wed, 18 Dec 2024 16:37:52 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3666510EC18;
 Wed, 18 Dec 2024 16:37:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/tests=3A_Move_shri?=
 =?utf-8?q?nk_test_out_of_xe=5Fbo?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Dec 2024 16:37:51 -0000
Message-ID: <173453987121.96409.7202993234975452265@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241218141447.2528530-1-nirmoy.das@intel.com>
In-Reply-To: <20241218141447.2528530-1-nirmoy.das@intel.com>
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

Series: drm/xe/tests: Move shrink test out of xe_bo
URL   : https://patchwork.freedesktop.org/series/142786/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 82f7adb0d455a89178c076f0a0171cd0c5034739
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Wed Dec 18 15:14:47 2024 +0100

    drm/xe/tests: Move shrink test out of xe_bo
    
    The subtest typically has an execution time long enough to motivate a
    separate test so that it can be easily excluded if needed.
    
    v2: reword commit message(Thomas)
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 78526dfb8799485890dae3877fea308e9501879c drm-intel
82f7adb0d455 drm/xe/tests: Move shrink test out of xe_bo
-:58: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#58: FILE: drivers/gpu/drm/xe/tests/xe_live_test_mod.c:9:
+extern struct kunit_suite xe_bo_shrink_test_suite;

total: 0 errors, 1 warnings, 0 checks, 38 lines checked


