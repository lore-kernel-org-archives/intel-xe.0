Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD01CCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 09:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D31A10E1EB;
	Fri,  3 Oct 2025 09:26:59 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1482710E1EB;
 Fri,  3 Oct 2025 09:26:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2Cxe=7D/displ?=
 =?utf-8?q?ay=3A_pass_hooks_to_display_probe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 03 Oct 2025 09:26:58 -0000
Message-ID: <175948361807.2278.4231310088725729558@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251003092107.2892508-1-jani.nikula@intel.com>
In-Reply-To: <20251003092107.2892508-1-jani.nikula@intel.com>
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

Series: drm/{i915,xe}/display: pass hooks to display probe
URL   : https://patchwork.freedesktop.org/series/155375/
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
commit f2617a7b108aba17f890391b12839b4c295b5d4e
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Oct 3 12:21:07 2025 +0300

    drm/{i915,xe}/display: pass hooks to display probe
    
    Let's gradually start calling i915 and xe core drivers from display via
    function pointers passed at display probe. For starters, just add a
    small feature test hook ->has_flat_ccs.
    
    FIXME: "hooks" is a terrible name, both as a parameter and a struct
    intel_display member name. It should reflect that we're calling the core
    or parent driver. This is a placeholder name for now.
    
    FIXME: Initially, one struct is fine... but once it accumulates a lot of
    functions, should it have more indirection? Maybe everything should be
    in sub-structs, or the top struct should just be a collection of
    pointers to hook structs?
    
            struct intel_core_hooks {
                    const struct intel_rpm_hooks *rpm;
            };
    
    The above would allow having the struct initialization inside the
    implementation file, and the functions themselves static. In any case,
    it seems best to have just one initialization of the hooks, instead of
    one init/register call for each functional area.
    
    The downside is of course having to call the functions like:
    
            display->hooks->rpm->get(display->drm);
    
    FIXME: It would really be convenient if we could stop using a display
    device with mock_gem_device() in mock_gem_device.c. The purpose of the
    mock gem device is to run mock *gem* tests. Could we make it happen
    without display?
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 39636f1340c98e9a67e800681cff4e8adde6fee4 drm-intel
f2617a7b108a drm/{i915,xe}/display: pass hooks to display probe
-:162: WARNING:IS_ENABLED_CONFIG: IS_ENABLED(I915) is normally used as IS_ENABLED(CONFIG_I915)
#162: FILE: drivers/gpu/drm/i915/display/skl_universal_plane.c:2934:
+	if (!IS_ENABLED(I915) && !display->hooks->has_flat_ccs(display->drm))

-:294: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#294: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 215 lines checked


