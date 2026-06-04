Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A7FCD6E75
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 20:16:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8C31129B8;
	Thu,  4 Jun 2026 20:16:34 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6506E1129B8;
 Thu,  4 Jun 2026 20:16:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/=7Bi915=2C_xe=7D=3A_Refact?=
 =?utf-8?q?or_generic=5Fhandle=5Firq=5Fsafe=28=29_error_messages?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Jun 2026 20:16:32 -0000
Message-ID: <178060419240.45116.16337426221286279347@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260604201005.3771198-1-jonathan.cavitt@intel.com>
In-Reply-To: <20260604201005.3771198-1-jonathan.cavitt@intel.com>
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

Series: drm/{i915, xe}: Refactor generic_handle_irq_safe() error messages
URL   : https://patchwork.freedesktop.org/series/167909/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../include/linux/device.h:15,
                 from ../include/drm/drm_print.h:31,
                 from ../drivers/gpu/drm/xe/xe_i2c.c:8:
../drivers/gpu/drm/xe/xe_i2c.c: In function ‘xe_i2c_irq_handler’:
../include/drm/drm_print.h:645:22: error: passing argument 1 of ‘__drm_to_dev’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  645 |         __drm_printk((drm), err, _ratelimited, "*ERROR* " fmt, ##__VA_ARGS__)
      |                      ^~~~~
      |                      |
      |                      char *
../include/linux/dev_printk.h:110:25: note: in definition of macro ‘dev_printk_index_wrap’
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                         ^~~
../include/linux/dev_printk.h:215:17: note: in expansion of macro ‘dev_err’
  215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
      |                 ^~~~~~~~~
../include/linux/dev_printk.h:225:9: note: in expansion of macro ‘dev_level_ratelimited’
  225 |         dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~~~
../include/drm/drm_print.h:615:9: note: in expansion of macro ‘dev_err_ratelimited’
  615 |         dev_##level##type(__drm_to_dev(drm), "[drm] " fmt, ##__VA_ARGS__)
      |         ^~~~
../include/drm/drm_print.h:645:9: note: in expansion of macro ‘__drm_printk’
  645 |         __drm_printk((drm), err, _ratelimited, "*ERROR* " fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_i2c.c:188:17: note: in expansion of macro ‘drm_err_ratelimited’
  188 |                 drm_err_ratelimited("failed to handle i2c irq: %d\n", ret);
      |                 ^~~~~~~~~~~~~~~~~~~
../include/drm/drm_print.h:608:68: note: expected ‘const struct drm_device *’ but argument is of type ‘char *’
  608 | static inline struct device *__drm_to_dev(const struct drm_device *drm)
      |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
../drivers/gpu/drm/xe/xe_i2c.c:188:71: error: expected ‘)’ before ‘ret’
  188 |                 drm_err_ratelimited("failed to handle i2c irq: %d\n", ret);
      |                                                                       ^~~
../include/linux/dev_printk.h:110:30: note: in definition of macro ‘dev_printk_index_wrap’
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                              ^~~
../include/linux/dev_printk.h:154:56: note: in expansion of macro ‘dev_fmt’
  154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
      |                                                        ^~~~~~~
../include/linux/dev_printk.h:215:17: note: in expansion of macro ‘dev_err’
  215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
      |                 ^~~~~~~~~
../include/linux/dev_printk.h:225:9: note: in expansion of macro ‘dev_level_ratelimited’
  225 |         dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~~~
../include/drm/drm_print.h:615:9: note: in expansion of macro ‘dev_err_ratelimited’
  615 |         dev_##level##type(__drm_to_dev(drm), "[drm] " fmt, ##__VA_ARGS__)
      |         ^~~~
../include/drm/drm_print.h:645:9: note: in expansion of macro ‘__drm_printk’
  645 |         __drm_printk((drm), err, _ratelimited, "*ERROR* " fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_i2c.c:188:17: note: in expansion of macro ‘drm_err_ratelimited’
  188 |                 drm_err_ratelimited("failed to handle i2c irq: %d\n", ret);
      |                 ^~~~~~~~~~~~~~~~~~~
../include/linux/dev_printk.h:110:24: note: to match this ‘(’
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                        ^
../include/linux/dev_printk.h:154:9: note: in expansion of macro ‘dev_printk_index_wrap’
  154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~~~
../include/linux/dev_printk.h:215:17: note: in expansion of macro ‘dev_err’
  215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
      |                 ^~~~~~~~~
../include/linux/dev_printk.h:225:9: note: in expansion of macro ‘dev_level_ratelimited’
  225 |         dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~~~
../include/drm/drm_print.h:615:9: note: in expansion of macro ‘dev_err_ratelimited’
  615 |         dev_##level##type(__drm_to_dev(drm), "[drm] " fmt, ##__VA_ARGS__)
      |         ^~~~
../include/drm/drm_print.h:645:9: note: in expansion of macro ‘__drm_printk’
  645 |         __drm_printk((drm), err, _ratelimited, "*ERROR* " fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_i2c.c:188:17: note: in expansion of macro ‘drm_err_ratelimited’
  188 |                 drm_err_ratelimited("failed to handle i2c irq: %d\n", ret);
      |                 ^~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:289: drivers/gpu/drm/xe/xe_i2c.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:548: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:548: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:548: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:548: drivers] Error 2
make[2]: *** [/kernel/Makefile:2143: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[20:15:58] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[20:16:02] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


