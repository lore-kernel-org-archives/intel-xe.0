Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C47AC28B2F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 19:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99F710E0B5;
	Tue, 11 Mar 2025 19:29:26 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C9F10E0B5;
 Tue, 11 Mar 2025 19:29:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_make_i915-=3E?=
 =?utf-8?q?display_opaque_pointer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Mar 2025 19:29:26 -0000
Message-ID: <174172136601.21531.15376824654709806628@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <cover.1741712601.git.jani.nikula@intel.com>
In-Reply-To: <cover.1741712601.git.jani.nikula@intel.com>
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

Series: drm/i915: make i915->display opaque pointer
URL   : https://patchwork.freedesktop.org/series/146156/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6c028cae8188e4ea9d74ac3898b66134b017b5b7
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Mar 11 19:06:14 2025 +0200

    drm/xe: drop intel_display_core/device.h include from xe_device_types.h
    
    Make xe->display opaque.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 25eafce2a8addeb97492b2054bde792f1b106c14 drm-intel
74351f12c979 drm/i915/hdmi: remove inline to_i915()
ae419d838319 drm/i915/hotplug: use container_of() to get struct intel_display
4c9f8a3f4517 drm/i915: convert i915 and xe display members into pointers
29c85646d226 drm/i915: scripted conversion to i915->display pointer
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
sed -i 's/&\([a-zA-Z0-9_>.-]*\)\(dev_priv\|i915\|xe\)->display\([^.]\)/\1\2->display\3/g' $(git ls-files -- drivers/gpu/drm/i915 drivers/gpu/drm/xe)

-:2413: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#2413: FILE: drivers/gpu/drm/i915/display/intel_hotplug.c:699:
+		queue_work(dev_priv->display->hotplug.dp_wq, &dev_priv->display->hotplug.dig_port_work);

-:4105: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!dev_priv->display->hotplug.dp_wq"
#4105: FILE: drivers/gpu/drm/i915/i915_driver.c:138:
+	if (dev_priv->display->hotplug.dp_wq == NULL)

total: 0 errors, 2 warnings, 1 checks, 3987 lines checked
b4c0022986d2 drm/i915: allocate struct intel_display dynamically
-:25: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*i915->display)...) over kzalloc(sizeof(struct intel_display)...)
#25: FILE: drivers/gpu/drm/i915/i915_driver.c:758:
+	i915->display = kzalloc(sizeof(struct intel_display), GFP_KERNEL);

-:52: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*xe->display)...) over kzalloc(sizeof(struct intel_display)...)
#52: FILE: drivers/gpu/drm/xe/display/xe_display.c:105:
+	xe->display = kzalloc(sizeof(struct intel_display), GFP_KERNEL);

total: 0 errors, 0 warnings, 2 checks, 34 lines checked
38cbcb50f242 drm/i915: stop including display/intel_display_core.h from i915_drv.h
6c028cae8188 drm/xe: drop intel_display_core/device.h include from xe_device_types.h


