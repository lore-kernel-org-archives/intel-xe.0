Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E003BC25B78
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 17:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E69C10EFE1;
	Mon, 27 May 2024 17:42:30 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD6E10EFE1;
 Mon, 27 May 2024 17:42:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_VF=3A_Setup_VRAM_based_on?=
 =?utf-8?q?_received_config_data?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 May 2024 17:42:28 -0000
Message-ID: <171683174889.2213622.7829981939456542343@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240527173554.1108-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240527173554.1108-1-michal.wajdeczko@intel.com>
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

Series: VF: Setup VRAM based on received config data
URL   : https://patchwork.freedesktop.org/series/134097/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2e2f3baed713ab3990efb5cd7d7ad7395b483224
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon May 27 19:35:54 2024 +0200

    drm/xe/vf: Setup VRAM based on received config data
    
    VF drivers will obtain VRAM configuration from the GuC as part of
    the VF self config. Use that configuration instead of trying to
    read inaccessible registers.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 0f0c00c367c8a8621a07443664d5f9a266889e84 drm-intel
7643ce7c27f9 drm/xe: Move XEHP_MTCFG_ADDR register definition to xe_regs.h
1b8ded9f1014 drm/xe: Move BAR definitions to dedicated file
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 41 lines checked
af18993b70d9 drm/xe: Promote VRAM initialization function to own file
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:402: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#402: 
new file mode 100644

-:644: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#644: FILE: drivers/gpu/drm/xe/xe_vram.c:238:
+	if (xe->info.has_flat_ccs) {
[...]
+	} else {
[...]

-:730: WARNING:LONG_LINE: line length of 139 exceeds 100 columns
#730: FILE: drivers/gpu/drm/xe/xe_vram.c:324:
+		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,

-:731: WARNING:LONG_LINE: line length of 127 exceeds 100 columns
#731: FILE: drivers/gpu/drm/xe/xe_vram.c:325:
+			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);

-:732: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#732: FILE: drivers/gpu/drm/xe/xe_vram.c:326:
+		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,

-:733: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#733: FILE: drivers/gpu/drm/xe/xe_vram.c:327:
+			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,

-:734: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#734: FILE: drivers/gpu/drm/xe/xe_vram.c:328:
+			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);

total: 0 errors, 7 warnings, 0 checks, 735 lines checked
f7d9cbaec1e6 drm/xe: Rename internal vram helper function
2e2f3baed713 drm/xe/vf: Setup VRAM based on received config data


