Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE63606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 18:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E6D10E466;
	Tue, 27 Oct 2026 18:47:41 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C100610E466;
 Tue, 27 Oct 2026 18:47:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_a_minimum_age_gate_to?=
 =?utf-8?q?_the_shrinker_+_LRU_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Oct 2026 18:47:40 -0000
Message-ID: <179312686078.78158.6245494762841287972@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261027183638.1031299-1-matthew.brost@intel.com>
In-Reply-To: <20261027183638.1031299-1-matthew.brost@intel.com>
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
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: Add a minimum age gate to the shrinker + LRU fixes
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
commit f78b1513f48082ad8dc1c7a46ff68a51c72d8473
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Oct 27 11:36:38 2026 -0700

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
    
    Assisted-by: LLM
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 5e5b89446954adf0d9b74ba4228862403f71eec4 drm-intel
ba8df199ac94 drm/xe: Bump the LRU of every BO an exec touches
-:19: WARNING:BAD_SIGN_OFF: Non-standard signature: Co-authored-by:
#19: 
Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>

total: 0 errors, 1 warnings, 0 checks, 31 lines checked
74519a825917 drm/xe: Bump the LRU on a successful page fault
f3969a767705 drm/xe: Leave the VM bulk move on BO release, not on GEM close
4d0c8cdaaeaa drm/ttm: Allow skipping to the next priority in the bo LRU cursor
f78b1513f480 drm/xe: Add a minimum age gate to the shrinker


