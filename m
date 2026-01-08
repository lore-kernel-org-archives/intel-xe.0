Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD98D148A3
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 06:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC17110E55D;
	Thu,  8 Jan 2026 06:10:26 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF2910E27B;
 Thu,  8 Jan 2026 06:10:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Remove_device_private_pag?=
 =?utf-8?q?es_from_physical_address_space_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jordan Niethe" <jniethe@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Jan 2026 06:10:24 -0000
Message-ID: <176785262484.135428.13609327193189954305@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260108060102.41357-1-jniethe@nvidia.com>
In-Reply-To: <20260108060102.41357-1-jniethe@nvidia.com>
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

Series: Remove device private pages from physical address space (rev4)
URL   : https://patchwork.freedesktop.org/series/159738/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9f1cb6875f3f9eb0925ed50c16100322a2df513c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 18aa5ea72d71c1ffdb49330f7a373ae1142caabf
Author: Jordan Niethe <jniethe@nvidia.com>
Date:   Thu Jan 8 17:01:02 2026 +1100

    mm: Remove device private pages from the physical address space
    
    Currently when creating these device private struct pages, the first
    step is to use request_free_mem_region() to get a range of physical
    address space large enough to represent the devices memory. This
    allocated physical address range is then remapped as device private
    memory using memremap_pages().
    
    Needing allocation of physical address space has some problems:
    
      1) There may be insufficient physical address space to represent the
         device memory. KASLR reducing the physical address space and VM
         configurations with limited physical address space increase the
         likelihood of hitting this especially as device memory increases. This
         has been observed to prevent device private from being initialized.
    
      2) Attempting to add the device private pages to the linear map at
         addresses beyond the actual physical memory causes issues on
         architectures like aarch64 meaning the feature does not work there.
    
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
    
    Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
    Signed-off-by: Alistair Popple <apopple@nvidia.com>
