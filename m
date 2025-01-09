Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A77DE77197
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 16:36:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1BA10E475;
	Thu,  9 Jan 2025 16:36:51 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89B110E472;
 Thu,  9 Jan 2025 16:36:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/dumb-buffers=3A_Fix_a?=
 =?utf-8?q?nd_improve_buffer-size_calculation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jan 2025 16:36:50 -0000
Message-ID: <173644061069.1677763.5716583456258335850@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250109150310.219442-1-tzimmermann@suse.de>
In-Reply-To: <20250109150310.219442-1-tzimmermann@suse.de>
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

Series: drm/dumb-buffers: Fix and improve buffer-size calculation
URL   : https://patchwork.freedesktop.org/series/143335/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 35814ed9bf58a1cc82b856b39baa3085c1c48384
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Thu Jan 9 15:57:19 2025 +0100

    drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
    
    Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
    buffer size. Align the pitch according to hardware requirements.
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
    Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+ /mt/dim checkpatch 424f495e9572bf87a42e3be0aa02ac4777541033 drm-intel
450657daf684 drm/dumb-buffers: Sanitize output on errors
-:40: WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#40: FILE: drivers/gpu/drm/drm_dumb_buffers.c:118:
+		return -ENOSYS;

total: 0 errors, 1 warnings, 0 checks, 53 lines checked
b9eed275c6e1 drm/dumb-buffers: Provide helper to set pitch and size
-:143: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#143: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 119 lines checked
f09eeeed8d20 drm/gem-dma: Compute dumb-buffer sizes with drm_mode_size_dumb()
30a1224b9660 drm/gem-shmem: Compute dumb-buffer sizes with drm_mode_size_dumb()
acea634cf2f4 drm/gem-vram: Compute dumb-buffer sizes with drm_mode_size_dumb()
04a09b037ad7 drm/armada: Compute dumb-buffer sizes with drm_mode_size_dumb()
cb68239c68b6 drm/exynos: Compute dumb-buffer sizes with drm_mode_size_dumb()
9fa140e6b149 drm/gma500: Compute dumb-buffer sizes with drm_mode_size_dumb()
d9c62c689687 drm/hibmc: Compute dumb-buffer sizes with drm_mode_size_dumb()
038b1cd9aa3c drm/imx/ipuv3: Compute dumb-buffer sizes with drm_mode_size_dumb()
4af6efa8cd1b drm/loongson: Compute dumb-buffer sizes with drm_mode_size_dumb()
2a5ef74cf2e1 drm/mediatek: Compute dumb-buffer sizes with drm_mode_size_dumb()
246634fe36f8 drm/msm: Compute dumb-buffer sizes with drm_mode_size_dumb()
70cb40dc4f5f drm/nouveau: Compute dumb-buffer sizes with drm_mode_size_dumb()
6281d734996a drm/omapdrm: Compute dumb-buffer sizes with drm_mode_size_dumb()
79324fa9a955 drm/qxl: Compute dumb-buffer sizes with drm_mode_size_dumb()
a5f0ebdd73b7 drm/renesas/rcar-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
21417802980b drm/renesas/rz-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
39e6faf5eb2e drm/rockchip: Compute dumb-buffer sizes with drm_mode_size_dumb()
d5edc84e7ab6 drm/tegra: Compute dumb-buffer sizes with drm_mode_size_dumb()
93b3a80da377 drm/virtio: Compute dumb-buffer sizes with drm_mode_size_dumb()
719154840974 drm/vmwgfx: Compute dumb-buffer sizes with drm_mode_size_dumb()
d3b82e7ed053 drm/xe: Compute dumb-buffer sizes with drm_mode_size_dumb()
d5021c31ea8d drm/xen: Compute dumb-buffer sizes with drm_mode_size_dumb()
35814ed9bf58 drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()


