Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D42C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 00:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420C410E301;
	Wed,  8 Nov 2023 00:38:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E5ECF10E301;
 Wed,  8 Nov 2023 00:38:20 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D4389AADF1;
 Wed,  8 Nov 2023 00:38:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Date: Wed, 08 Nov 2023 00:38:20 -0000
Message-ID: <169940390084.24274.17119298155781033145@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
In-Reply-To: <20231108003344.1169016-1-michal.winiarski@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_Probe_tweaks_and_reordering_=28part_1=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Probe tweaks and reordering (part 1)
URL   : https://patchwork.freedesktop.org/series/126105/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 3b0bded07 drm/xe: Fix unbind of unaccessed VMA (fault mode)
=== git am output follows ===
Applying: drm/xe: Remove shutdown
Applying: drm/xe: Skip calling drm_dev_put on probe error
Applying: drm/xe: Use managed pci_enable_device
Applying: drm/xe/irq: Don't call pci_free_irq_vectors
Applying: drm/xe/mmio: Move memory training check to probe vram
Applying: drm/xe: Move xe_set_dma_info outside of MMIO setup
Applying: drm/xe: Move xe_mmio_probe_tiles outside of MMIO setup
Applying: drm/xe: Split xe_info_init
Applying: drm/xe: Introduce xe_tile_init_early and use at earlier point in probe
Applying: drm/xe: Map the entire BAR0 and hold onto the initial mapping
Applying: drm/xe/device: Introduce xe_device_probe_early
Applying: drm/xe: Don't "peek" into GMD_ID


