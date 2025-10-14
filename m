Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B65DCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 19:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204FA10E695;
	Tue, 14 Oct 2025 19:24:07 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602C210E238;
 Tue, 14 Oct 2025 19:24:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/prefill=3A_Intro?=
 =?utf-8?q?duce_helpers_for_prefill_latency_calculations_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Oct 2025 19:24:05 -0000
Message-ID: <176046984538.12447.16220681741994241696@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251014191808.12326-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251014191808.12326-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/prefill: Introduce helpers for prefill latency calculations (rev2)
URL   : https://patchwork.freedesktop.org/series/155628/
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
commit 5d0b9753bce2beeecfaa4ee79a8bf00c1a4e6b3c
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Tue Oct 14 22:18:08 2025 +0300

    drm/i915/wm: Use skl_prefill
    
    Replace the current ad-hoc prefill calculations with skl_prefill.
    
    v2: cdclk_state no longer needed
        Rename to skl_prefill
    
    Reviewed-by: Uma Shankar <uma.shankar@intel.com> #v1
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb drm-intel
e96f057e162e drm/i915/vblank: Add helper to get correct vblank length
187083bc3250 drm/i915: Reject modes with linetime > 64 usec
141d7d90cc10 drm/i915/cdclk: Add prefill helpers for CDCLK
8c17cacd005e drm/i915/cdclk: Add intel_cdclk_min_cdclk_for_prefill()
b02bd8e65389 drm/i915/dsc: Add prefill helper for DSC
534d6bf07393 drm/i915/scaler: Add scaler prefill helpers
e47c252631f4 drm/i915/wm: Add WM0 prefill helpers
25bb31f5c6b7 drm/i915/prefill: Introduce skl_prefill.c
-:46: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#46: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 217 lines checked
5d0b9753bce2 drm/i915/wm: Use skl_prefill


