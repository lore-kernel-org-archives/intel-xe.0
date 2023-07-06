Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6133EEB64DC
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 12:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C82B10E514;
	Thu,  6 Jul 2023 12:10:16 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0CE3E10E518;
 Thu,  6 Jul 2023 12:10:13 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 09A97AADD7;
 Thu,  6 Jul 2023 12:10:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Date: Thu, 06 Jul 2023 12:10:13 -0000
Message-ID: <168864541303.18976.17867480795403700308@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230706120208.2828158-1-anshuman.gupta@intel.com>
In-Reply-To: <20230706120208.2828158-1-anshuman.gupta@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_D3?=
 =?utf-8?q?Cold_Policy_=28rev4=29?=
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

Series: D3Cold Policy (rev4)
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
commit 7ec724f1b009818a3f0e8576b77c0ac1204c6d11
Author: Anshuman Gupta <anshuman.gupta@intel.com>
Date:   Thu Jul 6 17:32:08 2023 +0530

    drm/xe/pm: Init pcode and restore vram on power lost
    
    Don't init pcode and restore VRAM objects in vain.
    We can rely on primary GT GUC_STATUS to detect whether
    card has really lost power even when d3cold is allowed by xe.
    Adding d3cold.lost_power flag to avoid pcode init and vram
    restoration.
    Also cleaning up the TODO code comment.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
+ /mt/dim checkpatch abcb88850f885254cf7477e1f7a5956136fb547c drm-intel
0e061266f drm/xe/pm: Add pci d3cold_capable support
6db8e300a drm/xe/pm: Refactor xe_pm_runtime_init
d28c30dda drm/xe/pm: Add vram_d3cold_threshold Sysfs
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 259 lines checked
407796f4b xe/drm/pm: Toggle d3cold_allowed using vram_usages
7ec724f1b drm/xe/pm: Init pcode and restore vram on power lost


