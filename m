Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1AFCD1284
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 12:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6020E10EBDA;
	Tue,  2 Apr 2024 12:53:36 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC6810EBDA;
 Tue,  2 Apr 2024 12:53:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_Battlemage_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Apr 2024 12:53:35 -0000
Message-ID: <171206241532.1154279.3356261340064486954@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
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

Series: Add Battlemage support
URL   : https://patchwork.freedesktop.org/series/131939/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e53c988e01b032c6419e7cb55a373af59599f18e
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Tue Apr 2 18:17:24 2024 +0530

    drm/xe/xe2hpm: Add initial set of workarounds
    
    Define the initial set of workarounds for Xe2_HPM.
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
+ /mt/dim checkpatch f54ea7473cd118eb39978f2e946b17558b5ff46d drm-intel
30e852e6cbc4 drm/xe/xe2: Recognize Xe2_HPG IP
c241f331102d drm/xe/xe2: Recognize Xe2_HPM IP
b9bd0c5a7178 drm/xe/bmg: Add BMG platform definition
-:57: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#57: FILE: include/drm/xe_pciids.h:211:
+#define XE_BMG_IDS(MACRO__, ...) \
+	MACRO__(0xE202, ## __VA_ARGS__), \
+	MACRO__(0xE20B, ## __VA_ARGS__), \
+	MACRO__(0xE20C, ## __VA_ARGS__), \
+	MACRO__(0xE20D, ## __VA_ARGS__), \
+	MACRO__(0xE212, ## __VA_ARGS__)

-:57: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'MACRO__' - possible side-effects?
#57: FILE: include/drm/xe_pciids.h:211:
+#define XE_BMG_IDS(MACRO__, ...) \
+	MACRO__(0xE202, ## __VA_ARGS__), \
+	MACRO__(0xE20B, ## __VA_ARGS__), \
+	MACRO__(0xE20C, ## __VA_ARGS__), \
+	MACRO__(0xE20D, ## __VA_ARGS__), \
+	MACRO__(0xE212, ## __VA_ARGS__)

total: 1 errors, 0 warnings, 1 checks, 37 lines checked
642292d3f501 drm/xe/bmg: Add BMG mocs table
4bc77ce53ab4 drm/xe/bmg: Program an additional discrete-specific PAT setting
-:24: ERROR:SPACING: space prohibited after that open parenthesis '('
#24: FILE: drivers/gpu/drm/xe/xe_pat.c:145:
+static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );

-:24: ERROR:SPACING: space prohibited before that close parenthesis ')'
#24: FILE: drivers/gpu/drm/xe/xe_pat.c:145:
+static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );

total: 2 errors, 0 warnings, 0 checks, 25 lines checked
be893cfada24 drm/xe/xe2hpg: Determine flat ccs offset for vram
1799b940ec59 drm/xe/xe2hpg: Remove extra allocation of CCS pages for dgfx
e192eda1e98e drm/xe/xe2hpg: Limit chunk size to 4MiB for vram
1d96399ca4e1 drm/xe/xe2hpg: Add initial GT workarounds
b2872ba332b4 drm/xe/xe2hpg: Introduce performance tuning changes for Xe2_HPG.
e53c988e01b0 drm/xe/xe2hpm: Add initial set of workarounds


