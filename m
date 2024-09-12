Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A667EEB59D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 19:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E3610EAD4;
	Thu, 12 Sep 2024 19:24:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC4010EAD4;
 Thu, 12 Sep 2024 19:24:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fix_xe=5Fforce=5Fwake=5Fg?=
 =?utf-8?q?et=28=29_failure_handling_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Sep 2024 19:24:48 -0000
Message-ID: <172616908824.993418.12223052277526610800@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
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

Series: Fix xe_force_wake_get() failure handling (rev2)
URL   : https://patchwork.freedesktop.org/series/137982/
State : success

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
commit fd1d4bfb0f9d0ec50c5090d647cbb4157d2484ed
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Fri Sep 13 00:46:03 2024 +0530

    drm/xe: Change return type to void for xe_force_wake_put
    
    In case of xe_force_wake_put failure caller just calls XE_WARN_ON
    and continues. Move XE_WARN_ON inside the xe_force_wake_put() and return
    void.
    
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 9fd27ed0883cff53777b8db0b7c6db327132dcdc drm-intel
371bc46c07da drm/xe: Error handling in xe_force_wake_get()
ea23cef4c1c6 drm/xe: Modify xe_force_wake_put to handle _get returned mask
00ecc12dbf9c drm/xe/device: Update handling of xe_force_wake_get return
a64b36d1e9df drm/xe/hdcp: Update handling of xe_force_wake_get return
e4e869fa3078 drm/xe/gsc: Update handling of xe_force_wake_get return
0d31a7d7d838 drm/xe/gt: Update handling of xe_force_wake_get return
d82df880439a drm/xe/xe_gt_idle: Update handling of xe_force_wake_get return
df0377f07ffc drm/xe/devcoredump: Update handling of xe_force_wake_get return
8f7fe7f81b46 drm/xe/tests/mocs: Update xe_force_wake_get() return handling
00cce24f3f56 drm/xe/mocs: Update handling of xe_force_wake_get return
332c2794525b drm/xe/xe_drm_client: Update handling of xe_force_wake_get return
807cabddf4d7 drm/xe/xe_gt_debugfs: Update handling of xe_force_wake_get return
72eb752b1d0b drm/xe/guc: Update handling of xe_force_wake_get return
d1e03013faa9 drm/xe/huc: Update handling of xe_force_wake_get return
7e544d1b6ce7 drm/xe/oa: Handle force_wake_get failure in xe_oa_stream_init()
f25893f0b465 drm/xe/pat: Update handling of xe_force_wake_get return
7d3dd424a1ac drm/xe/gt_tlb_invalidation_ggtt: Update handling of xe_force_wake_get return
d42bc2771516 drm/xe/xe_reg_sr: Update handling of xe_force_wake_get return
a75cfc6879c9 drm/xe/query: Update handling of xe_force_wake_get return
16d611d168ae drm/xe/vram: Update handling of xe_force_wake_get return
9f22b16b40d4 drm/xe: forcewake debugfs open fails on xe_forcewake_get failure
62502b32aec3 drm/xe: Ensure __must_check for xe_force_wake_get() return
fd1d4bfb0f9d drm/xe: Change return type to void for xe_force_wake_put


