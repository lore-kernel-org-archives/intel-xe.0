Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F253C55ABA
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 15:22:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA3E10EED4;
	Wed,  5 Aug 2026 15:22:21 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D591610EED7;
 Wed,  5 Aug 2026 15:22:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_device_page_migration?=
 =?utf-8?q?_in_low_memory_fallback?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Aug 2026 15:22:20 -0000
Message-ID: <178594334087.21461.17359992907916666710@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260805113338.3742178-1-matthew.brost@intel.com>
In-Reply-To: <20260805113338.3742178-1-matthew.brost@intel.com>
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

Series: Fix device page migration in low memory fallback
URL   : https://patchwork.freedesktop.org/series/171651/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 736b7f802b4297f160069ec61b375c2eddb5d473
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Aug 5 04:33:38 2026 -0700

    drm/pagemap: Add fault injection for higher-order RAM folio allocation
    
    Migrating a device-private THP back to system memory has two distinct
    paths in __migrate_device_pages(): the fast path where both source and
    destination carry MIGRATE_PFN_COMPOUND, and the fallback path where the
    destination could only be satisfied with order-0 folios and the source
    THP therefore has to be split via migrate_vma_split_unmapped_folio().
    
    The fallback path only triggers under genuine memory pressure, which
    makes it both rare and awkward to reproduce, yet it is the path where
    the interesting refcounting happens (the CPU fault holds an extra
    reference on the device folio taken by do_huge_pmd_device_private()).
    
    Add a fault_attr, modelled on backup_fault_inject in ttm_pool.c, that
    forces the higher-order allocation in
    drm_pagemap_migrate_populate_ram_pfn() to fail so the existing order-0
    fallback is taken deterministically.
    
    The attribute is exposed at /sys/kernel/debug/drm_pagemap_fault_inject
    and requires CONFIG_FAULT_INJECTION_DEBUG_FS. With
    CONFIG_FAULT_INJECTION disabled the helper compiles out to a constant
    false and the injection has no cost.
    
    Cc: Andrew Morton <akpm@linux-foundation.org>
    Cc: David Hildenbrand <david@kernel.org>
    Cc: Lorenzo Stoakes <ljs@kernel.org>
    Cc: Zi Yan <ziy@nvidia.com>
    Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
    Cc: Liam R. Howlett <liam@infradead.org>
    Cc: Nico Pache <nico.pache@linux.dev>
    Cc: Ryan Roberts <ryan.roberts@arm.com>
    Cc: Dev Jain <dev.jain@arm.com>
    Cc: Barry Song <baohua@kernel.org>
    Cc: Lance Yang <lance.yang@linux.dev>
    Cc: Usama Arif <usama.arif@linux.dev>
    Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
    Cc: Rakie Kim <rakie.kim@sk.com>
    Cc: Byungchul Park <byungchul@sk.com>
    Cc: Gregory Price <gourry@gourry.net>
    Cc: Ying Huang <ying.huang@linux.alibaba.com>
    Cc: Alistair Popple <apopple@nvidia.com>
    Cc: Balbir Singh <balbirs@nvidia.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Maxime Ripard <mripard@kernel.org>
    Cc: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: David Airlie <airlied@gmail.com>
    Cc: Simona Vetter <simona@ffwll.ch>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Cc: dri-devel@lists.freedesktop.org
    Cc: linux-mm@kvack.org
    Cc: linux-kernel@vger.kernel.org
    Cc: stable@vger.kernel.org
    Assisted-by: GitHub Copilot:claude-opus-5
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch b50d67c8afa30f742e87999b53f80d22f8be4ffc drm-intel
b2b124c65ad7 mm/migrate_device: Fix THP splitting of a CPU faulted device private folio
-:136: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#136: 
Assisted-by: GitHub Copilot:claude-opus-5

total: 0 errors, 1 warnings, 0 checks, 133 lines checked
6757a8e3bf13 mm/migrate_device: Apply the fault reference to the correct folio
-:63: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#63: 
Assisted-by: GitHub Copilot:claude-opus-5

-:87: CHECK:SPACING: spaces preferred around that '+' (ctx:VxV)
#87: FILE: mm/migrate_device.c:1300:
+			struct page *src_page = migrate_pfn_to_page(src_pfns[i+j]);
 			                                                      ^

total: 0 errors, 1 warnings, 1 checks, 37 lines checked
85ebfbd0a2db drm/pagemap: Fix folio allocation fallback and use-after-put
-:75: WARNING:BAD_SIGN_OFF: Duplicate signature
#75: 
Cc: stable@vger.kernel.org

-:76: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#76: 
Assisted-by: GitHub Copilot:claude-opus-5

total: 0 errors, 2 warnings, 0 checks, 168 lines checked
736b7f802b42 drm/pagemap: Add fault injection for higher-order RAM folio allocation
-:61: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#61: 
Assisted-by: GitHub Copilot:claude-opus-5

-:131: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 60 lines checked


