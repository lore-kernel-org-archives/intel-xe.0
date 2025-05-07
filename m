Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21423C3ABBC
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 01:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D6210E0BE;
	Wed,  7 May 2025 01:37:02 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CE610E0BE;
 Wed,  7 May 2025 01:37:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Support_active_context_ut?=
 =?utf-8?q?ilization_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 May 2025 01:37:01 -0000
Message-ID: <174658182119.53681.5214858362892230423@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250507013039.2043897-6-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20250507013039.2043897-6-umesh.nerlige.ramappa@intel.com>
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

Series: Support active context utilization (rev3)
URL   : https://patchwork.freedesktop.org/series/148302/
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
commit 254874616f76be5f2f59d0765cc833abd0651294
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Tue May 6 18:30:43 2025 -0700

    drm/xe: Add WA BB to capture active context utilization
    
    Context Timestamp (CTX_TIMESTAMP) in the LRC accumulates the run ticks
    of the context, but only gets updated when the context switches out. In
    order to check how long a context has been active before it switches
    out, two things are required:
    
    (1) Determine if the context is running:
    
    To do so, we program the WA BB to set an initial value for CTX_TIMESTAMP
    in the LRC. The value chosen is 1 since 0 is the initial value when the
    LRC is initialized. During a query, we just check for this value to
    determine if the context is active. If the context switched out, it
    would overwrite this location with the actual CTX_TIMESTAMP MMIO value.
    Note that WA BB runs as the last part of the context restore, so reusing
    this LRC location will not clobber anything.
    
    (2) Calculate the time that the context has been active for:
    
    The CTX_TIMESTAMP ticks only when the context is active. If a context is
    active, we just use the CTX_TIMESTAMP MMIO as the new value of
    utilization. While doing so, we need to read the CTX_TIMESTAMP MMIO
    for the specific engine instance. Since we do not know which instance
    the context is running on until it is scheduled, we also read the
    ENGINE_ID MMIO in the WA BB and store it in the PPHSWP.
    
    Using the above 2 instructions in a WA BB, capture active context
    utilization.
    
    v2: (Matt Brost)
    - This breaks TDR, fix it by saving the CTX_TIMESTAMP register
      "drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value"
    - Drop tile from LRC if using gt
      "drm/xe: Save the gt pointer in LRC and drop the tile"
    
    v3:
    - Remove helpers for bb_per_ctx_ptr (Matt)
    - Add define for context active value (Matt)
    - Use 64 bit CTX TIMESTAMP for platforms that support it. For platforms
      that don't, live with the rare race. (Matt, Lucas)
    - Convert engine id to hwe and get the MMIO value (Lucas)
    - Correct commit message on when WA BB runs (Lucas)
    
    v4:
    - s/GRAPHICS_VER(...)/xe->info.has_64bit_timestamp/ (Matt)
    - Drop support for active utilization on a VF (CI failure)
    - In xe_lrc_init ensure the lrc value is 0 to begin with (CI regression)
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4532
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 842c3c276c106040f9b96d72b9df35ed6aed9ae9 drm-intel
c1f76d2022f7 drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value
a919b820e154 drm/xe: Save the gt pointer in lrc and drop the tile
8174653d4486 drm/xe: Check 64-bit CTX timestamp for TDR when available
254874616f76 drm/xe: Add WA BB to capture active context utilization
-:226: WARNING:BRACES: braces {} are not necessary for single statement blocks
#226: FILE: drivers/gpu/drm/xe/xe_lrc.c:1128:
+	if (lrc_to_xe(lrc)->info.has_64bit_timestamp) {
+		xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP_UDW, 0);
+	}

total: 0 errors, 1 warnings, 0 checks, 299 lines checked


