Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D5DC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 15:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F2310E08D;
	Thu,  7 Dec 2023 15:05:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 92DFB10E08D;
 Thu,  7 Dec 2023 15:05:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5C790AA3D8;
 Thu,  7 Dec 2023 15:05:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_Revert_=22FIXME=3A_drm/i915=3A_avoid_taking_the_uncore_lock?=
 =?utf-8?q?_for_xe=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Date: Thu, 07 Dec 2023 15:05:05 -0000
Message-ID: <170196150537.28721.14191564719497234597@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231207130106.1676807-1-luciano.coelho@intel.com>
In-Reply-To: <20231207130106.1676807-1-luciano.coelho@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [1/2] Revert "FIXME: drm/i915: avoid taking the uncore lock for xe"
URL   : https://patchwork.freedesktop.org/series/127494/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3d68b4e1f5ac03117f6c58c5c8770191d5a6cf52
Author: Luca Coelho <luciano.coelho@intel.com>
Date:   Thu Dec 7 15:01:06 2023 +0200

    drm/i915: handle uncore spinlock when not available
    
    The uncore code may not always be available (e.g. when we build the
    display code with Xe), so we can't always rely on having the uncore's
    spinlock.
    
    To handle this, split the spin_lock/unlock_irqsave/restore() into
    spin_lock/unlock() followed by a call to local_irq_save/restore() and
    create wrapper functions for locking and unlocking the uncore's
    spinlock.  In these functions, we have a condition check and only
    actually try to lock/unlock the spinlock when I915 is defined, and
    thus uncore is available.
    
    This keeps the ifdefs contained in these new functions and all such
    logic inside the display code.
    
    Cc: Tvrtko Ursulin <tvrto.ursulin@intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
    Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20231201100032.1367589-1-luciano.coelho@intel.com
    (cherry picked from commit dcdf1bbe82f4b2a301a3692a0b1942c3fda70644)
+ /mt/dim checkpatch 668d13abebbbc3812de86be1f8477475e1d90728 drm-intel
fa52906aa Revert "FIXME: drm/i915: avoid taking the uncore lock for xe"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '54cbd07bd1d15cb6c8d28375dce6d6b70df6d252', maybe rebased or not pulled?
#6: 
This reverts commit 54cbd07bd1d15cb6c8d28375dce6d6b70df6d252.

total: 0 errors, 1 warnings, 0 checks, 63 lines checked
3d68b4e1f drm/i915: handle uncore spinlock when not available


