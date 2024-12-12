Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC41E7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 13:31:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5A110E22C;
	Thu, 12 Dec 2024 13:31:37 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76D710E426;
 Thu, 12 Dec 2024 13:31:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/tests=3A_Split_shr?=
 =?utf-8?q?ink_test_out_of_xe=5Fbo?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Dec 2024 13:31:36 -0000
Message-ID: <173401029674.1589450.1575969517508092170@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241212133810.3155721-1-nirmoy.das@intel.com>
In-Reply-To: <20241212133810.3155721-1-nirmoy.das@intel.com>
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

Series: drm/xe/tests: Split shrink test out of xe_bo
URL   : https://patchwork.freedesktop.org/series/142484/
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
commit 7052535893ded79aa2d1e0888a0a48d779a2ce9d
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Thu Dec 12 14:38:10 2024 +0100

    drm/xe/tests: Split shrink test out of xe_bo
    
    Currently, there is no good way to blocklist a dynamic subtest in IGT,
    so split out xe_bo_shrink into its own test, which can now be skipped
    from CI as it is meant to be run manually by developers because of its
    long execution time.
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 7b441ab54824526dd570dfbfbef51bcd2ba4c5b5 drm-intel
7052535893de drm/xe/tests: Split shrink test out of xe_bo
-:57: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#57: FILE: drivers/gpu/drm/xe/tests/xe_live_test_mod.c:9:
+extern struct kunit_suite xe_bo_shrink_test_suite;

total: 0 errors, 1 warnings, 0 checks, 38 lines checked


