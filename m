Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D32CCD1AF
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 19:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670F210E0B4;
	Tue, 21 Oct 2025 19:51:11 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432E710E0B4;
 Tue, 21 Oct 2025 19:51:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/uapi=3A_Intoduce_DRM?=
 =?utf-8?q?=5FMODE=5FDUMB=5FCURSOR?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Oct 2025 19:51:10 -0000
Message-ID: <176107627026.37893.2433408959543573537@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251021194455.24297-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251021194455.24297-1-ville.syrjala@linux.intel.com>
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

Series: drm/uapi: Intoduce DRM_MODE_DUMB_CURSOR
URL   : https://patchwork.freedesktop.org/series/156278/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8677d3b99d5fd579c143b22605d99121e2482e8a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cdd8f7d0e144ea8b9b0fe14665ee12427fc5e65f
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Tue Oct 21 22:44:55 2025 +0300

    drm/i915/dumb: Handle DRM_MODE_DUMB_CURSOR
    
    Allocate the dumb buffer based on the cursor hardware capabilities
    when userspace has asked for it via the DRM_MODE_DUMB_CURSOR flag.
    
    Cc: Daniel Stone <daniels@collabora.com>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch fb0f56ad8a2c9953c57c3337a72ccbf9c5050687 drm-intel
06c67187347c drm/uapi: Validate DRM_IOCTL_MODE_CREATE_DUMB flags
-:18: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#18: 
gbm: https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/gbm/backends/dri/gbm_dri.c?ref_type=heads#L852

-:18: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'gbm:', use 'Link:' or 'Closes:' instead
#18: 
gbm: https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/gbm/backends/dri/gbm_dri.c?ref_type=heads#L852

-:19: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'modesetting:', use 'Link:' or 'Closes:' instead
#19: 
modesetting: https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/hw/xfree86/drivers/modesetting/dumb_bo.c#L52

-:20: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'plymouth:', use 'Link:' or 'Closes:' instead
#20: 
plymouth: https://gitlab.freedesktop.org/plymouth/plymouth/-/blob/main/src/plugins/renderers/drm/plugin.c?ref_type=heads#L235

total: 0 errors, 4 warnings, 0 checks, 8 lines checked
5f558b04c149 drm/uapi: Introduce the DRM_MODE_DUMB_CURSOR flag
-:42: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#42: FILE: include/uapi/drm/drm_mode.h:1065:
+#define DRM_MODE_DUMB_CURSOR	(1<<0) /* dumb buffer is intended for a cursor */
                             	  ^

total: 0 errors, 0 warnings, 1 checks, 23 lines checked
ce85decb86e0 drm/i915/dumb: Move the display dumb buffer stuff into the display code
7d239dfa64a7 drm/i915/dumb: Reject dumb buffer that exceed max fb dimensions
cdd8f7d0e144 drm/i915/dumb: Handle DRM_MODE_DUMB_CURSOR


