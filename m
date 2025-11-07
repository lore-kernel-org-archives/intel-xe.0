Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF32CCFA05
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 11:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E33310EA9B;
	Fri,  7 Nov 2025 11:48:52 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F34510EA9B;
 Fri,  7 Nov 2025 11:48:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_avoid_poking_at_de?=
 =?utf-8?q?v-=3Evblank=5B=5D_directly?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Nov 2025 11:48:51 -0000
Message-ID: <176251613131.29335.17024282447112385254@10055242dc62>
X-Patchwork-Hint: ignore
References: <cover.1762513240.git.jani.nikula@intel.com>
In-Reply-To: <cover.1762513240.git.jani.nikula@intel.com>
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

Series: drm: avoid poking at dev->vblank[] directly
URL   : https://patchwork.freedesktop.org/series/157215/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 419fb4aa69b56c8d8add79415afafa4c9d97819c
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Nov 7 13:05:00 2025 +0200

    drm/gma500: use drm_crtc_vblank_crtc()
    
    We have drm_crtc_vblank_crtc() to get the struct drm_vblank_crtc pointer
    for a crtc. Use it instead of poking at dev->vblank[] directly.
    
    However, we also need to get the crtc to start with. We could use
    drm_crtc_from_index(), but refactor to use drm_for_each_crtc() instead.
    
    This is all a bit tedious, and perhaps the driver shouldn't be poking at
    vblank->enabled directly in the first place. But at least hide away the
    dev->vblank[] access in drm_vblank.c where it belongs.
    
    Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 1f25afd37c14352cd24ada205fe16ff022784bd4 drm-intel
f45c4946acd4 drm/vblank: use drm_crtc_vblank_crtc() in workers
0124eff9d97e drm/atomic: use drm_crtc_vblank_waitqueue()
4c831eaba995 drm/msm: use drm_crtc_vblank_waitqueue()
-:40: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#40: FILE: drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c:538:
+	ret = wait_event_timeout(*queue,
 		!(mdp4_read(mdp4_kms, REG_MDP4_OVERLAY_FLUSH) &

-:61: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#61: FILE: drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c:1249:
+	ret = wait_event_timeout(*queue,
 		((mdp5_ctl_get_commit_status(ctl) &

total: 0 errors, 0 warnings, 2 checks, 30 lines checked
ee8f8c6e5a2c drm/tidss: use drm_crtc_vblank_crtc()
f5a070785cd2 drm/vmwgfx: use drm_crtc_vblank_crtc()
419fb4aa69b5 drm/gma500: use drm_crtc_vblank_crtc()
-:72: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#72: FILE: drivers/gpu/drm/gma500/psb_irq.c:305:
+			gma_enable_pipestat(dev_priv, drm_crtc_index(crtc), PIPE_VBLANK_INTERRUPT_ENABLE);

-:75: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#75: FILE: drivers/gpu/drm/gma500/psb_irq.c:307:
+			gma_disable_pipestat(dev_priv, drm_crtc_index(crtc), PIPE_VBLANK_INTERRUPT_ENABLE);

-:100: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#100: FILE: drivers/gpu/drm/gma500/psb_irq.c:365:
+			gma_disable_pipestat(dev_priv, drm_crtc_index(crtc), PIPE_VBLANK_INTERRUPT_ENABLE);

total: 0 errors, 3 warnings, 0 checks, 75 lines checked


