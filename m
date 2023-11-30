Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1444C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 00:32:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E5410E473;
	Thu, 30 Nov 2023 00:32:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 84FB010E473;
 Thu, 30 Nov 2023 00:32:33 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 81589AADEA;
 Thu, 30 Nov 2023 00:32:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Date: Thu, 30 Nov 2023 00:32:33 -0000
Message-ID: <170130435352.15643.2414939999172167807@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231129223508.1189461-1-michal.winiarski@intel.com>
In-Reply-To: <20231129223508.1189461-1-michal.winiarski@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Probe_tweaks_and_reordering_=28rev4=29?=
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
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 111ec9849fe3594b3ee5a49bb8b59a35a5d9fee0
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Wed Nov 29 23:35:08 2023 +0100

    drm/xe: Initialize GuC earlier during probe
    
    SR-IOV VF has limited access to MMIO registers. Fortunately, it is able
    to access a curated subset that is needed to initialize the driver by
    communicating with SR-IOV PF using GuC CT.
    Initialize GuC earlier in order to keep the unified probe ordering
    between VF and PF modes.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch ff1db4de1e4054052fbf99ef307757fd2bc74df5 drm-intel
f08a0f236 drm/xe: Skip calling drm_dev_put on probe error
228cd57a6 drm/xe: Use managed pci_enable_device
171a5d131 drm/xe/irq: Don't call pci_free_irq_vectors
8aae7bcf6 drm/xe: Move xe_set_dma_info outside of MMIO setup
62409106a drm/xe: Move xe_mmio_probe_tiles outside of MMIO setup
00b18bdd6 drm/xe: Split xe_info_init
53115bd2e drm/xe: Introduce xe_tile_init_early and use at earlier point in probe
d20d280ca drm/xe: Map the entire BAR0 and hold onto the initial mapping
980bb735e drm/xe/device: Introduce xe_device_probe_early
-:76: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'xe__' - possible side-effects?
#76: FILE: drivers/gpu/drm/xe/xe_device.h:127:
+#define for_each_remote_tile(tile__, xe__, id__) \
+	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
+		for_each_if((tile__) = &(xe__)->tiles[(id__)])

-:76: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id__' - possible side-effects?
#76: FILE: drivers/gpu/drm/xe/xe_device.h:127:
+#define for_each_remote_tile(tile__, xe__, id__) \
+	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
+		for_each_if((tile__) = &(xe__)->tiles[(id__)])

total: 0 errors, 0 warnings, 2 checks, 160 lines checked
a69123b3b drm/xe: Don't "peek" into GMD_ID
28bafb6b1 drm/xe: Move system memory management init to earlier point in probe
590df3fd7 drm/xe: Move force_wake init to earlier point in probe
e0b6c496d drm/xe: Reorder GGTT init to earlier point in probe
2b0ea5d24 drm/xe: Add a helper for DRM device-lifetime BO create
16670e53a drm/xe/uc: Split xe_uc_fw_init
194c98981 drm/xe/uc: Store firmware binary in system-memory backed BO
6d734d8a2 drm/xe/uc: Extract xe_uc_sanitize_reset
93431e3a9 drm/xe/guc: Split GuC params used for "hwconfig" and "post-hwconfig"
a5656a446 drm/managed: Add drmm_release_action
28eef8b93 drm/tests: managed: Add a simple test for drmm_managed_release
6345d882e drm/xe/guc: Allocate GuC data structures in system memory for initial load
d5ec238f8 drm/xe/guc: Move GuC power control init to "post-hwconfig"
111ec9849 drm/xe: Initialize GuC earlier during probe


