Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355B3C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 00:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EF610E305;
	Wed,  8 Nov 2023 00:38:45 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id ABD1610E305;
 Wed,  8 Nov 2023 00:38:44 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A9E35AADF1;
 Wed,  8 Nov 2023 00:38:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Date: Wed, 08 Nov 2023 00:38:44 -0000
Message-ID: <169940392469.24272.2572056015021576429@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
In-Reply-To: <20231108003344.1169016-1-michal.winiarski@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Probe_tweaks_and_reordering_=28part_1=29?=
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
commit e630dfcc676ebc3cff540aa0bf99cc4b114ed57e
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Wed Nov 8 01:33:44 2023 +0100

    drm/xe: Don't "peek" into GMD_ID
    
    Now that MMIO init got moved to device early, we can use regular
    xe_mmio_read helpers to get to GMD_ID register.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch 3b0bded07ef9f00e6120c6856e86e3faf897191f drm-intel
a9124875a drm/xe: Remove shutdown
f0552fe23 drm/xe: Skip calling drm_dev_put on probe error
2aeedfd89 drm/xe: Use managed pci_enable_device
1a40cd86c drm/xe/irq: Don't call pci_free_irq_vectors
310d20fcd drm/xe/mmio: Move memory training check to probe vram
ef0e47638 drm/xe: Move xe_set_dma_info outside of MMIO setup
4276ac802 drm/xe: Move xe_mmio_probe_tiles outside of MMIO setup
e9f5414c2 drm/xe: Split xe_info_init
fc75a5373 drm/xe: Introduce xe_tile_init_early and use at earlier point in probe
8d82361ad drm/xe: Map the entire BAR0 and hold onto the initial mapping
634a39d28 drm/xe/device: Introduce xe_device_probe_early
-:94: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'xe__' - possible side-effects?
#94: FILE: drivers/gpu/drm/xe/xe_device.h:126:
+#define for_each_remote_tile(tile__, xe__, id__) \
+	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
+		for_each_if((tile__) = &(xe__)->tiles[(id__)])

-:94: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id__' - possible side-effects?
#94: FILE: drivers/gpu/drm/xe/xe_device.h:126:
+#define for_each_remote_tile(tile__, xe__, id__) \
+	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
+		for_each_if((tile__) = &(xe__)->tiles[(id__)])

total: 0 errors, 0 warnings, 2 checks, 171 lines checked
e630dfcc6 drm/xe: Don't "peek" into GMD_ID


