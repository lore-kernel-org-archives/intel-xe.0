Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0DEC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 21:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC7410E1A3;
	Mon, 13 Nov 2023 21:40:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 44E5410E1A3;
 Mon, 13 Nov 2023 21:40:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 43387A3ECB;
 Mon, 13 Nov 2023 21:40:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Date: Mon, 13 Nov 2023 21:40:51 -0000
Message-ID: <169991165127.24212.15969301133535559998@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231113195633.119188-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20231113195633.119188-1-juhapekka.heikkila@gmail.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5Bv9=2C1/6=5D_Revert_=22FIXME=3A_drm/i915?=
 =?utf-8?q?=3A_xe_dpt_integration=22?=
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

Series: series starting with [v9,1/6] Revert "FIXME: drm/i915: xe dpt integration"
URL   : https://patchwork.freedesktop.org/series/126349/
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
commit 9335026624690508c3a6a375899f3d4e876add90
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Mon Nov 13 21:56:33 2023 +0200

    FIXME: drm/i915: xe intel_fb.c framebuffer init and destroy xe changes
    
    intel_framebuffer_init and intel_user_framebuffer_destroy_vm
    xe changes.
    
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
+ /mt/dim checkpatch 7dc3dda9b2df5a5c8949532f254a0689de70f093 drm-intel
58c9b1235 Revert "FIXME: drm/i915: xe dpt integration"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'e417510409165b44ad59bfdbc59cd90316e91dc1', maybe rebased or not pulled?
#6: 
This reverts commit e417510409165b44ad59bfdbc59cd90316e91dc1.

-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:197: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 158 lines checked
fde0850f1 drm/i915/display: Separate xe and i915 common dpt code into own file
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:97: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#97: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 85 lines checked
2080797c7 drm/i915/display: in skl_surf_address check for dpt-vma
69338619c drm/i915/display: In intel_framebuffer_init switch to use intel_bo_to_drm_bo
30e7b832c fixup! drm/xe/display: Implement display support
-:8: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:83: WARNING:MISSING_EOF_NEWLINE: adding a line without newline at end of file
#83: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:384:
+}

-:83: WARNING:RETURN_VOID: void function return statements are not generally useful
#83: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:384:
+	return;
+}

-:84: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 3 warnings, 0 checks, 61 lines checked
933502662 FIXME: drm/i915: xe intel_fb.c framebuffer init and destroy xe changes


