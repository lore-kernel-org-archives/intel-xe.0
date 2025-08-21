Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E9DCA0EEB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 08:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BA410E2E8;
	Thu, 21 Aug 2025 08:37:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A48810E2E3;
 Thu, 21 Aug 2025 08:37:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/dumb-buffers=3A_Fix_a?=
 =?utf-8?q?nd_improve_buffer-size_calculation_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Aug 2025 08:37:06 -0000
Message-ID: <175576542649.255675.5289219308857387024@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250821081918.79786-1-tzimmermann@suse.de>
In-Reply-To: <20250821081918.79786-1-tzimmermann@suse.de>
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

Series: drm/dumb-buffers: Fix and improve buffer-size calculation (rev6)
URL   : https://patchwork.freedesktop.org/series/143335/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
553439844b6500767ce8aef522cfe9fbb7ece541
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e49bff806110ec37fce844d176e033df1f8ed2e8
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Thu Aug 21 10:17:32 2025 +0200

    drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
    
    Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
    buffer size. Align the pitch according to hardware requirements.
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
    Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
    Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
    Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+ /mt/dim checkpatch 1f3c2c82c864322cfa8f79c10c00cf361c926d2f drm-intel
a17af0085909 drm/dumb-buffers: Sanitize output on errors
-:41: WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#41: FILE: drivers/gpu/drm/drm_dumb_buffers.c:118:
+		return -ENOSYS;

total: 0 errors, 1 warnings, 0 checks, 53 lines checked
68c79faf5397 drm/dumb-buffers: Provide helper to set pitch and size
-:49: WARNING:BAD_SIGN_OFF: Duplicate signature
#49: 
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

-:248: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#248: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 261 lines checked
0a4ff52c3886 drm/gem-dma: Compute dumb-buffer sizes with drm_mode_size_dumb()
f8ed8e216703 drm/gem-shmem: Compute dumb-buffer sizes with drm_mode_size_dumb()
50f18398832b drm/gem-vram: Compute dumb-buffer sizes with drm_mode_size_dumb()
b0b9d7cc621e drm/armada: Compute dumb-buffer sizes with drm_mode_size_dumb()
4677ea0b9be7 drm/exynos: Compute dumb-buffer sizes with drm_mode_size_dumb()
df263c3db021 drm/gma500: Compute dumb-buffer sizes with drm_mode_size_dumb()
e15ecb670d36 drm/hibmc: Compute dumb-buffer sizes with drm_mode_size_dumb()
33f25663c335 drm/imx/ipuv3: Compute dumb-buffer sizes with drm_mode_size_dumb()
ae09bc006286 drm/loongson: Compute dumb-buffer sizes with drm_mode_size_dumb()
612e6825e997 drm/mediatek: Compute dumb-buffer sizes with drm_mode_size_dumb()
8d0e1a6d0059 drm/msm: Compute dumb-buffer sizes with drm_mode_size_dumb()
b63ec0a44e20 drm/nouveau: Compute dumb-buffer sizes with drm_mode_size_dumb()
17f9c4cca7ea drm/omapdrm: Compute dumb-buffer sizes with drm_mode_size_dumb()
feaa801bc71d drm/qxl: Compute dumb-buffer sizes with drm_mode_size_dumb()
67049800945b drm/renesas/rcar-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
b2a6e6429070 drm/renesas/rz-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
32433a8cd3e4 drm/rockchip: Compute dumb-buffer sizes with drm_mode_size_dumb()
6cc66347c569 drm/tegra: Compute dumb-buffer sizes with drm_mode_size_dumb()
76e0618e1a98 drm/virtio: Compute dumb-buffer sizes with drm_mode_size_dumb()
3be2e990f446 drm/vmwgfx: Compute dumb-buffer sizes with drm_mode_size_dumb()
4f908d470fd4 drm/xe: Compute dumb-buffer sizes with drm_mode_size_dumb()
39944f5cae95 drm/xen: Compute dumb-buffer sizes with drm_mode_size_dumb()
e49bff806110 drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()


