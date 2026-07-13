Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0355CC44501
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 18:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A972510E61A;
	Mon, 13 Jul 2026 18:23:22 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB09910E0FF;
 Mon, 13 Jul 2026 18:23:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe=3A_add_page_size_alloca?=
 =?utf-8?q?tion_mode_control_and_coverage_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Jul 2026 18:23:20 -0000
Message-ID: <178396700095.185203.8978376932207055808@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260713181605.3127204-1-naresh.kumar.g@intel.com>
In-Reply-To: <20260713181605.3127204-1-naresh.kumar.g@intel.com>
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

Series: drm/xe: add page size allocation mode control and coverage (rev3)
URL   : https://patchwork.freedesktop.org/series/168905/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_bo.c:4057:
../drivers/gpu/drm/xe/tests/xe_bo.c:26:43: error: field ‘mode’ has incomplete type
   26 |         enum xe_page_size_alloc_ctrl_mode mode;
      |                                           ^~~~
../drivers/gpu/drm/xe/tests/xe_bo.c: In function ‘page_size_alloc_save’:
../drivers/gpu/drm/xe/tests/xe_bo.c:34:21: error: ‘struct xe_device’ has no member named ‘page_size_alloc_ctrl’
   34 |         s->mode = xe->page_size_alloc_ctrl.mode;
      |                     ^~
../drivers/gpu/drm/xe/tests/xe_bo.c:35:26: error: ‘struct xe_device’ has no member named ‘page_size_alloc_ctrl’
   35 |         s->cur_index = xe->page_size_alloc_ctrl.cur_index;
      |                          ^~
In file included from ../include/linux/seqlock.h:20,
                 from ../include/linux/mmzone.h:17,
                 from ../include/linux/gfp.h:7,
                 from ../include/linux/mm.h:8,
                 from ../include/linux/pagemap.h:8,
                 from ../include/drm/ttm/ttm_tt.h:30,
                 from ../drivers/gpu/drm/xe/xe_bo.h:9,
                 from ../drivers/gpu/drm/xe/xe_bo.c:6:
../drivers/gpu/drm/xe/tests/xe_bo.c: In function ‘page_size_alloc_restore’:
../drivers/gpu/drm/xe/tests/xe_bo.c:41:23: error: ‘struct xe_device’ has no member named ‘page_size_alloc_ctrl’
   41 |         mutex_lock(&xe->page_size_alloc_ctrl.lock);
      |                       ^~
../include/linux/mutex.h:193:44: note: in definition of macro ‘mutex_lock’
  193 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
      |                                            ^~~~
../drivers/gpu/drm/xe/tests/xe_bo.c:42:11: error: ‘struct xe_device’ has no member named ‘page_size_alloc_ctrl’
   42 |         xe->page_size_alloc_ctrl.mode = s->mode;
      |           ^~
../drivers/gpu/drm/xe/tests/xe_bo.c:43:11: error: ‘struct xe_device’ has no member named ‘page_size_alloc_ctrl’
   43 |         xe->page_size_alloc_ctrl.cur_index = s->cur_index;
      |           ^~
../drivers/gpu/drm/xe/tests/xe_bo.c:44:25: error: ‘struct xe_device’ has no member named ‘page_size_alloc_ctrl’
   44 |         mutex_unlock(&xe->page_size_alloc_ctrl.lock);
      |                         ^~
../drivers/gpu/drm/xe/tests/xe_bo.c: At top level:
../drivers/gpu/drm/xe/tests/xe_bo.c:70:61: error: parameter 2 (‘mode’) has incomplete type
   70 |                           enum xe_page_size_alloc_ctrl_mode mode,
      |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
