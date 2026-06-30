Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED33C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 11:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72FF10E164;
	Tue, 30 Jun 2026 11:24:53 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B2910E164;
 Tue, 30 Jun 2026 11:24:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_add_disable?=
 =?utf-8?q?=5Fedp_module_parameter_to_skip_phantom_eDP_init?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: mei.fan.liou@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Jun 2026 11:24:52 -0000
Message-ID: <178281869248.133065.6984996580836252705@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260630102845.2678707-1-mei.fan.liou@intel.com>
In-Reply-To: <20260630102845.2678707-1-mei.fan.liou@intel.com>
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

Series: drm/i915: add disable_edp module parameter to skip phantom eDP init
URL   : https://patchwork.freedesktop.org/series/169500/
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
commit 5843f6cf4eb5a8ea4f438435b350a4b162504405
Author: LIOU, Mei Fan <mei.fan.liou@intel.com>
Date:   Tue Jun 30 03:28:45 2026 -0700

    drm/i915: add disable_edp module parameter to skip phantom eDP init
    
    Some platforms have BIOS/VBT that declares an eDP panel present while
    no physical panel is connected. This causes intel_edp_init_connector()
    to spend ~6 seconds waiting on PPS power sequencer and AUX channel
    timeouts before failing gracefully.
    
    Introduce a new boolean module parameter 'disable_edp' (default: false)
    that allows users to skip eDP connector initialization entirely. When
    set, the driver logs an informational message and returns false early
    from intel_edp_init_connector(), bypassing all PPS/AUX probing.
    
    This is modeled after the existing 'disable_display' parameter and
    is intended as a workaround for headless or display-less deployments
    where the BIOS incorrectly advertises an internal panel.
    
    Signed-off-by: LIOU, Mei Fan <mei.fan.liou@intel.com>
+ /mt/dim checkpatch a2d82f27ac35c691c1c65b40c72b13d8b2a7f91f drm-intel
5843f6cf4eb5 drm/i915: add disable_edp module parameter to skip phantom eDP init
-:32: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#32: FILE: drivers/gpu/drm/i915/display/intel_display_params.c:106:
+intel_display_param_named(disable_edp, bool, 0400,
+	"Disable eDP panel init, skips PPS/AUX probing when VBT declares eDP but no panel is present (default: false)");

total: 0 errors, 0 warnings, 1 checks, 29 lines checked


