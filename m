Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76060C61DFD
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 09:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFFC10F088;
	Wed,  2 Sep 2026 09:10:36 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E1F10F088;
 Wed,  2 Sep 2026 09:10:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?4=2C1/2=5D_drm/pagemap=3A_dma-unmap_pages_before_handling_migrati?=
 =?utf-8?q?on_errors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Sep 2026 09:10:34 -0000
Message-ID: <178834023495.110735.6975034530174497923@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260902063504.3024362-1-matthew.brost@intel.com>
In-Reply-To: <20260902063504.3024362-1-matthew.brost@intel.com>
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

Series: series starting with [v4,1/2] drm/pagemap: dma-unmap pages before handling migration errors
URL   : https://patchwork.freedesktop.org/series/173190/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b98e226499737d0b1662ee03df19494d2c04d33d
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Sep 1 23:35:04 2026 -0700

    drm/pagemap: Fix folio allocation fallback and use-after-put
    
    drm_pagemap_migrate_populate_ram_pfn() had two issues when populating
    RAM PFNs with higher-order folios:
    
    1. The higher-order vma_alloc_folio()/folio_alloc() calls did not pass
       __GFP_NOWARN, so a THP allocation failure under memory pressure
       would spam the kernel log, and there was no fallback path despite a
       TODO comment stating one was needed. Add __GFP_NOWARN to the
       higher-order allocation and, on failure, fall back to order-0
       allocations for the entire range originally covered by the failed
       higher-order allocation, leaving MIGRATE_PFN_COMPOUND unset for
       those PFNs.
    
    2. In the free_pages error path, order was computed via
       folio_order(page_folio(page)) *after* put_page(page) had already
       dropped the reference, resulting in a use-after-free/put when that
       was the last reference on the page. Compute order before releasing
       the page.
    
    Introducing the fallback in 1. also requires the source page array
    handed to ->copy_to_ram() to be built differently. Both callers only
    populated the entry at the head of each source folio, relying on the
    copy callback to derive the rest of the folio from the order recorded
    in the matching drm_pagemap_addr. Once the destination has been demoted
    to order-0 folios the drm_pagemap_addr entries are per-page, so a source
    page is needed for every one of them; leaving them NULL makes the copy
    callback stop after the first page and the remainder of the range is
    never copied.
    
    The source folio is only split later, by migrate_vma_pages() /
    migrate_device_pages(), so its order cannot be used to detect the
    demotion - test the destination for MIGRATE_PFN_COMPOUND instead. Factor
    the array population out into drm_pagemap_migrate_populate_src_pages()
    and use it from both drm_pagemap_evict_to_ram() and
    __drm_pagemap_migrate_to_ram().
    
    Fixes: ddeda6136038 ("drm/pagemap: Allocate folios when possible")
    Cc: stable@vger.kernel.org
    Assisted-by: GitHub_Copilot:claude-opus-5
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch f6e82e1b1b96ea7150f101ce93f139e1ff131d67 drm-intel
6094771bc95b drm/pagemap: dma-unmap pages before handling migration errors
-:16: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#16: 
Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: f86ad0ed620c ("drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap")

total: 0 errors, 1 warnings, 0 checks, 34 lines checked
b98e22649973 drm/pagemap: Fix folio allocation fallback and use-after-put


