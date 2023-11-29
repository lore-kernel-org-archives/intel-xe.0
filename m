Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A782FC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:04:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6507A10E69D;
	Wed, 29 Nov 2023 22:04:08 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5864510E69A;
 Wed, 29 Nov 2023 22:04:07 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 553E0A0003;
 Wed, 29 Nov 2023 22:04:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Date: Wed, 29 Nov 2023 22:04:07 -0000
Message-ID: <170129544734.12092.16563175342300387660@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
In-Reply-To: <20231129214509.1174116-1-michal.winiarski@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5BCI=2C01/14=5D_drm/xe=3A_Fix_header_guard_?=
 =?utf-8?q?warning?=
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

Series: series starting with [CI,01/14] drm/xe: Fix header guard warning
URL   : https://patchwork.freedesktop.org/series/127083/
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
commit 670a973db7d2e908a92499597aeff1a96eb3d7dc
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Wed Nov 29 22:45:09 2023 +0100

    drm/xe: Reorder GGTT init to earlier point in probe
    
    GuC will need to be loaded earlier during probe. Having functional GGTT
    is one of the prerequisites.
    Also rename xe_ggtt_init_noalloc to xe_ggtt_init_early to match the new
    call site.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch ff1db4de1e4054052fbf99ef307757fd2bc74df5 drm-intel
8e1cbf2fb drm/xe: Fix header guard warning
24e3892e8 drm/xe: Skip calling drm_dev_put on probe error
c85e0ca52 drm/xe: Use managed pci_enable_device
734465ebc drm/xe/irq: Don't call pci_free_irq_vectors
987538ac5 drm/xe: Move xe_set_dma_info outside of MMIO setup
1d08c6ac5 drm/xe: Move xe_mmio_probe_tiles outside of MMIO setup
13521fcd6 drm/xe: Split xe_info_init
dd9b1e89d drm/xe: Introduce xe_tile_init_early and use at earlier point in probe
fa2e6c124 drm/xe: Map the entire BAR0 and hold onto the initial mapping
3c88016dd drm/xe/device: Introduce xe_device_probe_early
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
003338cb9 drm/xe: Don't "peek" into GMD_ID
08964b93e drm/xe: Move system memory management init to earlier point in probe
49df49d3f drm/xe: Move force_wake init to earlier point in probe
670a973db drm/xe: Reorder GGTT init to earlier point in probe


