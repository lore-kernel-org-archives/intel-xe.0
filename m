Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B797C61CE8
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 02:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBC010E097;
	Fri, 13 Jun 2025 02:18:44 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07CC10E097;
 Fri, 13 Jun 2025 02:18:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Add_WildCat_Lake_support_=28re?=
 =?utf-8?q?v5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Jun 2025 02:18:42 -0000
Message-ID: <174978112284.74585.15113856288977929922@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250612203448.2948795-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20250612203448.2948795-1-dnyaneshwar.bhadane@intel.com>
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

Series: Add WildCat Lake support (rev5)
URL   : https://patchwork.freedesktop.org/series/149794/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_wa.c:873:
drivers/gpu/drm/xe/generated/xe_wa_oob.c:104:34: error: unterminated argument list invoking macro "XE_RTP_RULES"
  104 |         GRAPHICS_VERSION(3003) },
      |                                  ^
drivers/gpu/drm/xe/generated/xe_wa_oob.c:101:3: error: ‘XE_RTP_RULES’ undeclared here (not in a function)
  101 |   XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 3001), OR,
      |   ^~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_wa.c:874:9: error: expected ‘}’ before ‘{’ token
  874 |         {}
      |         ^
drivers/gpu/drm/xe/generated/xe_wa_oob.c:100:1: note: to match this ‘{’
  100 | { XE_RTP_NAME("16026508708"),
      | ^
../drivers/gpu/drm/xe/xe_wa.c:875:2: error: expected ‘}’ before ‘;’ token
  875 | };
      |  ^
../drivers/gpu/drm/xe/xe_wa.c:872:61: note: to match this ‘{’
  872 | static __maybe_unused const struct xe_rtp_entry oob_was[] = {
      |                                                             ^
../drivers/gpu/drm/xe/xe_wa.c:665:37: warning: ‘lrc_was’ defined but not used [-Wunused-const-variable=]
  665 | static const struct xe_rtp_entry_sr lrc_was[] = {
      |                                     ^~~~~~~
../drivers/gpu/drm/xe/xe_wa.c:308:37: warning: ‘engine_was’ defined but not used [-Wunused-const-variable=]
  308 | static const struct xe_rtp_entry_sr engine_was[] = {
      |                                     ^~~~~~~~~~
../drivers/gpu/drm/xe/xe_wa.c:101:37: warning: ‘gt_was’ defined but not used [-Wunused-const-variable=]
  101 | static const struct xe_rtp_entry_sr gt_was[] = {
      |                                     ^~~~~~
make[7]: *** [../scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_wa.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:554: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:554: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:554: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:554: drivers] Error 2
make[2]: *** [/kernel/Makefile:2006: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[02:17:58] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[02:18:03] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=25
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


