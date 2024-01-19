Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83ADBC47422
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 00:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F77710E96C;
	Fri, 19 Jan 2024 00:56:37 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907AC10E951;
 Fri, 19 Jan 2024 00:56:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe/guc=3A_Add_GuC_based_re?=
 =?utf-8?q?gister_capture_for_error_capture_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Date: Fri, 19 Jan 2024 00:56:36 -0000
Message-ID: <170562579659.558566.762014643631039549@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240119004203.393262-1-zhanjun.dong@intel.com>
In-Reply-To: <20240119004203.393262-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Add GuC based register capture for error capture (rev2)
URL   : https://patchwork.freedesktop.org/series/128077/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_guc_capture.c: In function ‘xe_guc_capture_destroy’:
../drivers/gpu/drm/xe/xe_guc_capture.c:1347:2: error: implicit declaration of function ‘guc_capture_delete_prealloc_nodes’; did you mean ‘guc_capture_create_prealloc_nodes’? [-Werror=implicit-function-declaration]
 1347 |  guc_capture_delete_prealloc_nodes(guc);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |  guc_capture_create_prealloc_nodes
../drivers/gpu/drm/xe/xe_guc_capture.c:1349:2: error: implicit declaration of function ‘guc_capture_free_extlists’; did you mean ‘guc_capture_get_one_ext_list’? [-Werror=implicit-function-declaration]
 1349 |  guc_capture_free_extlists(guc->capture->extlists);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~
      |  guc_capture_get_one_ext_list
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:243: drivers/gpu/drm/xe/xe_guc_capture.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:480: drivers/gpu/drm/xe] Error 2
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:480: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:480: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:480: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/kernel/Makefile:1911: .] Error 2
make[1]: *** [/kernel/Makefile:234: __sub-make] Error 2
make: *** [Makefile:234: __sub-make] Error 2

[00:56:08] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[00:56:13] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


