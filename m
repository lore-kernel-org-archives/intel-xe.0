Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7494C001DF
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 19:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C3210E78B;
	Fri, 28 Jul 2023 19:47:13 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3E96E10E78C;
 Fri, 28 Jul 2023 19:47:11 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3BA8AAADED;
 Fri, 28 Jul 2023 19:47:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Fri, 28 Jul 2023 19:47:11 -0000
Message-ID: <169057363124.19728.11952572751884284270@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230728192518.1951-1-michal.wajdeczko@intel.com>
In-Reply-To: <20230728192518.1951-1-michal.wajdeczko@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Introduce_xe=5FASSERT_macros?=
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

Series: drm/xe: Introduce xe_ASSERT macros
URL   : https://patchwork.freedesktop.org/series/121549/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b64fbee7ade07140df3f35ef6962cc07bd16b2e9
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Jul 28 21:25:18 2023 +0200

    drm/xe: Introduce xe_ASSERT macros
    
    As we are moving away from the controversial XE_BUG_ON macro,
    relying just on WARN_ON or drm_err does not cover the cases
    where we want to annotate functions with additional detailed
    debug checks to assert that all prerequisites are satisfied,
    without paying footprint or performance penalty on non-debug
    builds, where all misuses introduced during code integration
    were already fixed.
    
    Introduce family of xe_ASSERT macros that try to follow classic
    assert() utility and can be compiled out on non-debug builds.
    
    Macros are based on drm_WARN, but unlikely to origin, disallow
    use in expressions since we will compile that code out.
    
    As we are operating on the xe pointers, we can print additional
    information about the device, like tile or GT identifier, that
    is not available from generic WARN report:
    
    [ ] xe 0000:00:02.0: [drm] Assertion `false` failed!
        graphics: Xe_LP 12.0 media: Xe_M 12.0 GT0
    [ ] WARNING: CPU: 4 PID: 8442 at drivers/gpu/drm/xe/xe_device.c:280 xe_device_probe+0x2f5/0x4a0 [xe]
    [ ] RIP: 0010:xe_device_probe+0x2f5/0x4a0 [xe]
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 353cf75540219b45ed346f2a3ba9418297278472 drm-intel
b64fbee7a drm/xe: Introduce xe_ASSERT macros
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:26: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#26: 
[ ] WARNING: CPU: 4 PID: 8442 at drivers/gpu/drm/xe/xe_device.c:280 xe_device_probe+0x2f5/0x4a0 [xe]

-:35: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#35: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 47 lines checked


