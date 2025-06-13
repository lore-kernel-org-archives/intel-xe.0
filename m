Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418DFC71135
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 09:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D2210E917;
	Fri, 13 Jun 2025 09:23:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA96E10E902;
 Fri, 13 Jun 2025 09:23:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/dumb-buffers=3A_Fix_a?=
 =?utf-8?q?nd_improve_buffer-size_calculation_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Jun 2025 09:23:39 -0000
Message-ID: <174980661989.75396.11388253610977496827@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250613090431.127087-1-tzimmermann@suse.de>
In-Reply-To: <20250613090431.127087-1-tzimmermann@suse.de>
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

Series: drm/dumb-buffers: Fix and improve buffer-size calculation (rev5)
URL   : https://patchwork.freedesktop.org/series/143335/
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
commit b8bec323e4daad69506c67e19e34083390cfc0c6
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Fri Jun 13 11:00:44 2025 +0200

    drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
    
    Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
    buffer size. Align the pitch according to hardware requirements.
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
    Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+ /mt/dim checkpatch cce8a9af1c6cf1776511aa69e5f4b5bef7bf5938 drm-intel
d7776653716e drm/dumb-buffers: Sanitize output on errors
-:41: WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#41: FILE: drivers/gpu/drm/drm_dumb_buffers.c:118:
+		return -ENOSYS;

total: 0 errors, 1 warnings, 0 checks, 53 lines checked
23462640e407 drm/dumb-buffers: Provide helper to set pitch and size
-:234: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#234: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 251 lines checked
74f2ac827e69 drm/gem-dma: Compute dumb-buffer sizes with drm_mode_size_dumb()
2957c631d32e drm/gem-shmem: Compute dumb-buffer sizes with drm_mode_size_dumb()
fe6747cb5a4b drm/gem-vram: Compute dumb-buffer sizes with drm_mode_size_dumb()
e25848ef6d44 drm/armada: Compute dumb-buffer sizes with drm_mode_size_dumb()
617e8bb5a7cd drm/exynos: Compute dumb-buffer sizes with drm_mode_size_dumb()
5af7659365f8 drm/gma500: Compute dumb-buffer sizes with drm_mode_size_dumb()
23bf82aa03c4 drm/hibmc: Compute dumb-buffer sizes with drm_mode_size_dumb()
b5e43db50c3e drm/imx/ipuv3: Compute dumb-buffer sizes with drm_mode_size_dumb()
4851352a62ab drm/loongson: Compute dumb-buffer sizes with drm_mode_size_dumb()
837570fd6c83 drm/mediatek: Compute dumb-buffer sizes with drm_mode_size_dumb()
8396f2ee0673 drm/msm: Compute dumb-buffer sizes with drm_mode_size_dumb()
dc36d4e39e52 drm/nouveau: Compute dumb-buffer sizes with drm_mode_size_dumb()
7e3381841370 drm/omapdrm: Compute dumb-buffer sizes with drm_mode_size_dumb()
465dc91d7ef5 drm/qxl: Compute dumb-buffer sizes with drm_mode_size_dumb()
9968cf97b830 drm/renesas/rcar-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
ad6571b1c73e drm/renesas/rz-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
e6257046ae48 drm/rockchip: Compute dumb-buffer sizes with drm_mode_size_dumb()
984fb4e32aa2 drm/tegra: Compute dumb-buffer sizes with drm_mode_size_dumb()
bf6f9063815c drm/virtio: Compute dumb-buffer sizes with drm_mode_size_dumb()
2abf993c358d drm/vmwgfx: Compute dumb-buffer sizes with drm_mode_size_dumb()
88dd80e9beb9 drm/xe: Compute dumb-buffer sizes with drm_mode_size_dumb()
6cbcf9c9b3dc drm/xen: Compute dumb-buffer sizes with drm_mode_size_dumb()
b8bec323e4da drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()


