Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C16CEC0480
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 09:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE4710E0A5;
	Tue,  3 Mar 2026 09:59:55 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4125410E0A5;
 Tue,  3 Mar 2026 09:59:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/vrr=3A_Configure?=
 =?utf-8?q?_VRR_timings_after_enabling_TRANS=5FDDI=5FFUNC=5FCTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Mar 2026 09:59:53 -0000
Message-ID: <177253199324.309150.12332296647872316683@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260303095414.4331-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260303095414.4331-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/vrr: Configure VRR timings after enabling TRANS_DDI_FUNC_CTL
URL   : https://patchwork.freedesktop.org/series/162481/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 009b71af5fade302588435dbc544c6b105471a84
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Tue Mar 3 11:54:14 2026 +0200

    drm/i915/vrr: Configure VRR timings after enabling TRANS_DDI_FUNC_CTL
    
    Apparently ICL may hang with an MCE if we write TRANS_VRR_VMAX/FLIPLINE
    before enabling TRANS_DDI_FUNC_CTL.
    
    Personally I was only able to reproduce a hang (on an Dell XPS 7390
    2-in-1) with an external display connected via a dock using a dodgy
    type-C cable that made the link training fail. After the failed
    link training the machine would hang. TGL seemed immune to the
    problem for whatever reason.
    
    BSpec does tell us to configure VRR after enabling TRANS_DDI_FUNC_CTL
    as well. The DMC firmware also does the VRR restore in two stages:
    - first stage seems to be unconditional and includes TRANS_VRR_CTL
      and a few other VRR registers, among other things
    - second stage is conditional on the DDI being enabled,
      and includes TRANS_DDI_FUNC_CTL and TRANS_VRR_VMAX/VMIN/FLIPLINE,
      among other things
    
    So let's reorder the steps to match to avoid the hang, and
    toss in an extra WARN to make sure we don't screw this up later.
    
    BSpec: 22243
    Cc: stable@vger.kernel.org
    Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
    Reported-by: Benjamin Tissoires <bentiss@kernel.org>
    Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15777
    Tested-by: Benjamin Tissoires <bentiss@kernel.org>
    Fixes: dda7dcd9da73 ("drm/i915/vrr: Use fixed timings for platforms that support VRR")
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 17ea88b18f33a355595d94c8ee60269cc7ac7f1d drm-intel
009b71af5fad drm/i915/vrr: Configure VRR timings after enabling TRANS_DDI_FUNC_CTL
-:69: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#69: FILE: drivers/gpu/drm/i915/display/intel_vrr.c:612:
+		    !(intel_de_read(display, TRANS_DDI_FUNC_CTL(display, cpu_transcoder)) & TRANS_DDI_FUNC_ENABLE));

total: 0 errors, 1 warnings, 0 checks, 33 lines checked


