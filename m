Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10C8E7FDD8
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 21:17:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F5C10E3CE;
	Mon,  2 Feb 2026 21:17:08 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9035D10E2E8;
 Mon,  2 Feb 2026 21:17:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Remove_device_private_pag?=
 =?utf-8?q?es_from_physical_address_space_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jordan Niethe" <jniethe@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Feb 2026 21:17:07 -0000
Message-ID: <177006702756.217507.12913536391381159483@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260202113642.59295-1-jniethe@nvidia.com>
In-Reply-To: <20260202113642.59295-1-jniethe@nvidia.com>
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

Series: Remove device private pages from physical address space (rev9)
URL   : https://patchwork.freedesktop.org/series/159738/
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
commit 8da79889c3c65d44032f8a722f8e3d63f6025de1
Author: Jordan Niethe <jniethe@nvidia.com>
Date:   Mon Feb 2 22:36:42 2026 +1100

    mm: Remove device private pages from the physical address space
    
    The existing design of device private memory imposes limitations which
    render it non functional for certain systems and configurations where
    the physical address space is limited.
    
    Device private memory is implemented by first reserving a region of the
    physical address space. This is a problem. The physical address space is
    not a resource that is directly under the kernel's control. Availability
    of suitable physical address space is constrained by the underlying
    hardware and firmware and may not always be available.
    
    Device private memory assumes that it will be able to reserve a device
    memory sized chunk of physical address space. However, there is nothing
    guaranteeing that this will succeed, and there a number of factors that
    increase the likelihood of failure. We need to consider what else may
    exist in the physical address space. It is observed that certain VM
    configurations place very large PCI windows immediately after RAM. Large
    enough that there is no physical address space available at all for
    device private memory. This is more likely to occur on 43 bit physical
    width systems which have less physical address space.
    
    Instead of using the physical address space, introduce a device private
    address space and allocate devices regions from there to represent the
    device private pages.
    
    Introduce a new interface memremap_device_private_pagemap() that
    allocates a requested amount of device private address space and creates
    the necessary device private pages.
    
    To support this new interface, struct dev_pagemap needs some changes:
    
      - Add a new dev_pagemap::nr_pages field as an input parameter.
      - Add a new dev_pagemap::pages array to store the device
        private pages.
    
    When using memremap_device_private_pagemap(), rather then passing in
    dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address space to
    be remapped, dev_pagemap::nr_ranges will always be 1, and the device
    private range that is reserved is returned in dev_pagemap::range.
    
    Forbid calling memremap_pages() with dev_pagemap::ranges::type =
    MEMORY_DEVICE_PRIVATE.
    
    Represent this device private address space using a new
    device_private_pgmap_tree maple tree. This tree maps a given device
    private address to a struct dev_pagemap, where a specific device private
    page may then be looked up in that dev_pagemap::pages array.
    
    Device private address space can be reclaimed and the assoicated device
    private pages freed using the corresponding new
    memunmap_device_private_pagemap() interface.
    
    Because the device private pages now live outside the physical address
    space, they no longer have a normal PFN. This means that page_to_pfn(),
    et al. are no longer meaningful.
    
    Introduce helpers:
    
      - device_private_page_to_offset()
      - device_private_folio_to_offset()
    
    to take a given device private page / folio and return its offset within
    the device private address space.
    
    Update the places where we previously converted a device private page to
    a PFN to use these new helpers. When we encounter a device private
    offset, instead of looking up its page within the pagemap use
    device_private_offset_to_page() instead.
    
    Update the existing users:
    
     - lib/test_hmm.c
     - ppc ultravisor
     - drm/amd/amdkfd
     - gpu/drm/xe
     - gpu/drm/nouveau
    
    to use the new memremap_device_private_pagemap() interface.
    
    Acked-by: Felix Kuehling <felix.kuehling@amd.com>
    Reviewed-by: Zi Yan <ziy@nvidia.com> # for MM changes
    Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
    Signed-off-by: Alistair Popple <apopple@nvidia.com>
+ /mt/dim checkpatch b80983450d283269c8f38c96b66f0f97322be346 drm-intel
dbd6d09163f6 mm/migrate_device: Introduce migrate_pfn_from_page() helper
e2d454de7920 drm/amdkfd: Use migrate pfns internally
4199ec5cfab2 mm/migrate_device: Make migrate_device_{pfns, range}() take mpfns
-:215: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#215: FILE: mm/migrate_device.c:1394:
+int migrate_device_range(unsigned long *src_mpfns, unsigned long start,
 			unsigned long npages)

-:235: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#235: FILE: mm/migrate_device.c:1408:
+				src_mpfns[i+j] = 0;
 				           ^

-:279: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#279: FILE: mm/migrate_device.c:1444:
+				src_mpfns[i+j] = 0;
 				           ^

