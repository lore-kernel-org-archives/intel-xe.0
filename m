Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58054C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 20:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026A710E12F;
	Mon, 27 Nov 2023 20:26:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id BB55B10E12F;
 Mon, 27 Nov 2023 20:26:44 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B8250A0003;
 Mon, 27 Nov 2023 20:26:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Date: Mon, 27 Nov 2023 20:26:44 -0000
Message-ID: <170111680475.3003.16223388510212036842@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_re?=
 =?utf-8?q?vert_local_patches_and_cherrypick_same_patches_from_drm-tip?=
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

Series: revert local patches and cherrypick same patches from drm-tip
URL   : https://patchwork.freedesktop.org/series/126944/
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
commit 53553775a12c05112efee4a52b5df15c9ca4900d
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Mon Nov 27 21:09:35 2023 +0200

    drm/i915/display: Separate xe and i915 common dpt code into own file
    
    Here created intel_dpt_common.c to hold intel_dpt_configure which is
    needed for both xe and i915.
    
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
    Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20231116150225.204233-1-juhapekka.heikkila@gmail.com
    (cherry picked from commit 1aba67132cbc46856dfa8f904cd7021a75b1806d)
+ /mt/dim checkpatch 7cd1cacf17749d821ca9966ae5913852943d35e7 drm-intel
c175d1ff4 Revert "drm/i915/display: In intel_framebuffer_init switch to use intel_bo_to_drm_bo"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '1c7037778222e8f91e416b8fce2b365593ecbd3c', maybe rebased or not pulled?
#7: 
This reverts commit 1c7037778222e8f91e416b8fce2b365593ecbd3c.

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
ec853881e Revert "drm/i915/display: in skl_surf_address check for dpt-vma"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'd192a479c592c5be260ae260429d24cf19ca7c9f', maybe rebased or not pulled?
#7: 
This reverts commit d192a479c592c5be260ae260429d24cf19ca7c9f.

total: 0 errors, 1 warnings, 0 checks, 9 lines checked
148785e6d Revert "drm/i915/display: Separate xe and i915 common dpt code into own file"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'c87774bd9237e8f45181cff47f193d1966da1403', maybe rebased or not pulled?
#7: 
This reverts commit c87774bd9237e8f45181cff47f193d1966da1403.

-:96: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#96: 
deleted file mode 100644

total: 0 errors, 2 warnings, 0 checks, 62 lines checked
0ad5cd61c drm/i915/display: In intel_framebuffer_init switch to use intel_bo_to_drm_bo
ee881b2a9 drm/i915/display: in skl_surf_address check for dpt-vma
53553775a drm/i915/display: Separate xe and i915 common dpt code into own file
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:104: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#104: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 85 lines checked


