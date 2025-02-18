Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281A6C02198
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 15:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DC610E3EA;
	Tue, 18 Feb 2025 15:06:58 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BD710E05A;
 Tue, 18 Feb 2025 15:06:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/dumb-buffers=3A_Fix_a?=
 =?utf-8?q?nd_improve_buffer-size_calculation_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Feb 2025 15:06:57 -0000
Message-ID: <173989121753.3593754.13365914505919642336@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250218142542.438557-1-tzimmermann@suse.de>
In-Reply-To: <20250218142542.438557-1-tzimmermann@suse.de>
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

Series: drm/dumb-buffers: Fix and improve buffer-size calculation (rev3)
URL   : https://patchwork.freedesktop.org/series/143335/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8b69a13a3c86690017e364c674fabde9ca6cd807
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Tue Feb 18 15:23:48 2025 +0100

    drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()
    
    Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
    buffer size. Align the pitch according to hardware requirements.
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
    Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+ /mt/dim checkpatch 4587c05996666a92af63f86ba410bae1dc940794 drm-intel
7ec2b3eae6cd drm/dumb-buffers: Sanitize output on errors
-:40: WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#40: FILE: drivers/gpu/drm/drm_dumb_buffers.c:118:
+		return -ENOSYS;

total: 0 errors, 1 warnings, 0 checks, 53 lines checked
b6ea8e6d031c drm/dumb-buffers: Provide helper to set pitch and size
-:172: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#172: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 200 lines checked
10cdcd45595c drm/gem-dma: Compute dumb-buffer sizes with drm_mode_size_dumb()
f68456be5567 drm/gem-shmem: Compute dumb-buffer sizes with drm_mode_size_dumb()
7d468a34da8a drm/gem-vram: Compute dumb-buffer sizes with drm_mode_size_dumb()
3cfe2f12ea9f drm/armada: Compute dumb-buffer sizes with drm_mode_size_dumb()
f627a99995d7 drm/exynos: Compute dumb-buffer sizes with drm_mode_size_dumb()
81d2d7ff93a3 drm/gma500: Compute dumb-buffer sizes with drm_mode_size_dumb()
1c89ebd8e7f3 drm/hibmc: Compute dumb-buffer sizes with drm_mode_size_dumb()
20b65d672ef5 drm/imx/ipuv3: Compute dumb-buffer sizes with drm_mode_size_dumb()
86f46248f158 drm/loongson: Compute dumb-buffer sizes with drm_mode_size_dumb()
a7fe2c190688 drm/mediatek: Compute dumb-buffer sizes with drm_mode_size_dumb()
e6eb5791ad9f drm/msm: Compute dumb-buffer sizes with drm_mode_size_dumb()
580a743d71ec drm/nouveau: Compute dumb-buffer sizes with drm_mode_size_dumb()
e3dabd042099 drm/omapdrm: Compute dumb-buffer sizes with drm_mode_size_dumb()
b89bef556029 drm/qxl: Compute dumb-buffer sizes with drm_mode_size_dumb()
e042cccfee89 drm/renesas/rcar-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
a2d94780fabc drm/renesas/rz-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
8a61f0898ed3 drm/rockchip: Compute dumb-buffer sizes with drm_mode_size_dumb()
9038c45eb1a8 drm/tegra: Compute dumb-buffer sizes with drm_mode_size_dumb()
a673887e7aa6 drm/virtio: Compute dumb-buffer sizes with drm_mode_size_dumb()
fa08c880b1f7 drm/vmwgfx: Compute dumb-buffer sizes with drm_mode_size_dumb()
7e8221b85ad1 drm/xe: Compute dumb-buffer sizes with drm_mode_size_dumb()
565cc33e407e drm/xen: Compute dumb-buffer sizes with drm_mode_size_dumb()
8b69a13a3c86 drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()


