Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E31CAC592
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 09:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFF610E976;
	Fri, 19 Sep 2025 09:58:34 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43FC10E976;
 Fri, 19 Sep 2025 09:58:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/irq=3A_display_i?=
 =?utf-8?q?rq_refactoring?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Sep 2025 09:58:32 -0000
Message-ID: <175827591292.348078.6382962081408696993@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1758275448.git.jani.nikula@intel.com>
In-Reply-To: <cover.1758275448.git.jani.nikula@intel.com>
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

Series: drm/i915/irq: display irq refactoring
URL   : https://patchwork.freedesktop.org/series/154763/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 791ecc91ac91f04d2f496cd1b4a472825985160e
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Sep 19 12:51:49 2025 +0300

    drm/i915/irq: split ILK display irq handling
    
    Split out display irq handling on ilk. Since the master IRQ enable is in
    DEIIR, we'll need to do this in two parts. First, add
    ilk_display_irq_master_disable() to disable master and south interrupts,
    and second, add (repurposed) ilk_display_irq_handler() to finish display
    irq handling.
    
    It's not the prettiest thing you ever saw, but improves separation of
    display irq handling. And removes HAS_PCH_NOP() and DISPLAY_VER() checks
    from core irq code.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 6fecb015b85391be65d1048561fa8da2f1096fee drm-intel
397aade20ba0 drm/i915/irq: drop intel_psr_regs.h include
3783a1197818 drm/i915/irq: initialize gen2_imr_mask in terms of enable_mask
6ba5888923b4 drm/i915/irq: abstract i9xx_display_irq_enable_mask()
8f2adc6fea77 drm/i915/irq: move check for HAS_HOTPLUG() inside i9xx_hpd_irq_ack()
36c72f582b52 drm/i915/irq: change ILK irq handling order
-:22: WARNING:LINE_SPACING: Missing a blank line after declarations
#22: FILE: drivers/gpu/drm/i915/i915_irq.c:454:
+		u32 pm_iir = raw_reg_read(regs, GEN6_PMIIR);
+		if (pm_iir) {

total: 0 errors, 1 warnings, 0 checks, 30 lines checked
791ecc91ac91 drm/i915/irq: split ILK display irq handling


