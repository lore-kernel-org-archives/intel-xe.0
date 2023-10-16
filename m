Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F31CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 16:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A38C10E21D;
	Mon, 16 Oct 2023 16:38:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 070CB10E215;
 Mon, 16 Oct 2023 16:38:07 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 03BE8AADEA;
 Mon, 16 Oct 2023 16:38:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Mon, 16 Oct 2023 16:38:07 -0000
Message-ID: <169747428701.13510.1672996345158973180@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231016163449.1300701-8-matthew.d.roper@intel.com>
In-Reply-To: <20231016163449.1300701-8-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_LR?=
 =?utf-8?q?C_debugfs_and_general_instruction_tweaks_=28rev4=29?=
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

Series: LRC debugfs and general instruction tweaks (rev4)
URL   : https://patchwork.freedesktop.org/series/125008/
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
commit 1cf6db12345bd48dc1bdddd48558e19812d634e6
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Mon Oct 16 09:34:56 2023 -0700

    drm/xe/debugfs: Include GFXPIPE commands in LRC dump
    
    RCS and CCS engines include several non-register gfxpipe commands in
    their LRC images.  Include these in the dump output so that we can see
    exactly what's inside the context snapshot.
    
    v2:
     - Include raw instruction header in output
     - Add 3DSTATE_AMFS_TEXTURE_POINTERS and 3DSTATE_MONOFILTER_SIZE.  The
       first was supposed to be removed in Xe_HPG, and the second by
       gen12, but both still show up in the RCS LRC.
    
    v3:
     - Sanity check that we don't have numdw > remaining_dw.  (Lucas)
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch ab7cd1b4af95baba2d6ce5487d35ffda523e895d drm-intel
2d49bb3a8 drm/xe: Make MI_FLUSH_DW immediate size more explicit
becb85253 drm/xe: Separate number of registers from MI_LRI opcode
803c81a2c drm/xe: Clarify number of dwords/qwords stored by MI_STORE_DATA_IMM
57f9d7c2b drm/xe: Extract MI_* instructions to their own header
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 190 lines checked
d42d3fa57 drm/xe/debugfs: Add dump of default LRCs' MI instructions
1cf6db123 drm/xe/debugfs: Include GFXPIPE commands in LRC dump
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

-:187: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#187: FILE: drivers/gpu/drm/xe/xe_lrc.c:998:
+#define MATCH(cmd) \
+	case cmd: \
+		drm_printf(p, "[%#010x] " #cmd " (%d dwords)\n", *dw, numdw); \
+		return numdw

total: 0 errors, 2 warnings, 0 checks, 240 lines checked


