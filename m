Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6295CD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 11:48:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8230911B4D3;
	Thu,  4 Apr 2024 11:48:44 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E626A11B4D1;
 Thu,  4 Apr 2024 11:48:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_DMC_w?=
 =?utf-8?q?akelock_implementation_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Apr 2024 11:48:42 -0000
Message-ID: <171223132294.1209579.6617291859023579116@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240404114147.236316-1-luciano.coelho@intel.com>
In-Reply-To: <20240404114147.236316-1-luciano.coelho@intel.com>
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

Series: drm/i915/display: DMC wakelock implementation (rev5)
URL   : https://patchwork.freedesktop.org/series/128628/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c5b8514a27d3fe106ae93b3028bf1dd1ecd33a79
Author: Luca Coelho <luciano.coelho@intel.com>
Date:   Thu Apr 4 14:41:47 2024 +0300

    drm/i915/display: tie DMC wakelock to DC5/6 state transitions
    
    We only need DMC wakelocks when we allow DC5 and DC6 states.  Add the
    calls to enable and disable DMC wakelock accordingly.
    
    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
+ /mt/dim checkpatch 714417be4833696db248e963e5010e6639610bda drm-intel
e019c3c24fd6 drm/i915/display: add support for DMC wakelocks
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:225: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#225: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 456 lines checked
a2b9d274cfcd drm/i915/display: don't allow DMC wakelock on older hardware
7b54b72553ef drm/i915/display: add module parameter to enable DMC wakelock
-:22: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#22: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:120:
+intel_display_param_named_unsafe(enable_dmc_wl, bool, 0400,
+	"Enable DMC wakelock "

total: 0 errors, 0 warnings, 1 checks, 36 lines checked
c5b8514a27d3 drm/i915/display: tie DMC wakelock to DC5/6 state transitions


