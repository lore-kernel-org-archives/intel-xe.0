Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FD2C0015E
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 20:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC5F10E1A8;
	Tue, 25 Jul 2023 20:20:33 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 896D710E1A8;
 Tue, 25 Jul 2023 20:20:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 83476AADD6;
 Tue, 25 Jul 2023 20:20:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Tue, 25 Jul 2023 20:20:32 -0000
Message-ID: <169031643253.27664.596601559327438702@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230719192726.172056-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230719192726.172056-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Fix_an_invalid_locking_wait_context_bug_=28rev2=29?=
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

Series: drm/xe: Fix an invalid locking wait context bug (rev2)
URL   : https://patchwork.freedesktop.org/series/121003/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3daa9e7f075e90f75db359e8c2e42e9c716735e4
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Tue Jul 25 16:17:58 2023 -0400

    drm/xe: Fix an invalid locking wait context bug
    
    We cannot have spin locks around xe_irq_reset, since it will
    call the intel_display_power_is_enabled() function, and
    that needs a mutex lock. Hence causing the undesired
    "[ BUG: Invalid wait context ]"
    
    We cannot convert i915's power domain lock to spin lock
    due to the nested dependency of non-atomic context waits.
    
    So, let's move the xe_irq_reset functions from the
    critical area, while still ensuring that we are protecting
    the irq.enabled and ensuring the right serialization
    in the irq handlers.
    
    v2: On the first version, I had missed the fact that
    irq.enabled is checked on the xe/display glue layer,
    and that i915 display code is actually using the irq
    spin lock properly. So, this got changed to a version
    suggested by Matthew Auld, along with introducing
    the lockdep_assert_held at the display glue code.
    
    Suggested-by: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 1dd467ce41537f09a7d0aa6b506502adeada8b17 drm-intel
3daa9e7f0 drm/xe: Fix an invalid locking wait context bug


