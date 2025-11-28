Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E972CFD376
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 14:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D4910E100;
	Fri, 28 Nov 2025 14:21:26 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB9410E100;
 Fri, 28 Nov 2025 14:21:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_VF_double_migration_=28re?=
 =?utf-8?q?v7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Nov 2025 14:21:25 -0000
Message-ID: <176433968548.38795.1848344090696755951@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251128133052.17120-6-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20251128133052.17120-6-satyanarayana.k.v.p@intel.com>
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

Series: VF double migration (rev7)
URL   : https://patchwork.freedesktop.org/series/156339/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e1d8c4b17949b2692524eb7102eee1adb1eca06c
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Fri Nov 28 19:00:57 2025 +0530

    drm/xe/vf: Add debugfs entries to test VF double migration
    
    VF migration sends a marker to the GUC before resource fixups begin,
    and repeats the marker with the RESFIX_DONE notification. This prevents
    the GUC from submitting jobs during double migration events.
    
    To reliably test double migration, a second migration must be triggered
    while fixups from the first migration are still in progress. Since fixups
    complete quickly, reproducing this scenario is difficult. Introduce
    debugfs controls to add delays in the post-fixup phase, creating a
    deterministic window for subsequent migrations.
    
    New debugfs entries:
            /sys/kernel/debug/dri/BDF/
            ├── tile0
            │   ├─gt0
            │   │ ├──vf
            │   │ │  ├── resfix_stoppers
    
    resfix_stoppers: Predefined checkpoints that allow the migration process
    to pause at specific stages. The stages are given below.
    
    VF_MIGRATION_WAIT_RESFIX_START          - BIT(0)
    VF_MIGRATION_WAIT_FIXUPS                - BIT(1)
    VF_MIGRATION_WAIT_RESTART_JOBS          - BIT(2)
    VF_MIGRATION_WAIT_RESFIX_DONE           - BIT(3)
    
    Each state will pause with a 1-second delay per iteration, continuing until
    its corresponding bit is cleared.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Tomasz Lis <tomasz.lis@intel.com>
+ /mt/dim checkpatch e1c1b3e03e356d1e20432dcb0d38ad44d5e92670 drm-intel
525a62fa7067 drm/xe/vf: Enable VF migration only on supported GuC versions
7c53600059e9 drm/xe/vf: Introduce RESFIX start marker support
73a152f37b24 drm/xe/vf: Requeue recovery on GuC MIGRATION error during VF post-migration
e1d8c4b17949 drm/xe/vf: Add debugfs entries to test VF double migration
-:86: WARNING:MACRO_ARG_UNUSED: Argument '_POS' is not used in function-like macro
#86: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:73:
+#define VF_MIGRATION_INJECT_WAIT(_gt, _POS)	typecheck(struct xe_gt *, (_gt))

total: 0 errors, 1 warnings, 0 checks, 106 lines checked


