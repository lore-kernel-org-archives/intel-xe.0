Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C39DC4167B
	for <intel-xe@archiver.kernel.org>; Sun, 10 Dec 2023 18:53:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B02810E05C;
	Sun, 10 Dec 2023 18:53:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 80E4710E05C;
 Sun, 10 Dec 2023 18:53:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7D608AADD6;
 Sun, 10 Dec 2023 18:53:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_GuC_Doorbells_M?=
 =?utf-8?q?anager?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Sun, 10 Dec 2023 18:53:17 -0000
Message-ID: <170223439751.19107.10837440972769044348@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231210180659.1615-1-michal.wajdeczko@intel.com>
In-Reply-To: <20231210180659.1615-1-michal.wajdeczko@intel.com>
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

Series: Introduce GuC Doorbells Manager
URL   : https://patchwork.freedesktop.org/series/127608/
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
commit d72b1706b031ba3bae0633a623d6792cf8d933d2
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Sun Dec 10 19:06:59 2023 +0100

    drm/xe/kunit: Add GuC Doorbell Manager tests
    
    Add few tests to make sure that basic usage scenarios of the GuC
    Doorbell Manager are implemented correctly.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch 1fc141d1f445b8e5ab4ff14645b0482dd98460b9 drm-intel
aa76fc716 drm/xe: Add GT oriented drm_printers
8f5c7c8c0 drm/xe: Use GT oriented functions to report TLB timeout
c7e6ef99b drm/xe: Introduce GuC Doorbells Manager
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:40: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#40: 
new file mode 100644

-:124: ERROR:TRAILING_WHITESPACE: trailing whitespace
#124: FILE: drivers/gpu/drm/xe/xe_guc_db_mgr.c:80:
+ * $

-:227: ERROR:TRAILING_WHITESPACE: trailing whitespace
#227: FILE: drivers/gpu/drm/xe/xe_guc_db_mgr.c:183:
+ * @dbm: the &xe_guc_db_mgr $

-:252: ERROR:TRAILING_WHITESPACE: trailing whitespace
#252: FILE: drivers/gpu/drm/xe/xe_guc_db_mgr.c:208:
+ * @dbm: the &xe_guc_db_mgr $

total: 3 errors, 1 warnings, 0 checks, 330 lines checked
448512863 drm/xe/kunit: Set SR-IOV mode of the fake device
bb342a75a drm/xe/kunit: Define helper functions to allocate mock device
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
new file mode 100644

-:91: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#91: FILE: drivers/gpu/drm/xe/tests/xe_kunit_helpers.c:60:
+ * Return: A pointer to default mock &xe_device.
+*/

-:110: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#110: FILE: drivers/gpu/drm/xe/tests/xe_kunit_helpers.c:79:
+ * Return: Always 0.
+*/

total: 0 errors, 3 warnings, 0 checks, 113 lines checked
0f8b04f54 drm/xe/kunit: Use xe kunit helpers in RTP test
ecab576e9 drm/xe/kunit: Use xe kunit helpers in WA test
d72b1706b drm/xe/kunit: Add GuC Doorbell Manager tests
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 206 lines checked


