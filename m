Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2C5C5DF97
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 21:43:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDF510F3B1;
	Fri, 21 Aug 2026 21:43:20 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6F710E376;
 Fri, 21 Aug 2026 21:43:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Update_Wa=5F140?=
 =?utf-8?q?26539277?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Aug 2026 21:43:18 -0000
Message-ID: <178734859898.76503.782574623517819340@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260821-wa_14026539277-v3-0-1f98c2af12f6@intel.com>
In-Reply-To: <20260821-wa_14026539277-v3-0-1f98c2af12f6@intel.com>
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

Series: drm/xe: Update Wa_14026539277
URL   : https://patchwork.freedesktop.org/series/172611/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 34e373c10b4bed0798def42346f617db75ed7457
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Fri Aug 21 18:36:49 2026 -0300

    drm/xe: Add up-to-date implementation for Wa_14026539277
    
    Wa_14026539277 is a temporary workaround that targets only A*
    steppings of graphics version 35.10 and requires that we avoid using
    2-way coherency for device-cacheable memory accesses.  For
    driver-internal usage, we convert those configurations to be
    device-uncached and 1-way-coherent; on the UAPI side, we reject
    VM_BIND/MADVISE calls that are 2-way-coherent and leave it up to
    userspace to select the alternative option that is most appropriate to
    their usage.
    
    v2:
      - Add missing bits to convert the PAT value to device-uncacheable in
        wa_14026539277_fixup_pat_value(). (Sashiko)
      - Also validate the PAT index in the DRM_XE_VM_MADVISE
        ioctl. (Sashiko)
      - Match against the graphics IP instead of the platform.
    v3:
      - Handle any 2-way-coherent PAT index irrespective of L3 cache
        policy, because L3 UC can be promoted to cached by MOCS. (Matt)
    
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Cc: Filip Hazubski <filip.hazubski@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 58d59a40e2a041d3c159fab8bf5d5dc19d28da6c drm-intel
d6af86deff52 drm/xe: Extract override_has_cached_pt()
5a247e796589 Revert "drm/xe/nvlp: Implement Wa_14026539277"
34e373c10b4b drm/xe: Add up-to-date implementation for Wa_14026539277
-:120: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#120: FILE: drivers/gpu/drm/xe/xe_pat.c:417:
+					  wa_14026539277_fixup_pat_value(gt, xe->pat.pat_ats->value));

total: 0 errors, 1 warnings, 0 checks, 187 lines checked


