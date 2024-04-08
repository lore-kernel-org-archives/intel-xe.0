Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E414DCD1292
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 19:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E57010F1B6;
	Mon,  8 Apr 2024 19:18:27 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD68910F1B6;
 Mon,  8 Apr 2024 19:18:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_drm=5Fi915=5F?=
 =?utf-8?q?private_and_xe=5Fdevice_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Apr 2024 19:18:25 -0000
Message-ID: <171260390577.1286971.16916890870905698252@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1712599670.git.jani.nikula@intel.com>
In-Reply-To: <cover.1712599670.git.jani.nikula@intel.com>
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

Series: drm/i915: drm_i915_private and xe_device cleanups
URL   : https://patchwork.freedesktop.org/series/132174/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit af72963b81c78a21f8f18bf8553e3c1ad2f2bb08
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Apr 8 21:08:43 2024 +0300

    drm/xe/display: remove unused xe->enabled_irq_mask
    
    The xe->enabled_irq_mask member has never been used for anything.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 0c3980f55f037f9aacb929c5cb603445e0597070 drm-intel
de0fdb13a9d5 drm/i915/gt: drop display clock info from gt debugfs
bb8da0f4576b drm/i915: move skl_preferred_vco_freq to display substruct
1f800425729f drm/i915: move max_dotclk_freq to display substruct
a0d9bdd06b76 drm/i915: move vblank_enabled to display substruct
-:47: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#47: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1215:
+		intel_uncore_write(&i915->uncore, SCPD0, _MASKED_BIT_ENABLE(CSTATE_RENDER_CLOCK_GATE_DISABLE));

-:63: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#63: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:1323:
+		intel_uncore_write(&i915->uncore, SCPD0, _MASKED_BIT_DISABLE(CSTATE_RENDER_CLOCK_GATE_DISABLE));

total: 0 errors, 2 warnings, 0 checks, 60 lines checked
ece9c4287516 drm/i915: move display_irqs_enabled to display substruct
82119ddc8201 drm/i915: move de_irq_mask to display substruct
32b193f8f39f drm/i915: move pipestat_irq_mask to display substruct
af72963b81c7 drm/xe/display: remove unused xe->enabled_irq_mask


