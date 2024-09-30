Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC427CDD1D5
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 19:22:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EBC10E2F3;
	Mon, 30 Sep 2024 19:22:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E3510E149;
 Mon, 30 Sep 2024 19:22:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_Remove_DRM_apertur?=
 =?utf-8?q?e_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Sep 2024 19:22:56 -0000
Message-ID: <172772417653.1138378.13734658232081281410@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240930130921.689876-1-tzimmermann@suse.de>
In-Reply-To: <20240930130921.689876-1-tzimmermann@suse.de>
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

Series: drm: Remove DRM aperture helpers
URL   : https://patchwork.freedesktop.org/series/139309/
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
commit b38db633a3b883e4c20e465d7e584356eae0108a
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Mon Sep 30 15:03:26 2024 +0200

    drm: Remove DRM aperture helpers
    
    The DRM aperture helpers are wrappers around video helpers from
    <linux/aperture.h>. There are no callers of these functions. Remove
    them entirely.
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: Jonathan Corbet <corbet@lwn.net>
    Acked-by: Alex Deucher <alexander.deucher@amd.com>
+ /mt/dim checkpatch 4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1 drm-intel
da375315ff46 drm/amdgpu: Use video aperture helpers
f7801a68e238 drm/arm/hdlcd: Use video aperture helpers
98aad57d31d8 drm/armada: Use video aperture helpers
0d885247957b drm/ast: Use video aperture helpers
92243adff58e drm/hisilicon/hibmc: Use video aperture helpers
bf86924d87c8 drm/hyperv-drm: Use video aperture helpers
65d673a34d03 drm/i915: Use video aperture helpers
30a84e019fff drm/loongson: Use video aperture helpers
da282e808a85 drm/meson: Use video aperture helpers
829f85eff10a drm/mgag200: Use video aperture helpers
9ace32c9ae69 drm/msm: Use video aperture helpers
44006f7faaba drm/nouveau: Use video aperture helpers
461f9e34476e drm/ofdrm: Use video aperture helpers
3d40934d6a38 drm/qxl: Use video aperture helpers
f52e108c6693 drm/radeon: Use video aperture helpers
fa09815cd062 drm/rockchip: Use video aperture helpers
6724c85cc534 drm/simpledrm: Use video aperture helpers
dbe4f8b8ab6c drm/stm: Use video aperture helpers
609414452693 drm/sun4i: Use video aperture helpers
30fc4f5dba92 drm/tegra: Use video aperture helpers
cb5b0bc524d7 drm/bochs: Use video aperture helpers
f687a10c2ecf drm/cirrus: Use video aperture helpers
-:14: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

-:17: WARNING:OBSOLETE: drivers/gpu/drm/tiny/cirrus.c is marked as 'obsolete' in the MAINTAINERS hierarchy.  No unnecessary modifications please.

total: 0 errors, 2 warnings, 0 checks, 22 lines checked
6846b3b55071 drm/vboxvideo: Use video aperture helpers
60a714314f65 drm/vc4: Use video aperture helpers
de3ddb966c20 drm/virtgpu: Use video aperture helpers
6ec1dd878cb8 drm/vmwgfx: Use video aperture helpers
517496a7a5ff drm/xe: Use video aperture helpers
b38db633a3b8 drm: Remove DRM aperture helpers
-:67: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#67: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 37 lines checked


