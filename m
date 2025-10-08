Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C569CCA472
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 14:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CFF10E820;
	Wed,  8 Oct 2025 14:03:55 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7715310E824;
 Wed,  8 Oct 2025 14:03:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2C_xe=7D/disp?=
 =?utf-8?q?lay=3A_pass_parent_interface_to_display_probe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Oct 2025 14:03:54 -0000
Message-ID: <175993223447.18440.13203982571800284353@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251008135344.773326-1-jani.nikula@intel.com>
In-Reply-To: <20251008135344.773326-1-jani.nikula@intel.com>
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

Series: drm/{i915, xe}/display: pass parent interface to display probe
URL   : https://patchwork.freedesktop.org/series/155615/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 938e383affc1b3ebeffccc20d6d13824c499fef1
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Oct 8 16:53:44 2025 +0300

    drm/{i915, xe}/display: pass parent interface to display probe
    
    Let's gradually start calling i915 and xe parent, or core, drivers from
    display via function pointers passed at display probe.
    
    For starters, just add a small feature test hook ->has_flat_ccs. While
    it's platform specific for platforms supported by i915, the newer
    platforms in xe may have it fused off, and need a dynamic check.
    
    Going forward, the struct intel_display_parent_interface is expected to
    include const pointers to sub-structs by functionality, for example:
    
    struct intel_display_rpm {
            struct ref_tracker *(*get)(struct drm_device *drm);
            /* ... */
    };
    
    struct intel_display_parent_interface {
            /* ... */
            const struct intel_display_rpm *rpm;
    };
    
    This is a baby step towards not building display as part of both i915
    and xe drivers, but rather making it an independent driver interfacing
    with the two.
    
    Cc: Jouni Högander <jouni.hogander@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 45c0689519437d48d0de2bff3fbf13ee51012232 drm-intel
938e383affc1 drm/{i915, xe}/display: pass parent interface to display probe
-:72: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#72: FILE: drivers/gpu/drm/i915/display/intel_display_device.c:1651:
+						 const struct intel_display_parent_interface *parent)

-:103: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#103: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:315:
+						 const struct intel_display_parent_interface *parent);

-:163: WARNING:IS_ENABLED_CONFIG: IS_ENABLED(I915) is normally used as IS_ENABLED(CONFIG_I915)
#163: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:2934:
+	if (!IS_ENABLED(I915) && !display->parent->has_flat_ccs(display->drm))

-:309: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#309: 
new file mode 100644

total: 0 errors, 4 warnings, 0 checks, 232 lines checked


