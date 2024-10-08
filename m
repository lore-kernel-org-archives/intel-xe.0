Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1791DCED273
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 06:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCB010E474;
	Tue,  8 Oct 2024 06:59:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5FF10E474;
 Tue,  8 Oct 2024 06:59:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fix_xe=5Fforce=5Fwake=5Fg?=
 =?utf-8?q?et=28=29_failure_handling_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Oct 2024 06:59:03 -0000
Message-ID: <172837074358.1202117.4610889847440275011@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
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

Series: Fix xe_force_wake_get() failure handling (rev9)
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
commit 365f87541793b157087a13beb6bba1612bd5c030
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Tue Oct 8 12:41:15 2024 +0530

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
    Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>(#rev5)
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch fc6867c683c18ec3ac31682fd37d418d8a8ebde1 drm-intel
9f56af761827 drm/xe: Add member initialized_domains to xe_force_wake()
4ff304414484 drm/xe/forcewake: Change awake_domain datatype
fce974f5e0cc drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()
a2b8c044a55e drm/xe: Error handling in xe_force_wake_get()
8e3c3ce39037 drm/xe: Modify xe_force_wake_put to handle _get returned mask
e637129ea9b1 drm/xe/device: Update handling of xe_force_wake_get return
d43ee07e5970 drm/xe/hdcp: Update handling of xe_force_wake_get return
e382be2714c1 drm/xe/gsc: Update handling of xe_force_wake_get return
90ccb891a635 drm/xe/gt: Update handling of xe_force_wake_get return
4d0bf03e669c drm/xe/xe_gt_idle: Update handling of xe_force_wake_get return
e21f6428c549 drm/xe/devcoredump: Update handling of xe_force_wake_get return
ec753581c74d drm/xe/tests/mocs: Update xe_force_wake_get() return handling
73d39cc0a980 drm/xe/mocs: Update handling of xe_force_wake_get return
ee7d7142a7d9 drm/xe/xe_drm_client: Update handling of xe_force_wake_get return
4b42561e9b11 drm/xe/xe_gt_debugfs: Update handling of xe_force_wake_get return
1ffff82ebfef drm/xe/guc: Update handling of xe_force_wake_get return
d5a2d71a0ed7 drm/xe/huc: Update handling of xe_force_wake_get return
4ef509583b5c drm/xe/oa: Handle force_wake_get failure in xe_oa_stream_init()
268a660189a8 drm/xe/pat: Update handling of xe_force_wake_get return
f3ca0bd8049d drm/xe/gt_tlb_invalidation_ggtt: Update handling of xe_force_wake_get return
d6ca8a98213a drm/xe/xe_reg_sr: Update handling of xe_force_wake_get return
6edf980ccf3f drm/xe/query: Update handling of xe_force_wake_get return
abdc1cfa1437 drm/xe/vram: Update handling of xe_force_wake_get return
6f08244eca72 drm/xe: forcewake debugfs open fails on xe_forcewake_get failure
f34df599421e drm/xe: Ensure __must_check for xe_force_wake_get() return
365f87541793 drm/xe: Change return type to void for xe_force_wake_put


