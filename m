Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DABD6CFDC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 06:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BE810EA51;
	Fri, 23 Jan 2026 06:30:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B2210E10A;
 Fri, 23 Jan 2026 06:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Remove_device_private_pag?=
 =?utf-8?q?es_from_physical_address_space_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jordan Niethe" <jniethe@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Jan 2026 06:30:11 -0000
Message-ID: <176914981143.186240.6543490593013952308@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260123062309.23090-1-jniethe@nvidia.com>
In-Reply-To: <20260123062309.23090-1-jniethe@nvidia.com>
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

Series: Remove device private pages from physical address space (rev5)
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
commit 1802d11c036e59160f648898603b993d191deff9
Author: Jordan Niethe <jniethe@nvidia.com>
Date:   Fri Jan 23 17:23:09 2026 +1100

    mm: Remove device private pages from the physical address space
    
    Currently when creating device private struct pages, the first step is
    to use request_free_mem_region() to get a range of physical address
    space large enough to represent the devices memory. This allocated
    physical address range is then remapped as device private memory using
    memremap_pages().
    
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
+ /mt/dim checkpatch 4a255b429d80f8b0800bdef43ba3175b771e77ff drm-intel
194d435cc980 mm/migrate_device: Introduce migrate_pfn_from_page() helper
ab50de99e563 drm/amdkfd: Use migrate pfns internally
807b654cd212 mm/migrate_device: Make migrate_device_{pfns, range}() take mpfns
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
317cbbab0ef1 mm/migrate_device: Add migrate PFN flag to track device private pages
8d3f2e81810a mm/page_vma_mapped: Add flag to page_vma_mapped_walk::flags to track device private pages
a4f0d38701db mm: Add helpers to create migration entries from struct pages
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
#193: FILE: mm/hugetlb.c:4958:
+				softleaf = make_readable_migration_entry_from_page(

-:205: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#205: FILE: mm/hugetlb.c:6511:
+					entry = make_readable_exclusive_migration_entry_from_page(

-:211: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#211: FILE: mm/hugetlb.c:6515:
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
38619cdddc5a mm: Add a new swap type for migration entries of device private pages
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
b4561fd2eece mm: Add softleaf support for device private migration entries
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
  - SWP_MIGRATION_DEVICE_READ_EXCLUSIVE -> SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE

total: 0 errors, 1 warnings, 0 checks, 139 lines checked
033968b40f43 mm: Begin creating device private migration entries
-:23: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#23: FILE: include/linux/swapops.h:209:
+		return make_readable_migration_device_private_entry(

-:34: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#34: FILE: include/linux/swapops.h:224:
+		return make_readable_exclusive_migration_device_private_entry(

-:45: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#45: FILE: include/linux/swapops.h:239:
+		return make_writable_migration_device_private_entry(

total: 0 errors, 0 warnings, 3 checks, 30 lines checked
d31f873267a1 mm: Add helpers to create device private entries from struct pages
-:88: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#88: FILE: mm/huge_memory.c:3222:
+				swp_entry = make_writable_device_private_entry_from_page(

-:93: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#93: FILE: mm/huge_memory.c:3225:
+				swp_entry = make_readable_device_private_entry_from_page(

total: 0 errors, 0 warnings, 2 checks, 113 lines checked
031758330705 mm/util: Add flag to track device private pages in page snapshots
-:32: CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the previous line
#32: FILE: fs/proc/page.c:199:
+	} else if (!(ps.flags & PAGE_SNAPSHOT_DEVICE_PRIVATE)
+		   && is_zero_pfn(ps.pfn)) {

total: 0 errors, 0 warnings, 1 checks, 36 lines checked
a903a479162c mm/hmm: Add flag to track device private pages
1802d11c036e mm: Remove device private pages from the physical address space
-:542: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#542: FILE: include/linux/memremap.h:235:
+void __init_zone_device_page(struct page *page, unsigned long pfn,
+	unsigned long zone_idx, int nid,

-:573: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#573: FILE: include/linux/memremap.h:303:
+static inline int devm_memremap_device_private_pagemap(struct device *dev,
+		struct dev_pagemap *pgmap)

-:585: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#585: FILE: include/linux/memremap.h:315:
+static inline void devm_memunmap_device_private_pagemap(struct device *dev,
+		struct dev_pagemap *pgmap)

-:902: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#902: FILE: mm/debug.c:81:
+	pr_warn("page: refcount:%d mapcount:%d mapping:%p index:%#lx %spfn:%#lx\n",
 			folio_ref_count(folio), mapcount, mapping,

-:1060: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1060: FILE: mm/memremap.c:388:
+	ret = devm_add_action_or_reset(dev, devm_memremap_device_private_pagemap_release,
+			pgmap);

-:1102: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kvzalloc(sizeof(*pgmap->pages)...) over kvzalloc(sizeof(struct page)...)
#1102: FILE: mm/memremap.c:522:
+	pgmap->pages = kvzalloc(sizeof(struct page) * pgmap->nr_pages,

-:1103: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1103: FILE: mm/memremap.c:523:
+	pgmap->pages = kvzalloc(sizeof(struct page) * pgmap->nr_pages,
+			       GFP_KERNEL);

-:1119: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1119: FILE: mm/memremap.c:539:
+	rc = percpu_ref_init(&pgmap->ref, dev_pagemap_percpu_release, 0,
+		GFP_KERNEL);

-:1132: CHECK:SPACING: No space is necessary after a cast
#1132: FILE: mm/memremap.c:552:
+		page_folio(page)->pgmap = (void *) pgmap;

-:1172: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1172: FILE: mm/memremap.c:592:
+	if (!((softleaf_is_device_private(entry) ||
+	    (softleaf_is_migration_device_private(entry)))))

-:1181: CHECK:SPACING: No space is necessary after a cast
#1181: FILE: mm/memremap.c:601:
+	struct dev_pagemap *pgmap = (struct dev_pagemap *) page_pgmap(page);

total: 0 errors, 0 warnings, 11 checks, 1169 lines checked


