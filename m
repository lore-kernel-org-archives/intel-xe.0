Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A60D2F7EE
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 05:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDCC10E1C2;
	Thu, 17 Oct 2024 05:40:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ABC10E1C2;
 Thu, 17 Oct 2024 05:40:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_xe=5Fforce=5Fwake=5Fg?=
 =?utf-8?q?et=28=29_failure_handling_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Oct 2024 05:40:51 -0000
Message-ID: <172914365101.1276968.13327329886427316815@2413ebb6fbb6>
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

Series: Fix xe_force_wake_get() failure handling (rev11)
URL   : https://patchwork.freedesktop.org/series/137982/
State : warning

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
commit 96ab87fcd5ffee209dfd6297990ad06157d84d96
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
    Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 87312f4bbb70018f831a8ef565db9cdc37b4da67 drm-intel
f7c953f5f2ad drm/xe: Add member initialized_domains to xe_force_wake()
59ef04a8b431 drm/xe/forcewake: Change awake_domain datatype
9e02d10fc381 drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()
f2fcdd090c2d drm/xe: Error handling in xe_force_wake_get()
faa9d4e21cd9 drm/xe: Modify xe_force_wake_put to handle _get returned mask
b6d7dbeb1b7c drm/xe/device: Update handling of xe_force_wake_get return
9ea956a89534 drm/xe/hdcp: Update handling of xe_force_wake_get return
f9d08094bc24 drm/xe/gsc: Update handling of xe_force_wake_get return
24db2c7f9a57 drm/xe/gt: Update handling of xe_force_wake_get return
195244363cfd drm/xe/xe_gt_idle: Update handling of xe_force_wake_get return
dff773139a22 drm/xe/devcoredump: Update handling of xe_force_wake_get return
45312d98188f drm/xe/tests/mocs: Update xe_force_wake_get() return handling
fe310481e0ee drm/xe/mocs: Update handling of xe_force_wake_get return
6faf7f6dac76 drm/xe/xe_drm_client: Update handling of xe_force_wake_get return
055a1e7f42c5 drm/xe/xe_gt_debugfs: Update handling of xe_force_wake_get return
b0a026cbcec2 drm/xe/guc: Update handling of xe_force_wake_get return
4466e4abd4d7 drm/xe/huc: Update handling of xe_force_wake_get return
-:28: WARNING:BAD_SIGN_OFF: Duplicate signature
#28: 
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

total: 0 errors, 1 warnings, 0 checks, 23 lines checked
e24049e6a98f drm/xe/oa: Handle force_wake_get failure in xe_oa_stream_init()
9f0016425cfc drm/xe/pat: Update handling of xe_force_wake_get return
8c05d7b87236 drm/xe/gt_tlb_invalidation_ggtt: Update handling of xe_force_wake_get return
17481179fe81 drm/xe/xe_reg_sr: Update handling of xe_force_wake_get return
33a16d3aa04b drm/xe/query: Update handling of xe_force_wake_get return
de071cee9056 drm/xe/vram: Update handling of xe_force_wake_get return
2cb8c0dce8f4 drm/xe: forcewake debugfs open fails on xe_forcewake_get failure
f2017522c5fb drm/xe: Ensure __must_check for xe_force_wake_get() return
96ab87fcd5ff drm/xe: Change return type to void for xe_force_wake_put


