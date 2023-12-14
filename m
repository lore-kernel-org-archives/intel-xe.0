Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AA7C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 21:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1087E10E30A;
	Thu, 14 Dec 2023 21:37:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2F70E10E30A;
 Thu, 14 Dec 2023 21:37:43 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 24714AADE4;
 Thu, 14 Dec 2023 21:37:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_VF_specific_int?=
 =?utf-8?q?errupts_handler_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Thu, 14 Dec 2023 21:37:43 -0000
Message-ID: <170258986314.19959.11597730931491359518@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231214185955.1791-1-michal.wajdeczko@intel.com>
In-Reply-To: <20231214185955.1791-1-michal.wajdeczko@intel.com>
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

Series: Introduce VF specific interrupts handler (rev2)
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
commit f0567ba9eb74e6d4322f0b457e0e97d9fa042e04
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Dec 14 19:59:55 2023 +0100

    drm/xe/vf: Add VF specific interrupt handler
    
    There are small differences in handling of the register based
    interrupts on the VF driver as some registers are not accessible
    to the VF driver. Additionally VFs must support Memory Based
    Interrupts. Add VF specific interrupt handler for this.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c drm-intel
74903e165 drm/xe: Add command MI_LOAD_REGISTER_MEM
3b2e83377 drm/xe: Define registers used by memory based irq processing
dd113d01a drm/xe: Update LRC context layout definitions
da2d65bd9 drm/xe: Update definition of GT_INTR_DW
9aa995839 drm/xe: Define IRQ offsets used by HW engines
228a2c944 drm/xe: Add XE_BO_NEEDS_UC flag to force UC mode instead WB
45a3d17aa drm/xe/vf: Introduce Memory Based Interrupts Handler
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
-:103: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#103: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 556 lines checked
dcefffb31 drm/xe/vf: Update LRC with memory based interrupts data
6d73dad72 drm/xe/vf: Setup memory based interrupts in GuC
f0567ba9e drm/xe/vf: Add VF specific interrupt handler


