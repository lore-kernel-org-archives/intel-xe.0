Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD87FD88CB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 22:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71F010E0C9;
	Tue, 10 Mar 2026 22:56:44 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794AA10E0C9;
 Tue, 10 Mar 2026 22:56:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Attempt_to_fixup_reset=2C?=
 =?utf-8?q?_wedge=2C_unload_corner_cases?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Mar 2026 22:56:43 -0000
Message-ID: <177318340347.341309.13578434516797130742@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260310225039.1320161-1-zhanjun.dong@intel.com>
In-Reply-To: <20260310225039.1320161-1-zhanjun.dong@intel.com>
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

Series: Attempt to fixup reset, wedge, unload corner cases
URL   : https://patchwork.freedesktop.org/series/162978/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a4cb1482d011d0a0c780d3b4ea40b6281dd168d3
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Mar 10 18:50:39 2026 -0400

    drm/xe: Open-code GGTT MMIO access protection
    
    GGTT MMIO access is currently protected by hotplug (drm_dev_enter),
    which works correctly when the driver loads successfully and is later
    unbound or unloaded. However, if driver load fails, this protection is
    insufficient because drm_dev_unplug() is never called.
    
    Additionally, devm release functions cannot guarantee that all BOs with
    GGTT mappings are destroyed before the GGTT MMIO region is removed, as
    some BOs may be freed asynchronously by worker threads.
    
    To address this, introduce an open-coded flag, protected by the GGTT
    lock, that guards GGTT MMIO access. The flag is cleared during the
    dev_fini_ggtt devm release function to ensure MMIO access is disabled
    once teardown begins.
    
    Cc: stable@vger.kernel.org
    Fixes: 919bb54e989c ("drm/xe: Fix missing runtime outer protection for ggtt_remove_node")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch ab86ea7989502faeabd9bceb2264d8dbfed6e8ce drm-intel
83fc7876f7a9 drm/xe: Always kill exec queues in xe_guc_submit_pause_abort
-:29: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Matthew Brost <matthew.brost@intel.com>'

total: 1 errors, 0 warnings, 0 checks, 9 lines checked
ea9cfa7863da drm/xe: Forcefully tear down exec queues in GuC submit fini
-:187: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Zhanjun Dong <zhanjun.dong@intel.com>'

total: 1 errors, 0 warnings, 0 checks, 147 lines checked
c59557250fa2 drm/xe: Trigger queue cleanup if not in wedged mode 2
-:68: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Zhanjun Dong <zhanjun.dong@intel.com>'

total: 1 errors, 0 warnings, 0 checks, 48 lines checked
bf17f756c55e drm/xe: Use XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET enum instead of magic number
e7ecb98c4970 drm/xe/guc: Ensure CT state transitions via STOP before DISABLED
b4afb246ba6c drm/xe/uc: Drop xe_guc_sanitize in favor of managed cleanup
a4cb1482d011 drm/xe: Open-code GGTT MMIO access protection


