Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731DECAC596
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 19:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F71C10E1D1;
	Tue, 17 Sep 2024 19:25:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF88610E1D1;
 Tue, 17 Sep 2024 19:25:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_xe=5Fforce=5Fwake=5Fg?=
 =?utf-8?q?et=28=29_failure_handling_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Sep 2024 19:25:35 -0000
Message-ID: <172660113571.1023537.5711855084939478903@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
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

Series: Fix xe_force_wake_get() failure handling (rev4)
URL   : https://patchwork.freedesktop.org/series/137982/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 71e4dc6b4d4577555b3b6fa608e82e8dd1f22de5
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Tue Sep 17 23:44:25 2024 +0530

    drm/xe: Change return type to void for xe_force_wake_put
    
    There is no need to return an error from xe_force_wake_put(), as a
    failure implicitly indicates that the domain failed to sleep.
    
    v3
    - Move kernel-doc to this patch (Badal)
    
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 38e1b615fb395b928e514108e908cd6edf3d34c3 drm-intel
833f72039699 drm/xe: Error handling in xe_force_wake_get()
-:114: WARNING:NEW_TYPEDEFS: do not add new typedefs
#114: FILE: drivers/gpu/drm/xe/xe_force_wake_types.h:14:
+typedef unsigned int xe_wakeref_t;

total: 0 errors, 1 warnings, 0 checks, 73 lines checked
bfe4b9dcf96e drm/xe: Modify xe_force_wake_put to handle _get returned mask
16f4ba7138f5 drm/xe/device: Update handling of xe_force_wake_get return
640b54e08fb1 drm/xe/hdcp: Update handling of xe_force_wake_get return
1c0feab3417f drm/xe/gsc: Update handling of xe_force_wake_get return
33f2a23dfa96 drm/xe/gt: Update handling of xe_force_wake_get return
caf17c6042af drm/xe/xe_gt_idle: Update handling of xe_force_wake_get return
50b8e91d59eb drm/xe/devcoredump: Update handling of xe_force_wake_get return
80ff38e4fcdf drm/xe/tests/mocs: Update xe_force_wake_get() return handling
808a7baff013 drm/xe/mocs: Update handling of xe_force_wake_get return
3713453c756e drm/xe/xe_drm_client: Update handling of xe_force_wake_get return
68ec08477090 drm/xe/xe_gt_debugfs: Update handling of xe_force_wake_get return
a7a74f9844bd drm/xe/guc: Update handling of xe_force_wake_get return
79533d523d5d drm/xe/huc: Update handling of xe_force_wake_get return
3427e00715a9 drm/xe/oa: Handle force_wake_get failure in xe_oa_stream_init()
d27bbd79d892 drm/xe/pat: Update handling of xe_force_wake_get return
f9b01d8bbfb6 drm/xe/gt_tlb_invalidation_ggtt: Update handling of xe_force_wake_get return
4d9f2cc1726d drm/xe/xe_reg_sr: Update handling of xe_force_wake_get return
60141eed74c7 drm/xe/query: Update handling of xe_force_wake_get return
5d6cf660f94a drm/xe/vram: Update handling of xe_force_wake_get return
61104c93aeef drm/xe: forcewake debugfs open fails on xe_forcewake_get failure
fa92f3ec4d8f drm/xe: Ensure __must_check for xe_force_wake_get() return
71e4dc6b4d45 drm/xe: Change return type to void for xe_force_wake_put


