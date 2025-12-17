Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6DDD64060
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 00:14:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E9910E9A2;
	Wed, 17 Dec 2025 00:14:58 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAA110E9A2;
 Wed, 17 Dec 2025 00:14:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_THP_support_in_drm?=
 =?utf-8?q?=5Fpagemap?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Dec 2025 00:14:56 -0000
Message-ID: <176593049617.95623.18332692723789571675@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251216201206.1660899-1-francois.dugast@intel.com>
In-Reply-To: <20251216201206.1660899-1-francois.dugast@intel.com>
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

Series: Enable THP support in drm_pagemap
URL   : https://patchwork.freedesktop.org/series/159119/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 045a2d7f4d8ee2fa2aae61b920215d726a7a81e3
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Tue Dec 16 21:10:14 2025 +0100

    drm/pagemap: Enable THP support for GPU memory migration
    
    This enables support for Transparent Huge Pages (THP) for device pages by
    using MIGRATE_VMA_SELECT_COMPOUND during migration. It removes the need to
    split folios and loop multiple times over all pages to perform required
    operations at page level. Instead, we rely on newly introduced support for
    higher orders in drm_pagemap and folio-level API.
    
    In Xe, this drastically improves performance when using SVM. The GT stats
    below collected after a 2MB page fault show overall servicing is more than
    7 times faster, and thanks to reduced CPU overhead the time spent on the
    actual copy goes from 23% without THP to 80% with THP:
    
    Without THP:
    
        svm_2M_pagefault_us: 966
        svm_2M_migrate_us: 942
        svm_2M_device_copy_us: 223
        svm_2M_get_pages_us: 9
        svm_2M_bind_us: 10
    
    With THP:
    
        svm_2M_pagefault_us: 132
        svm_2M_migrate_us: 128
        svm_2M_device_copy_us: 106
        svm_2M_get_pages_us: 1
        svm_2M_bind_us: 2
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Michal Mrozek <michal.mrozek@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 72428bdb20b6c86beaeddb9d69bf698d0697aa41 drm-intel
221fce297833 mm/migrate: Add migrate_device_split_page
-:86: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#86: FILE: mm/migrate_device.c:796:
+	VM_BUG_ON_FOLIO(!order, folio);

-:87: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#87: FILE: mm/migrate_device.c:797:
+	VM_BUG_ON_FOLIO(!folio_is_device_private(folio), folio);

-:88: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#88: FILE: mm/migrate_device.c:798:
+	VM_BUG_ON_FOLIO(folio_ref_count(folio), folio);

-:98: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#98: FILE: mm/migrate_device.c:808:
+		VM_BUG_ON_FOLIO(ret, folio);

total: 0 errors, 4 warnings, 0 checks, 95 lines checked
b0e9b0730b6b drm/pagemap: Unlock and put folios when possible
78646c2647f6 drm/pagemap: Add helper to access zone_device_data
045a2d7f4d8e drm/pagemap: Enable THP support for GPU memory migration


