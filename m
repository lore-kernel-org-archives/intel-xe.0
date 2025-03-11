Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B968C2BA1B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 17:51:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA3C10E644;
	Tue, 11 Mar 2025 17:51:31 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D799910E640;
 Tue, 11 Mar 2025 17:51:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/dumb-buffers=3A_Fix_a?=
 =?utf-8?q?nd_improve_buffer-size_calculation_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Mar 2025 17:51:29 -0000
Message-ID: <174171548988.20739.13410875978404084818@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250311155120.442633-1-tzimmermann@suse.de>
In-Reply-To: <20250311155120.442633-1-tzimmermann@suse.de>
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

Series: drm/dumb-buffers: Fix and improve buffer-size calculation (rev4)
URL   : https://patchwork.freedesktop.org/series/143335/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 31440052de02606a0e3038ea3b8873050c4bba53
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Tue Mar 11 16:47:29 2025 +0100

    drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
    
    Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
    buffer size. Align the pitch according to hardware requirements.
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
    Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+ /mt/dim checkpatch f8df428b3850ed87a1e2f3b12b6025328d8a6373 drm-intel
f8e3e5cb2b56 drm/dumb-buffers: Sanitize output on errors
-:40: WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#40: FILE: drivers/gpu/drm/drm_dumb_buffers.c:118:
+		return -ENOSYS;

total: 0 errors, 1 warnings, 0 checks, 53 lines checked
de4bb172b854 drm/dumb-buffers: Provide helper to set pitch and size
-:234: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#234: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 254 lines checked
7b52997abeee drm/gem-dma: Compute dumb-buffer sizes with drm_mode_size_dumb()
08b878b043e5 drm/gem-shmem: Compute dumb-buffer sizes with drm_mode_size_dumb()
0363c3edab32 drm/gem-vram: Compute dumb-buffer sizes with drm_mode_size_dumb()
5a28eafd86af drm/armada: Compute dumb-buffer sizes with drm_mode_size_dumb()
2a953bf59bf0 drm/exynos: Compute dumb-buffer sizes with drm_mode_size_dumb()
319243428c64 drm/gma500: Compute dumb-buffer sizes with drm_mode_size_dumb()
b98825c5cc66 drm/hibmc: Compute dumb-buffer sizes with drm_mode_size_dumb()
2183391b187a drm/imx/ipuv3: Compute dumb-buffer sizes with drm_mode_size_dumb()
9887e0a08315 drm/loongson: Compute dumb-buffer sizes with drm_mode_size_dumb()
98ec55d0d8a4 drm/mediatek: Compute dumb-buffer sizes with drm_mode_size_dumb()
15717b899ae4 drm/msm: Compute dumb-buffer sizes with drm_mode_size_dumb()
6be6a058828b drm/nouveau: Compute dumb-buffer sizes with drm_mode_size_dumb()
089e3cc75b15 drm/omapdrm: Compute dumb-buffer sizes with drm_mode_size_dumb()
4464803ed8d6 drm/qxl: Compute dumb-buffer sizes with drm_mode_size_dumb()
159ac8fa2106 drm/renesas/rcar-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
d3f6741a3701 drm/renesas/rz-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
abf101289431 drm/rockchip: Compute dumb-buffer sizes with drm_mode_size_dumb()
4efc91301b74 drm/tegra: Compute dumb-buffer sizes with drm_mode_size_dumb()
6c9ab172ad12 drm/virtio: Compute dumb-buffer sizes with drm_mode_size_dumb()
afaa26f4f917 drm/vmwgfx: Compute dumb-buffer sizes with drm_mode_size_dumb()
c2757f8f1f79 drm/xe: Compute dumb-buffer sizes with drm_mode_size_dumb()
b3ea697658f2 drm/xen: Compute dumb-buffer sizes with drm_mode_size_dumb()
31440052de02 drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()


