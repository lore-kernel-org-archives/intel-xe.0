Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC8DEDE997
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 03:10:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DD610E5B9;
	Wed, 11 Sep 2024 03:10:05 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5460810E5B9;
 Wed, 11 Sep 2024 03:10:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_device_private_page_l?=
 =?utf-8?q?ivelock_on_CPU_fault?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Sep 2024 03:10:04 -0000
Message-ID: <172602420433.983473.7320304334548775969@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240911030337.870160-1-matthew.brost@intel.com>
In-Reply-To: <20240911030337.870160-1-matthew.brost@intel.com>
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

Series: Fix device private page livelock on CPU fault
URL   : https://patchwork.freedesktop.org/series/138497/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a4b4054ef029e32d07154acac270ada3909e9cce
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Sep 10 20:03:37 2024 -0700

    mm/migrate: Trylock device page in do_swap_page
    
    Avoid multiple CPU page faults to the same device page racing by locking
    the page in do_swap_page before taking an additional reference to the
    page. This prevents scenarios where multiple CPU page faults each take
    an extra reference to a device page, which could abort migration in
    folio_migrate_mapping. With the device page locked in do_swap_page, the
    migrate_vma_* functions need to be updated to avoid locking the
    fault_page argument.
    
    Prior to this change, a livelock scenario could occur in Xe's (Intel GPU
    DRM driver) SVM implementation if enough threads faulted the same device
    page.
    
    Cc: Philip Yang <Philip.Yang@amd.com>
    Cc: Felix Kuehling <felix.kuehling@amd.com>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: Andrew Morton <akpm@linux-foundation.org>
    Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 43852924969a3fbe93796d71bece8e5539aa4845 drm-intel
a4b4054ef029 mm/migrate: Trylock device page in do_swap_page
-:25: WARNING:BAD_SIGN_OFF: Non-standard signature: 'Suggessted-by:' - perhaps 'Suggested-by:'?
#25: 
Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>

-:180: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#180: FILE: mm/migrate_device.c:874:
+void migrate_device_finalize(unsigned long *src_pfns,
+			unsigned long *dst_pfns, unsigned long npages)

total: 0 errors, 1 warnings, 1 checks, 149 lines checked


