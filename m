Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D6DCD3439
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 15:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6FD10F1A6;
	Thu,  7 May 2026 15:16:03 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE33F10F1A6;
 Thu,  7 May 2026 15:16:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/intel/display=3A_Add_?=
 =?utf-8?q?support_for_pipe_background_color_=28v4=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 May 2026 15:16:01 -0000
Message-ID: <177816696170.47093.6103699393678381722@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260505200133.636584-2-dev@lankhorst.se>
In-Reply-To: <20260505200133.636584-2-dev@lankhorst.se>
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

Series: drm/intel/display: Add support for pipe background color (v4) (rev2)
URL   : https://patchwork.freedesktop.org/series/166019/
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
commit ff003f3c5d495a21908c20afd373e4346270f1b4
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Tue May 5 22:01:34 2026 +0200

    drm/intel/display: Add support for pipe background color (v4)
    
    Gen9 platforms allow CRTC's to be programmed with a background/canvas
    color below the programmable planes.  Let's expose this as a property to
    allow userspace to program a desired value.
    
    This patch is based on earlier work by Chandra Konduru and Matt Roper.
    Between 2018 and now, intel/display has changed so much that another
    rewrite was necessary.
    
    v2:
     - Set initial background color (black) via proper helper function (Bob)
     - Fix debugfs output
     - General rebasing
    v3 (Maarten):
     - Rebase on top of recent changes.
    v4 (Maarten):
     - Complete rewrite based on the solution that went upstream, and
       on the new intel color management features.
    
    Cc: Chandra Konduru <chandra.konduru@intel.com>
    Cc: dri-devel@lists.freedesktop.org
    Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch ca078d725c0fa0a78c4cfcbc73dcd0845589535a drm-intel
ff003f3c5d49 drm/intel/display: Add support for pipe background color (v4)
-:26: WARNING:BAD_SIGN_OFF: Co-developed-by and Signed-off-by: name/email do not match
#26: 
Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

-:67: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u16' over 'uint16_t'
#67: FILE: drivers/gpu/drm/i915/display/intel_color.c:1131:
+	uint16_t r = (hw_background_color >> 20) & 0x3ff;

-:68: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u16' over 'uint16_t'
#68: FILE: drivers/gpu/drm/i915/display/intel_color.c:1132:
+	uint16_t g = (hw_background_color >> 10) & 0x3ff;

-:69: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u16' over 'uint16_t'
#69: FILE: drivers/gpu/drm/i915/display/intel_color.c:1133:
+	uint16_t b = hw_background_color & 0x3ff;

-:228: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Maarten Lankhorst <dev@lankhorst.se>' != 'Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>'

total: 0 errors, 2 warnings, 3 checks, 159 lines checked


