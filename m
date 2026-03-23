Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECB8EC01A9
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 09:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9363310E0B6;
	Mon, 23 Mar 2026 09:40:46 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6148F10E0B6;
 Mon, 23 Mar 2026 09:40:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/madvise=3A_Add_sup?=
 =?utf-8?q?port_for_purgeable_buffer_objects_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Mar 2026 09:40:45 -0000
Message-ID: <177425884537.384777.7254904201793089114@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260323093106.2986900-1-arvind.yadav@intel.com>
In-Reply-To: <20260323093106.2986900-1-arvind.yadav@intel.com>
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

Series: drm/xe/madvise: Add support for purgeable buffer objects (rev8)
URL   : https://patchwork.freedesktop.org/series/156651/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0952626bd51291fbb52833d8b6e629a4ae3502d6
Author: Arvind Yadav <arvind.yadav@intel.com>
Date:   Mon Mar 23 15:01:01 2026 +0530

    drm/xe/madvise: Accept canonical GPU addresses in xe_vm_madvise_ioctl
    
    Userspace passes canonical (sign-extended) GPU addresses where bits 63:48
    mirror bit 47. The internal GPUVM uses non-canonical form (upper bits
    zeroed), so passing raw canonical addresses into GPUVM lookups causes
    mismatches for addresses above 128TiB.
    
    Strip the sign extension with xe_device_uncanonicalize_addr() at the
    top of xe_vm_madvise_ioctl(). Non-canonical addresses are unaffected.
    
    Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
    
    Suggested-by: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
+ /mt/dim checkpatch aea7130e799d7d9a09c00f453f7edda33f4587e7 drm-intel
81eb56e4fb82 drm/xe/uapi: Add UAPI support for purgeable buffer objects
1f46e4a73bc3 drm/xe/bo: Add purgeable bo state tracking and field madv to xe_bo
8a15573b0868 drm/xe/madvise: Implement purgeable buffer object support
-:23: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#23: 
  - Async TLB invalidation via trigger_rebind (no blocking xe_vm_invalidate_vma)

-:132: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#132: FILE: drivers/gpu/drm/xe/xe_bo.c:856:
+	xe_assert(xe, new_state == XE_MADV_PURGEABLE_WILLNEED ||
+		      new_state == XE_MADV_PURGEABLE_DONTNEED ||

total: 0 errors, 1 warnings, 1 checks, 517 lines checked
cd8447dbb9f5 drm/xe/bo: Block CPU faults to purgeable buffer objects
3a868969ec09 drm/xe/vm: Prevent binding of purged buffer objects
-:37: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#37: 
  - Replace three boolean parameters with struct xe_vma_lock_and_validate_flags

-:123: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#123: FILE: drivers/gpu/drm/xe/xe_vm.c:3060:
+							.request_decompress = op->map.request_decompress,

total: 0 errors, 2 warnings, 0 checks, 131 lines checked
14d60d5357c6 drm/xe/madvise: Implement per-VMA purgeable state tracking
9225a876d963 drm/xe/madvise: Block imported and exported dma-bufs
-:51: CHECK:LINE_SPACING: Please don't use multiple blank lines
#51: FILE: drivers/gpu/drm/xe/xe_vm_madvise.c:188:
 
+

total: 0 errors, 0 warnings, 1 checks, 56 lines checked
27b3b103f5cf drm/xe/bo: Block mmap of DONTNEED/purged BOs
a0acce580eb3 drm/xe/dma_buf: Block export of DONTNEED/purged BOs
66049647446d drm/xe/bo: Add purgeable shrinker state helpers
-:34: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#34: 
  - Merge xe_bo_set_purgeable_shrinker() and xe_bo_clear_purgeable_shrinker()

total: 0 errors, 1 warnings, 0 checks, 67 lines checked
41a5701076e4 drm/xe/madvise: Enable purgeable buffer object IOCTL support
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
This final patch enables userspace to use the DRM_XE_VMA_ATTR_PURGEABLE_STATE

total: 0 errors, 1 warnings, 0 checks, 43 lines checked
0952626bd512 drm/xe/madvise: Accept canonical GPU addresses in xe_vm_madvise_ioctl


