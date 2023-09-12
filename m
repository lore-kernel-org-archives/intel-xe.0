Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA86EE3F29
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 20:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A9F10E0AA;
	Tue, 12 Sep 2023 20:24:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3654F10E11A;
 Tue, 12 Sep 2023 20:24:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 38D4EAADDC;
 Tue, 12 Sep 2023 20:24:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Tue, 12 Sep 2023 20:24:47 -0000
Message-ID: <169455028722.31792.13686208290413676643@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230912182956.253-1-michal.wajdeczko@intel.com>
In-Reply-To: <20230912182956.253-1-michal.wajdeczko@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Introduce_Xe_assert_macros_=28rev3=29?=
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

Series: drm/xe: Introduce Xe assert macros (rev3)
URL   : https://patchwork.freedesktop.org/series/122240/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6a7aa97ae706394b9c7fdca0aca80061de08e6a2
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Sep 12 20:29:56 2023 +0200

    drm/xe: Introduce Xe assert macros
    
    As we are moving away from the controversial XE_BUG_ON macro,
    relying just on WARN_ON or drm_err does not cover the cases
    where we want to annotate functions with additional detailed
    debug checks to assert that all prerequisites are satisfied,
    without paying footprint or performance penalty on non-debug
    builds, where all misuses introduced during code integration
    were already fixed.
    
    Introduce family of Xe assert macros that try to follow classic
    assert() utility and can be compiled out on non-debug builds.
    
    Macros are based on drm_WARN, but unlikely to origin, disallow
    use in expressions since we will compile that code out.
    
    As we are operating on the xe pointers, we can print additional
    information about the device, like tile or GT identifier, that
    is not available from generic WARN report:
    
    [ ] xe 0000:00:02.0: [drm] Assertion `true == false` failed!
        platform: 1 subplatform: 1
        graphics: Xe_LP 12.00 step B0
        media: Xe_M 12.00 step B0
        display: enabled step D0
        tile: 0 VRAM 0 B
        GT: 0 type 1
    
    [ ] xe 0000:b3:00.0: [drm] Assertion `true == false` failed!
        platform: 7 subplatform: 3
        graphics: Xe_HPG 12.55 step A1
        media: Xe_HPM 12.55 step A1
        display: disabled step **
        tile: 0 VRAM 14.0 GiB
        GT: 0 type 1
    
    [ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_device_probe+0x374/0x520 [xe]
    [ ] RIP: 0010:xe_device_probe+0x374/0x520 [xe]
    [ ] Call Trace:
    [ ]  ? __warn+0x7b/0x160
    [ ]  ? xe_device_probe+0x374/0x520 [xe]
    [ ]  ? report_bug+0x1c3/0x1d0
    [ ]  ? handle_bug+0x42/0x70
    [ ]  ? exc_invalid_op+0x14/0x70
    [ ]  ? asm_exc_invalid_op+0x16/0x20
    [ ]  ? xe_device_probe+0x374/0x520 [xe]
    [ ]  ? xe_device_probe+0x374/0x520 [xe]
    [ ]  xe_pci_probe+0x6e3/0x950 [xe]
    [ ]  ? lockdep_hardirqs_on+0xc7/0x140
    [ ]  pci_device_probe+0x9e/0x160
    [ ]  really_probe+0x19d/0x400
    
    v2: use lowercase names
    v3: apply xe coding style
    v4: fix non-debug build and improve kernel-doc
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Oded Gabbay <ogabbay@kernel.org>
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch da184d0771450c366fa6499d42b49eba733a67f8 drm-intel
6a7aa97ae drm/xe: Introduce Xe assert macros
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:40: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#40: 
[ ] WARNING: CPU: 0 PID: 2687 at drivers/gpu/drm/xe/xe_device.c:281 xe_device_probe+0x374/0x520 [xe]

-:71: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#71: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 177 lines checked


