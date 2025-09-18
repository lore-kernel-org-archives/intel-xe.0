Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82356CAC5A0
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 13:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426BD10E8CB;
	Thu, 18 Sep 2025 13:36:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CABD10E8C3;
 Thu, 18 Sep 2025 13:36:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/irq=3A_clarify_a?=
 =?utf-8?q?nd_refactor_-=3Eirq=5Fmask_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Sep 2025 13:36:07 -0000
Message-ID: <175820256763.344321.2911072186334420878@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1758198300.git.jani.nikula@intel.com>
In-Reply-To: <cover.1758198300.git.jani.nikula@intel.com>
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

Series: drm/i915/irq: clarify and refactor ->irq_mask (rev2)
URL   : https://patchwork.freedesktop.org/series/154698/
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
commit 0d7ee11329adc473e3e68402cc204c74e239e28e
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Sep 18 15:41:24 2025 +0300

    drm/i915/irq: add ilk_display_irq_reset()
    
    Abstract ilk_display_irq_reset(), moving display related reset
    there. This results in a slightly different order for the reset,
    hopefully with no impact.
    
    v2: Also move GEN7_ERR_INT (Ville)
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 31f149f6d10616688087056856c29390e28d7e44 drm-intel
47c167c60f0c drm/i915/irq: use a dedicated IMR cache for VLV/CHV
5f5f151194fd drm/i915/irq: use a dedicated IMR cache for gen 5-7
3ed305b57312 drm/i915/irq: rename irq_mask to gen2_imr_mask
4aa3b48cd49a drm/i915/irq: rename de_irq_mask[] to de_pipe_imr_mask[]
-:46: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#46: FILE: drivers/gpu/drm/i915/display/intel_display_irq.c:224:
+		intel_de_write(display, GEN8_DE_PIPE_IMR(pipe), display->irq.de_pipe_imr_mask[pipe]);

total: 0 errors, 1 warnings, 0 checks, 53 lines checked
0d7ee11329ad drm/i915/irq: add ilk_display_irq_reset()


