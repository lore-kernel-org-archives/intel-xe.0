Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E9BC71136
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 18:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF53910E778;
	Tue, 17 Jun 2025 18:32:25 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A079E10E0F7;
 Tue, 17 Jun 2025 18:32:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dmc=3A_Deal_with?=
 =?utf-8?q?_loss_of_pipe_DMC_state_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Jun 2025 18:32:25 -0000
Message-ID: <175018514565.88665.9642406222922002818@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250617170759.19552-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250617170759.19552-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/dmc: Deal with loss of pipe DMC state (rev2)
URL   : https://patchwork.freedesktop.org/series/150112/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 816bc1b065c20f9fc847c463f7cc890608f23308
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Tue Jun 17 20:07:59 2025 +0300

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
    
    Reviewed-by: Uma Shankar <uma.shankar@intel.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch eb615557c4565c6236cd13b9cd164d472df1d0ed drm-intel
09f447df8dff drm/i915/dmc: Limit pipe DMC clock gating w/a to just ADL/DG2/MTL
7f2e73c1a08f drm/i915/dmc: Parametrize MTL_PIPEDMC_GATING_DIS
de217468fe50 drm/i915/dmc: Shuffle code around
-:112: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#112: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:590:
+		intel_de_write(display, PIPEDMC_INTERRUPT_MASK(pipe), ~pipedmc_interrupt_mask(display));

total: 0 errors, 1 warnings, 0 checks, 162 lines checked
6b4b47da30a6 drm/i915/dmc: Extract dmc_load_program()
42f14912309a drm/i915/dmc: Reload pipe DMC state on TGL when enabling pipe A
5cd0b03abe50 drm/i915/dmc: Reload pipe DMC MMIO registers for pipe C/D on various platforms
d77eba77ca3e drm/i915/dmc: Assert DMC is loaded harder
be6594e84dbc drm/i915/dmc: Pass crtc_state to intel_dmc_{enable, disable}_pipe()
816bc1b065c2 drm/i915/dmc: Do not enable the pipe DMC on TGL when PSR is possible


