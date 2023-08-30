Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC98C6FA8F
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 14:23:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0828410E52E;
	Wed, 30 Aug 2023 14:23:33 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7A7D810E52E;
 Wed, 30 Aug 2023 14:23:31 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 73D0CAADF2;
 Wed, 30 Aug 2023 14:23:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Wed, 30 Aug 2023 14:23:31 -0000
Message-ID: <169340541145.15234.10703551975423020610@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230830123722.6-1-francois.dugast@intel.com>
In-Reply-To: <20230830123722.6-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_Use_Xe_?=
 =?utf-8?q?assert_macros_instead_of_XE=5FWARN=5FON_macro_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Use Xe assert macros instead of XE_WARN_ON macro (rev2)
URL   : https://patchwork.freedesktop.org/series/122906/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[14:22:19] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:22:23] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/tests/xe_pci_test.c:13:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/tests/xe_wa_test.c:11:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/tests/xe_rtp_test.c:16:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_bb.c:9:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bb.c: In function ‘__xe_bb_create_job’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bb.c:69:2: note: in expansion of macro ‘xe_gt_assert’
   69 |  xe_gt_assert(q->gt, bb->len * 4 + bb_prefetch(q->gt) <= size);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bb.c: In function ‘xe_bb_create_migration_job’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bb.c:87:2: note: in expansion of macro ‘xe_gt_assert’
   87 |  xe_gt_assert(q->gt, second_idx <= bb->len);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bb.c:88:2: note: in expansion of macro ‘xe_gt_assert’
   88 |  xe_gt_assert(q->gt, q->vm->flags & XE_VM_FLAG_MIGRATION);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bb.c: In function ‘xe_bb_create_job’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bb.c:98:2: note: in expansion of macro ‘xe_gt_assert’
   98 |  xe_gt_assert(q->gt, !(q->vm && q->vm->flags & XE_VM_FLAG_MIGRATION));
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo.c:17:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bo.c: In function ‘xe_bo_move’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:146:41: note: in expansion of macro ‘xe_tile_assert_msg’
  146 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_bo.c:711:2: note: in expansion of macro ‘xe_tile_assert’
  711 |  xe_tile_assert(tile, tile->migrate);
      |  ^~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_bo_evict.c:9:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_debugfs.c:14:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_devcoredump.c:12:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_device_sysfs.c:12:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_device.c:6:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_dma_buf.c:18:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_exec.c:14:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_execlist.c:15:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_execlist.c:15:
../drivers/gpu/drm/xe/xe_execlist.c: In function ‘__start_lrc’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_execlist.c:54:3: note: in expansion of macro ‘xe_gt_assert’
   54 |   xe_gt_assert(hwe->gt, FIELD_FIT(XEHP_SW_CTX_ID, ctx_id));
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_execlist.c:57:3: note: in expansion of macro ‘xe_gt_assert’
   57 |   xe_gt_assert(hwe->gt, FIELD_FIT(GEN11_SW_CTX_ID, ctx_id));
      |   ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_force_wake.c:6:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_exec_queue.c:14:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.c: In function ‘xe_force_wake_init_gt’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.c:48:2: note: in expansion of macro ‘xe_gt_assert’
   48 |  xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.c: In function ‘xe_force_wake_init_engines’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.c:70:2: note: in expansion of macro ‘xe_gt_assert’
   70 |  xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_ggtt.c:16:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_ggtt.c:16:
../drivers/gpu/drm/xe/xe_ggtt.c: In function ‘xe_ggtt_set_pte’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:146:41: note: in expansion of macro ‘xe_tile_assert_msg’
  146 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ggtt.c:61:2: note: in expansion of macro ‘xe_tile_assert’
   61 |  xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
      |  ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:146:41: note: in expansion of macro ‘xe_tile_assert_msg’
  146 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ggtt.c:62:2: note: in expansion of macro ‘xe_tile_assert’
   62 |  xe_tile_assert(ggtt->tile, addr < ggtt->size);
      |  ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ggtt.c: In function ‘xe_ggtt_clear’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:146:41: note: in expansion of macro ‘xe_tile_assert_msg’
  146 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ggtt.c:72:2: note: in expansion of macro ‘xe_tile_assert’
   72 |  xe_tile_assert(ggtt->tile, start < end);
      |  ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ggtt.c: In function ‘ggtt_invalidate_gt_tlb’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ggtt.c:233:3: note: in expansion of macro ‘xe_gt_assert’
  233 |   xe_gt_assert(gt, seqno > 0);
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ggtt.c: In function ‘xe_ggtt_printk’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:146:41: note: in expansion of macro ‘xe_tile_assert_msg’
  146 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ggtt.c:269:3: note: in expansion of macro ‘xe_tile_assert’
  269 |   xe_tile_assert(ggtt->tile, addr <= U32_MAX);
      |   ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ggtt.c: In function ‘__xe_ggtt_insert_bo_at’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:146:41: note: in expansion of macro ‘xe_tile_assert_msg’
  146 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ggtt.c:322:3: note: in expansion of macro ‘xe_tile_assert’
  322 |   xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
      |   ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ggtt.c: In function ‘xe_ggtt_remove_bo’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:146:41: note: in expansion of macro ‘xe_tile_assert_msg’
  146 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ggtt.c:374:2: note: in expansion of macro ‘xe_tile_assert’
  374 |  xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
      |  ^~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_gt_clock.c:10:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_gt.c:14:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_clock.c: In function ‘xe_gt_clock_init’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_clock.c:61:2: note: in expansion of macro ‘xe_gt_assert’
   61 |  xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_gt_debugfs.c:11:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_debugfs.c: In function ‘xe_gt_debugfs_register’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_debugfs.c:161:2: note: in expansion of macro ‘xe_gt_assert’
  161 |  xe_gt_assert(gt, minor->debugfs_root);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_gt_idle_sysfs.c:8:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_map.h:11,
                 from ../drivers/gpu/drm/xe/xe_vm.h:11,
                 from ../drivers/gpu/drm/xe/xe_trace.h:21,
                 from ../drivers/gpu/drm/xe/xe_gt_pagefault.c:21:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:8:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:8:
../drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c: In function ‘xe_gt_tlb_invalidation_vma’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:253:2: note: in expansion of macro ‘xe_gt_assert’
  253 |  xe_gt_assert(gt, vma);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:291:3: note: in expansion of macro ‘xe_gt_assert’
  291 |   xe_gt_assert(gt, length >= SZ_4K);
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:292:3: note: in expansion of macro ‘xe_gt_assert’
  292 |   xe_gt_assert(gt, is_power_of_2(length));
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:293:3: note: in expansion of macro ‘xe_gt_assert’
  293 |   xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1, ilog2(SZ_2M) + 1)));
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:294:3: note: in expansion of macro ‘xe_gt_assert’
  294 |   xe_gt_assert(gt, IS_ALIGNED(start, length));
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:303:2: note: in expansion of macro ‘xe_gt_assert’
  303 |  xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_map.h:11,
                 from ../drivers/gpu/drm/xe/xe_guc_ads.c:18:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_map.h:11,
                 from ../drivers/gpu/drm/xe/xe_guc_ads.c:18:
../drivers/gpu/drm/xe/xe_guc_ads.c: In function ‘xe_guc_ads_init_post_hwconfig’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ads.c:314:2: note: in expansion of macro ‘xe_gt_assert’
  314 |  xe_gt_assert(gt, ads->bo);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ads.c:319:2: note: in expansion of macro ‘xe_gt_assert’
  319 |  xe_gt_assert(gt, ads->golden_lrc_size +
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ads.c: In function ‘guc_mmio_reg_state_init’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ads.c:522:2: note: in expansion of macro ‘xe_gt_assert’
  522 |  xe_gt_assert(gt, regset_used <= ads->regset_size);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ads.c: In function ‘xe_guc_ads_populate_minimal’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ads.c:577:2: note: in expansion of macro ‘xe_gt_assert’
  577 |  xe_gt_assert(gt, ads->bo);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ads.c: In function ‘xe_guc_ads_populate’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ads.c:601:2: note: in expansion of macro ‘xe_gt_assert’
  601 |  xe_gt_assert(gt, ads->bo);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ads.c: In function ‘guc_populate_golden_lrc’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ads.c:648:3: note: in expansion of macro ‘xe_gt_assert’
  648 |   xe_gt_assert(gt, gt->default_lrc[class]);
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_ads.c:677:2: note: in expansion of macro ‘xe_gt_assert’
  677 |  xe_gt_assert(gt, total_size == ads->golden_lrc_size);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_guc_ct.c:15:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_guc_debugfs.c:11:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_guc_hwconfig.c:11:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_map.h:11,
                 from ../drivers/gpu/drm/xe/xe_guc_log.c:12:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_guc_pc.c:15:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_guc_pc.c:15:
../drivers/gpu/drm/xe/xe_guc_pc.c: In function ‘xe_guc_pc_start’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:819:2: note: in expansion of macro ‘xe_gt_assert’
  819 |  xe_gt_assert(gt, xe_device_guc_submission_enabled(xe));
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_guc_submit.c:17:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_hw_engine.c:13:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_hw_engine.c:13:
../drivers/gpu/drm/xe/xe_hw_engine.c: In function ‘hw_engine_mmio_write32’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine.c:248:2: note: in expansion of macro ‘xe_gt_assert’
  248 |  xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine.c: In function ‘hw_engine_mmio_read32’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine.c:258:2: note: in expansion of macro ‘xe_gt_assert’
  258 |  xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine.c: In function ‘hw_engine_init_early’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine.c:378:2: note: in expansion of macro ‘xe_gt_assert’
  378 |  xe_gt_assert(gt, !hwe->gt);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine.c: In function ‘hw_engine_init’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine.c:419:2: note: in expansion of macro ‘xe_gt_assert’
  419 |  xe_gt_assert(gt, id < ARRAY_SIZE(engine_infos) && engine_infos[id].name);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_hw_engine.c:420:2: note: in expansion of macro ‘xe_gt_assert’
  420 |  xe_gt_assert(gt, gt->info.engine_mask & BIT(id));
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_hw_fence.c:12:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_huc.c:9:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_huc_debugfs.c:11:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_irq.c:14:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_lrc.c:14:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_lrc.c:14:
../drivers/gpu/drm/xe/xe_lrc.c: In function ‘set_offsets’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_lrc.c:119:3: note: in expansion of macro ‘xe_gt_assert’
  119 |   xe_gt_assert(hwe->gt, count);
      |   ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_mmio.c:17:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_mocs.c:10:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_pci.c:19:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_pm.c:15:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_map.h:11,
                 from ../drivers/gpu/drm/xe/xe_vm.h:11,
                 from ../drivers/gpu/drm/xe/xe_preempt_fence.c:11:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_pt.c:9:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_pt.c:9:
../drivers/gpu/drm/xe/xe_pt.c: In function ‘xe_pt_create’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:146:41: note: in expansion of macro ‘xe_tile_assert_msg’
  146 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c:199:2: note: in expansion of macro ‘xe_tile_assert’
  199 |  xe_tile_assert(tile, level <= XE_VM_MAX_LEVEL);
      |  ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c: In function ‘xe_pt_prepare_bind’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:146:41: note: in expansion of macro ‘xe_tile_assert_msg’
  146 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c:1007:3: note: in expansion of macro ‘xe_tile_assert’
 1007 |   xe_tile_assert(tile, *num_entries);
      |   ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c: In function ‘invalidation_fence_init’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c:1279:2: note: in expansion of macro ‘xe_gt_assert’
 1279 |  xe_gt_assert(gt, !ret || ret == -ENOENT);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c: In function ‘__xe_pt_bind_vma’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:146:41: note: in expansion of macro ‘xe_tile_assert_msg’
  146 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c:1359:2: note: in expansion of macro ‘xe_tile_assert’
 1359 |  xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
      |  ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c: In function ‘__xe_pt_unbind_vma’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:146:41: note: in expansion of macro ‘xe_tile_assert_msg’
  146 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c:1710:2: note: in expansion of macro ‘xe_tile_assert’
 1710 |  xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
      |  ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:146:41: note: in expansion of macro ‘xe_tile_assert_msg’
  146 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_pt.c:1776:3: note: in expansion of macro ‘xe_tile_assert’
 1776 |   xe_tile_assert(tile, xe_vma_is_userptr(vma));
      |   ^~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_reg_sr.c:19:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_query.c:14:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_map.h:11,
                 from ../drivers/gpu/drm/xe/xe_vm.h:11,
                 from ../drivers/gpu/drm/xe/xe_ring_ops.c:19:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ring_ops.c: In function ‘__emit_job_gen12_simple’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ring_ops.c:238:2: note: in expansion of macro ‘xe_gt_assert’
  238 |  xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ring_ops.c: In function ‘__emit_job_gen12_video’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ring_ops.c:298:2: note: in expansion of macro ‘xe_gt_assert’
  298 |  xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ring_ops.c: In function ‘__emit_job_gen12_render_compute’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ring_ops.c:346:2: note: in expansion of macro ‘xe_gt_assert’
  346 |  xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ring_ops.c: In function ‘emit_migration_job_gen12’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ring_ops.c:376:2: note: in expansion of macro ‘xe_gt_assert’
  376 |  xe_gt_assert(job->q->gt, i <= MAX_JOB_SIZE_DW);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ring_ops.c: In function ‘emit_job_gen12_gsc’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_ring_ops.c:385:2: note: in expansion of macro ‘xe_gt_assert’
  385 |  xe_gt_assert(gt, job->q->width <= 1); /* no parallel submission for GSCCS */
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_sa.c:13:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_sched_job.c:11:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_step.c:10:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_tile.c:8:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_map.h:11,
                 from ../drivers/gpu/drm/xe/xe_vm.h:11,
                 from ../drivers/gpu/drm/xe/xe_trace.h:21,
                 from ../drivers/gpu/drm/xe/xe_trace.c:8:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c:16:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:13:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_uc.c:8:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_uc.c: In function ‘xe_uc_init_hw’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_uc.c:165:2: note: in expansion of macro ‘xe_gt_assert’
  165 |  xe_gt_assert(uc_to_gt(uc), !ret);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_uc_fw.c:14:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_uc_fw.c:14:
../drivers/gpu/drm/xe/xe_uc_fw.c: In function ‘guc_read_css_info’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_uc_fw.c:252:2: note: in expansion of macro ‘xe_gt_assert’
  252 |  xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_uc_fw.c:253:2: note: in expansion of macro ‘xe_gt_assert’
  253 |  xe_gt_assert(gt, uc_fw->major_ver_found >= 70);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_map.h:11,
                 from ../drivers/gpu/drm/xe/xe_vm.h:11,
                 from ../drivers/gpu/drm/xe/xe_vm.c:6:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_map.h:11,
                 from ../drivers/gpu/drm/xe/xe_vm.h:11,
                 from ../drivers/gpu/drm/xe/xe_vm_madvise.c:14:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_wa.c:17:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_wait_user_fence.c:13:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_wopcm.c:9:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from ../drivers/gpu/drm/xe/xe_device.h:16,
                 from ../drivers/gpu/drm/xe/xe_guc.c:12:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_migrate.c:18:
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_ref’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:27:2: note: in expansion of macro ‘xe_gt_assert’
   27 |  xe_gt_assert(fw->gt, domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h: In function ‘xe_force_wake_assert_held’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_force_wake.h:35:2: note: in expansion of macro ‘xe_gt_assert’
   35 |  xe_gt_assert(fw->gt, fw->awake_domains & domain);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c: In function ‘xe_migrate_prepare_vm’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:146:41: note: in expansion of macro ‘xe_tile_assert_msg’
  146 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:177:2: note: in expansion of macro ‘xe_tile_assert’
  177 |  xe_tile_assert(tile, m->batch_base_ofs + batch->size < SZ_2M);
      |  ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:146:41: note: in expansion of macro ‘xe_tile_assert_msg’
  146 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:211:3: note: in expansion of macro ‘xe_tile_assert’
  211 |   xe_tile_assert(tile, !xe->info.supports_usm);
      |   ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c: In function ‘emit_pte’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:146:41: note: in expansion of macro ‘xe_tile_assert_msg’
  146 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:493:6: note: in expansion of macro ‘xe_tile_assert’
  493 |      xe_tile_assert(m->tile, IS_ALIGNED(addr, SZ_64K));
      |      ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c: In function ‘emit_copy_ccs’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:522:2: note: in expansion of macro ‘xe_gt_assert’
  522 |  xe_gt_assert(gt, num_ccs_blks <= NUM_CCS_BLKS_PER_XFER);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c: In function ‘emit_copy’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:542:2: note: in expansion of macro ‘xe_gt_assert’
  542 |  xe_gt_assert(gt, size / pitch <= S16_MAX);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:543:2: note: in expansion of macro ‘xe_gt_assert’
  543 |  xe_gt_assert(gt, pitch / 4 <= S16_MAX);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:544:2: note: in expansion of macro ‘xe_gt_assert’
  544 |  xe_gt_assert(gt, pitch <= U16_MAX);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c: In function ‘xe_migrate_ccs_copy’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:604:3: note: in expansion of macro ‘xe_gt_assert’
  604 |   xe_gt_assert(gt, src_is_vram || dst_is_vram);
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c: In function ‘emit_clear_link_copy’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:816:2: note: in expansion of macro ‘xe_gt_assert’
  816 |  xe_gt_assert(gt, cs - bb->cs == len + bb->len);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c: In function ‘emit_clear_main_copy’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:173:2: note: in expansion of macro ‘xe_tile_assert_msg’
  173 |  xe_tile_assert_msg(gt_to_tile(__gt), condition, "GT: %u type %d\n" msg,   \
      |  ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:170:37: note: in expansion of macro ‘xe_gt_assert_msg’
  170 | #define xe_gt_assert(gt, condition) xe_gt_assert_msg((gt), condition, "")
      |                                     ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:854:2: note: in expansion of macro ‘xe_gt_assert’
  854 |  xe_gt_assert(gt, cs - bb->cs == len + bb->len);
      |  ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c: In function ‘write_pgtable’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:146:41: note: in expansion of macro ‘xe_tile_assert_msg’
  146 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:1029:2: note: in expansion of macro ‘xe_tile_assert’
 1029 |  xe_tile_assert(tile, update->qwords <= 0x1ff);
      |  ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c: In function ‘xe_migrate_update_pgtables’:
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:146:41: note: in expansion of macro ‘xe_tile_assert_msg’
  146 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:1219:2: note: in expansion of macro ‘xe_tile_assert’
 1219 |  xe_tile_assert(tile, batch_size < SZ_128K);
      |  ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:146:41: note: in expansion of macro ‘xe_tile_assert_msg’
  146 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:1229:4: note: in expansion of macro ‘xe_tile_assert’
 1229 |    xe_tile_assert(tile, num_updates <= NUM_VMUSA_WRITES_PER_UNIT);
      |    ^~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_assert.h:149:7: warning: unused variable ‘__buf’ [-Wunused-variable]
  149 |  char __buf[10];          \
      |       ^~~~~
../drivers/gpu/drm/xe/xe_assert.h:146:41: note: in expansion of macro ‘xe_tile_assert_msg’
  146 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
      |                                         ^~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_migrate.c:1258:4: note: in expansion of macro ‘xe_tile_assert’
 1258 |    xe_tile_assert(tile, pt_bo->size == SZ_4K);
      |    ^~~~~~~~~~~~~~
stty: 'standard input': Inappropriate ioctl for device

[14:22:43] Starting KUnit Kernel (1/1)...
[14:22:43] ============================================================
[14:22:43] ==================== xe_bo (2 subtests) ====================
[14:22:43] [SKIPPED] xe_ccs_migrate_kunit
[14:22:43] [SKIPPED] xe_bo_evict_kunit
[14:22:43] ===================== [SKIPPED] xe_bo ======================
[14:22:43] ================== xe_dma_buf (1 subtest) ==================
[14:22:43] [SKIPPED] xe_dma_buf_kunit
[14:22:43] =================== [SKIPPED] xe_dma_buf ===================
[14:22:43] ================== xe_migrate (1 subtest) ==================
[14:22:43] [SKIPPED] xe_migrate_sanity_kunit
[14:22:43] =================== [SKIPPED] xe_migrate ===================
[14:22:43] =================== xe_pci (2 subtests) ====================
[14:22:43] [PASSED] xe_gmdid_graphics_ip
[14:22:43] [PASSED] xe_gmdid_media_ip
[14:22:43] ===================== [PASSED] xe_pci ======================
[14:22:43] ==================== xe_rtp (1 subtest) ====================
[14:22:43] ================== xe_rtp_process_tests  ===================
[14:22:43] [PASSED] coalesce-same-reg
[14:22:43] [PASSED] no-match-no-add
[14:22:43] [PASSED] no-match-no-add-multiple-rules
[14:22:43] [PASSED] two-regs-two-entries
[14:22:43] [PASSED] clr-one-set-other
[14:22:43] [PASSED] set-field
[14:22:43] [PASSED] conflict-duplicate
[14:22:43] [PASSED] conflict-not-disjoint
[14:22:43] [PASSED] conflict-reg-type
[14:22:43] ============== [PASSED] xe_rtp_process_tests ===============
[14:22:43] ===================== [PASSED] xe_rtp ======================
[14:22:43] ==================== xe_wa (1 subtest) =====================
[14:22:43] ======================== xe_wa_gt  =========================
[14:22:43] [PASSED] TIGERLAKE (B0)
[14:22:43] [PASSED] DG1 (A0)
[14:22:43] [PASSED] DG1 (B0)
[14:22:43] [PASSED] ALDERLAKE_S (A0)
[14:22:43] [PASSED] ALDERLAKE_S (B0)
[14:22:43] [PASSED] ALDERLAKE_S (C0)
[14:22:43] [PASSED] ALDERLAKE_S (D0)
[14:22:43] [PASSED] ALDERLAKE_P (A0)
[14:22:43] [PASSED] ALDERLAKE_P (B0)
[14:22:43] [PASSED] ALDERLAKE_P (C0)
[14:22:43] [PASSED] DG2_G10 (A0)
[14:22:43] [PASSED] DG2_G10 (A1)
[14:22:43] [PASSED] DG2_G10 (B0)
[14:22:43] [PASSED] DG2_G10 (C0)
[14:22:43] [PASSED] DG2_G11 (A0)
[14:22:43] [PASSED] DG2_G11 (B0)
[14:22:43] [PASSED] DG2_G11 (B1)
[14:22:43] [PASSED] DG2_G12 (A0)
[14:22:43] [PASSED] DG2_G12 (A1)
[14:22:43] [PASSED] PVC (B0)
[14:22:43] [PASSED] PVC (B1)
[14:22:43] [PASSED] PVC (C0)
[14:22:43] ==================== [PASSED] xe_wa_gt =====================
[14:22:43] ====================== [PASSED] xe_wa ======================
[14:22:43] ============================================================
[14:22:43] Testing complete. Ran 37 tests: passed: 33, skipped: 4
[14:22:43] Elapsed time: 24.197s total, 4.216s configuring, 19.861s building, 0.101s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[14:22:43] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[14:22:45] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
[14:23:04] Starting KUnit Kernel (1/1)...
[14:23:04] ============================================================
[14:23:04] ============ drm_test_pick_cmdline (2 subtests) ============
[14:23:04] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[14:23:04] =============== drm_test_pick_cmdline_named  ===============
[14:23:04] [PASSED] NTSC
[14:23:04] [PASSED] NTSC-J
[14:23:04] [PASSED] PAL
[14:23:04] [PASSED] PAL-M
[14:23:04] =========== [PASSED] drm_test_pick_cmdline_named ===========
[14:23:04] ============== [PASSED] drm_test_pick_cmdline ==============
[14:23:04] ================== drm_buddy (6 subtests) ==================
[14:23:04] [PASSED] drm_test_buddy_alloc_limit
[14:23:04] [PASSED] drm_test_buddy_alloc_range
[14:23:04] [PASSED] drm_test_buddy_alloc_optimistic
[14:23:04] [PASSED] drm_test_buddy_alloc_pessimistic
[14:23:04] [PASSED] drm_test_buddy_alloc_smoke
[14:23:04] [PASSED] drm_test_buddy_alloc_pathological
[14:23:04] ==================== [PASSED] drm_buddy ====================
[14:23:04] ============= drm_cmdline_parser (40 subtests) =============
[14:23:04] [PASSED] drm_test_cmdline_force_d_only
[14:23:04] [PASSED] drm_test_cmdline_force_D_only_dvi
[14:23:04] [PASSED] drm_test_cmdline_force_D_only_hdmi
[14:23:04] [PASSED] drm_test_cmdline_force_D_only_not_digital
[14:23:04] [PASSED] drm_test_cmdline_force_e_only
[14:23:04] [PASSED] drm_test_cmdline_res
[14:23:04] [PASSED] drm_test_cmdline_res_vesa
[14:23:04] [PASSED] drm_test_cmdline_res_vesa_rblank
[14:23:04] [PASSED] drm_test_cmdline_res_rblank
[14:23:04] [PASSED] drm_test_cmdline_res_bpp
[14:23:04] [PASSED] drm_test_cmdline_res_refresh
[14:23:04] [PASSED] drm_test_cmdline_res_bpp_refresh
[14:23:04] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[14:23:04] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[14:23:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[14:23:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[14:23:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[14:23:04] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[14:23:04] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[14:23:04] [PASSED] drm_test_cmdline_res_margins_force_on
[14:23:04] [PASSED] drm_test_cmdline_res_vesa_margins
[14:23:04] [PASSED] drm_test_cmdline_name
[14:23:04] [PASSED] drm_test_cmdline_name_bpp
[14:23:04] [PASSED] drm_test_cmdline_name_option
[14:23:04] [PASSED] drm_test_cmdline_name_bpp_option
[14:23:04] [PASSED] drm_test_cmdline_rotate_0
[14:23:04] [PASSED] drm_test_cmdline_rotate_90
[14:23:04] [PASSED] drm_test_cmdline_rotate_180
[14:23:04] [PASSED] drm_test_cmdline_rotate_270
[14:23:04] [PASSED] drm_test_cmdline_hmirror
[14:23:04] [PASSED] drm_test_cmdline_vmirror
[14:23:04] [PASSED] drm_test_cmdline_margin_options
[14:23:04] [PASSED] drm_test_cmdline_multiple_options
[14:23:04] [PASSED] drm_test_cmdline_bpp_extra_and_option
[14:23:04] [PASSED] drm_test_cmdline_extra_and_option
[14:23:04] [PASSED] drm_test_cmdline_freestanding_options
[14:23:04] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[14:23:04] [PASSED] drm_test_cmdline_panel_orientation
[14:23:04] ================ drm_test_cmdline_invalid  =================
[14:23:04] [PASSED] margin_only
[14:23:04] [PASSED] interlace_only
[14:23:04] [PASSED] res_missing_x
[14:23:04] [PASSED] res_missing_y
[14:23:04] [PASSED] res_bad_y
[14:23:04] [PASSED] res_missing_y_bpp
[14:23:04] [PASSED] res_bad_bpp
[14:23:04] [PASSED] res_bad_refresh
[14:23:04] [PASSED] res_bpp_refresh_force_on_off
[14:23:04] [PASSED] res_invalid_mode
[14:23:04] [PASSED] res_bpp_wrong_place_mode
[14:23:04] [PASSED] name_bpp_refresh
[14:23:04] [PASSED] name_refresh
[14:23:04] [PASSED] name_refresh_wrong_mode
[14:23:04] [PASSED] name_refresh_invalid_mode
[14:23:04] [PASSED] rotate_multiple
[14:23:04] [PASSED] rotate_invalid_val
[14:23:04] [PASSED] rotate_truncated
[14:23:04] [PASSED] invalid_option
[14:23:04] [PASSED] invalid_tv_option
[14:23:04] [PASSED] truncated_tv_option
[14:23:04] ============ [PASSED] drm_test_cmdline_invalid =============
[14:23:04] =============== drm_test_cmdline_tv_options  ===============
[14:23:04] [PASSED] NTSC
[14:23:04] [PASSED] NTSC_443
[14:23:04] [PASSED] NTSC_J
[14:23:04] [PASSED] PAL
[14:23:04] [PASSED] PAL_M
[14:23:04] [PASSED] PAL_N
[14:23:04] [PASSED] SECAM
[14:23:04] =========== [PASSED] drm_test_cmdline_tv_options ===========
[14:23:04] =============== [PASSED] drm_cmdline_parser ================
[14:23:04] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[14:23:04] ========== drm_test_get_tv_mode_from_name_valid  ===========
[14:23:04] [PASSED] NTSC
[14:23:04] [PASSED] NTSC-443
[14:23:04] [PASSED] NTSC-J
[14:23:04] [PASSED] PAL
[14:23:04] [PASSED] PAL-M
[14:23:04] [PASSED] PAL-N
[14:23:04] [PASSED] SECAM
[14:23:04] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[14:23:04] [PASSED] drm_test_get_tv_mode_from_name_truncated
[14:23:04] ============ [PASSED] drm_get_tv_mode_from_name ============
[14:23:04] ============= drm_damage_helper (21 subtests) ==============
[14:23:04] [PASSED] drm_test_damage_iter_no_damage
[14:23:04] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[14:23:04] [PASSED] drm_test_damage_iter_no_damage_src_moved
[14:23:04] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[14:23:04] [PASSED] drm_test_damage_iter_no_damage_not_visible
[14:23:04] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[14:23:04] [PASSED] drm_test_damage_iter_no_damage_no_fb
[14:23:04] [PASSED] drm_test_damage_iter_simple_damage
[14:23:04] [PASSED] drm_test_damage_iter_single_damage
[14:23:04] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[14:23:04] [PASSED] drm_test_damage_iter_single_damage_outside_src
[14:23:04] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[14:23:04] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[14:23:04] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[14:23:04] [PASSED] drm_test_damage_iter_single_damage_src_moved
[14:23:04] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[14:23:04] [PASSED] drm_test_damage_iter_damage
[14:23:04] [PASSED] drm_test_damage_iter_damage_one_intersect
[14:23:04] [PASSED] drm_test_damage_iter_damage_one_outside
[14:23:04] [PASSED] drm_test_damage_iter_damage_src_moved
[14:23:04] [PASSED] drm_test_damage_iter_damage_not_visible
[14:23:04] ================ [PASSED] drm_damage_helper ================
[14:23:04] ============== drm_dp_mst_helper (2 subtests) ==============
[14:23:04] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[14:23:04] [PASSED] Clock 154000 BPP 30 DSC disabled
[14:23:04] [PASSED] Clock 234000 BPP 30 DSC disabled
[14:23:04] [PASSED] Clock 297000 BPP 24 DSC disabled
[14:23:04] [PASSED] Clock 332880 BPP 24 DSC enabled
[14:23:04] [PASSED] Clock 324540 BPP 24 DSC enabled
[14:23:04] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[14:23:04] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[14:23:04] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[14:23:04] [PASSED] DP_POWER_UP_PHY with port number
[14:23:04] [PASSED] DP_POWER_DOWN_PHY with port number
[14:23:04] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[14:23:04] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[14:23:04] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[14:23:04] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[14:23:04] [PASSED] DP_QUERY_PAYLOAD with port number
[14:23:04] [PASSED] DP_QUERY_PAYLOAD with VCPI
[14:23:04] [PASSED] DP_REMOTE_DPCD_READ with port number
[14:23:04] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[14:23:04] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[14:23:04] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[14:23:04] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[14:23:04] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[14:23:04] [PASSED] DP_REMOTE_I2C_READ with port number
[14:23:04] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[14:23:04] [PASSED] DP_REMOTE_I2C_READ with transactions array
[14:23:04] [PASSED] DP_REMOTE_I2C_WRITE with port number
[14:23:04] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[14:23:04] [PASSED] DP_REMOTE_I2C_WRITE with data array
[14:23:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[14:23:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[14:23:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[14:23:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[14:23:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[14:23:04] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[14:23:04] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[14:23:04] ================ [PASSED] drm_dp_mst_helper ================
[14:23:04] =========== drm_format_helper_test (11 subtests) ===========
[14:23:04] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[14:23:04] [PASSED] single_pixel_source_buffer
[14:23:04] [PASSED] single_pixel_clip_rectangle
[14:23:04] [PASSED] well_known_colors
[14:23:04] [PASSED] destination_pitch
[14:23:04] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[14:23:04] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[14:23:04] [PASSED] single_pixel_source_buffer
[14:23:04] [PASSED] single_pixel_clip_rectangle
[14:23:04] [PASSED] well_known_colors
[14:23:04] [PASSED] destination_pitch
[14:23:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[14:23:04] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[14:23:04] [PASSED] single_pixel_source_buffer
[14:23:04] [PASSED] single_pixel_clip_rectangle
[14:23:04] [PASSED] well_known_colors
[14:23:04] [PASSED] destination_pitch
[14:23:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[14:23:04] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[14:23:04] [PASSED] single_pixel_source_buffer
[14:23:04] [PASSED] single_pixel_clip_rectangle
[14:23:04] [PASSED] well_known_colors
[14:23:04] [PASSED] destination_pitch
[14:23:04] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[14:23:04] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[14:23:04] [PASSED] single_pixel_source_buffer
[14:23:04] [PASSED] single_pixel_clip_rectangle
[14:23:04] [PASSED] well_known_colors
[14:23:04] [PASSED] destination_pitch
[14:23:04] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[14:23:04] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[14:23:04] [PASSED] single_pixel_source_buffer
[14:23:04] [PASSED] single_pixel_clip_rectangle
[14:23:04] [PASSED] well_known_colors
[14:23:04] [PASSED] destination_pitch
[14:23:04] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[14:23:04] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[14:23:04] [PASSED] single_pixel_source_buffer
[14:23:04] [PASSED] single_pixel_clip_rectangle
[14:23:04] [PASSED] well_known_colors
[14:23:04] [PASSED] destination_pitch
[14:23:04] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[14:23:04] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[14:23:04] [PASSED] single_pixel_source_buffer
[14:23:04] [PASSED] single_pixel_clip_rectangle
[14:23:04] [PASSED] well_known_colors
[14:23:04] [PASSED] destination_pitch
[14:23:04] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[14:23:04] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[14:23:04] [PASSED] single_pixel_source_buffer
[14:23:04] [PASSED] single_pixel_clip_rectangle
[14:23:04] [PASSED] well_known_colors
[14:23:04] [PASSED] destination_pitch
[14:23:04] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[14:23:04] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[14:23:04] [PASSED] single_pixel_source_buffer
[14:23:04] [PASSED] single_pixel_clip_rectangle
[14:23:04] [PASSED] well_known_colors
[14:23:04] [PASSED] destination_pitch
[14:23:04] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[14:23:04] ============== drm_test_fb_xrgb8888_to_mono  ===============
[14:23:04] [PASSED] single_pixel_source_buffer
[14:23:04] [PASSED] single_pixel_clip_rectangle
[14:23:04] [PASSED] well_known_colors
[14:23:04] [PASSED] destination_pitch
[14:23:04] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[14:23:04] ============= [PASSED] drm_format_helper_test ==============
[14:23:04] ================= drm_format (18 subtests) =================
[14:23:04] [PASSED] drm_test_format_block_width_invalid
[14:23:04] [PASSED] drm_test_format_block_width_one_plane
[14:23:04] [PASSED] drm_test_format_block_width_two_plane
[14:23:04] [PASSED] drm_test_format_block_width_three_plane
[14:23:04] [PASSED] drm_test_format_block_width_tiled
[14:23:04] [PASSED] drm_test_format_block_height_invalid
[14:23:04] [PASSED] drm_test_format_block_height_one_plane
[14:23:04] [PASSED] drm_test_format_block_height_two_plane
[14:23:04] [PASSED] drm_test_format_block_height_three_plane
[14:23:04] [PASSED] drm_test_format_block_height_tiled
[14:23:04] [PASSED] drm_test_format_min_pitch_invalid
[14:23:04] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[14:23:04] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[14:23:04] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[14:23:04] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[14:23:04] [PASSED] drm_test_format_min_pitch_two_plane
[14:23:04] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[14:23:04] [PASSED] drm_test_format_min_pitch_tiled
[14:23:04] =================== [PASSED] drm_format ====================
[14:23:04] =============== drm_framebuffer (1 subtest) ================
[14:23:04] =============== drm_test_framebuffer_create  ===============
[14:23:04] [PASSED] ABGR8888 normal sizes
[14:23:04] [PASSED] ABGR8888 max sizes
[14:23:04] [PASSED] ABGR8888 pitch greater than min required
[14:23:04] [PASSED] ABGR8888 pitch less than min required
[14:23:04] [PASSED] ABGR8888 Invalid width
[14:23:04] [PASSED] ABGR8888 Invalid buffer handle
[14:23:04] [PASSED] No pixel format
[14:23:04] [PASSED] ABGR8888 Width 0
[14:23:04] [PASSED] ABGR8888 Height 0
[14:23:04] [PASSED] ABGR8888 Out of bound height * pitch combination
[14:23:04] [PASSED] ABGR8888 Large buffer offset
[14:23:04] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[14:23:04] [PASSED] ABGR8888 Valid buffer modifier
[14:23:04] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[14:23:04] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[14:23:04] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[14:23:04] [PASSED] NV12 Normal sizes
[14:23:04] [PASSED] NV12 Max sizes
[14:23:04] [PASSED] NV12 Invalid pitch
[14:23:04] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[14:23:04] [PASSED] NV12 different  modifier per-plane
[14:23:04] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[14:23:04] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[14:23:04] [PASSED] NV12 Modifier for inexistent plane
[14:23:04] [PASSED] NV12 Handle for inexistent plane
[14:23:04] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[14:23:04] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[14:23:04] [PASSED] YVU420 Normal sizes
[14:23:04] [PASSED] YVU420 Max sizes
[14:23:04] [PASSED] YVU420 Invalid pitch
[14:23:04] [PASSED] YVU420 Different pitches
[14:23:04] [PASSED] YVU420 Different buffer offsets/pitches
[14:23:04] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[14:23:04] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[14:23:04] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[14:23:04] [PASSED] YVU420 Valid modifier
[14:23:04] [PASSED] YVU420 Different modifiers per plane
[14:23:04] [PASSED] YVU420 Modifier for inexistent plane
[14:23:04] [PASSED] X0L2 Normal sizes
[14:23:04] [PASSED] X0L2 Max sizes
[14:23:04] [PASSED] X0L2 Invalid pitch
[14:23:04] [PASSED] X0L2 Pitch greater than minimum required
stty: 'standard input': Inappropriate ioctl for device
[14:23:04] [PASSED] X0L2 Handle for inexistent plane
[14:23:04] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[14:23:04] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[14:23:04] [PASSED] X0L2 Valid modifier
[14:23:04] [PASSED] X0L2 Modifier for inexistent plane
[14:23:04] =========== [PASSED] drm_test_framebuffer_create ===========
[14:23:04] ================= [PASSED] drm_framebuffer =================
[14:23:04] =============== drm-test-managed (1 subtest) ===============
[14:23:04] [PASSED] drm_test_managed_run_action
[14:23:04] ================ [PASSED] drm-test-managed =================
[14:23:04] =================== drm_mm (19 subtests) ===================
[14:23:04] [PASSED] drm_test_mm_init
[14:23:04] [PASSED] drm_test_mm_debug
[14:23:15] [PASSED] drm_test_mm_reserve
[14:23:25] [PASSED] drm_test_mm_insert
[14:23:25] [PASSED] drm_test_mm_replace
[14:23:25] [PASSED] drm_test_mm_insert_range
[14:23:25] [PASSED] drm_test_mm_frag
[14:23:25] [PASSED] drm_test_mm_align
[14:23:25] [PASSED] drm_test_mm_align32
[14:23:26] [PASSED] drm_test_mm_align64
[14:23:26] [PASSED] drm_test_mm_evict
[14:23:26] [PASSED] drm_test_mm_evict_range
[14:23:26] [PASSED] drm_test_mm_topdown
[14:23:26] [PASSED] drm_test_mm_bottomup
[14:23:26] [PASSED] drm_test_mm_lowest
[14:23:26] [PASSED] drm_test_mm_highest
[14:23:27] [PASSED] drm_test_mm_color
[14:23:27] [PASSED] drm_test_mm_color_evict
[14:23:27] [PASSED] drm_test_mm_color_evict_range
[14:23:27] ===================== [PASSED] drm_mm ======================
[14:23:27] ============= drm_modes_analog_tv (4 subtests) =============
[14:23:27] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[14:23:27] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[14:23:27] [PASSED] drm_test_modes_analog_tv_pal_576i
[14:23:27] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[14:23:27] =============== [PASSED] drm_modes_analog_tv ===============
[14:23:27] ============== drm_plane_helper (2 subtests) ===============
[14:23:27] =============== drm_test_check_plane_state  ================
[14:23:27] [PASSED] clipping_simple
[14:23:27] [PASSED] clipping_rotate_reflect
[14:23:27] [PASSED] positioning_simple
[14:23:27] [PASSED] upscaling
[14:23:27] [PASSED] downscaling
[14:23:27] [PASSED] rounding1
[14:23:27] [PASSED] rounding2
[14:23:27] [PASSED] rounding3
[14:23:27] [PASSED] rounding4
[14:23:27] =========== [PASSED] drm_test_check_plane_state ============
[14:23:27] =========== drm_test_check_invalid_plane_state  ============
[14:23:27] [PASSED] positioning_invalid
[14:23:27] [PASSED] upscaling_invalid
[14:23:27] [PASSED] downscaling_invalid
[14:23:27] ======= [PASSED] drm_test_check_invalid_plane_state ========
[14:23:27] ================ [PASSED] drm_plane_helper =================
[14:23:27] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[14:23:27] ====== drm_test_connector_helper_tv_get_modes_check  =======
[14:23:27] [PASSED] None
[14:23:27] [PASSED] PAL
[14:23:27] [PASSED] NTSC
[14:23:27] [PASSED] Both, NTSC Default
[14:23:27] [PASSED] Both, PAL Default
[14:23:27] [PASSED] Both, NTSC Default, with PAL on command-line
[14:23:27] [PASSED] Both, PAL Default, with NTSC on command-line
[14:23:27] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[14:23:27] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[14:23:27] ================== drm_rect (9 subtests) ===================
[14:23:27] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[14:23:27] [PASSED] drm_test_rect_clip_scaled_not_clipped
[14:23:27] [PASSED] drm_test_rect_clip_scaled_clipped
[14:23:27] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[14:23:27] ================= drm_test_rect_intersect  =================
[14:23:27] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[14:23:27] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[14:23:27] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[14:23:27] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[14:23:27] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[14:23:27] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[14:23:27] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[14:23:27] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[14:23:27] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[14:23:27] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[14:23:27] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[14:23:27] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[14:23:27] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[14:23:27] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[14:23:27] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[14:23:27] ============= [PASSED] drm_test_rect_intersect =============
[14:23:27] ================ drm_test_rect_calc_hscale  ================
[14:23:27] [PASSED] normal use
[14:23:27] [PASSED] out of max range
[14:23:27] [PASSED] out of min range
[14:23:27] [PASSED] zero dst
[14:23:27] [PASSED] negative src
[14:23:27] [PASSED] negative dst
[14:23:27] ============ [PASSED] drm_test_rect_calc_hscale ============
[14:23:27] ================ drm_test_rect_calc_vscale  ================
[14:23:27] [PASSED] normal use
[14:23:27] [PASSED] out of max range
[14:23:27] [PASSED] out of min range
[14:23:27] [PASSED] zero dst
[14:23:27] [PASSED] negative src
[14:23:27] [PASSED] negative dst
[14:23:27] ============ [PASSED] drm_test_rect_calc_vscale ============
[14:23:27] ================== drm_test_rect_rotate  ===================
[14:23:27] [PASSED] reflect-x
[14:23:27] [PASSED] reflect-y
[14:23:27] [PASSED] rotate-0
[14:23:27] [PASSED] rotate-90
[14:23:27] [PASSED] rotate-180
[14:23:27] [PASSED] rotate-270
[14:23:27] ============== [PASSED] drm_test_rect_rotate ===============
[14:23:27] ================ drm_test_rect_rotate_inv  =================
[14:23:27] [PASSED] reflect-x
[14:23:27] [PASSED] reflect-y
[14:23:27] [PASSED] rotate-0
[14:23:27] [PASSED] rotate-90
[14:23:27] [PASSED] rotate-180
[14:23:27] [PASSED] rotate-270
[14:23:27] ============ [PASSED] drm_test_rect_rotate_inv =============
[14:23:27] ==================== [PASSED] drm_rect =====================
[14:23:27] ================== drm_exec (7 subtests) ===================
[14:23:27] [PASSED] sanitycheck
[14:23:27] [PASSED] test_lock
[14:23:27] [PASSED] test_lock_unlock
[14:23:27] [PASSED] test_duplicates
[14:23:27] [PASSED] test_prepare
[14:23:27] [PASSED] test_prepare_array
[14:23:27] [PASSED] test_multiple_loops
[14:23:27] ==================== [PASSED] drm_exec =====================
[14:23:27] ============================================================
[14:23:27] Testing complete. Ran 340 tests: passed: 340
[14:23:27] Elapsed time: 44.501s total, 1.662s configuring, 19.157s building, 23.654s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


