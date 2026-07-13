Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56345C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 23:15:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181FC10EB6A;
	Mon, 13 Jul 2026 23:15:18 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D7110EB6A;
 Mon, 13 Jul 2026 23:15:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pt=3A_Reset_prepar?=
 =?utf-8?q?e_state_in_xe=5Fpt=5Fupdate=5Fops=5Finit=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zongyao Bai" <zongyao.bai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Jul 2026 23:15:16 -0000
Message-ID: <178398451640.186082.9122141586091927384@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260713230830.2662760-1-zongyao.bai@intel.com>
In-Reply-To: <20260713230830.2662760-1-zongyao.bai@intel.com>
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

Series: drm/xe/pt: Reset prepare state in xe_pt_update_ops_init()
URL   : https://patchwork.freedesktop.org/series/170360/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3a3bfd40703f763f405b6f45691635da8d618dfc
Author: Zongyao Bai <zongyao.bai@intel.com>
Date:   Mon Jul 13 23:08:30 2026 +0000

    drm/xe/pt: Reset prepare state in xe_pt_update_ops_init()
    
    xe_pt_update_ops_init() resets the per-prepare address range and
    deferred state, but current_op was left unchanged. If the same
    xe_vm_pgtable_update_ops is prepared again, new operations are appended
    after the stale current_op value instead of starting from ops[0]. This
    can make current_op exceed the number of operations allocated by
    xe_vma_ops_alloc(), leading to out-of-bounds access to pt_update_ops->ops.
    So, reset current_op when initializing the PT update ops.
    
    Also reset needs_svm_lock and needs_invalidation. These flags are derived
    during the same prepare pass as current_op and are consumed by
    xe_pt_update_ops_run(); leaving them stale can select the SVM migrate ops
    or request TLB invalidation even when the current prepared operations do
    not require it.
    
    Assisted-by: GitHub-Copilot:claude-sonnet-4.6
    Signed-off-by: Bai, Zongyao <zongyao.bai@intel.com>
+ /mt/dim checkpatch 4df02bb6acd1307de4de001699112cbdaf5afdfc drm-intel
3a3bfd40703f drm/xe/pt: Reset prepare state in xe_pt_update_ops_init()
-:38: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: Zongyao Bai <zongyao.bai@intel.com>' != 'Signed-off-by: Bai, Zongyao <zongyao.bai@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 11 lines checked


