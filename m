Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263CEE9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 21:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D798210E31E;
	Wed, 18 Feb 2026 21:52:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F8410E31B;
 Wed, 18 Feb 2026 21:52:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_nova-core=3A_Add_memory_m?=
 =?utf-8?q?anagement_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Feb 2026 21:52:36 -0000
Message-ID: <177145155652.264211.12690278580466446850@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
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

Series: nova-core: Add memory management support
URL   : https://patchwork.freedesktop.org/series/161791/
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
commit a4da7e403d44dee94d6c0d326a522a589a65a468
Author: Joel Fernandes <joelagnelf@nvidia.com>
Date:   Wed Feb 18 16:20:20 2026 -0500

    nova-core: mm: Add BarUser to struct Gpu and create at boot
    
    Add a BarUser field to struct Gpu and eagerly create it during GPU
    initialization. The BarUser provides the BAR1 user interface for CPU
    access to GPU virtual memory through the GPU's MMU.
    
    The BarUser is initialized using BAR1 PDE base address from GSP static
    info, MMU version and BAR1 size obtained from platform device.
    
    Cc: Nikola Djukic <ndjukic@nvidia.com>
    Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
+ /mt/dim checkpatch 7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5 drm-intel
f596709dbf5c nova-core: mm: Add support to use PRAMIN windows to write to VRAM
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 316 lines checked
386c402d7a38 docs: gpu: nova-core: Document the PRAMIN aperture mechanism
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 129 lines checked
b996aa00a275 nova-core: Add BAR1 aperture type and size constant
ceb20c4981b4 nova-core: gsp: Add BAR1 PDE base accessors
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
These addresses point to the root page tables for BAR1 virtual memory spaces.

total: 0 errors, 1 warnings, 0 checks, 47 lines checked
523640e1c4b2 nova-core: mm: Add common memory management types
1415e6d883bc nova-core: mm: Add common types for all page table formats
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 156 lines checked
94b27a15b495 nova-core: mm: Add MMU v2 page table types
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 206 lines checked
027ff6f89dba nova-core: mm: Add MMU v3 page table types
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

-:114: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#114: FILE: drivers/gpu/nova-core/mm/pagetable/ver3.rs:85:
+        1:1     no_ats      as bool, "Address Translation Services disabled (0=enabled, 1=disabled)";

-:181: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#181: FILE: drivers/gpu/nova-core/mm/pagetable/ver3.rs:152:
+        2:1     aperture    as u8 => AperturePde, "Memory aperture (0=invalid, 1=vidmem, 2=coherent, 3=non-coherent)";

total: 0 errors, 3 warnings, 0 checks, 309 lines checked
261f4c1d1c21 nova-core: mm: Add unified page table entry wrapper enums
6267773b9f99 nova-core: mm: Add TLB flush support
-:32: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#32: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 135 lines checked
6f21af6c6a75 nova-core: mm: Add GpuMm centralized memory manager
4dfc45c04dc2 nova-core: mm: Add page table walker for MMU v2/v3
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 220 lines checked
ac709df66072 nova-core: mm: Add Virtual Memory Manager
-:30: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#30: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 70 lines checked
4749822c02f9 nova-core: mm: Add virtual address range tracking to VMM
d93e8336db44 nova-core: mm: Add multi-page mapping API to VMM
dee99a774734 nova-core: mm: Add BAR1 user interface
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 168 lines checked
67f16577cb57 nova-core: gsp: Return GspStaticInfo and FbLayout from boot()
f7d2988e125f nova-core: mm: Add BAR1 memory management self-tests
e831326a03c1 nova-core: mm: Add PRAMIN aperture self-tests
a56c1804e0de nova-core: gsp: Extract usable FB region from GSP
834e3a8f9473 nova-core: fb: Add usable_vram field to FbLayout
95a95747d557 nova-core: mm: Use usable VRAM region for buddy allocator
a4da7e403d44 nova-core: mm: Add BarUser to struct Gpu and create at boot


