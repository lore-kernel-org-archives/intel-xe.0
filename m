Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CBCC54756
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 07:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602E199EA9;
	Thu, 22 May 2025 07:22:24 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D456996B5E;
 Thu, 22 May 2025 07:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_series_starting_with_=5B1/9=5D?=
 =?utf-8?q?_iosys-map=3A_add_new_accessor_interfaces_and_use_them_internally?=
 =?utf-8?q?=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dave Airlie" <airlied@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 May 2025 07:21:03 -0000
Message-ID: <174789846386.12496.6299968026392897279@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250522065519.318013-1-airlied@gmail.com>
In-Reply-To: <20250522065519.318013-1-airlied@gmail.com>
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

Series: series starting with [1/9] iosys-map: add new accessor interfaces and use them internally.
URL   : https://patchwork.freedesktop.org/series/149367/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[07:20:34] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[07:20:38] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
ERROR:root:../drivers/gpu/drm/drm_bridge.c:1406:6: error: redefinition of ‘devm_drm_put_bridge’
 1406 | void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge)
      |      ^~~~~~~~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/drm_bridge.c:31:
../include/drm/drm_bridge.h:1314:20: note: previous definition of ‘devm_drm_put_bridge’ with type ‘void(struct device *, struct drm_bridge *)’
 1314 | static inline void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge) {}
      |                    ^~~~~~~~~~~~~~~~~~~
make[6]: *** [../scripts/Makefile.build:203: drivers/gpu/drm/drm_bridge.o] Error 1
make[6]: *** Waiting for unfinished jobs....
../drivers/gpu/drm/xe/xe_lrc.c: In function ‘xe_lrc_setup_utilization’:
../drivers/gpu/drm/xe/xe_lrc.c:951:40: error: ‘struct iosys_map’ has no member named ‘vaddr’; did you mean ‘_vaddr’?
  951 |         cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
      |                                        ^~~~~
      |                                        _vaddr
make[7]: *** [../scripts/Makefile.build:203: drivers/gpu/drm/xe/xe_lrc.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:461: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:461: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:461: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:461: drivers] Error 2
make[2]: *** [/kernel/Makefile:2003: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


