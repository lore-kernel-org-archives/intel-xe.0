Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46A0C71137
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 17:01:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148AC88D18;
	Wed, 11 Jun 2025 17:01:44 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB2B10E6DA;
 Wed, 11 Jun 2025 17:01:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dmc=3A_Deal_with?=
 =?utf-8?q?_loss_of_pipe_DMC_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Jun 2025 17:01:43 -0000
Message-ID: <174966130311.68523.8101998268083598342@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250611155241.24191-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250611155241.24191-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/dmc: Deal with loss of pipe DMC state
URL   : https://patchwork.freedesktop.org/series/150112/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit af3938a5a6a00326505fc3ce4c45b5637f9cfccc
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed Jun 11 18:52:41 2025 +0300

    drm/i915/dmc: Do not enable the pipe DMC on TGL when PSR is possible
    
    On TGL/derivatives the pipe DMC state is lost when PG1 is disabled,
    and the main DMC does not restore any of it. This means the state will
    also be lost during PSR+DC5/6. It seems safest to not even enable the
    pipe DMC in that case (the main DMC does restore the pipe DMC enable
    bit in PIPEDMC_CONTROL_A for some reason).
    
    Since pipe DMC is only needed for "fast LACE" on these platforms we aren't
    actually losing anything here. In the future if we do want to enable
    "fast LACE" we'll just have to remember that it won't be compatible with
    PSR.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch aafbd01c99cde1b0b8a117e0ae1b77e87554c7b6 drm-intel
4fa4a2f5b7b4 drm/i915/dmc: Limit pipe DMC clock gating w/a to just ADL/DG2/MTL
5dc1d87f3cb7 drm/i915/dmc: Parametrize MTL_PIPEDMC_GATING_DIS
9ba3cd5ddc52 drm/i915/dmc: Shuffle code around
-:112: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#112: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:590:
+		intel_de_write(display, PIPEDMC_INTERRUPT_MASK(pipe), ~pipedmc_interrupt_mask(display));

total: 0 errors, 1 warnings, 0 checks, 162 lines checked
4ccacce51c14 drm/i915/dmc: Extract dmc_load_program()
9957880c2e83 drm/i915/dmc: Reload pipe DMC state on TGL when enabling pipe A
37ee5c5a5e91 drm/i915/dmc: Reload pipe DMC MMIO registers for pipe C/D on PTL+
7e59fe604c19 drm/i915/dmc: Assert DMC is loaded harder
b4c459e89c1a drm/i915/dmc: Pass crtc_state to intel_dmc_{enable, disable}_pipe()
af3938a5a6a0 drm/i915/dmc: Do not enable the pipe DMC on TGL when PSR is possible


