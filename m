Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACDDCCD1BB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 15:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6EE610E7ED;
	Wed, 22 Oct 2025 15:18:58 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D203F10E15F;
 Wed, 22 Oct 2025 15:18:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dmc=3A_Event_han?=
 =?utf-8?q?dler_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Oct 2025 15:18:56 -0000
Message-ID: <176114633685.42825.4166421142905078907@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251022100718.24803-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251022100718.24803-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/dmc: Event handler fixes
URL   : https://patchwork.freedesktop.org/series/156319/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8677d3b99d5fd579c143b22605d99121e2482e8a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 95624966af24b6283d8fc86f51a852134af0cb4d
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed Oct 22 13:07:18 2025 +0300

    drm/i915/dmc: Set DMC_EVT_CTL_ENABLE for disabled event handlers as well
    
    DMC_EVT_CTL_ENABLE cannot be cleared once set. So currently
    any event we never enable will have DMC_EVT_CTL_ENABLE cleared,
    whereas any event which has been enabled even once will have
    DMC_EVT_CTL_ENABLE set. For that reason assert_dmc_loaded() has
    a special case to ignore any mismatches in DMC_EVT_CTL_ENABLE.
    
    Eliminate the special case by always configuring DMC_EVT_CTL_ENABLE
    based on the original firmware event definition. Now all
    event handlers will have DMC_EVT_CTL_ENABLE set, whether or
    not the event has been enabled in the past.
    
    All disabled event handlers will still have the event type set
    to DMC_EVENT_FALSE so they will not actually trigger despite
    DMC_EVT_CTL_ENABLE being set.
    
    Tested-by: Petr Vorel <pvorel@suse.cz>
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Reviewed-by: Petr Vorel <pvorel@suse.cz>
+ /mt/dim checkpatch 602d56f809ae2450a720a0fbedcfe84ff38ffb98 drm-intel
8dea60b74887 drm/i915/dmc: Clear HRR EVT_CTL/HTP to zero on ADL-S
-:81: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#81: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:1106:
+			dmc_info->mmiodata[i+1],
 			                    ^

-:86: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#86: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:1111:
+				   dmc_info->mmioaddr[i+1], &dmc_info->mmiodata[i+1]))
 				                       ^

-:86: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#86: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:1111:
+				   dmc_info->mmioaddr[i+1], &dmc_info->mmiodata[i+1]))
 				                                                 ^

-:95: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#95: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:1120:
+			    i+1, i915_mmio_reg_offset(dmc_info->mmioaddr[i+1]),
 			     ^

-:95: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#95: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:1120:
+			    i+1, i915_mmio_reg_offset(dmc_info->mmioaddr[i+1]),
 			                                                  ^

-:96: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#96: FILE: drivers/gpu/drm/i915/display/intel_dmc.c:1121:
+			    orig_mmiodata[1], dmc_info->mmiodata[i+1]);
 			                                          ^

total: 0 errors, 0 warnings, 6 checks, 69 lines checked
f7b1d398d5d5 drm/i915/dmc: Fixup TGL/ADL-S HRR event handler type
95624966af24 drm/i915/dmc: Set DMC_EVT_CTL_ENABLE for disabled event handlers as well


