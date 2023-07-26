Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD29C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 17:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AD710E045;
	Wed, 26 Jul 2023 17:31:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 494CB10E063;
 Wed, 26 Jul 2023 17:31:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 45980AADF1;
 Wed, 26 Jul 2023 17:31:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 26 Jul 2023 17:31:49 -0000
Message-ID: <169039270927.23470.12500746427055633978@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
In-Reply-To: <20230726160708.3967790-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fi?=
 =?utf-8?q?x_stolen_setup_for_MTL+_=28rev2=29?=
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

Series: Fix stolen setup for MTL+ (rev2)
URL   : https://patchwork.freedesktop.org/series/121329/
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
commit 071c1ffb41008ef41d14c5c6b8c13f5e6b5e73f1
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Jul 26 09:07:08 2023 -0700

    drm/xe: Sort xe_regs.h
    
    Sort it by register address to make it easy to update when needed.
    
    v2: Do not create exception for registers with same functionality.
    Always sort it.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 3eb59fdaff17b28970c5be4fd00dba25b3ffb3f1 drm-intel
c4a5fc3af fixup! 57f0bc550693ad29726bf2a71d05af0dc2d0a542
b33e25821 fixup! drm/xe/display: Implement display support
af631e7fa drm/xe: Fix checking for unset value
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '0f885eced0a8', maybe rebased or not pulled?
#6: 
Commit 0f885eced0a8 ("drm/xe: NULL binding implementation") introduced

-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '0f885eced0a8', maybe rebased or not pulled?
#12: 
Fixes: 0f885eced0a8 ("drm/xe: NULL binding implementation")

total: 0 errors, 2 warnings, 0 checks, 11 lines checked
c3454d93a drm/xe: Remove vma arg from xe_pte_encode()
3b3236d99 drm/xe: Decouple vram check from xe_bo_addr()
379dac5b8 drm/xe: Set PTE_DM bit for stolen on MTL
1371ba552 fixup! drm/xe/display: Implement display support
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
7d92b1aa6 drm/xe: Fix MTL+ stolen memory mapping
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '8d8d062be6b9', maybe rebased or not pulled?
#6: 
Based on commit 8d8d062be6b9 ("drm/i915/mtl: Fix MTL stolen memory GGTT

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
fcb72edeb drm/xe: Carve out top of DSM as reserved
071c1ffb4 drm/xe: Sort xe_regs.h


