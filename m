Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C28FFF8860
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 13:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C1610E2A6;
	Mon, 27 Apr 2026 13:36:34 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A2A10E2A6;
 Mon, 27 Apr 2026 13:36:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_halted_scanning_of_sw?=
 =?utf-8?q?ap-cache_folios?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Apr 2026 13:36:34 -0000
Message-ID: <177729699448.13242.14913952702255022225@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260427103532.5623-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260427103532.5623-1-thomas.hellstrom@linux.intel.com>
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

Series: Fix halted scanning of swap-cache folios
URL   : https://patchwork.freedesktop.org/series/165518/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2d37551001d86c3869ebebb4f0679f1e64fecd5e
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Mon Apr 27 12:35:32 2026 +0200

    mm: vmscan: keep anon scanning enabled when swapcache folios are present
    
    Two separate guards in the reclaim path suppress all anon-LRU scanning
    when swap space is exhausted or nearly so:
    
      can_reclaim_anon_pages()   –  returns false when get_nr_swap_pages()==0
                                     (or the memcg swap limit is reached);
                                     used by the non-MGLRU get_scan_count() and
                                     several MGLRU helper estimations.
    
      get_swappiness() [MGLRU]   –  returns 0 when the above condition holds AND
                                     the per-memcg free-swap count drops below
                                     MIN_LRU_BATCH, causing for_each_evictable_type()
                                     to skip LRU_GEN_ANON entirely.
    
    Both guards exist for a good reason: if there is no swap space, trying to
    write out an anon folio is pointless because folio_alloc_swap() will fail
    before a slot can be assigned.  The scan overhead is wasted and may delay
    reclaiming more useful file-backed pages.
    
    However, both guards conflate two conceptually different populations of
    anon pages:
    
      1. Anon pages that have never been backed by swap.
         These require a free slot before they can be reclaimed.
         The guards are correct for this group.
    
      2. Anon folios that are already in the swap cache (PG_swapcache set).
         These carry a pre-allocated swap slot.  Writing them back and
         dropping their RAM backing does NOT consume a new slot: the slot
         already exists and its map-count is held at >= 1 (via
         folio_dup_swap()) until the content has been safely stored.
         Reclaiming such a folio frees nr_pages of RAM while leaving the
         slot count unchanged.
    
    Because the two guards do not distinguish between these groups, they
    suppress anon scanning for the entire LRU once swap becomes scarce,
    even when swapcache folios are present that could be reclaimed for free.
    The practical consequence is that those folios remain in RAM,
    blocking forward progress under memory pressure.
    
    Fix this by continuing the scan while there are pages in the swap cache
    
    RFC:
    This might actually be intentional: accepting a presumably small number
    of freeable pages in the swap cache to avoid costly LRU scans?
    
    There might also be more efficient fixes, like introducing a separate
    LRU list for swapcache pages?
    
    Cc: Andrew Morton <akpm@linux-foundation.org>
    Cc: David Hildenbrand <david@kernel.org>
    Cc: Michal Hocko <mhocko@kernel.org>
    Cc: Qi Zheng <zhengqi.arch@bytedance.com>
    Cc: Shakeel Butt <shakeel.butt@linux.dev>
    Cc: Lorenzo Stoakes <ljs@kernel.org>
    Cc: Axel Rasmussen <axelrasmussen@google.com>
    Cc: Yuanchu Xie <yuanchu@google.com>
    Cc: Wei Xu <weixugc@google.com>
    Cc: Brian Geffon <bgeffon@google.com>
    Cc: Steven Barrett <steven@liquorix.net>
    Cc: Oleksandr Natalenko <oleksandr@natalenko.name>
    Cc: linux-mm@kvack.org
    Cc: linux-kernel@vger.kernel.org
    Fixes: ac35a4902374 ("mm: multi-gen LRU: minimal implementation")
    Fixes: a2a36488a61c ("mm/vmscan: Consider anonymous pages without swap")
    Assisted-by: GitHub Copilot:claude-sonnet-4.6
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch fce38e768e144d1935086ce9fb66da3a9907029b drm-intel
2d37551001d8 mm: vmscan: keep anon scanning enabled when swapcache folios are present
-:18: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#18: 
  get_swappiness() [MGLRU]   –  returns 0 when the above condition holds AND

-:74: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#74: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 0 errors, 2 warnings, 0 checks, 33 lines checked


