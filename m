Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B84CC02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 11:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AF110EC56;
	Fri, 14 Feb 2025 11:34:07 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89CE10EC55;
 Fri, 14 Feb 2025 11:34:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_DRM_scheduler_kunit_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Feb 2025 11:34:06 -0000
Message-ID: <173953284681.2016199.8899121095369403840@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214112805.20008-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250214112805.20008-1-tvrtko.ursulin@igalia.com>
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

Series: DRM scheduler kunit tests
URL   : https://patchwork.freedesktop.org/series/144856/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 658156082b07624f4997027baa050d60e1dfe9cc
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Fri Feb 14 11:28:04 2025 +0000

    drm/scheduler: Add a basic test for modifying entities scheduler list
    
    Add a basic test for exercising modifying the entities scheduler list at
    runtime.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Danilo Krummrich <dakr@kernel.org>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Philipp Stanner <phasta@kernel.org>
+ /mt/dim checkpatch 57457d93f156d8b4bdff8d138127d81b8f97d8c9 drm-intel
208e077451b5 drm: Move some options to separate new Kconfig.debug
-:21: WARNING:EMBEDDED_FILENAME: It's generally not useful to have the filename in the file
#21: FILE: drivers/gpu/drm/Kconfig:31:
+source "drivers/gpu/drm/Kconfig.debug"

-:160: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#160: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 242 lines checked
6df8010cbdf8 drm/scheduler: Add scheduler unit testing infrastructure and some basic tests
-:37: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol
#37: FILE: drivers/gpu/drm/Kconfig.debug:102:
+config DRM_SCHED_KUNIT_TEST
+	tristate "KUnit tests for the DRM scheduler" if !KUNIT_ALL_TESTS
+	select DRM_SCHED
+	depends on DRM && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Choose this option to build unit tests for the DRM scheduler.
+
+	  Recommended for driver developers only.
+
+	  If in doubt, say "N".
+

-:52: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#52: 
new file mode 100644

-:156: WARNING:TYPO_SPELLING: 'upto' may be misspelled - perhaps 'up to'?
#156: FILE: drivers/gpu/drm/scheduler/tests/mock_scheduler.c:60:
+	struct drm_mock_sched_job *upto =
 	                           ^^^^

-:157: WARNING:TYPO_SPELLING: 'upto' may be misspelled - perhaps 'up to'?
#157: FILE: drivers/gpu/drm/scheduler/tests/mock_scheduler.c:61:
+		container_of(hrtimer, typeof(*upto), timer);
 		                              ^^^^

-:233: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#233: FILE: drivers/gpu/drm/scheduler/tests/mock_scheduler.c:137:
+}
+static void drm_mock_sched_hw_fence_release(struct dma_fence *fence)

-:315: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#315: FILE: drivers/gpu/drm/scheduler/tests/mock_scheduler.c:219:
+^I^I.ops ^I^I= &drm_mock_scheduler_ops,$

-:316: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#316: FILE: drivers/gpu/drm/scheduler/tests/mock_scheduler.c:220:
+^I^I.num_rqs ^I= DRM_SCHED_PRIORITY_COUNT,$

-:318: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#318: FILE: drivers/gpu/drm/scheduler/tests/mock_scheduler.c:222:
+^I^I.hang_limit ^I= UINT_MAX,$

-:320: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#320: FILE: drivers/gpu/drm/scheduler/tests/mock_scheduler.c:224:
+^I^I.name ^I^I= "drm-mock-scheduler",$

-:465: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#465: FILE: drivers/gpu/drm/scheduler/tests/sched_tests.h:47:
+	spinlock_t		lock;

-:484: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#484: FILE: drivers/gpu/drm/scheduler/tests/sched_tests.h:66:
+ struct drm_mock_sched_entity {$

-:497: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#497: FILE: drivers/gpu/drm/scheduler/tests/sched_tests.h:79:
+ * ^I^I timeline advance mode$

-:515: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#515: FILE: drivers/gpu/drm/scheduler/tests/sched_tests.h:97:
+	spinlock_t		lock;

-:610: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#610: FILE: drivers/gpu/drm/scheduler/tests/sched_tests.h:192:
+	ret = dma_fence_wait_timeout(&job->base.s_fence->finished,
+				      false,

-:630: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#630: FILE: drivers/gpu/drm/scheduler/tests/sched_tests.h:212:
+	ret = dma_fence_wait_timeout(&job->base.s_fence->scheduled,
+				      false,

-:822: ERROR:SPACING: space required after that ';' (ctx:VxV)
#822: FILE: drivers/gpu/drm/scheduler/tests/tests_basic.c:180:
+		drm_mock_sched_entity_free(entity[i]);}
 		                                     ^

total: 1 errors, 10 warnings, 5 checks, 770 lines checked
69be74b2779f drm/scheduler: Add a simple timeout test
5385f8527350 drm/scheduler: Add basic priority tests
-:49: WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#49: FILE: drivers/gpu/drm/scheduler/tests/tests_basic.c:273:
+	BUILD_BUG_ON(DRM_SCHED_PRIORITY_COUNT != ARRAY_SIZE(entity));

total: 0 errors, 1 warnings, 0 checks, 108 lines checked
658156082b07 drm/scheduler: Add a basic test for modifying entities scheduler list


