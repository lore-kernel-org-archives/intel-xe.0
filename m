Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78775CDD1D5
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 19:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CFF10E2F3;
	Mon, 30 Sep 2024 19:22:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA0910E149;
 Mon, 30 Sep 2024 19:22:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm=3A_Remove_DRM_ap?=
 =?utf-8?q?erture_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Sep 2024 19:22:31 -0000
Message-ID: <172772415104.1138378.4269265731834262065@2413ebb6fbb6>
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
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4e4d7873ac76 drm-tip: 2024y-09m-30d-16h-43m-25s UTC integration manifest
=== git am output follows ===
Applying: drm/amdgpu: Use video aperture helpers
Applying: drm/arm/hdlcd: Use video aperture helpers
Applying: drm/armada: Use video aperture helpers
Applying: drm/ast: Use video aperture helpers
Applying: drm/hisilicon/hibmc: Use video aperture helpers
Applying: drm/hyperv-drm: Use video aperture helpers
Applying: drm/i915: Use video aperture helpers
Applying: drm/loongson: Use video aperture helpers
Applying: drm/meson: Use video aperture helpers
Applying: drm/mgag200: Use video aperture helpers
Applying: drm/msm: Use video aperture helpers
Applying: drm/nouveau: Use video aperture helpers
Applying: drm/ofdrm: Use video aperture helpers
Applying: drm/qxl: Use video aperture helpers
Applying: drm/radeon: Use video aperture helpers
Applying: drm/rockchip: Use video aperture helpers
Applying: drm/simpledrm: Use video aperture helpers
Applying: drm/stm: Use video aperture helpers
Applying: drm/sun4i: Use video aperture helpers
Applying: drm/tegra: Use video aperture helpers
Applying: drm/bochs: Use video aperture helpers
Applying: drm/cirrus: Use video aperture helpers
Applying: drm/vboxvideo: Use video aperture helpers
Applying: drm/vc4: Use video aperture helpers
Applying: drm/virtgpu: Use video aperture helpers
Applying: drm/vmwgfx: Use video aperture helpers
Applying: drm/xe: Use video aperture helpers
Applying: drm: Remove DRM aperture helpers


