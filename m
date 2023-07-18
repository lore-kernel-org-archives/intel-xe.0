Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DC5EB64DA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 08:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3284010E304;
	Tue, 18 Jul 2023 08:50:43 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0F65310E303;
 Tue, 18 Jul 2023 08:50:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0C301A47E9;
 Tue, 18 Jul 2023 08:50:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Date: Tue, 18 Jul 2023 08:50:41 -0000
Message-ID: <168967024104.22206.18294150381388682574@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230718080703.239343-1-anshuman.gupta@intel.com>
In-Reply-To: <20230718080703.239343-1-anshuman.gupta@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_D3?=
 =?utf-8?q?Cold_Policy_=28rev8=29?=
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

Series: D3Cold Policy (rev8)
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
commit 22a25b40f4927b4d923f558a07f4f300d9447ec8
Author: Anshuman Gupta <anshuman.gupta@intel.com>
Date:   Tue Jul 18 13:37:03 2023 +0530

    drm/xe/pm: Init pcode and restore vram on power lost
    
    Don't init pcode and restore VRAM objects in vain.
    We can rely on primary GT GUC_STATUS to detect whether
    card has really lost power even when d3cold is allowed by xe.
    Adding d3cold.lost_power flag to avoid pcode init and vram
    restoration.
    Also cleaning up the TODO code comment.
    
    v2:
    - %s/xe_guc_has_lost_power()/xe_guc_in_reset().
    - Used existing gt instead of new variable. [Rodrigo]
    - Added kernel-doc function comment. [Rodrigo]
    - xe_guc_in_reset() return true if failed to get fw.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch a43fd52b7ab2009631518ead5ca0afe9bc44515a drm-intel
771454979 drm/xe/pm: Add pci d3cold_capable support
72c62f101 drm/xe/pm: Refactor xe_pm_runtime_init
8622bf793 drm/xe/pm: Add vram_d3cold_threshold Sysfs
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:42: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#42: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 264 lines checked
9a4bb27f4 xe/drm/pm: Toggle d3cold_allowed using vram_usages
22a25b40f drm/xe/pm: Init pcode and restore vram on power lost


