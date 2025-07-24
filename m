Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C35C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 01:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A3210E1AB;
	Thu, 24 Jul 2025 01:11:05 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF81110E1AB;
 Thu, 24 Jul 2025 01:11:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_psmi_suppor?=
 =?utf-8?q?t_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Jul 2025 01:11:04 -0000
Message-ID: <175331946482.184983.9238115943478948673@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250723-psmi-v2-0-84a04b5a3c04@intel.com>
In-Reply-To: <20250723-psmi-v2-0-84a04b5a3c04@intel.com>
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

Series: drm/xe: Add psmi support (rev2)
URL   : https://patchwork.freedesktop.org/series/151729/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63535c743231a7497a612c53f6edbb8a7d14412d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 433053ab1a741d67e7fdebc9c59e377d9ebc92dd
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Jul 23 18:04:28 2025 -0700

    drm/xe/configfs: Allow to enable PSMI
    
    Now that additional WAs are in place and it's possible to allocate
    buffers through debugfs, add the configfs attribute to turn PSMI on.
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch e95f7906632d9bacee7d6f47884f856632393fa0 drm-intel
9e32ffd03e38 drm/xe/psmi: Add GuC flag to enable PSMI
be3101da90e2 drm/xe/psmi: Add debugfs interface for PSMI
-:110: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#110: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 380 lines checked
08c24e0aea17 drm/xe/rtp: Add match for psmi
d4b994fa72d5 drm/xe/psmi: Add Wa_14020001231
-:34: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#34: FILE: drivers/gpu/drm/xe/xe_guc_ads.c:387:
+					GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT,

total: 0 errors, 1 warnings, 0 checks, 28 lines checked
6929d94b7c00 drm/xe/psmi: Add Wa_16023683509
-:34: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#34: FILE: drivers/gpu/drm/xe/xe_guc_fwif.h:111:
+#define   GUC_WA_SAVE_RESTORE_MCFG_REG_AT_MC6 ^IBIT(25)$

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
f7482d738aae drm/xe/configfs: Simplify kernel doc
433053ab1a74 drm/xe/configfs: Allow to enable PSMI


