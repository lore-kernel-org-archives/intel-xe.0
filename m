Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD94BC7EE29
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 11:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8820910E010;
	Wed,  7 Jun 2023 11:15:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E4DE310E010;
 Wed,  7 Jun 2023 11:15:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E1347AADD7;
 Wed,  7 Jun 2023 11:15:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Date: Wed, 07 Jun 2023 11:15:16 -0000
Message-ID: <168613651691.21180.10402854773694274507@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230607110328.3739706-1-anshuman.gupta@intel.com>
In-Reply-To: <20230607110328.3739706-1-anshuman.gupta@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_D3?=
 =?utf-8?q?Cold_Policy_=28rev2=29?=
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

Series: D3Cold Policy (rev2)
URL   : https://patchwork.freedesktop.org/series/118035/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3568eb7a1155b6759c0473107f0c095a7195604e
Author: Anshuman Gupta <anshuman.gupta@intel.com>
Date:   Wed Jun 7 16:33:28 2023 +0530

    drm/xe/pm: Init pcode and restore vram on power lost
    
    Don't init pcode and restore VRAM objects in vain.
    We can rely on primary GT GUC_STATUS to detect whether
    card has really lost power even when d3cold is allowed by xe.
    Adding d3cold.lost_power flag to avoid pcode init and vram
    restoration.
    Also cleaning up the TODO code comment.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
+ /mt/dim checkpatch 0f657f7b7f8886953ec1d946965a90fd286a6591 drm-intel
57fad5271 drm/xe/pm: Add pci d3cold_capable support
e4f6fe2f5 drm/xe/pm: Refactor xe_pm_runtime_init
ede55dbe1 drm/xe/pm: Add vram_d3cold_threshold Sysfs
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:32: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#32: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 243 lines checked
0c9d7b1d6 xe/drm/pm: Toggle d3cold_allowed using vram_usages
3568eb7a1 drm/xe/pm: Init pcode and restore vram on power lost


