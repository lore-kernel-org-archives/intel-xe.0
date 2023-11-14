Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822E4C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 13:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FBE10E206;
	Tue, 14 Nov 2023 13:08:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 93BCF10E449;
 Tue, 14 Nov 2023 13:08:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 923BBAADE8;
 Tue, 14 Nov 2023 13:08:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Date: Tue, 14 Nov 2023 13:08:04 -0000
Message-ID: <169996728459.29255.8704951396153080208@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
In-Reply-To: <20231114130231.2299661-1-michal.winiarski@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Probe_tweaks_and_reordering_=28rev2=29?=
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

Series: drm/xe: Probe tweaks and reordering (rev2)
URL   : https://patchwork.freedesktop.org/series/126392/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 32fa0441b75e63bbdbc16332c408cda1ff6e2766
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Tue Nov 14 14:02:31 2023 +0100

    drm/xe: Initialize GuC earlier during probe
    
    SR-IOV VF has limited access to MMIO registers. Fortunately, it is able
    to access a curated subset that is needed to initialize the driver by
    communicating with SR-IOV PF using GuC CT.
    Initialize GuC earlier in order to keep the unified probe ordering
    between VF and PF modes.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch 7dc3dda9b2df5a5c8949532f254a0689de70f093 drm-intel
b15910a5d drm/xe: Skip calling drm_dev_put on probe error
d5ac5bea2 drm/xe: Use managed pci_enable_device
a48563b38 drm/xe/irq: Don't call pci_free_irq_vectors
bb09a122c drm/xe: Move xe_set_dma_info outside of MMIO setup
95648fa68 drm/xe: Move xe_mmio_probe_tiles outside of MMIO setup
b082b038a drm/xe: Split xe_info_init
5e888d7e0 drm/xe: Introduce xe_tile_init_early and use at earlier point in probe
cb26847c8 drm/xe: Map the entire BAR0 and hold onto the initial mapping
efea961ab drm/xe/device: Introduce xe_device_probe_early
-:74: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'xe__' - possible side-effects?
#74: FILE: drivers/gpu/drm/xe/xe_device.h:127:
+#define for_each_remote_tile(tile__, xe__, id__) \
+	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
+		for_each_if((tile__) = &(xe__)->tiles[(id__)])

-:74: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id__' - possible side-effects?
#74: FILE: drivers/gpu/drm/xe/xe_device.h:127:
+#define for_each_remote_tile(tile__, xe__, id__) \
+	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
+		for_each_if((tile__) = &(xe__)->tiles[(id__)])

-:152: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#152: FILE: drivers/gpu/drm/xe/xe_pci.c:541:
+static int xe_info_init_early(struct xe_device *xe,
 			       const struct xe_device_desc *desc,

total: 0 errors, 0 warnings, 3 checks, 155 lines checked
19bdcd70f drm/xe: Don't "peek" into GMD_ID
69f783f8d drm/xe: Move system memory management init to earlier point in probe
ee8f7ec79 drm/xe: Move force_wake init to earlier point in probe
7e0121fd7 drm/xe: Reorder GGTT init to earlier point in probe
030166acc drm/xe/uc: Split xe_uc_fw_init
8fb404848 drm/xe/uc: Store firmware binary in system-memory backed BO
cf405071c drm/xe/uc: Extract xe_uc_sanitize_reset
08f0712e8 drm/xe/guc: Split GuC params used for "hwconfig" and "post-hwconfig"
0f61dd5ff drm/xe/guc: Allocate GuC data structures in system memory for initial load
7d3fbb0e1 drm/xe/guc: Move GuC power control init to "post-hwconfig"
32fa0441b drm/xe: Initialize GuC earlier during probe


