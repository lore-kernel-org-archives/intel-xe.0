Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFF0C46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 04:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A56D10E3EC;
	Tue, 19 Dec 2023 04:58:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id F02DC10E3EC;
 Tue, 19 Dec 2023 04:58:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EC899AADE4;
 Tue, 19 Dec 2023 04:58:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_GuC_Doorbells_M?=
 =?utf-8?q?anager_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Tue, 19 Dec 2023 04:58:28 -0000
Message-ID: <170296190896.17583.8676915010567608273@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231218190629.502-1-michal.wajdeczko@intel.com>
In-Reply-To: <20231218190629.502-1-michal.wajdeczko@intel.com>
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

Series: Introduce GuC Doorbells Manager (rev5)
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
commit be74604c7ca401b7a1319724dc57e434e18db6b0
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Dec 18 20:06:29 2023 +0100

    drm/xe/kunit: Add GuC Doorbells Manager tests
    
    Add few tests to make sure that basic usage scenarios of the GuC
    Doorbells Manager are implemented correctly.
    
    Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 84e5d706cb0c11f2948a9f16d9e31ad5256b641c drm-intel
5c1ffdb60 drm/xe: Add GT oriented drm_printers
4ef791ed8 drm/xe: Report TLB timeout using GT oriented functions
4b224bcb6 drm/xe: Introduce GuC Doorbells Manager
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:41: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#41: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 330 lines checked
6c426cb25 drm/xe/kunit: Set SR-IOV mode of the fake device
66aa048a7 drm/xe/kunit: Define helper functions to allocate fake xe device
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 106 lines checked
4b0e3a353 drm/xe/kunit: Restore test->priv when done with fake xe device
4dde29cd1 drm/xe/kunit: Use xe kunit helper in RTP test
9a9332c0d drm/xe/kunit: Use xe kunit helper in WA test
61ea6b3e9 drm/xe/kunit: Enable CONFIG_LOCKDEP in tests
be74604c7 drm/xe/kunit: Add GuC Doorbells Manager tests
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:17: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#17: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 208 lines checked


