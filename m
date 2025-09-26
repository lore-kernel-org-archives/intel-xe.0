Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E765CAC5AE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 11:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4329F10E06B;
	Fri, 26 Sep 2025 11:16:05 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E8110E06B;
 Fri, 26 Sep 2025 11:16:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2Cxe=7D=3A_dr?=
 =?utf-8?q?iver_agnostic_drm_to_display_pointer_chase?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Sep 2025 11:16:04 -0000
Message-ID: <175888536412.370490.11710238037286150482@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250926111032.1188876-1-jani.nikula@intel.com>
In-Reply-To: <20250926111032.1188876-1-jani.nikula@intel.com>
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

Series: drm/{i915,xe}: driver agnostic drm to display pointer chase
URL   : https://patchwork.freedesktop.org/series/155098/
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
commit 17886eaf2060327086a34ffaa085c6cf68a2812e
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Sep 26 14:10:32 2025 +0300

    drm/{i915,xe}: driver agnostic drm to display pointer chase
    
    The display driver needs to get from the struct drm_device pointer to
    the struct intel_display pointer. Currently, this depends on knowledge
    of the struct drm_i915_private and struct xe_device definitions, but
    we'd like to hide those definitions from display.
    
    Require the struct drm_device and struct intel_display * members within
    struct drm_i915_private and struct xe_device to be placed next to each
    other, to be able to figure out the display pointer without knowledge of
    the structures.
    
    Use a generic dummy device structure to define the relative offsets of
    the drm and display members, and add static assertions to ensure this
    holds for both i915 and xe. Use the dummy structure to do the pointer
    chase from struct drm_device * to struct intel_display *.
    
    This requires moving the display member in struct xe_device after the
    drm member.
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
    Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch d557b14c00c4ab027e66c1c7bf512cf479ff8c24 drm-intel
17886eaf2060 drm/{i915,xe}: driver agnostic drm to display pointer chase
-:145: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#145: 
new file mode 100644

-:187: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#187: FILE: include/drm/intel/display_member.h:38:
+		offsetof(struct __intel_generic_device, display) - offsetof(struct __intel_generic_device, drm) == \

-:189: WARNING:LONG_LINE: line length of 128 exceeds 100 columns
#189: FILE: include/drm/intel/display_member.h:40:
+		__stringify(type) " " __stringify(drm_member) " and " __stringify(display_member) " members at invalid offsets")

total: 0 errors, 3 warnings, 0 checks, 128 lines checked


