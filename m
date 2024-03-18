Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E545C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 20:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62725112003;
	Mon, 18 Mar 2024 20:27:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C44B112016;
 Mon, 18 Mar 2024 20:26:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_DMC_w?=
 =?utf-8?q?akelock_implementation_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Mar 2024 20:26:58 -0000
Message-ID: <171079361844.886732.16442731200511721819@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240318133757.1479189-1-luciano.coelho@intel.com>
In-Reply-To: <20240318133757.1479189-1-luciano.coelho@intel.com>
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

Series: drm/i915/display: DMC wakelock implementation (rev4)
URL   : https://patchwork.freedesktop.org/series/128628/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a0e23686bedea42039adcf098a285ea46309f1b0
Author: Luca Coelho <luciano.coelho@intel.com>
Date:   Mon Mar 18 15:37:57 2024 +0200

    drm/i915/display: tie DMC wakelock to DC5/6 state transitions
    
    We only need DMC wakelocks when we allow DC5 and DC6 states.  Add the
    calls to enable and disable DMC wakelock accordingly.
    
    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
+ /mt/dim checkpatch ce8cc731d53f9197a853b0d00386d7835f2b80e6 drm-intel
139d06feaf89 drm/i915/display: add support for DMC wakelocks
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:237: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#237: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 450 lines checked
60cb9b5d3a5a drm/i915/display: don't allow DMC wakelock on older hardware
7400a5b7486b drm/i915/display: add module parameter to enable DMC wakelock
-:21: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#21: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:120:
+intel_display_param_named_unsafe(enable_dmc_wl, bool, 0400,
+	"Enable DMC wakelock "

total: 0 errors, 0 warnings, 1 checks, 54 lines checked
a0e23686bede drm/i915/display: tie DMC wakelock to DC5/6 state transitions


