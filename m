Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E721C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 00:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097D710E473;
	Thu, 30 Nov 2023 00:32:00 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 39A4A10E473;
 Thu, 30 Nov 2023 00:31:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2AFDAAADEA;
 Thu, 30 Nov 2023 00:31:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Date: Thu, 30 Nov 2023 00:31:59 -0000
Message-ID: <170130431915.15642.373624168616230585@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_Probe_tweaks_and_reordering_=28rev4=29?=
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

Series: drm/xe: Probe tweaks and reordering (rev4)
URL   : https://patchwork.freedesktop.org/series/126392/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: ff1db4de1 drm/xe: Manually setup C6 when skip_guc_pc is set
=== git am output follows ===
Applying: drm/xe: Skip calling drm_dev_put on probe error
Applying: drm/xe: Use managed pci_enable_device
Applying: drm/xe/irq: Don't call pci_free_irq_vectors
Applying: drm/xe: Move xe_set_dma_info outside of MMIO setup
Applying: drm/xe: Move xe_mmio_probe_tiles outside of MMIO setup
Applying: drm/xe: Split xe_info_init
Applying: drm/xe: Introduce xe_tile_init_early and use at earlier point in probe
Applying: drm/xe: Map the entire BAR0 and hold onto the initial mapping
Applying: drm/xe/device: Introduce xe_device_probe_early
Applying: drm/xe: Don't "peek" into GMD_ID
Applying: drm/xe: Move system memory management init to earlier point in probe
Applying: drm/xe: Move force_wake init to earlier point in probe
Applying: drm/xe: Reorder GGTT init to earlier point in probe
Applying: drm/xe: Add a helper for DRM device-lifetime BO create
Applying: drm/xe/uc: Split xe_uc_fw_init
Applying: drm/xe/uc: Store firmware binary in system-memory backed BO
Applying: drm/xe/uc: Extract xe_uc_sanitize_reset
Applying: drm/xe/guc: Split GuC params used for "hwconfig" and "post-hwconfig"
Applying: drm/managed: Add drmm_release_action
Applying: drm/tests: managed: Add a simple test for drmm_managed_release
Applying: drm/xe/guc: Allocate GuC data structures in system memory for initial load
Applying: drm/xe/guc: Move GuC power control init to "post-hwconfig"
Applying: drm/xe: Initialize GuC earlier during probe


