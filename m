Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C77C02198
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 15:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB68E10E6FB;
	Tue, 18 Feb 2025 15:06:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBFA10E6EE;
 Tue, 18 Feb 2025 15:06:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/dumb-buffers=3A_?=
 =?utf-8?q?Fix_and_improve_buffer-size_calculation_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Feb 2025 15:06:28 -0000
Message-ID: <173989118863.3593329.16527445915408646152@b555e5b46a47>
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
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4587c0599666 drm-tip: 2025y-02m-18d-09h-10m-11s UTC integration manifest
=== git am output follows ===
Applying: drm/dumb-buffers: Sanitize output on errors
Applying: drm/dumb-buffers: Provide helper to set pitch and size
Applying: drm/gem-dma: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/gem-shmem: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/gem-vram: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/armada: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/exynos: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/gma500: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/hibmc: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/imx/ipuv3: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/loongson: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/mediatek: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/msm: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/nouveau: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/omapdrm: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/qxl: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/renesas/rcar-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/renesas/rz-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/rockchip: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/tegra: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/virtio: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/vmwgfx: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/xe: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/xen: Compute dumb-buffer sizes with drm_mode_size_dumb()
Applying: drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()


