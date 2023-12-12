Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33A6C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 23:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2E410E12F;
	Tue, 12 Dec 2023 23:30:12 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B886E10E12F;
 Tue, 12 Dec 2023 23:30:09 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A05ECAADF8;
 Tue, 12 Dec 2023 23:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_VF_specific_int?=
 =?utf-8?q?errupts_handler?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Tue, 12 Dec 2023 23:30:09 -0000
Message-ID: <170242380965.31291.7014215606576763210@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231212210054.1747-1-michal.wajdeczko@intel.com>
In-Reply-To: <20231212210054.1747-1-michal.wajdeczko@intel.com>
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

Series: Introduce VF specific interrupts handler
URL   : https://patchwork.freedesktop.org/series/127715/
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
commit 35ea891fceaa5aa71dfd88e4940d8a07d61678cb
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Dec 12 22:00:54 2023 +0100

    drm/xe/vf: Add VF specific interrupt handler
    
    There are small differences in handling of the register based
    interrupts on the VF driver as some registers are not accessible
    to the VF driver. Additionally VFs must support Memory Based
    Interrupts. Add VF specific interrupt handler for this.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch b7e6b29e607e7c75765d77d4ae315dec580d1ccc drm-intel
c53f60839 drm/xe: Add device flag for memory based IRQ support
dabe80098 drm/xe: Add command MI_LOAD_REGISTER_MEM
86735cf80 drm/xe: Define registers used by memory based irq processing
a53903f9d drm/xe: Update LRC context layout definitions
d1eb35a80 drm/xe: Update definition of GT_INTR_DW
98037e66b drm/xe: Define IRQ offsets used by HW engines
622601a24 drm/xe/vf: Introduce Memory Based Interrupts Handler
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
-:86: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#86: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 544 lines checked
680533847 drm/xe/vf: Update LRC with memory based interrupts data
3defc8cd8 drm/xe/vf: Setup memory based interrupts in GuC
35ea891fc drm/xe/vf: Add VF specific interrupt handler


