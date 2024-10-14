Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB4ACFC500
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 07:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF20E10E3AE;
	Mon, 14 Oct 2024 07:44:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3E710E3AE;
 Mon, 14 Oct 2024 07:44:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fix_xe=5Fforce=5Fwake=5Fg?=
 =?utf-8?q?et=28=29_failure_handling_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Oct 2024 07:44:50 -0000
Message-ID: <172889189096.1246660.3962682265511170306@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
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

Series: Fix xe_force_wake_get() failure handling (rev10)
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
commit 0fdd85bbb3353dfe0c8fcdcb38cc083fe5fd673f
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Mon Oct 14 13:26:01 2024 +0530

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
    
    v8
    - Fix kernel-doc
    
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 5e5de1c8d013445c36efd4434d679ea277553754 drm-intel
baa231b5dd29 drm/xe: Add member initialized_domains to xe_force_wake()
26b81e846517 drm/xe/forcewake: Change awake_domain datatype
9c48178bd22a drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()
8cd55343ff49 drm/xe: Error handling in xe_force_wake_get()
5a326a95f260 drm/xe: Modify xe_force_wake_put to handle _get returned mask
3d389f460b22 drm/xe/device: Update handling of xe_force_wake_get return
68c6a71b3a01 drm/xe/hdcp: Update handling of xe_force_wake_get return
9ae4201ec112 drm/xe/gsc: Update handling of xe_force_wake_get return
e1259552a96d drm/xe/gt: Update handling of xe_force_wake_get return
fafe336d3614 drm/xe/xe_gt_idle: Update handling of xe_force_wake_get return
61360254fc37 drm/xe/devcoredump: Update handling of xe_force_wake_get return
c208b6126124 drm/xe/tests/mocs: Update xe_force_wake_get() return handling
2f0f534b6c75 drm/xe/mocs: Update handling of xe_force_wake_get return
6e05f3a411be drm/xe/xe_drm_client: Update handling of xe_force_wake_get return
6898e9a10bca drm/xe/xe_gt_debugfs: Update handling of xe_force_wake_get return
d0099dacc3bb drm/xe/guc: Update handling of xe_force_wake_get return
476374097acb drm/xe/huc: Update handling of xe_force_wake_get return
4482be5c6577 drm/xe/oa: Handle force_wake_get failure in xe_oa_stream_init()
9544c593493f drm/xe/pat: Update handling of xe_force_wake_get return
ee2c2ff86212 drm/xe/gt_tlb_invalidation_ggtt: Update handling of xe_force_wake_get return
0a92a54bdda0 drm/xe/xe_reg_sr: Update handling of xe_force_wake_get return
70cbab2aec3a drm/xe/query: Update handling of xe_force_wake_get return
f5df564b7922 drm/xe/vram: Update handling of xe_force_wake_get return
061cfe15004a drm/xe: forcewake debugfs open fails on xe_forcewake_get failure
9ca739e083b4 drm/xe: Ensure __must_check for xe_force_wake_get() return
0fdd85bbb335 drm/xe: Change return type to void for xe_force_wake_put


