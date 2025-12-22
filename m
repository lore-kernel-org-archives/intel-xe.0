Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE74AE6ADFE
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 21:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C6610E040;
	Mon, 22 Dec 2025 21:20:52 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5BF10E040;
 Mon, 22 Dec 2025 21:20:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_reduc?=
 =?utf-8?q?e_i915=5Fdrv=2Eh_usage_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Dec 2025 21:20:51 -0000
Message-ID: <176643845124.111846.9509937134621685613@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1766406794.git.jani.nikula@intel.com>
In-Reply-To: <cover.1766406794.git.jani.nikula@intel.com>
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

Series: drm/i915/display: reduce i915_drv.h usage (rev2)
URL   : https://patchwork.freedesktop.org/series/159278/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99339247d1ae4378b24366da182e712bdc623311
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5581117943e23b6d793658911b3513e890ad7b5b
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Dec 22 14:34:03 2025 +0200

    drm/i915/display: use to_intel_uncore() to avoid i915_drv.h
    
    A number of places that include i915_drv.h only need it to get from
    display to i915 to uncore. We have to_intel_uncore() for that, use it to
    avoid the i915_drv.h include.
    
    v2: Rebase
    
    Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
    Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
+ /mt/dim checkpatch f101d56dc32350daa45c130ff7a6d46512f614a9 drm-intel
bb7b06380ead drm/i915: remove unused dev_priv local variable
1faa8bc6b03a drm/xe/compat: remove unused forcewake get/put macros
fc08a7ee263f drm/xe/compat: convert uncore macro to static inlines
5581117943e2 drm/i915/display: use to_intel_uncore() to avoid i915_drv.h
-:386: WARNING:LINE_SPACING: Missing a blank line after declarations
#386: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:310:
+	struct intel_uncore *uncore = to_intel_uncore(display->drm);
+	spin_lock(&uncore->lock);

-:396: WARNING:LINE_SPACING: Missing a blank line after declarations
#396: FILE: drivers/gpu/drm/i915/display/intel_vblank.c:317:
+	struct intel_uncore *uncore = to_intel_uncore(display->drm);
+	spin_unlock(&uncore->lock);

total: 0 errors, 2 warnings, 0 checks, 327 lines checked


