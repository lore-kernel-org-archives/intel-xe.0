Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A482CD54A9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 10:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B3F10E363;
	Tue, 19 Sep 2023 10:06:10 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E463910E363;
 Tue, 19 Sep 2023 10:06:08 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E1398A0169;
 Tue, 19 Sep 2023 10:06:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Date: Tue, 19 Sep 2023 10:06:08 -0000
Message-ID: <169511796892.3666.16172068451715701788@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230919094737.743358-1-luciano.coelho@intel.com>
In-Reply-To: <20230919094737.743358-1-luciano.coelho@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_So?=
 =?utf-8?q?me_changes_for_Xe_in_spinlock_handling_in_i915/display?=
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

Series: Some changes for Xe in spinlock handling in i915/display
URL   : https://patchwork.freedesktop.org/series/123899/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 25fc1d79c60cb80074969c192d2fdd1e3321f249
Author: Luca Coelho <luciano.coelho@intel.com>
Date:   Tue Sep 19 12:47:37 2023 +0300

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
    
    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
+ /mt/dim checkpatch 3d7e02fb9c40263a989c4c19d2dc5a07659965ed drm-intel
4e14993f4 Revert "FIXME: drm/i915/crtc: use irqsave for locking event_lock"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '0aff77c2fbd20da430763bdb25db5eaa6245650a', maybe rebased or not pulled?
#7: 
This reverts commit 0aff77c2fbd20da430763bdb25db5eaa6245650a.

total: 0 errors, 1 warnings, 0 checks, 17 lines checked
25fc1d79c drm/i915: handle uncore spinlock when not available


