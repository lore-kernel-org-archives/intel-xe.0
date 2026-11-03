Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29EE606A337
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 00:03:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D9910E2F8;
	Tue,  3 Nov 2026 00:03:28 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C4210E720;
 Tue,  3 Nov 2026 00:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_a_minimum_age_gate_to?=
 =?utf-8?q?_the_shrinker_+_LRU_fixes_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Nov 2026 00:03:27 -0000
Message-ID: <179366420747.107581.13130640047702496370@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102223220.1411858-1-matthew.brost@intel.com>
In-Reply-To: <20261102223220.1411858-1-matthew.brost@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: Add a minimum age gate to the shrinker + LRU fixes (rev4)
URL   : https://patchwork.freedesktop.org/series/176975/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ab8a617937c4fafb86f99efd0628e7ee445a2396
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Nov 2 14:32:20 2026 -0800

    drm/xe: Add a minimum age gate to the shrinker
    
    Backing up a BO costs a GPU blit plus a page copy, and if the BO is part
    of an active working set it is faulted straight back in on the next exec.
    Evicting a BO that was used moments ago is therefore almost always a
    loss, yet the shrinker has no notion of recency beyond LRU order.
    
    Timestamp BOs wherever their LRU position is updated, and read the stamp
    back from whatever owns that position. A BO in a VM's bulk move is
    anchored inside its range, so it is aged by the VM-wide stamp taken in
    xe_vm_bump_lru() alongside the bulk move itself. Any other BO carries
    its own, stamped there too and on a successful move into TT in
    xe_bo_move(), where ttm_resource_alloc() has already placed the new
    resource at the LRU tail.
    
    Add a per-device shrinker_min_age_ms sysfs attribute, defaulting to
    CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS (0, disabled). While set, the shrinker
    won't back up BOs younger than the delay. Each LRU priority is roughly
    age ordered, so the gate is applied per priority: xe_shrinker_count()
    snoops the first shrinkable BO of each priority and reports nothing only
    if all of them are young, and the backup walk skips to the next priority
    at the first young BO, both as a backstop for the count sample and so a
    hot priority doesn't shield colder BOs in another one.
    
    Only BOs this shrinker would actually back up have a say. BOs in
    XE_PL_SYSTEM, which are not GPU mapped and hence not part of a working
    set, and BOs xe_bo_shrink() rejects outright are never young. Purgeable
    BOs and those advised DONTNEED are neither: they are dropped rather than
    backed up and accounted to the purgeable shrinker, so they are never
    young and the count snoop skips their XE_BO_PRIORITY_LOW band entirely.
    
    The gate is hard and applies at every reclaim priority, so a working set
    kept younger than the delay is never backed up and can lead to OOM. This
    is deliberate, and why it is off by default.
    
    A follow-up could either introduce shrinker priority levels, allowing
    the `shrinker_min_age_ms` check to be bypassed at sufficiently high
    priorities, or implement an OOM notifier that similarly bypasses the
    `shrinker_min_age_ms` check. This would allow the feature to be safely
    enabled in an upstream release.
    
    Assisted-by: LLM
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 0f5e7199aaceed05aa49dad4c97df2677e32f779 drm-intel
8f7a1d50f5fc drm/xe: Bump the LRU on a successful page fault
-:37: WARNING:BRACES: braces {} are not necessary for single statement blocks
#37: FILE: drivers/gpu/drm/xe/xe_pagefault.c:227:
+			if (bo) {
+				ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
+			}

total: 0 errors, 1 warnings, 0 checks, 18 lines checked
f6fd0afd77c8 drm/ttm: Allow skipping to the next priority in the bo LRU cursor
-:26: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#26: 
Assisted-by: LLM

-:26: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#26: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 91 lines checked
ab8a617937c4 drm/xe: Add a minimum age gate to the shrinker
-:45: WARNING:BAD_SIGN_OFF: Non-standard signature: Assisted-by:
#45: 
Assisted-by: LLM

-:45: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'LLM'
#45: 
Assisted-by: LLM

total: 1 errors, 1 warnings, 0 checks, 492 lines checked


