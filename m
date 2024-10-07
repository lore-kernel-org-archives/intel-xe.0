Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC65CFB44D
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 16:48:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF66210E3DD;
	Mon,  7 Oct 2024 16:48:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8785910E3DD;
 Mon,  7 Oct 2024 16:48:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fix_xe=5Fforce=5Fwake=5Fg?=
 =?utf-8?q?et=28=29_failure_handling_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Oct 2024 16:48:55 -0000
Message-ID: <172831973555.1199437.18400491020942163871@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
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

Series: Fix xe_force_wake_get() failure handling (rev8)
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
commit 141cde6ba6c236c0fa49b0e8f1803a309c4f8f57
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Mon Oct 7 12:30:17 2024 +0530

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
    Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>(#rev5)
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 39a016b276ce8adac629cc6c31892d0b7d2af634 drm-intel
89cf161716f8 drm/xe: Add member initialized_domains to xe_force_wake()
746a27bd49a8 drm/xe/forcewake: Change awake_domain datatype
a0dcaa1aeef1 drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()
78a6543b91fe drm/xe: Error handling in xe_force_wake_get()
1fef0311c88a drm/xe: Modify xe_force_wake_put to handle _get returned mask
4db05be80c46 drm/xe/device: Update handling of xe_force_wake_get return
6cefc316f921 drm/xe/hdcp: Update handling of xe_force_wake_get return
5f079e0169e0 drm/xe/gsc: Update handling of xe_force_wake_get return
b68ecce9cf28 drm/xe/gt: Update handling of xe_force_wake_get return
9049b87f8145 drm/xe/xe_gt_idle: Update handling of xe_force_wake_get return
5c23b7dc2942 drm/xe/devcoredump: Update handling of xe_force_wake_get return
af5fa8603fa3 drm/xe/tests/mocs: Update xe_force_wake_get() return handling
0bc5ebace592 drm/xe/mocs: Update handling of xe_force_wake_get return
c58897675d40 drm/xe/xe_drm_client: Update handling of xe_force_wake_get return
376076bcd12b drm/xe/xe_gt_debugfs: Update handling of xe_force_wake_get return
fd9bd3500ab6 drm/xe/guc: Update handling of xe_force_wake_get return
b22ded01dcac drm/xe/huc: Update handling of xe_force_wake_get return
8ca431ef1db2 drm/xe/oa: Handle force_wake_get failure in xe_oa_stream_init()
995ff25c8d8a drm/xe/pat: Update handling of xe_force_wake_get return
7ee1348bb4df drm/xe/gt_tlb_invalidation_ggtt: Update handling of xe_force_wake_get return
3d6e8a961578 drm/xe/xe_reg_sr: Update handling of xe_force_wake_get return
979e786da2a5 drm/xe/query: Update handling of xe_force_wake_get return
ebfd12c269be drm/xe/vram: Update handling of xe_force_wake_get return
fec9015a98ff drm/xe: forcewake debugfs open fails on xe_forcewake_get failure
bdf31b31385d drm/xe: Ensure __must_check for xe_force_wake_get() return
141cde6ba6c2 drm/xe: Change return type to void for xe_force_wake_put


