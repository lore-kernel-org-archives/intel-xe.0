Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F55DCDB47E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 19:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB78110E54E;
	Thu, 12 Oct 2023 19:29:58 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4553310E546;
 Thu, 12 Oct 2023 19:29:56 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 40A8AAADF2;
 Thu, 12 Oct 2023 19:29:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Thu, 12 Oct 2023 19:29:56 -0000
Message-ID: <169713899626.25007.2681067255809618444@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231011230957.463381-8-matthew.d.roper@intel.com>
In-Reply-To: <20231011230957.463381-8-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_LR?=
 =?utf-8?q?C_debugfs_and_general_instruction_tweaks_=28rev2=29?=
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

Series: LRC debugfs and general instruction tweaks (rev2)
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
commit 35af4701f7ef446c98a98f03777a732e1a9fbc5c
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Wed Oct 11 16:10:04 2023 -0700

    drm/xe/debugfs: Include GFXPIPE commands in LRC dump
    
    RCS and CCS engines include several non-register gfxpipe commands in
    their LRC images.  Include these in the dump output so that we can see
    exactly what's inside the context snapshot.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 6c0d1e36f310682297a5b07336b0883afc77f66e drm-intel
43834bf0e drm/xe: Make MI_FLUSH_DW immediate size more explicit
b20eeb3a8 drm/xe: Separate number of registers from MI_LRI opcode
c2a553548 drm/xe: Clarify number of dwords/qwords stored by MI_STORE_DATA_IMM
d11b497f1 drm/xe: Extract MI_* instructions to their own header
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:18: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#18: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 190 lines checked
70f54e2b8 drm/xe/debugfs: Add dump of default LRCs' MI instructions
-:61: ERROR:OPEN_BRACE: open brace '{' following function definitions go on the next line
#61: FILE: drivers/gpu/drm/xe/xe_gt_debugfs.c:153:
+static int rcs_default_lrc(struct seq_file *m, void *data) {

-:68: ERROR:OPEN_BRACE: open brace '{' following function definitions go on the next line
#68: FILE: drivers/gpu/drm/xe/xe_gt_debugfs.c:160:
+static int ccs_default_lrc(struct seq_file *m, void *data) {

-:75: ERROR:OPEN_BRACE: open brace '{' following function definitions go on the next line
#75: FILE: drivers/gpu/drm/xe/xe_gt_debugfs.c:167:
+static int bcs_default_lrc(struct seq_file *m, void *data) {

-:82: ERROR:OPEN_BRACE: open brace '{' following function definitions go on the next line
#82: FILE: drivers/gpu/drm/xe/xe_gt_debugfs.c:174:
+static int vcs_default_lrc(struct seq_file *m, void *data) {

-:89: ERROR:OPEN_BRACE: open brace '{' following function definitions go on the next line
#89: FILE: drivers/gpu/drm/xe/xe_gt_debugfs.c:181:
+static int vecs_default_lrc(struct seq_file *m, void *data) {

-:145: WARNING:LINE_SPACING: Missing a blank line after declarations
#145: FILE: drivers/gpu/drm/xe/xe_lrc.c:925:
+		int num_noop = 1;
+		while (num_noop < remaining_dw &&

total: 5 errors, 1 warnings, 0 checks, 183 lines checked
35af4701f drm/xe/debugfs: Include GFXPIPE commands in LRC dump
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

-:62: CHECK:LINE_SPACING: Please don't use multiple blank lines
#62: FILE: drivers/gpu/drm/xe/instructions/xe_gfxpipe_commands.h:45:
+
+

-:160: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#160: FILE: drivers/gpu/drm/xe/xe_lrc.c:976:
+	switch (*dw & GFXPIPE_MATCH_MASK) {
+

-:161: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#161: FILE: drivers/gpu/drm/xe/xe_lrc.c:977:
+#define MATCH(cmd) \
+	case cmd: \
+		  drm_printf(p, #cmd " (%d dwords)\n", numdw); \
+		return numdw

total: 0 errors, 2 warnings, 2 checks, 224 lines checked


