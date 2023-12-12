Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBC9C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 03:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3F510E13B;
	Tue, 12 Dec 2023 03:45:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id D1A0488EFE;
 Tue, 12 Dec 2023 03:45:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B7FCFAADD5;
 Tue, 12 Dec 2023 03:45:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_GSC_proxy_suppo?=
 =?utf-8?q?rt?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Tue, 12 Dec 2023 03:45:51 -0000
Message-ID: <170235275175.31291.18196979862852594338@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231212010600.3479465-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231212010600.3479465-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe: GSC proxy support
URL   : https://patchwork.freedesktop.org/series/127657/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bf5436adfca487f5626af0a8bd34c381bdfcbe87
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Mon Dec 11 17:05:59 2023 -0800

    drm/xe/gsc: add support for GSC proxy interrupt
    
    The GSC notifies us of a proxy request via the HECI2 interrupt. The
    interrupt must be enabled both in the HECI layer and in our usual gt irq
    programming; for the latter, the interrupt is enabled via the same enable
    register as the GSC CS, but it does have its own mask register. When the
    interrupt is received, we also need to de-assert it in both layers.
    
    The handling of the proxy request is deferred to the same worker that we
    use for GSC load. New flags have been added to distinguish between the
    init case and the proxy interrupt.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 5cae0d34637bd4914e4099eff1233d83bc9d2d21 drm-intel
05bf8bd4b drm/xe/gsc: Initialize GSC proxy
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
-:35: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#35: 
new file mode 100644

-:599: WARNING:NEEDLESS_IF: kfree(NULL) is safe and this check is probably not required
#599: FILE: drivers/gpu/drm/xe/xe_gsc_proxy.c:333:
+	if (gsc->proxy.to_csme) {
+		kfree(gsc->proxy.to_csme);

total: 0 errors, 2 warnings, 0 checks, 749 lines checked
bf5436adf drm/xe/gsc: add support for GSC proxy interrupt


