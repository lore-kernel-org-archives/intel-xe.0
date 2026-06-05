Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08974CD6E5D
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 11:34:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FDB10E609;
	Fri,  5 Jun 2026 11:34:29 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCA610E609;
 Fri,  5 Jun 2026 11:34:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_use-after-f?=
 =?utf-8?q?ree_race_in_xe=5Fpt=5Fzap=5Fptes_and_xe=5Fpt=5Fzap=5Fptes=5Frange?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Jun 2026 11:34:28 -0000
Message-ID: <178065926896.47432.9305120202755286933@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260605105202.1664464-1-francois.dugast@intel.com>
In-Reply-To: <20260605105202.1664464-1-francois.dugast@intel.com>
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

Series: drm/xe: Fix use-after-free race in xe_pt_zap_ptes and xe_pt_zap_ptes_range
URL   : https://patchwork.freedesktop.org/series/167948/
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
commit 9bc0e55447e48f377fc9047c817e698855b6adb1
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Fri Jun 5 12:52:02 2026 +0200

    drm/xe: Fix use-after-free race in xe_pt_zap_ptes and xe_pt_zap_ptes_range
    
    xe_pt_zap_ptes() and xe_pt_zap_ptes_range() walk the page-table tree
    holding only the BO reservation or SVM notifier_lock respectively.
    Concurrently, xe_pt_update_ops_run() (vm->lock write) calls xe_pt_commit()
    which swaps children[] pointers and immediately frees the replaced xe_pt
    via xe_pt_destroy().  xe_vm_pt_destroy() has the same exposure during VM
    teardown.  Either path can produce a use-after-free when a concurrent walk
    dereferences a just-freed node. Fix by introducing a per-VM rw_semaphore
    pt_lock.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
    Assisted-by: GitHub Copilot:claude-sonnet-4.6
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch fe3f27ecb39e8357b0af59cfe9402fd5cc0c07b1 drm-intel
9bc0e55447e4 drm/xe: Fix use-after-free race in xe_pt_zap_ptes and xe_pt_zap_ptes_range
-:19: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#19: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 0 errors, 1 warnings, 0 checks, 141 lines checked


