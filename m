Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC15CD37AC
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 16:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4847510EF7E;
	Wed, 13 May 2026 16:39:56 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C18E10EF71;
 Wed, 13 May 2026 16:39:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_add_display_i?=
 =?utf-8?q?rq_hooks_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 May 2026 16:39:55 -0000
Message-ID: <177869039563.68993.9973215222125830135@5ab824fced77>
X-Patchwork-Hint: ignore
References: <cover.1778688699.git.jani.nikula@intel.com>
In-Reply-To: <cover.1778688699.git.jani.nikula@intel.com>
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

Series: drm/i915: add display irq hooks (rev3)
URL   : https://patchwork.freedesktop.org/series/165936/
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
commit 08cac07cafff393a95c8e5bbdea9a10a05dcfc71
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed May 13 19:13:31 2026 +0300

    drm/i915/irq: add intel_display_irq_handler() to irq funcs
    
    Call the platform specific display irq handler hooks via
    intel_display_irq_handler().
    
    v3: Pure vfunc change (Ville)
    
    v2: Rebase, handle LPE audio in ack (Ville)
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 21b42374be17d486baf9392b56377afde67a778d drm-intel
0d73ccdb90fd drm/i915/irq: deduplicate dg1_de_irq_postinstall() and gen11_de_irq_postinstall()
893bc59c4e01 drm/i915/irq: constify pipe stats parameters
-:57: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#57: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:81:
+void i915_pipestat_irq_handler(struct intel_display *display, u32 iir, const u32 pipe_stats[I915_MAX_PIPES]);

-:58: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#58: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:82:
+void i965_pipestat_irq_handler(struct intel_display *display, u32 iir, const u32 pipe_stats[I915_MAX_PIPES]);

-:59: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#59: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:83:
+void valleyview_pipestat_irq_handler(struct intel_display *display, const u32 pipe_stats[I915_MAX_PIPES]);

total: 0 errors, 3 warnings, 0 checks, 36 lines checked
f3f1da9d7759 drm/i915/irq: add display irq funcs, start with intel_display_irq_reset()
438f34ca2c9a drm/i915/irq: add intel_display_irq_postinstall() to irq funcs
42663327fd75 drm/i915/irq: add platform specific display irq ack functions
0fc8ef8bcae2 drm/i915/irq: add platform specific display irq handler functions
-:192: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#192: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:73:
+bool ilk_display_irq_handler(struct intel_display *display, const struct intel_display_irq_state *state);

-:193: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#193: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:74:
+bool gen8_display_irq_handler(struct intel_display *display, const struct intel_display_irq_state *state);

-:194: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#194: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:75:
+bool gen11_display_irq_handler(struct intel_display *display, const struct intel_display_irq_state *state);

-:195: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#195: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:76:
+bool i965_display_irq_handler(struct intel_display *display, const struct intel_display_irq_state *state);

-:196: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#196: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:77:
+bool i915_display_irq_handler(struct intel_display *display, const struct intel_display_irq_state *state);

-:197: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#197: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:78:
+bool vlv_display_irq_handler(struct intel_display *display, const struct intel_display_irq_state *state);

total: 0 errors, 6 warnings, 0 checks, 277 lines checked
976efead2eb1 drm/i915/irq: add intel_display_irq_ack() to irq funcs
08cac07cafff drm/i915/irq: add intel_display_irq_handler() to irq funcs
-:163: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#163: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:70:
+bool intel_display_irq_handler(struct intel_display *display, const struct intel_display_irq_state *state);

total: 0 errors, 1 warnings, 0 checks, 207 lines checked


