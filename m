Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C915C67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 18:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D3710F94A;
	Mon,  8 Apr 2024 18:33:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEA71127E2;
 Mon,  8 Apr 2024 18:33:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_Battlemage_support_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Apr 2024 18:33:47 -0000
Message-ID: <171260122719.1286971.16214687261324806482@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
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

Series: Add Battlemage support (rev3)
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
commit 1a255adc593c99046df13b53c44eb3d9b2f02f36
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Mon Apr 8 22:35:45 2024 +0530

    drm/xe/xe2hpm: Add initial set of workarounds
    
    Define the initial set of workarounds for Xe2_HPM.
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch a533b51ca017728c1228432e8e1e9aba4fd65b02 drm-intel
db5706f9acfb drm/xe/xe2: Recognize Xe2_HPG IP
f3eb3f81c6cd drm/xe/xe2: Recognize Xe2_HPM IP
2f39573c3f61 drm/xe/bmg: Add BMG platform definition
33aa4086964f drm/xe/bmg: Add BMG mocs table
4653630e5120 drm/xe/bmg: Program an additional discrete-specific PAT setting
-:24: ERROR:SPACING: space prohibited after that open parenthesis '('
#24: FILE: drivers/gpu/drm/xe/xe_pat.c:145:
+static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );

-:24: ERROR:SPACING: space prohibited before that close parenthesis ')'
#24: FILE: drivers/gpu/drm/xe/xe_pat.c:145:
+static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );

total: 2 errors, 0 warnings, 0 checks, 25 lines checked
56baccd10e86 drm/xe/xe2hpg: Determine flat ccs offset for vram
29a85d4aafa4 drm/xe/xe2hpg: Remove extra allocation of CCS pages for dgfx
56d153f3cf64 drm/xe/xe2: Add workaround 18034896535
a4497f24e078 drm/xe/xe2hpg: Add initial GT workarounds
46b388f5e1e9 drm/xe/xe2hpg: Introduce performance tuning changes for Xe2_HPG.
1a255adc593c drm/xe/xe2hpm: Add initial set of workarounds


