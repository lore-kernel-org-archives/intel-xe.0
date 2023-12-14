Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CDEC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 12:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7094310E17C;
	Thu, 14 Dec 2023 12:59:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 98AE510E17C;
 Thu, 14 Dec 2023 12:59:44 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8CC9FA3ECB;
 Thu, 14 Dec 2023 12:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Engine_Busyness_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Thu, 14 Dec 2023 12:59:44 -0000
Message-ID: <170255878457.19958.14351784996884853454@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231214113144.251726-1-riana.tauro@intel.com>
In-Reply-To: <20231214113144.251726-1-riana.tauro@intel.com>
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

Series: Engine Busyness (rev3)
URL   : https://patchwork.freedesktop.org/series/126919/
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
commit d0d03f749f168812909448c5249aa820f8c2dda3
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Thu Dec 14 17:01:44 2023 +0530

    RFC drm/xe/guc: Handle runtime suspend issues for engine busyness
    
    1) During runtime suspend, when card enters D3hot, values read
        from the shared memory maintained by GuC returns 0xFF.
        Waking up for every perf read when
        device is runtime suspended causes power penality.
        Store the last read busy ticks and total active ticks and return
        these values when suspended
    
     2) When the device is runtime resumed, guc is loaded again. If pmu
        interface was opened to collect busyness events, the guc stats
        have to be re-enabled to resume collection after suspend.
        Disable/enable guc stats if pmu is opened and is already collecting
        busyness events and device gets runtime suspended/resumed.
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 5cd1893366708380854f4694ae57417192458a6b drm-intel
b8621025e drm/xe/pmu: Remove PMU from Xe till uapi is finalized
-:117: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#117: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 114 lines checked
71e8da255 fixup! drm/xe/uapi: Reject bo creation of unaligned size
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
3ed2e2616 drm/xe: Move user engine class mappings to functions
723eca7ed RFC drm/xe/guc: Add interface for engine busyness ticks
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:111: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#111: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 275 lines checked
3c45b8729 RFC drm/xe/uapi: Add configs for Engine busyness
95abe0af1 RFC drm/xe/pmu: Enable PMU interface and add engine busyness counter
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
-:118: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#118: 
new file mode 100644

-:457: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#457: FILE: drivers/gpu/drm/xe/xe_pmu.c:335:
+						      __DRM_XE_PMU_ENGINE(j, xe_hw_engine_to_user_class(hwe->class),

total: 0 errors, 2 warnings, 0 checks, 664 lines checked
a847a8ef7 RFC drm/xe/guc: Add PMU counter for total active ticks
bfeb74340 RFC drm/xe/guc: Expose engine busyness only for supported GuC version
159c5db3f RFC drm/xe/guc: Dynamically enable/disable engine busyness stats
d0d03f749 RFC drm/xe/guc: Handle runtime suspend issues for engine busyness


