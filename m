Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323A0C369A2
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 21:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D948E10E0BA;
	Fri, 11 Apr 2025 21:04:02 +0000 (UTC)
Received: from 32c37dd7f93d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5F610E0A0;
 Fri, 11 Apr 2025 21:04:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pf=3A_Don=27t_show?=
 =?utf-8?q?_GGTT/LMEM_debugfs_files_under_media_GT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Apr 2025 21:04:01 -0000
Message-ID: <174440544169.6170.10363382236559180093@32c37dd7f93d>
X-Patchwork-Hint: ignore
References: <20250411193030.1865-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250411193030.1865-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Don't show GGTT/LMEM debugfs files under media GT
URL   : https://patchwork.freedesktop.org/series/147612/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d9bb67653118e62b06116fad4c0f93b9e6971f66
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Apr 11 21:30:30 2025 +0200

    drm/xe/pf: Don't show GGTT/LMEM debugfs files under media GT
    
    Most of the PF's debugfs files (and their implementations) are
    based on the GT hierarchy even if files are related to GGTT or
    LMEM data, that are related to the tile.
    
    While we could reach the tile data from any GT, to avoid potential
    misuse, some functions allow to be used on the primary GT only,
    and may use asserts to enforce that.
    
    In our case, the following assert could be seen when reading the
    /sys/kernel/debug/dri/0000:00:02.0/gt1/pf/ggtt_available
    
     [ ] xe 0000:00:02.0: [drm] Assertion `!xe_gt_is_media_type(gt)` failed!
     [ ] WARNING: CPU: 4 PID: 10609 at drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:379 pf_get_spare_ggtt+0x256/0x4e0 [xe]
     [ ] RIP: 0010:pf_get_spare_ggtt+0x256/0x4e0 [xe]
     [ ] Call Trace:
     [ ]  <TASK>
     [ ]  xe_gt_sriov_pf_config_print_available_ggtt+0xb7/0x480 [xe]
     [ ]  ? __memcg_slab_post_alloc_hook+0x12f/0x3f0
     [ ]  xe_gt_debugfs_simple_show+0x7b/0xb0 [xe]
     [ ]  ? __pfx___drm_printfn_seq_file+0x10/0x10
     [ ]  ? __pfx___drm_puts_seq_file+0x10/0x10
     [ ]  seq_read_iter+0x139/0x4e0
     [ ]  seq_read+0x11d/0x160
     [ ]  full_proxy_read+0x6b/0xb0
     [ ]  vfs_read+0xfa/0x390
    
    Fix that by moving GGTT/LMEM debugfs attributes to separate lists
    and register them only when applicable (on primary GT, on DGFX).
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 95956f65403ec2f6784fca383eecbb54431ddebc drm-intel
d9bb67653118 drm/xe/pf: Don't show GGTT/LMEM debugfs files under media GT
-:18: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#18: 
 [ ] WARNING: CPU: 4 PID: 10609 at drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:379 pf_get_spare_ggtt+0x256/0x4e0 [xe]

-:142: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 98 lines checked


