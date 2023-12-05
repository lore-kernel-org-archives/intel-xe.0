Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E6CC10DCE
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 02:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1669910E465;
	Tue,  5 Dec 2023 02:13:46 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0795C10E465;
 Tue,  5 Dec 2023 02:13:44 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 05F50AA917;
 Tue,  5 Dec 2023 02:13:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Date: Tue, 05 Dec 2023 02:13:44 -0000
Message-ID: <170174242402.24285.15289592857639568567@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231205013309.1497006-1-michal.winiarski@intel.com>
In-Reply-To: <20231205013309.1497006-1-michal.winiarski@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5BCI=2C01/13=5D_drm/xe=3A_Split_xe=5Finfo?=
 =?utf-8?q?=5Finit?=
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

Series: series starting with [CI,01/13] drm/xe: Split xe_info_init
URL   : https://patchwork.freedesktop.org/series/127329/
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
commit aa41ff31a81b16660f34b45ce2496e1786ec4c4f
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Tue Dec 5 02:33:08 2023 +0100

    drm/xe/guc: Split GuC params used for "hwconfig" and "post-hwconfig"
    
    Move params that are not used for initial "hwconfig" load to
    "post-hwconfig" phase.
    
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 3cf2df8b17f8be54008581a37361e6ec36dc3d87 drm-intel
9b06f2d04 drm/xe: Split xe_info_init
665e66cf5 drm/xe: Introduce xe_tile_init_early and use at earlier point in probe
6d4d6b18c drm/xe: Map the entire BAR0 and hold onto the initial mapping
ac2186a82 drm/xe/device: Introduce xe_device_probe_early
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
6ed9ba545 drm/xe: Don't "peek" into GMD_ID
a46c79b94 drm/xe: Move system memory management init to earlier point in probe
fbafc7119 drm/xe: Move force_wake init to earlier point in probe
5cdf74d86 drm/xe: Reorder GGTT init to earlier point in probe
bbe34fa52 drm/xe: Add a helper for DRM device-lifetime BO create
89dcbab08 drm/xe/uc: Split xe_uc_fw_init
199c0e7ad drm/xe/uc: Store firmware binary in system-memory backed BO
0cd6c1f79 drm/xe/uc: Extract xe_uc_sanitize_reset
aa41ff31a drm/xe/guc: Split GuC params used for "hwconfig" and "post-hwconfig"


