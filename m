Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026DCC47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 16:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA65F10E719;
	Wed, 17 Jan 2024 16:39:58 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C81E10E719;
 Wed, 17 Jan 2024 16:39:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_GSC_proxy_suppo?=
 =?utf-8?q?rt_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Wed, 17 Jan 2024 16:39:57 -0000
Message-ID: <170550959744.537693.2396821908275215237@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240110004416.1127942-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240110004416.1127942-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe: GSC proxy support (rev3)
URL   : https://patchwork.freedesktop.org/series/127657/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 36677b0f452023c66c03fd9a6df230a2e82dacae
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Tue Jan 9 16:44:15 2024 -0800

    drm/xe/gsc: add support for GSC proxy interrupt
    
    The GSC notifies us of a proxy request via the HECI2 interrupt. The
    interrupt must be enabled both in the HECI layer and in our usual gt irq
    programming; for the latter, the interrupt is enabled via the same enable
    register as the GSC CS, but it does have its own mask register. When the
    interrupt is received, we also need to de-assert it in both layers.
    
    The handling of the proxy request is deferred to the same worker that we
    use for GSC load. New flags have been added to distinguish between the
    init case and the proxy interrupt.
    
    v2: rename irq define, fix include ordering (Alan)
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch b42f47ca5fff1d04fb8eb02d64520b3f338a495d drm-intel
b6b5e94ac drm/xe/gsc: Initialize GSC proxy
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:39: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#39: 
new file mode 100644

-:612: WARNING:NEEDLESS_IF: kfree(NULL) is safe and this check is probably not required
#612: FILE: drivers/gpu/drm/xe/xe_gsc_proxy.c:337:
+	if (gsc->proxy.to_csme) {
+		kfree(gsc->proxy.to_csme);

total: 0 errors, 2 warnings, 0 checks, 823 lines checked
36677b0f4 drm/xe/gsc: add support for GSC proxy interrupt


