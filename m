Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47A4C27C43
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 13:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5380B10E380;
	Thu, 30 May 2024 13:26:45 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C6010E50F;
 Thu, 30 May 2024 13:26:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_move_Intel_drm_hea?=
 =?utf-8?q?ders_to_a_subdirectory_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 May 2024 13:26:43 -0000
Message-ID: <171707560392.2238284.1809535943675661875@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1717075103.git.jani.nikula@intel.com>
In-Reply-To: <cover.1717075103.git.jani.nikula@intel.com>
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

Series: drm: move Intel drm headers to a subdirectory (rev4)
URL   : https://patchwork.freedesktop.org/series/132263/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 12c1e6d07a5cf3132c10357e7f9333f8be1419f4
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu May 30 16:19:11 2024 +0300

    MAINTAINERS: update i915 and xe entries for include/drm/intel
    
    With all the Intel specific drm files under include/drm/intel, update
    the i915, xe, and the shared display entries. Do not discriminate based
    on file name pattern, just add the entire directory for all three
    entries.
    
    Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Oded Gabbay <ogabbay@kernel.org>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Tvrtko Ursulin <tursulin@ursulin.net>
    Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 2673d3bec539b78f4368d00e0bf66d1449d77468 drm-intel
6781864017e9 drm: move intel-gtt.h under include/drm/intel
-:84: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#84: 
rename from include/drm/intel-gtt.h

total: 0 errors, 1 warnings, 0 checks, 40 lines checked
60f064083a4d drm: move i915_gsc_proxy_mei_interface.h under include/drm/intel
-:60: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#60: 
rename from include/drm/i915_gsc_proxy_mei_interface.h

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
ca3c5047b57c drm: move i915_component.h under include/drm/intel
-:140: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#140: 
rename from include/drm/i915_component.h

total: 0 errors, 1 warnings, 0 checks, 80 lines checked
e60d76b235c1 drm: move intel_lpe_audio.h under include/drm/intel
-:47: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#47: 
rename from include/drm/intel_lpe_audio.h

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
21cc3f7dd601 drm: move i915_drm.h under include/drm/intel
-:130: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#130: 
rename from include/drm/i915_drm.h

total: 0 errors, 1 warnings, 0 checks, 64 lines checked
435d7da06c20 drm: move i915_pxp_tee_interface.h under include/drm/intel
-:45: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#45: 
rename from include/drm/i915_pxp_tee_interface.h

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
185d9f2fa0a9 drm: move i915_pciids.h under include/drm/intel
-:71: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#71: 
rename from include/drm/i915_pciids.h

total: 0 errors, 1 warnings, 0 checks, 32 lines checked
1c7e6f10287b drm: move xe_pciids.h under include/drm/intel
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
rename from include/drm/xe_pciids.h

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
280e9743bf40 drm: move i915_hdcp_interface.h under include/drm/intel
-:84: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#84: 
rename from include/drm/i915_hdcp_interface.h

total: 0 errors, 1 warnings, 0 checks, 40 lines checked
12c1e6d07a5c MAINTAINERS: update i915 and xe entries for include/drm/intel


