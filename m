Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97C1FF885E
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 10:36:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789B310E69B;
	Mon, 27 Apr 2026 10:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IlPKhoFH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D908810E696
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 10:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777286159; x=1808822159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eNfYJi8qFB0xftXT3xe60DzRPizbftXxkLkbsak0mmk=;
 b=IlPKhoFHHCtuIGllm/KXpi0iQcEs5ZZ9nkN+5WBaWzxmhbbmDkLxFrhl
 S9t2+zFUbf0Z3Om1tNehOpWtfxKfmKLmuF46cVQnTXVfHitYMbRD993IO
 i9iiML846YNIzXG/EoPLV8nswuOU29nAR50JzpRvOqNMU0p6Bq/m9Zvmm
 6rM2trR4PeSFC5LuDwTpvi4gSsBf1mRC/qXFLlXczOnG4lzrujSRwER/3
 yJfzhzhXNMRO3PJZ7Lx5KKZ473nbFskrB1fPO0AxnByqPlQ4rGbDh0Ant
 Y506lVY/z9fEzkokUZtp8nzJnul0PYJzFN6d/v7EAhYAw6vijI8zq1mCf g==;
X-CSE-ConnectionGUID: yWKg9UnnTcW3gzQiUxC8Ew==
X-CSE-MsgGUID: O9iQXGuMRvCex3N/MeyBGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="100826051"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="100826051"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 03:35:59 -0700
X-CSE-ConnectionGUID: vAErtvypRGWcE36nxLgz8w==
X-CSE-MsgGUID: jlmqFKliQ/iOOrfYHjHg3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="264017016"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.36])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 03:35:56 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
 Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Brian Geffon <bgeffon@google.com>, Steven Barrett <steven@liquorix.net>,
 Oleksandr Natalenko <oleksandr@natalenko.name>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/1] mm: vmscan: keep anon scanning enabled when swapcache
 folios are present
Date: Mon, 27 Apr 2026 12:35:32 +0200
Message-ID: <20260427103532.5623-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427103532.5623-1-thomas.hellstrom@linux.intel.com>
References: <20260427103532.5623-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

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
---
 mm/vmscan.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 0fc9373e8251..f50a5fc99fc9 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -377,6 +377,15 @@ static inline bool can_reclaim_anon_pages(struct mem_cgroup *memcg,
 			return true;
 	}
 
+	/*
+	 * Even with no free swap slots, anon folios already in the swap cache
+	 * carry a pre-allocated slot and can be written back and freed from RAM
+	 * without consuming a new one.  Do not suppress anon scanning when such
+	 * folios are present on this node.
+	 */
+	if (node_page_state(NODE_DATA(nid), NR_SWAPCACHE) > 0)
+		return true;
+
 	/*
 	 * The page can not be swapped.
 	 *
@@ -2736,8 +2745,16 @@ static int get_swappiness(struct lruvec *lruvec, struct scan_control *sc)
 		return 0;
 
 	if (!can_demote(pgdat->node_id, sc, memcg) &&
-	    mem_cgroup_get_nr_swap_pages(memcg) < MIN_LRU_BATCH)
-		return 0;
+	    mem_cgroup_get_nr_swap_pages(memcg) < MIN_LRU_BATCH) {
+		/*
+		 * Even with few free swap slots, folios already in the swap
+		 * cache carry a pre-allocated slot and can be written back and
+		 * freed from RAM without consuming a new one.  Keep anon
+		 * scanning enabled while such folios remain in this lruvec.
+		 */
+		if (!lruvec_page_state(lruvec, NR_SWAPCACHE))
+			return 0;
+	}
 
 	return sc_swappiness(sc, memcg);
 }
-- 
2.53.0

