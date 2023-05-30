Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB826C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 05:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CBE310E08E;
	Tue, 30 May 2023 05:08:40 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 87C2C10E08E;
 Tue, 30 May 2023 05:08:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0F3AAAADD6;
 Tue, 30 May 2023 05:08:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Tue, 30 May 2023 05:08:38 -0000
Message-ID: <168542331806.18933.1566883220971520549@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230530051302.2248354-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20230530051302.2248354-1-sujaritha.sundaresan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe?=
 =?utf-8?q?=3A_Sysfs_entries_to_query_fused_min=2C_max_frequency_of?=
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

Series: drm/xe: Sysfs entries to query fused min, max frequency of
URL   : https://patchwork.freedesktop.org/series/118538/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_guc_pc.c: In function ‘freq_mem_rp0_show’:
../drivers/gpu/drm/xe/xe_guc_pc.c:638:27: error: ‘XEHPSDV_PCODE_FREQUENCY_CONFIG’ undeclared (first use in this function)
  638 |  err = xe_pcode_read(dev, XEHPSDV_PCODE_FREQUENCY_CONFIG,
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:638:27: note: each undeclared identifier is reported only once for each function it appears in
../drivers/gpu/drm/xe/xe_guc_pc.c:639:8: error: ‘PCODE_MBOX_FC_SC_READ_FUSED_P0’ undeclared (first use in this function)
  639 |        PCODE_MBOX_FC_SC_READ_FUSED_P0,
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:640:8: error: ‘PCODE_MBOX_DOMAIN_HBM’ undeclared (first use in this function)
  640 |        PCODE_MBOX_DOMAIN_HBM, &val);
      |        ^~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:638:22: error: passing argument 1 of ‘xe_pcode_read’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  638 |  err = xe_pcode_read(dev, XEHPSDV_PCODE_FREQUENCY_CONFIG,
      |                      ^~~
      |                      |
      |                      struct device *
In file included from ../drivers/gpu/drm/xe/xe_guc_pc.c:22:
../drivers/gpu/drm/xe/xe_pcode.h:16:33: note: expected ‘struct xe_gt *’ but argument is of type ‘struct device *’
   16 | int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1);
      |                   ~~~~~~~~~~~~~~^~
../drivers/gpu/drm/xe/xe_guc_pc.c:638:8: error: too many arguments to function ‘xe_pcode_read’
  638 |  err = xe_pcode_read(dev, XEHPSDV_PCODE_FREQUENCY_CONFIG,
      |        ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_guc_pc.c:22:
../drivers/gpu/drm/xe/xe_pcode.h:16:5: note: declared here
   16 | int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1);
      |     ^~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c: In function ‘freq_mem_rpn_show’:
../drivers/gpu/drm/xe/xe_guc_pc.c:657:27: error: ‘XEHPSDV_PCODE_FREQUENCY_CONFIG’ undeclared (first use in this function)
  657 |  err = xe_pcode_read(dev, XEHPSDV_PCODE_FREQUENCY_CONFIG,
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:658:8: error: ‘PCODE_MBOX_FC_SC_READ_FUSED_PN’ undeclared (first use in this function)
  658 |        PCODE_MBOX_FC_SC_READ_FUSED_PN,
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:659:8: error: ‘PCODE_MBOX_DOMAIN_HBM’ undeclared (first use in this function)
  659 |        PCODE_MBOX_DOMAIN_HBM, &val);
      |        ^~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_guc_pc.c:657:22: error: passing argument 1 of ‘xe_pcode_read’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  657 |  err = xe_pcode_read(dev, XEHPSDV_PCODE_FREQUENCY_CONFIG,
      |                      ^~~
      |                      |
      |                      struct device *
In file included from ../drivers/gpu/drm/xe/xe_guc_pc.c:22:
../drivers/gpu/drm/xe/xe_pcode.h:16:33: note: expected ‘struct xe_gt *’ but argument is of type ‘struct device *’
   16 | int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1);
      |                   ~~~~~~~~~~~~~~^~
../drivers/gpu/drm/xe/xe_guc_pc.c:657:8: error: too many arguments to function ‘xe_pcode_read’
  657 |  err = xe_pcode_read(dev, XEHPSDV_PCODE_FREQUENCY_CONFIG,
      |        ^~~~~~~~~~~~~
In file included from ../drivers/gpu/drm/xe/xe_guc_pc.c:22:
../drivers/gpu/drm/xe/xe_pcode.h:16:5: note: declared here
   16 | int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1);
      |     ^~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[6]: *** [../scripts/Makefile.build:252: drivers/gpu/drm/xe/xe_guc_pc.o] Error 1
make[6]: *** Waiting for unfinished jobs....
make[5]: *** [../scripts/Makefile.build:494: drivers/gpu/drm/xe] Error 2
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [../scripts/Makefile.build:494: drivers/gpu/drm] Error 2
make[3]: *** [../scripts/Makefile.build:494: drivers/gpu] Error 2
make[2]: *** [../scripts/Makefile.build:494: drivers] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/kernel/Makefile:2025: .] Error 2
make: *** [Makefile:226: __sub-make] Error 2

[05:08:15] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[05:08:19] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


