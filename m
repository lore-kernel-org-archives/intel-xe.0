Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846FDCCFA10
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 01:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5022010E04A;
	Thu, 26 Sep 2024 01:04:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FF010E04A;
 Thu, 26 Sep 2024 01:04:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fix_xe=5Fforce=5Fwake=5Fg?=
 =?utf-8?q?et=28=29_failure_handling_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 01:04:22 -0000
Message-ID: <172731266294.1103576.17079566700345606600@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
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

Series: Fix xe_force_wake_get() failure handling (rev5)
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
commit 9ab09c18bb7258069f77ee4b31b2f40ae3c3be69
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Tue Sep 24 17:46:41 2024 +0530

    drm/xe: Change return type to void for xe_force_wake_put
    
    There is no need to return an error from xe_force_wake_put(), as a
    failure implicitly indicates that the domain failed to sleep.
    
    v3
    - Move kernel-doc to this patch (Badal)
    
    v5
    - change parameter to unsigned int in xe_force_wake_put()
    
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 88d592f72f7bc508d6a027b1f96aa2e53f803e1b drm-intel
a77b885b893c drm/xe: Error handling in xe_force_wake_get()
3ed9e597ff05 drm/xe: Modify xe_force_wake_put to handle _get returned mask
c9ece6d6acc7 drm/xe/device: Update handling of xe_force_wake_get return
5e66322bb536 drm/xe/hdcp: Update handling of xe_force_wake_get return
3eef38a8a365 drm/xe/gsc: Update handling of xe_force_wake_get return
f6fe90b64ce2 drm/xe/gt: Update handling of xe_force_wake_get return
3acbdf2022df drm/xe/xe_gt_idle: Update handling of xe_force_wake_get return
3ecd8f39dffb drm/xe/devcoredump: Update handling of xe_force_wake_get return
b62afb2dff1a drm/xe/tests/mocs: Update xe_force_wake_get() return handling
4e11ba3fc938 drm/xe/mocs: Update handling of xe_force_wake_get return
ea8ada53209b drm/xe/xe_drm_client: Update handling of xe_force_wake_get return
e19f5021ce15 drm/xe/xe_gt_debugfs: Update handling of xe_force_wake_get return
914e4b07d8ab drm/xe/guc: Update handling of xe_force_wake_get return
b006ac0f50ae drm/xe/huc: Update handling of xe_force_wake_get return
d80a41d00eac drm/xe/oa: Handle force_wake_get failure in xe_oa_stream_init()
219ad0a214b8 drm/xe/pat: Update handling of xe_force_wake_get return
7daad5ddacd7 drm/xe/gt_tlb_invalidation_ggtt: Update handling of xe_force_wake_get return
12a83e9840d8 drm/xe/xe_reg_sr: Update handling of xe_force_wake_get return
e63c7a848b03 drm/xe/query: Update handling of xe_force_wake_get return
3c236042aaa2 drm/xe/vram: Update handling of xe_force_wake_get return
c47bd90293d1 drm/xe: forcewake debugfs open fails on xe_forcewake_get failure
a0225b99fec9 drm/xe: Ensure __must_check for xe_force_wake_get() return
9ab09c18bb72 drm/xe: Change return type to void for xe_force_wake_put


