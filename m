Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F617CD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 13:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9059C113394;
	Wed, 10 Apr 2024 13:36:08 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B96E113394;
 Wed, 10 Apr 2024 13:36:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm=3A_move_Intel_drm_hea?=
 =?utf-8?q?ders_to_a_subdirectory_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Apr 2024 13:36:06 -0000
Message-ID: <171275616644.1320942.4831889138756239879@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1712743191.git.jani.nikula@intel.com>
In-Reply-To: <cover.1712743191.git.jani.nikula@intel.com>
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

Series: drm: move Intel drm headers to a subdirectory (rev2)
URL   : https://patchwork.freedesktop.org/series/132263/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 513b078c96cfcb1e42220b105fcc54946c691d42
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Apr 10 13:05:17 2024 +0300

    drm: move i915_hdcp_interface.h under include/drm/intel
    
    Clean up the top level include/drm directory by grouping all the Intel
    specific files under a common subdirectory.
    
    Cc: Daniel Vetter <daniel@ffwll.ch>
    Cc: Dave Airlie <airlied@gmail.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Tomas Winkler <tomas.winkler@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 99e48ffb5dafa3b78e05ea5ba664782fae99e78e drm-intel
7be8cdc10613 drm/i915: use system include for drm headers
8796d82b4d8b drm: move intel-gtt.h under include/drm/intel
-:81: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#81: 
rename from include/drm/intel-gtt.h

total: 0 errors, 1 warnings, 0 checks, 40 lines checked
c8ca3daed28c drm: move i915_gsc_proxy_mei_interface.h under include/drm/intel
-:57: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#57: 
rename from include/drm/i915_gsc_proxy_mei_interface.h

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
3fc8c51df540 drm: move i915_component.h under include/drm/intel
-:123: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#123: 
rename from include/drm/i915_component.h

total: 0 errors, 1 warnings, 0 checks, 72 lines checked
650cc685448e drm: move intel_lpe_audio.h under include/drm/intel
-:44: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
rename from include/drm/intel_lpe_audio.h

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
9ca4af0c7ead drm: move i915_drm.h under include/drm/intel
-:128: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#128: 
rename from include/drm/i915_drm.h

total: 0 errors, 1 warnings, 0 checks, 64 lines checked
1f5225ea90ab drm: move i915_pxp_tee_interface.h under include/drm/intel
-:43: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#43: 
rename from include/drm/i915_pxp_tee_interface.h

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
eb86b0518f90 drm: move i915_pciids.h under include/drm/intel
-:69: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#69: 
rename from include/drm/i915_pciids.h

total: 0 errors, 1 warnings, 0 checks, 32 lines checked
f32781deef6a drm: move xe_pciids.h under include/drm/intel
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
rename from include/drm/xe_pciids.h

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
513b078c96cf drm: move i915_hdcp_interface.h under include/drm/intel
-:82: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#82: 
rename from include/drm/i915_hdcp_interface.h

total: 0 errors, 1 warnings, 0 checks, 40 lines checked


