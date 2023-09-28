Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2853ECE7B10
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 09:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE17A10E5FD;
	Thu, 28 Sep 2023 09:31:42 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 698CC10E5FF;
 Thu, 28 Sep 2023 09:31:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 662A2A00CC;
 Thu, 28 Sep 2023 09:31:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 28 Sep 2023 09:31:41 -0000
Message-ID: <169589350141.21265.9654159360115782099@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230928092816.375130-7-matthew.auld@intel.com>
In-Reply-To: <20230928092816.375130-7-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PA?=
 =?utf-8?q?T_and_cache_coherency_support_=28rev6=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: PAT and cache coherency support (rev6)
URL   : https://patchwork.freedesktop.org/series/123027/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 55776995fbfb3520f824d7de09076d6d4e316ab2
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Sep 28 10:28:22 2023 +0100

    drm/xe/uapi: support pat_index selection with vm_bind
    
    Allow userspace to directly control the pat_index for a given vm
    binding. This should allow directly controlling the coherency, caching
    and potentially other stuff in the future for the ppGTT binding.
    
    The exact meaning behind the pat_index is very platform specific (see
    BSpec or PRMs) but effectively maps to some predefined memory
    attributes. From the KMD pov we only care about the coherency that is
    provided by the pat_index, which falls into either NONE, 1WAY or 2WAY.
    The vm_bind coherency mode for the given pat_index needs to be at least
    as coherent as the coh_mode that was set at object creation. For
    platforms that lack the explicit coherency mode, we treat UC/WT/WC as
    NONE and WB as AT_LEAST_1WAY.
    
    For userptr mappings we lack a corresponding gem object, so the expected
    coherency mode is instead implicit and must fall into either 1WAY or
    2WAY. Trying to use NONE will be rejected by the kernel. For imported
    dma-buf (from a different device) the coherency mode is also implicit
    and must also be either 1WAY or 2WAY i.e AT_LEAST_1WAY.
    
    v2:
      - Undefined coh_mode(pat_index) can now be treated as programmer
        error. (Matt Roper)
      - We now allow gem_create.coh_mode <= coh_mode(pat_index), rather than
        having to match exactly. This ensures imported dma-buf can always
        just use 1way (or even 2way), now that we also bundle 1way/2way into
        at_least_1way. We still require 1way/2way for external dma-buf, but
        the policy can now be the same for self-import, if desired.
      - Use u16 for pat_index in uapi. u32 is massive overkill. (José)
      - Move as much of the pat_index validation as we can into
        vm_bind_ioctl_check_args. (José)
    v3 (Matt Roper):
      - Split the pte_encode() refactoring into separate patch.
    v4:
      - Rebase
    
    Bspec: 45101, 44235 #xe
    Bspec: 70552, 71582, 59400 #xe2
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Pallavi Mishra <pallavi.mishra@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Cc: Filip Hazubski <filip.hazubski@intel.com>
    Cc: Carl Zhang <carl.zhang@intel.com>
    Cc: Effie Yu <effie.yu@intel.com>
+ /mt/dim checkpatch 7c58b58522cf124dd324fbf95d9dd838fac36bcb drm-intel
8c8f0e00e drm/xe/pat: trim the xelp PAT table
8d607a574 drm/xe: directly use pat_index for pte_encode
323b91909 drm/xe/uapi: Add support for cache and coherency mode
-:43: WARNING:BAD_SIGN_OFF: Non-standard signature: Co-authored-by:
#43: 
Co-authored-by: Matthew Auld <matthew.auld@intel.com>

-:97: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#97: FILE: drivers/gpu/drm/xe/xe_bo.c:1203:
+struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 				    struct xe_tile *tile, struct dma_resv *resv,

-:134: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#134: FILE: drivers/gpu/drm/xe/xe_bo.c:1357:
+	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
 				   vm && !xe_vm_in_fault_mode(vm) &&

-:267: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#267: FILE: drivers/gpu/drm/xe/xe_bo.h:87:
+struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 				    struct xe_tile *tile, struct dma_resv *resv,

total: 0 errors, 1 warnings, 3 checks, 281 lines checked
6070904f7 drm/xe/pat: annotate pat_index with coherency mode
-:72: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#72: FILE: drivers/gpu/drm/xe/xe_pat.c:38:
+	void (*program_graphics)(struct xe_gt *gt, const struct xe_pat_table_entry table[], int n_entries);

-:73: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#73: FILE: drivers/gpu/drm/xe/xe_pat.c:39:
+	void (*program_media)(struct xe_gt *gt, const struct xe_pat_table_entry table[], int n_entries);

total: 0 errors, 2 warnings, 0 checks, 148 lines checked
55776995f drm/xe/uapi: support pat_index selection with vm_bind


