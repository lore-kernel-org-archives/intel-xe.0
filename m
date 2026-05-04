Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BD9CD342F
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 22:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519B310E8B7;
	Mon,  4 May 2026 22:32:02 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6B710E8B8;
 Mon,  4 May 2026 22:32:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_add_display_i?=
 =?utf-8?q?rq_hooks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 May 2026 22:32:00 -0000
Message-ID: <177793392090.37015.16306901163150749234@5ab824fced77>
X-Patchwork-Hint: ignore
References: <cover.1777933454.git.jani.nikula@intel.com>
In-Reply-To: <cover.1777933454.git.jani.nikula@intel.com>
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

Series: drm/i915: add display irq hooks
URL   : https://patchwork.freedesktop.org/series/165936/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 42b79ec08acaabb8e258edcdb571599694dea2eb
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue May 5 01:26:13 2026 +0300

    drm/i915/irq: add intel_display_irq_handler() to irq funcs
    
    Call the platform specific display irq handler hooks via
    intel_display_irq_handler(). Add master_ctl to struct
    intel_display_irq_state, and pass the state pointer to the handler where
    necessary.
    
    v2: Rebase, handle LPE audio in ack (Ville)
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 5521e3e7a175fef7d7a35a4b8fd17ca473be8e7e drm-intel
7b761176fc8b drm/i915/irq: deduplicate dg1_de_irq_postinstall() and gen11_de_irq_postinstall()
cf68dfb97458 drm/i915/irq: constify pipe stats parameters
-:53: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#53: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:81:
+void i915_pipestat_irq_handler(struct intel_display *display, u32 iir, const u32 pipe_stats[I915_MAX_PIPES]);

-:54: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#54: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:82:
+void i965_pipestat_irq_handler(struct intel_display *display, u32 iir, const u32 pipe_stats[I915_MAX_PIPES]);

-:55: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#55: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:83:
+void valleyview_pipestat_irq_handler(struct intel_display *display, const u32 pipe_stats[I915_MAX_PIPES]);

total: 0 errors, 3 warnings, 0 checks, 36 lines checked
dea19583b863 drm/i915/irq: add display irq funcs, start with intel_display_irq_reset()
8f71ec7cb5c1 drm/i915/irq: add intel_display_irq_postinstall() to irq funcs
514c1a0515a2 drm/i915/irq: add intel_display_irq_ack() to irq funcs
42b79ec08aca drm/i915/irq: add intel_display_irq_handler() to irq funcs
-:253: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#253: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:70:
+bool intel_display_irq_handler(struct intel_display *display, const struct intel_display_irq_state *state);

total: 0 errors, 1 warnings, 0 checks, 332 lines checked


