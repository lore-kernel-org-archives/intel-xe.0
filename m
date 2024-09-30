Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D160DCEB2C1
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 20:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A26110E134;
	Mon, 30 Sep 2024 20:55:59 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F061110E134;
 Mon, 30 Sep 2024 20:55:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fix_xe=5Fforce=5Fwake=5Fg?=
 =?utf-8?q?et=28=29_failure_handling_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Sep 2024 20:55:57 -0000
Message-ID: <172772975797.1139033.16329534092770726806@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
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

Series: Fix xe_force_wake_get() failure handling (rev7)
URL   : https://patchwork.freedesktop.org/series/137982/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a403ff294bf3238f1509a75116aa6f5adfcfabd6
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Mon Sep 30 11:01:49 2024 +0530

    drm/xe: Change return type to void for xe_force_wake_put
    
    There is no need to return an error from xe_force_wake_put(), as a
    failure implicitly indicates that the domain failed to sleep.
    
    v3
    - Move kernel-doc to this patch (Badal)
    
    v5
    - change parameter to unsigned int in xe_force_wake_put()
    
    v6
    - Remove unneccsary wrapping (Michal)
    - Remove non required header (Michal)
    - Mention timeout(Michal)
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1 drm-intel
6b4980fda15c drm/xe: Add member initialized_domains to xe_force_wake()
0924eb63e373 drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()
47bf81320c0f drm/xe: Error handling in xe_force_wake_get()
e134f6bafb1a drm/xe: Modify xe_force_wake_put to handle _get returned mask
061e8a2f20f9 drm/xe/device: Update handling of xe_force_wake_get return
641383dae676 drm/xe/hdcp: Update handling of xe_force_wake_get return
f44d1b237f4b drm/xe/gsc: Update handling of xe_force_wake_get return
1706c6523e55 drm/xe/gt: Update handling of xe_force_wake_get return
2408485b63bf drm/xe/xe_gt_idle: Update handling of xe_force_wake_get return
2a744042b463 drm/xe/devcoredump: Update handling of xe_force_wake_get return
d1e9fa872fe8 drm/xe/tests/mocs: Update xe_force_wake_get() return handling
b0b953b20a11 drm/xe/mocs: Update handling of xe_force_wake_get return
37e22a5d442d drm/xe/xe_drm_client: Update handling of xe_force_wake_get return
b228edbb0fbb drm/xe/xe_gt_debugfs: Update handling of xe_force_wake_get return
9c32691a1754 drm/xe/guc: Update handling of xe_force_wake_get return
b227bde3524b drm/xe/huc: Update handling of xe_force_wake_get return
fc030c6d7951 drm/xe/oa: Handle force_wake_get failure in xe_oa_stream_init()
fbf2277e5c16 drm/xe/pat: Update handling of xe_force_wake_get return
15834092fcd8 drm/xe/gt_tlb_invalidation_ggtt: Update handling of xe_force_wake_get return
18f01c3e3d3a drm/xe/xe_reg_sr: Update handling of xe_force_wake_get return
ccb7d1def1c4 drm/xe/query: Update handling of xe_force_wake_get return
50f1dba995e9 drm/xe/vram: Update handling of xe_force_wake_get return
3fe144fbed32 drm/xe: forcewake debugfs open fails on xe_forcewake_get failure
be5c4ff77e39 drm/xe: Ensure __must_check for xe_force_wake_get() return
a403ff294bf3 drm/xe: Change return type to void for xe_force_wake_put