total: 0 errors, 0 warnings, 3 checks, 220 lines checked
d0a1d952dd5b mm/migrate_device: Add migrate PFN flag to track device private pages
c760c14b2084 mm/page_vma_mapped: Add flag to page_vma_mapped_walk::flags to track device private pages
e0dff233fe01 mm: Add helpers to create migration entries from struct pages
-:137: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#137: FILE: mm/huge_memory.c:2528:
+			entry = make_readable_exclusive_migration_entry_from_page(

-:142: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#142: FILE: mm/huge_memory.c:2532:
+			entry = make_readable_migration_entry_from_page(

-:154: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#154: FILE: mm/huge_memory.c:3191:
+				swp_entry = make_writable_migration_entry_from_page(

-:159: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#159: FILE: mm/huge_memory.c:3194:
+				swp_entry = make_readable_exclusive_migration_entry_from_page(

-:164: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#164: FILE: mm/huge_memory.c:3197:
+				swp_entry = make_readable_migration_entry_from_page(

-:194: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#194: FILE: mm/hugetlb.c:4958:
+				softleaf = make_readable_migration_entry_from_page(

-:206: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#206: FILE: mm/hugetlb.c:6495:
+					entry = make_readable_exclusive_migration_entry_from_page(

-:212: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#212: FILE: mm/hugetlb.c:6499:
+					entry = make_readable_migration_entry_from_page(

-:228: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#228: FILE: mm/memory.c:966:
+			entry = make_readable_migration_entry_from_page(

-:244: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#244: FILE: mm/migrate_device.c:435:
+				entry = make_writable_migration_entry_from_page(

-:249: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#249: FILE: mm/migrate_device.c:438:
+				entry = make_readable_exclusive_migration_entry_from_page(

-:254: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#254: FILE: mm/migrate_device.c:441:
+				entry = make_readable_migration_entry_from_page(

-:269: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#269: FILE: mm/mprotect.c:331:
+					entry = make_readable_exclusive_migration_entry_from_page(

-:274: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#274: FILE: mm/mprotect.c:335:
+					entry = make_readable_migration_entry_from_page(

-:291: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#291: FILE: mm/rmap.c:2539:
+				entry = make_writable_migration_entry_from_page(

-:296: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#296: FILE: mm/rmap.c:2542:
+				entry = make_readable_exclusive_migration_entry_from_page(

-:301: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#301: FILE: mm/rmap.c:2545:
+				entry = make_readable_migration_entry_from_page(

total: 0 errors, 0 warnings, 17 checks, 235 lines checked
c5522dca6574 mm: Add a new swap type for migration entries of device private pages
-:63: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#63: FILE: include/linux/swap.h:86:
+#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
                                                 ^

-:63: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#63: FILE: include/linux/swap.h:86:
+#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
                                                                  ^

-:63: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#63: FILE: include/linux/swap.h:86:
+#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
                                                                                    ^

-:64: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#64: FILE: include/linux/swap.h:87:
+#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
                                                           ^

-:64: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#64: FILE: include/linux/swap.h:87:
+#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
                                                                            ^

-:64: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#64: FILE: include/linux/swap.h:87:
+#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
                                                                                              ^

-:65: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#65: FILE: include/linux/swap.h:88:
+#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
                                                  ^

-:65: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#65: FILE: include/linux/swap.h:88:
+#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
                                                                   ^

-:65: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#65: FILE: include/linux/swap.h:88:
+#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
                                                                                     ^

total: 0 errors, 0 warnings, 9 checks, 61 lines checked
161b6167faf2 mm: Add softleaf support for device private migration entries
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
  - SWP_MIGRATION_DEVICE_READ_EXCLUSIVE -> SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE

total: 0 errors, 1 warnings, 0 checks, 139 lines checked
9d7d8b795b67 mm: Begin creating device private migration entries
-:23: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#23: FILE: include/linux/swapops.h:210:
+		return make_readable_migration_device_private_entry(

-:34: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#34: FILE: include/linux/swapops.h:225:
+		return make_readable_exclusive_migration_device_private_entry(

-:45: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#45: FILE: include/linux/swapops.h:240:
+		return make_writable_migration_device_private_entry(

total: 0 errors, 0 warnings, 3 checks, 30 lines checked
821827c1f136 mm: Add helpers to create device private entries from struct pages
-:88: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#88: FILE: mm/huge_memory.c:3222:
+				swp_entry = make_writable_device_private_entry_from_page(

-:93: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#93: FILE: mm/huge_memory.c:3225:
+				swp_entry = make_readable_device_private_entry_from_page(

total: 0 errors, 0 warnings, 2 checks, 113 lines checked
03b96f89c997 mm/util: Add flag to track device private pages in page snapshots
829c19d4d197 mm/hmm: Add flag to track device private pages
8da79889c3c6 mm: Remove device private pages from the physical address space
-:580: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#580: FILE: include/linux/memremap.h:306:
+static inline int devm_memremap_device_private_pagemap(struct device *dev,
+		struct dev_pagemap *pgmap)

-:592: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#592: FILE: include/linux/memremap.h:318:
+static inline void devm_memunmap_device_private_pagemap(struct device *dev,
+		struct dev_pagemap *pgmap)

-:909: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#909: FILE: mm/debug.c:81:
+	pr_warn("page: refcount:%d mapcount:%d mapping:%p index:%#lx %spfn:%#lx\n",
 			folio_ref_count(folio), mapcount, mapping,

-:1067: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1067: FILE: mm/memremap.c:388:
+	ret = devm_add_action_or_reset(dev, devm_memremap_device_private_pagemap_release,
+			pgmap);

total: 0 errors, 0 warnings, 4 checks, 1172 lines checked


