Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68756D35171
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 10:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C53F10ECB8;
	Wed,  1 Apr 2026 10:35:38 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7848610ECB8;
 Wed,  1 Apr 2026 10:35:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/psr=3A_Do_not_us?=
 =?utf-8?q?e_pipe=5Fsrc_as_borders_for_SU_area_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Apr 2026 10:35:36 -0000
Message-ID: <177503973647.422694.1457279030764703061@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260327114553.195285-1-jouni.hogander@intel.com>
In-Reply-To: <20260327114553.195285-1-jouni.hogander@intel.com>
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

Series: drm/i915/psr: Do not use pipe_src as borders for SU area (rev2)
URL   : https://patchwork.freedesktop.org/series/163985/
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
commit 533665a15135bd99ff672852ea7cbf8b6a426eec
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri Mar 27 13:45:53 2026 +0200

    drm/i915/psr: Do not use pipe_src as borders for SU area
    
    This far using crtc_state->pipe_src as borders for Selective Update area
    haven't caused visible problems as drm_rect_width(crtc_state->pipe_src) ==
    crtc_state->hw.adjusted_mode.crtc_hdisplay and
    drm_rect_height(crtc_state->pipe_src) ==
    crtc_state->hw.adjusted_mode.crtc_vdisplay when pipe scaling is not
    used. On the other hand using pipe scaling is forcing full frame updates and all the
    Selective Update area calculations are skipped. Now this improper usage of
    crtc_state->pipe_src is causing following warnings:
    
    <4> [7771.978166] xe 0000:00:02.0: [drm] drm_WARN_ON_ONCE(su_lines % vdsc_cfg->slice_height)
    
    after WARN_ON_ONCE was added by commit:
    
    "drm/i915/dsc: Add helper for writing DSC Selective Update ET parameters"
    
    These warnings are seen when DSC and pipe scaling are enabled
    simultaneously. This is because on full frame update SU area is improperly
    set as pipe_src which is not aligned with DSC slice height.
    
    Fix these by creating local rectangle using
    crtc_state->hw.adjusted_mode.crtc_hdisplay and
    crtc_state->hw.adjusted_mode.crtc_vdisplay. Use this local rectangle as
    borders for SU area.
    
    Fixes: d6774b8c3c58 ("drm/i915: Ensure damage clip area is within pipe area")
    Cc: <stable@vger.kernel.org> # v6.0+
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Reviewed-by: Mika Kahola <mika.kahola@intel.com>
+ /mt/dim checkpatch 5d36e6d54e963f0c1137aaf2249d2baa781f08c2 drm-intel
533665a15135 drm/i915/psr: Do not use pipe_src as borders for SU area
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
used. On the other hand using pipe scaling is forcing full frame updates and all the

total: 0 errors, 1 warnings, 0 checks, 94 lines checked


