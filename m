Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E03F433CD
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 22:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB61F10E75E;
	Wed, 15 Apr 2026 22:00:32 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB8610E1F9;
 Wed, 15 Apr 2026 22:00:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?11=2C01/20=5D_gpu=3A_nova-core=3A_gsp=3A_Return_GspStaticInfo_fro?=
 =?utf-8?q?m_boot=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Apr 2026 22:00:31 -0000
Message-ID: <177629043182.465220.14572488847178611512@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260415210548.3776595-1-joelagnelf@nvidia.com>
In-Reply-To: <20260415210548.3776595-1-joelagnelf@nvidia.com>
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

Series: series starting with [v11,01/20] gpu: nova-core: gsp: Return GspStaticInfo from boot()
URL   : https://patchwork.freedesktop.org/series/164944/
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
commit 1c419740ba8242c6015c1defa6a2ec7e1ea8d06a
Author: Joel Fernandes <joelagnelf@nvidia.com>
Date:   Wed Apr 15 17:05:47 2026 -0400

    gpu: nova-core: mm: Add PRAMIN aperture self-tests
    
    Add self-tests for the PRAMIN aperture mechanism to verify correct
    operation during GPU probe. The tests validate various alignment
    requirements and corner cases.
    
    The tests are default disabled and behind CONFIG_NOVA_MM_SELFTESTS.
    When enabled, tests run after GSP boot during probe.
    
    Cc: Nikola Djukic <ndjukic@nvidia.com>
    Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
+ /mt/dim checkpatch 259d8b4db2633a121007a389ad6b9bfb1be1f9dd drm-intel
710ebd21aa4d gpu: nova-core: gsp: Return GspStaticInfo from boot()
d286516c85e6 gpu: nova-core: gsp: Extract usable FB region from GSP
abc0e85a01cd gpu: nova-core: gsp: Expose total physical VRAM end from FB region info
f2e3c50fd128 gpu: nova-core: mm: Add support to use PRAMIN windows to write to VRAM
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 314 lines checked
7325fd88d283 docs: gpu: nova-core: Document the PRAMIN aperture mechanism
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 127 lines checked
da8ed24586cf gpu: nova-core: mm: Add common memory management types
b386cdeffbff gpu: nova-core: mm: Add TLB flush support
-:32: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#32: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 151 lines checked
e2118179db1b gpu: nova-core: mm: Add GpuMm centralized memory manager
8a3fee70100f gpu: nova-core: mm: Add common types for all page table formats
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 164 lines checked
a48299a44358 gpu: nova-core: mm: Add MMU v2 page table types
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 279 lines checked
74b9dd4e9a8a gpu: nova-core: mm: Add MMU v3 page table types
-:46: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#46: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 414 lines checked
65a1701cd409 gpu: nova-core: mm: Add unified page table entry wrapper enums
f7d6ee7b29a5 gpu: nova-core: mm: Add page table walker for MMU v2/v3
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 249 lines checked
767ae1c443e6 gpu: nova-core: mm: Add Virtual Memory Manager
-:30: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#30: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 70 lines checked
16f8ed60cbb8 gpu: nova-core: mm: Add virtual address range tracking to VMM
e315df4f160b gpu: nova-core: mm: Add multi-page mapping API to VMM
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 623 lines checked
820e5d4d4131 gpu: nova-core: Add BAR1 aperture type and size constant
cee835e101ba gpu: nova-core: mm: Add BAR1 user interface
-:102: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#102: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 218 lines checked
82ea8913792d gpu: nova-core: mm: Add BAR1 memory management self-tests
1c419740ba82 gpu: nova-core: mm: Add PRAMIN aperture self-tests


