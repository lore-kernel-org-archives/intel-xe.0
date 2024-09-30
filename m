Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2A3CF6497
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 06:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB39410E2CD;
	Mon, 30 Sep 2024 06:03:17 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5788E10E2CD;
 Mon, 30 Sep 2024 06:03:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fix_xe=5Fforce=5Fwake=5Fg?=
 =?utf-8?q?et=28=29_failure_handling_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Sep 2024 06:03:17 -0000
Message-ID: <172767619735.1133377.18078563435676278207@2413ebb6fbb6>
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

Series: Fix xe_force_wake_get() failure handling (rev6)
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
commit 1b8e7194f609fc8f87758b086b25338535ef3cde
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
+ /mt/dim checkpatch 1accf1380ac2afd6da0ebfd3a62971335fc9214b drm-intel
5dcec7ce9922 drm/xe: Add member initialized_domains to xe_force_wake()
d2c37854a7d7 drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()
dee8b2fa63c2 drm/xe: Error handling in xe_force_wake_get()
0efcbf2f27e0 drm/xe: Modify xe_force_wake_put to handle _get returned mask
5ecd49a731f4 drm/xe/device: Update handling of xe_force_wake_get return
42862ddc16af drm/xe/hdcp: Update handling of xe_force_wake_get return
909db6e1810b drm/xe/gsc: Update handling of xe_force_wake_get return
b4b942954867 drm/xe/gt: Update handling of xe_force_wake_get return
3f4ac9040fc7 drm/xe/xe_gt_idle: Update handling of xe_force_wake_get return
aad0564f4ce9 drm/xe/devcoredump: Update handling of xe_force_wake_get return
9b0493e1f778 drm/xe/tests/mocs: Update xe_force_wake_get() return handling
7b034bb10862 drm/xe/mocs: Update handling of xe_force_wake_get return
46d5292e8ee4 drm/xe/xe_drm_client: Update handling of xe_force_wake_get return
ecc736fbf1f2 drm/xe/xe_gt_debugfs: Update handling of xe_force_wake_get return
6d3a58a5fa7c drm/xe/guc: Update handling of xe_force_wake_get return
400c86b8f0e7 drm/xe/huc: Update handling of xe_force_wake_get return
1ebf1b967595 drm/xe/oa: Handle force_wake_get failure in xe_oa_stream_init()
22f0a9841e47 drm/xe/pat: Update handling of xe_force_wake_get return
790df3247711 drm/xe/gt_tlb_invalidation_ggtt: Update handling of xe_force_wake_get return
bc5ac1d22b82 drm/xe/xe_reg_sr: Update handling of xe_force_wake_get return
1cdf3fd7f398 drm/xe/query: Update handling of xe_force_wake_get return
bc1eeea44b4c drm/xe/vram: Update handling of xe_force_wake_get return
72ef34ec253e drm/xe: forcewake debugfs open fails on xe_forcewake_get failure
473efe438935 drm/xe: Ensure __must_check for xe_force_wake_get() return
1b8e7194f609 drm/xe: Change return type to void for xe_force_wake_put