+ /mt/dim checkpatch bbd2596084d7d562841571575239ef867c69bdce drm-intel
53e2447be466 mm/migrate_device: Introduce migrate_pfn_from_page() helper
89fd961c62a8 drm/amdkfd: Use migrate pfns internally
2b1a856ae366 mm/migrate_device: Make migrate_device_{pfns, range}() take mpfns
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
7fe03810d5e5 mm/migrate_device: Add migrate PFN flag to track device private pages
ece762160bdd mm/page_vma_mapped: Add flags to page_vma_mapped_walk::pfn to track device private pages
264ce669f77c mm: Add helpers to create migration entries from struct pages
-:136: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#136: FILE: mm/huge_memory.c:2528:
+			entry = make_readable_exclusive_migration_entry_from_page(

-:141: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#141: FILE: mm/huge_memory.c:2532:
+			entry = make_readable_migration_entry_from_page(

-:153: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#153: FILE: mm/huge_memory.c:3191:
+				swp_entry = make_writable_migration_entry_from_page(

-:158: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#158: FILE: mm/huge_memory.c:3194:
+				swp_entry = make_readable_exclusive_migration_entry_from_page(

-:163: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#163: FILE: mm/huge_memory.c:3197:
+				swp_entry = make_readable_migration_entry_from_page(

-:193: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#193: FILE: mm/hugetlb.c:4942:
+				softleaf = make_readable_migration_entry_from_page(

-:205: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#205: FILE: mm/hugetlb.c:6495:
+					entry = make_readable_exclusive_migration_entry_from_page(

-:211: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#211: FILE: mm/hugetlb.c:6499:
+					entry = make_readable_migration_entry_from_page(

-:227: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#227: FILE: mm/memory.c:966:
+			entry = make_readable_migration_entry_from_page(

-:243: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#243: FILE: mm/migrate_device.c:435:
+				entry = make_writable_migration_entry_from_page(

-:248: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#248: FILE: mm/migrate_device.c:438:
+				entry = make_readable_exclusive_migration_entry_from_page(

-:253: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#253: FILE: mm/migrate_device.c:441:
+				entry = make_readable_migration_entry_from_page(

-:268: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#268: FILE: mm/mprotect.c:331:
+					entry = make_readable_exclusive_migration_entry_from_page(

-:273: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#273: FILE: mm/mprotect.c:335:
+					entry = make_readable_migration_entry_from_page(

-:290: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#290: FILE: mm/rmap.c:2542:
+				entry = make_writable_migration_entry_from_page(

-:295: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#295: FILE: mm/rmap.c:2545:
+				entry = make_readable_exclusive_migration_entry_from_page(

-:300: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#300: FILE: mm/rmap.c:2548:
+				entry = make_readable_migration_entry_from_page(

total: 0 errors, 0 warnings, 17 checks, 234 lines checked
3c4133760de1 mm: Add a new swap type for migration entries of device private pages
-:207: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#207: FILE: include/linux/swap.h:86:
+#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
                                                 ^

-:207: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#207: FILE: include/linux/swap.h:86:
+#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
                                                                  ^

-:207: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#207: FILE: include/linux/swap.h:86:
+#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
                                                                                    ^

-:208: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#208: FILE: include/linux/swap.h:87:
+#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
                                                           ^

-:208: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#208: FILE: include/linux/swap.h:87:
+#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
                                                                            ^

-:208: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#208: FILE: include/linux/swap.h:87:
+#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
                                                                                              ^

-:209: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#209: FILE: include/linux/swap.h:88:
+#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
                                                  ^

-:209: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#209: FILE: include/linux/swap.h:88:
+#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
                                                                   ^

-:209: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#209: FILE: include/linux/swap.h:88:
+#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
                                                                                     ^

-:303: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#303: FILE: include/linux/swapops.h:246:
+		return make_readable_migration_device_private_entry(

-:314: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#314: FILE: include/linux/swapops.h:261:
+		return make_readable_exclusive_migration_device_private_entry(

-:325: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#325: FILE: include/linux/swapops.h:276:
+		return make_writable_migration_device_private_entry(

total: 0 errors, 0 warnings, 12 checks, 260 lines checked
b4fe3470bca5 mm: Add helpers to create device private entries from struct pages
-:88: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#88: FILE: mm/huge_memory.c:3222:
+				swp_entry = make_writable_device_private_entry_from_page(

-:93: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#93: FILE: mm/huge_memory.c:3225:
+				swp_entry = make_readable_device_private_entry_from_page(

total: 0 errors, 0 warnings, 2 checks, 113 lines checked
d0b96c8248e0 mm/util: Add flag to track device private pages in page snapshots
-:32: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#32: FILE: fs/proc/page.c:199:
+	} else if (!(ps.flags & PAGE_SNAPSHOT_DEVICE_PRIVATE)
+		   && is_zero_pfn(ps.pfn)) {

total: 0 errors, 0 warnings, 1 checks, 36 lines checked
91ad4cbdeb3f mm/hmm: Add flag to track device private pages
18aa5ea72d71 mm: Remove device private pages from the physical address space
-:533: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#533: FILE: include/linux/memremap.h:235:
+void __init_zone_device_page(struct page *page, unsigned long pfn,
+	unsigned long zone_idx, int nid,

-:564: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#564: FILE: include/linux/memremap.h:303:
+static inline int devm_memremap_device_private_pagemap(struct device *dev,
+		struct dev_pagemap *pgmap)

-:576: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#576: FILE: include/linux/memremap.h:315:
+static inline void devm_memunmap_device_private_pagemap(struct device *dev,
+		struct dev_pagemap *pgmap)

-:642: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#642: FILE: include/linux/mm.h:2041:
+	VM_BUG_ON(folio_is_device_private(folio));

-:870: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#870: FILE: lib/test_hmm.c:1723:
+		offset = device_private_folio_to_offset(tail) - device_private_folio_to_offset(head);

-:894: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#894: FILE: mm/debug.c:81:
+	pr_warn("page: refcount:%d mapcount:%d mapping:%p index:%#lx %spfn:%#lx\n",
 			folio_ref_count(folio), mapcount, mapping,

-:1052: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1052: FILE: mm/memremap.c:388:
+	ret = devm_add_action_or_reset(dev, devm_memremap_device_private_pagemap_release,
+			pgmap);

-:1094: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kvzalloc(sizeof(*pgmap->pages)...) over kvzalloc(sizeof(struct page)...)
#1094: FILE: mm/memremap.c:522:
+	pgmap->pages = kvzalloc(sizeof(struct page) * pgmap->nr_pages,

-:1095: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1095: FILE: mm/memremap.c:523:
+	pgmap->pages = kvzalloc(sizeof(struct page) * pgmap->nr_pages,
+			       GFP_KERNEL);

-:1111: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1111: FILE: mm/memremap.c:539:
+	rc = percpu_ref_init(&pgmap->ref, dev_pagemap_percpu_release, 0,
+		GFP_KERNEL);

-:1121: CHECK:SPACING: No space is necessary after a cast
#1121: FILE: mm/memremap.c:549:
+		page_folio(page)->pgmap = (void *) pgmap;

-:1161: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1161: FILE: mm/memremap.c:589:
+	if (!((softleaf_is_device_private(entry) ||
+	    (softleaf_is_migration_device_private(entry)))))

-:1170: CHECK:SPACING: No space is necessary after a cast
#1170: FILE: mm/memremap.c:598:
+	struct dev_pagemap *pgmap = (struct dev_pagemap *) page_pgmap(page);

-:1172: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#1172: FILE: mm/memremap.c:600:
+	VM_BUG_ON_PAGE(!is_device_private_page(page), page);

total: 0 errors, 3 warnings, 11 checks, 1155 lines checked


