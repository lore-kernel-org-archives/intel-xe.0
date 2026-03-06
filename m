Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8043BF01829
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 11:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238CD10ECEC;
	Fri,  6 Mar 2026 11:26:46 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83E410ECEC;
 Fri,  6 Mar 2026 11:26:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Add_ocode_late_binding_support?=
 =?utf-8?q?_for_CRI?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Mar 2026 11:26:44 -0000
Message-ID: <177279640488.325615.10468593049166266591@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260305104441.2857181-6-badal.nilawar@intel.com>
In-Reply-To: <20260305104441.2857181-6-badal.nilawar@intel.com>
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

Series: Add ocode late binding support for CRI
URL   : https://patchwork.freedesktop.org/series/162657/
State : failure

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
ERROR:root:../drivers/gpu/drm/xe/xe_late_bind_fw.c:36:36: error: ‘INTEL_LB_TYPE_OCODE’ undeclared here (not in a function)
   36 |                 [XE_LB_FW_OCODE] = INTEL_LB_TYPE_OCODE,
      |                                    ^~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_late_bind_fw.c: In function ‘xe_late_bind_parse_status’:
../drivers/gpu/drm/xe/xe_late_bind_fw.c:210:14: error: ‘INTEL_LB_STATUS_INTERNAL_ERROR’ undeclared (first use in this function); did you mean ‘INTEL_LB_STATUS_GENERAL_ERROR’?
  210 |         case INTEL_LB_STATUS_INTERNAL_ERROR:
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |              INTEL_LB_STATUS_GENERAL_ERROR
../drivers/gpu/drm/xe/xe_late_bind_fw.c:210:14: note: each undeclared identifier is reported only once for each function it appears in
../drivers/gpu/drm/xe/xe_late_bind_fw.c:212:14: error: ‘INTEL_LB_STATUS_INVALID_FPT_TABLE’ undeclared (first use in this function); did you mean ‘INTEL_LB_STATUS_INVALID_SIGNATURE’?
  212 |         case INTEL_LB_STATUS_INVALID_FPT_TABLE:
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |              INTEL_LB_STATUS_INVALID_SIGNATURE
../drivers/gpu/drm/xe/xe_late_bind_fw.c:214:14: error: ‘INTEL_LB_STATUS_SIGNED_PAYLOAD_VERIFICATION_ERROR’ undeclared (first use in this function)
  214 |         case INTEL_LB_STATUS_SIGNED_PAYLOAD_VERIFICATION_ERROR:
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_late_bind_fw.c:216:14: error: ‘INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_CPD’ undeclared (first use in this function)
  216 |         case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_CPD:
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_late_bind_fw.c:218:14: error: ‘INTEL_LB_STATUS_SIGNED_PAYLOAD_FW_VERSION_MISMATCH’ undeclared (first use in this function)
  218 |         case INTEL_LB_STATUS_SIGNED_PAYLOAD_FW_VERSION_MISMATCH:
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_late_bind_fw.c:220:14: error: ‘INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_MANIFEST’ undeclared (first use in this function)
  220 |         case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_MANIFEST:
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_late_bind_fw.c:222:14: error: ‘INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_HASH’ undeclared (first use in this function)
  222 |         case INTEL_LB_STATUS_SIGNED_PAYLOAD_INVALID_HASH:
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_late_bind_fw.c:224:14: error: ‘INTEL_LB_STATUS_SIGNED_PAYLOAD_BINDING_TYPE_MISMATCH’ undeclared (first use in this function)
  224 |         case INTEL_LB_STATUS_SIGNED_PAYLOAD_BINDING_TYPE_MISMATCH:
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_late_bind_fw.c:226:14: error: ‘INTEL_LB_STATUS_SIGNED_PAYLOAD_HANDLE_SVN_FAILED’ undeclared (first use in this function)
  226 |         case INTEL_LB_STATUS_SIGNED_PAYLOAD_HANDLE_SVN_FAILED:
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_late_bind_fw.c:228:14: error: ‘INTEL_LB_STATUS_DESTINATION_MBOX_FAILURE’ undeclared (first use in this function); did you mean ‘INTEL_LB_STATUS_ARB_FAILURE’?
  228 |         case INTEL_LB_STATUS_DESTINATION_MBOX_FAILURE:
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |              INTEL_LB_STATUS_ARB_FAILURE
../drivers/gpu/drm/xe/xe_late_bind_fw.c:230:14: error: ‘INTEL_LB_STATUS_MISSING_LOADING_PATCH’ undeclared (first use in this function)
  230 |         case INTEL_LB_STATUS_MISSING_LOADING_PATCH:
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/xe/xe_late_bind_fw.c:232:14: error: ‘INTEL_LB_STATUS_INVALID_COMMAND’ undeclared (first use in this function); did you mean ‘INTEL_LB_STATUS_INVALID_PAYLOAD’?
  232 |         case INTEL_LB_STATUS_INVALID_COMMAND:
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |              INTEL_LB_STATUS_INVALID_PAYLOAD
../drivers/gpu/drm/xe/xe_late_bind_fw.c:234:14: error: ‘INTEL_LB_STATUS_INVALID_HECI_HEADER’ undeclared (first use in this function); did you mean ‘INTEL_LB_STATUS_INVALID_PAYLOAD’?
  234 |         case INTEL_LB_STATUS_INVALID_HECI_HEADER:
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |              INTEL_LB_STATUS_INVALID_PAYLOAD
../drivers/gpu/drm/xe/xe_late_bind_fw.c:236:14: error: ‘INTEL_LB_STATUS_IP_ERROR_START’ undeclared (first use in this function)
  236 |         case INTEL_LB_STATUS_IP_ERROR_START:
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
make[7]: *** [../scripts/Makefile.build:289: drivers/gpu/drm/xe/xe_late_bind_fw.o] Error 1
make[7]: *** Waiting for unfinished jobs....
make[6]: *** [../scripts/Makefile.build:546: drivers/gpu/drm/xe] Error 2
make[5]: *** [../scripts/Makefile.build:546: drivers/gpu/drm] Error 2
make[4]: *** [../scripts/Makefile.build:546: drivers/gpu] Error 2
make[3]: *** [../scripts/Makefile.build:546: drivers] Error 2
make[2]: *** [/kernel/Makefile:2101: .] Error 2
make[1]: *** [/kernel/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2

[11:26:10] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[11:26:15] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make all compile_commands.json scripts_gdb ARCH=um O=.kunit --jobs=48
+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


