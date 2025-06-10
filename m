Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75548C5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 11:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B40D10E507;
	Tue, 10 Jun 2025 11:05:14 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4F610E507;
 Tue, 10 Jun 2025 11:05:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe=3A_i2c_support_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Jun 2025 11:05:13 -0000
Message-ID: <174955351310.63316.12461431249578529928@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250610100311.2245871-1-heikki.krogerus@linux.intel.com>
In-Reply-To: <20250610100311.2245871-1-heikki.krogerus@linux.intel.com>
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

Series: drm/xe: i2c support (rev2)
URL   : https://patchwork.freedesktop.org/series/149699/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_i2c.c:203:21: error: variable ‘i2c_regmap_config’ has initializer but incomplete type
  203 | static const struct regmap_config i2c_regmap_config = {
      |                     ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_i2c.c:204:10: error: ‘const struct regmap_config’ has no member named ‘reg_bits’
  204 |         .reg_bits = 32,
      |          ^~~~~~~~
../drivers/gpu/drm/xe/xe_i2c.c:204:21: warning: excess elements in struct initializer
  204 |         .reg_bits = 32,
      |                     ^~
../drivers/gpu/drm/xe/xe_i2c.c:204:21: note: (near initialization for ‘i2c_regmap_config’)
../drivers/gpu/drm/xe/xe_i2c.c:205:10: error: ‘const struct regmap_config’ has no member named ‘val_bits’
  205 |         .val_bits = 32,
      |          ^~~~~~~~
../drivers/gpu/drm/xe/xe_i2c.c:205:21: warning: excess elements in struct initializer
  205 |         .val_bits = 32,
      |                     ^~
../drivers/gpu/drm/xe/xe_i2c.c:205:21: note: (near initialization for ‘i2c_regmap_config’)
../drivers/gpu/drm/xe/xe_i2c.c:206:10: error: ‘const struct regmap_config’ has no member named ‘reg_read’
  206 |         .reg_read = xe_i2c_read,
      |          ^~~~~~~~
../drivers/gpu/drm/xe/xe_i2c.c:206:21: warning: excess elements in struct initializer
  206 |         .reg_read = xe_i2c_read,
      |                     ^~~~~~~~~~~
../drivers/gpu/drm/xe/xe_i2c.c:206:21: note: (near initialization for ‘i2c_regmap_config’)
../drivers/gpu/drm/xe/xe_i2c.c:207:10: error: ‘const struct regmap_config’ has no member named ‘reg_write’
  207 |         .reg_write = xe_i2c_write,
      |          ^~~~~~~~~
../drivers/gpu/drm/xe/xe_i2c.c:207:22: warning: excess elements in struct initializer
  207 |         .reg_write = xe_i2c_write,
      |                      ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_i2c.c:207:22: note: (near initialization for ‘i2c_regmap_config’)
../drivers/gpu/drm/xe/xe_i2c.c:208:10: error: ‘const struct regmap_config’ has no member named ‘fast_io’
  208 |         .fast_io = true,
      |          ^~~~~~~
../drivers/gpu/drm/xe/xe_i2c.c:208:20: warning: excess elements in struct initializer
  208 |         .fast_io = true,
      |                    ^~~~
../drivers/gpu/drm/xe/xe_i2c.c:208:20: note: (near initialization for ‘i2c_regmap_config’)
../drivers/gpu/drm/xe/xe_i2c.c: In function ‘xe_i2c_probe’:
../drivers/gpu/drm/xe/xe_i2c.c:273:18: error: implicit declaration of function ‘devm_regmap_init’ [-Werror=implicit-function-declaration]
  273 |         regmap = devm_regmap_init(i2c->drm_dev, NULL, i2c, &i2c_regmap_config);
      |                  ^~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_i2c.c:273:16: warning: assignment to ‘struct regmap *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
  273 |         regmap = devm_regmap_init(i2c->drm_dev, NULL, i2c, &i2c_regmap_config);
      |                ^
../drivers/gpu/drm/xe/xe_i2c.c: At top level:
../drivers/gpu/drm/xe/xe_i2c.c:203:35: error: storage size of ‘i2c_regmap_config’ isn’t known
  203 | static const struct regmap_config i2c_regmap_config = {
      |                                   ^~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_i2c.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:554: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:554: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:554: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:554: drivers] Error 2
make[2]: *** [/kernel/Makefile:2006: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[11:04:39] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:04:43] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


