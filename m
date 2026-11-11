Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E885606A327
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 12:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E2E10FA44;
	Wed, 11 Nov 2026 12:28:06 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6406A10FAE4;
 Wed, 11 Nov 2026 12:28:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dpt=3A_Optimize_?=
 =?utf-8?q?i915_DPT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Nov 2026 12:28:05 -0000
Message-ID: <179440008540.9222.1235652912822573037@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/dpt: Optimize i915 DPT
URL   : https://patchwork.freedesktop.org/series/178310/
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
commit 4a974e0e402cc9dc95e02a0d078c3e0ecfe0ecdb
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed Nov 11 13:20:07 2026 +0200

    drm/i915/dpt: s/struct intel_dpt/struct i915_dpt/
    
    struct intel_dpt is now completely encased inside i915 code, so
    rename it to struct i915_dpt.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch d5036074d7760ba3ee4a3d63e88c662f505da3cf drm-intel
dbfc08cff230 drm/i915: Bump surface alignment to 32k on MTL for async flips
-:45: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
3aba2fed0cfa drm/i915/fb: Fix error handling onion in intel_framebuffer_init()
575b752f9482 drm/i915/dpt: Stop allocation DPTs from stolen
fce87d034f58 drm/i915/fb_pin: Remove overzealous vma NULL checks
c99fba5b8967 drm/i915: intel_{remapped, rotation}_info_size() into intel/gtt_view_types.h
18748d8d85fa drm/i915/dpt: Compute DPT size in the DPT code
ccb9afc6947e drm/i915/vma: Extract intel_gtt_view_compare()
-:74: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#74: FILE: drivers/gpu/drm/i915/i915_vma.h:252:
+	GEM_BUG_ON(view && !i915_is_ggtt_or_dpt(vm));

total: 0 errors, 1 warnings, 0 checks, 63 lines checked
8c9b05e88884 drm/i915/vma: Introduce i915_vma_lookup()
-:57: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#57: FILE: drivers/gpu/drm/i915/i915_vma.c:330:
+	GEM_BUG_ON(view && !i915_is_ggtt_or_dpt(vm));

-:58: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#58: FILE: drivers/gpu/drm/i915/i915_vma.c:331:
+	GEM_BUG_ON(!kref_read(&vm->ref));

total: 0 errors, 2 warnings, 0 checks, 69 lines checked
da8ec096b283 drm/i915/dpt: Make i915_dpt_{suspend, resume}() internal to i915
fcc4d8f6e070 drm/i915/dpt: Cache DPTs in the gem object
42e1b4bc03b6 drm/i915/dpt: Hide the DPT even more from the display code
80194fe13ee8 drm/i915/dpt: Remove dpt->vma
4a974e0e402c drm/i915/dpt: s/struct intel_dpt/struct i915_dpt/