../drivers/gpu/drm/xe/tests/xe_bo.c:69:13: error: function declaration isn’t a prototype [-Werror=strict-prototypes]
   69 | static void run_only_leaf(struct kunit *test,
      |             ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_bo.c: In function ‘run_only_leaf’:
../drivers/gpu/drm/xe/tests/xe_bo.c:89:23: error: ‘struct xe_device’ has no member named ‘page_size_alloc_ctrl’
   89 |         mutex_lock(&xe->page_size_alloc_ctrl.lock);
      |                       ^~
../include/linux/mutex.h:193:44: note: in definition of macro ‘mutex_lock’
  193 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
      |                                            ^~~~
../drivers/gpu/drm/xe/tests/xe_bo.c:91:11: error: ‘struct xe_device’ has no member named ‘page_size_alloc_ctrl’
   91 |         xe->page_size_alloc_ctrl.mode = mode;
      |           ^~
../drivers/gpu/drm/xe/tests/xe_bo.c:92:25: error: ‘struct xe_device’ has no member named ‘page_size_alloc_ctrl’
   92 |         mutex_unlock(&xe->page_size_alloc_ctrl.lock);
      |                         ^~
../drivers/gpu/drm/xe/tests/xe_bo.c: In function ‘xe_bo_page_size_alloc_only_2m’:
../drivers/gpu/drm/xe/tests/xe_bo.c:147:29: error: ‘XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M’ undeclared (first use in this function)
  147 |         run_only_leaf(test, XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M, &leaf_2m);
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_bo.c:147:29: note: each undeclared identifier is reported only once for each function it appears in
../drivers/gpu/drm/xe/tests/xe_bo.c: In function ‘xe_bo_page_size_alloc_only_1g’:
../drivers/gpu/drm/xe/tests/xe_bo.c:152:29: error: ‘XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G’ undeclared (first use in this function)
  152 |         run_only_leaf(test, XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G, &leaf_1g);
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_bo.c: In function ‘xe_bo_page_size_alloc_mixed_bos’:
../drivers/gpu/drm/xe/tests/xe_bo.c:178:23: error: ‘struct xe_device’ has no member named ‘page_size_alloc_ctrl’
  178 |         mutex_lock(&xe->page_size_alloc_ctrl.lock);
      |                       ^~
../include/linux/mutex.h:193:44: note: in definition of macro ‘mutex_lock’
  193 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
      |                                            ^~~~
../drivers/gpu/drm/xe/tests/xe_bo.c:180:11: error: ‘struct xe_device’ has no member named ‘page_size_alloc_ctrl’
  180 |         xe->page_size_alloc_ctrl.mode = XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED;
      |           ^~
../drivers/gpu/drm/xe/tests/xe_bo.c:180:41: error: ‘XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED’ undeclared (first use in this function)
  180 |         xe->page_size_alloc_ctrl.mode = XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED;
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/tests/xe_bo.c:181:11: error: ‘struct xe_device’ has no member named ‘page_size_alloc_ctrl’
  181 |         xe->page_size_alloc_ctrl.cur_index = 0;
      |           ^~
../drivers/gpu/drm/xe/tests/xe_bo.c:182:25: error: ‘struct xe_device’ has no member named ‘page_size_alloc_ctrl’
  182 |         mutex_unlock(&xe->page_size_alloc_ctrl.lock);
      |                         ^~
../drivers/gpu/drm/xe/tests/xe_bo.c:208:31: error: ‘struct xe_device’ has no member named ‘page_size_alloc_ctrl’
  208 |                 mutex_lock(&xe->page_size_alloc_ctrl.lock);
      |                               ^~
../include/linux/mutex.h:193:44: note: in definition of macro ‘mutex_lock’
  193 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
      |                                            ^~~~
../drivers/gpu/drm/xe/tests/xe_bo.c:209:19: error: ‘struct xe_device’ has no member named ‘page_size_alloc_ctrl’
  209 |                 xe->page_size_alloc_ctrl.mode = XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED;
      |                   ^~
../drivers/gpu/drm/xe/tests/xe_bo.c:210:19: error: ‘struct xe_device’ has no member named ‘page_size_alloc_ctrl’
  210 |                 xe->page_size_alloc_ctrl.cur_index = i;
      |                   ^~
../drivers/gpu/drm/xe/tests/xe_bo.c:211:33: error: ‘struct xe_device’ has no member named ‘page_size_alloc_ctrl’
  211 |                 mutex_unlock(&xe->page_size_alloc_ctrl.lock);
      |                                 ^~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:289: drivers/gpu/drm/xe/xe_bo.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:549: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:549: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:549: drivers/gpu] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [../scripts/Makefile.build:549: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:2184: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[18:22:48] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:22:53] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


