Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D60C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 14:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B283310EA28;
	Wed, 15 May 2024 14:53:31 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF8B10EA28;
 Wed, 15 May 2024 14:53:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_xe_bo_shrinker_and_e?=
 =?utf-8?q?xhaustive_eviction_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 May 2024 14:53:30 -0000
Message-ID: <171578481012.2118792.12645363431704377946@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240515081449.46646-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240515081449.46646-1-thomas.hellstrom@linux.intel.com>
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

Series: xe bo shrinker and exhaustive eviction (rev2)
URL   : https://patchwork.freedesktop.org/series/133643/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: d98c9eae8405 drm-tip: 2024y-05m-15d-12h-51m-18s UTC integration manifest
=== git am output follows ===
.git/rebase-apply/patch:123: trailing whitespace.
		
warning: 1 line adds whitespace errors.
.git/rebase-apply/patch:144: trailing whitespace.
	
warning: 1 line adds whitespace errors.
.git/rebase-apply/patch:139: trailing whitespace.
	
.git/rebase-apply/patch:165: trailing whitespace.
	} else {	
.git/rebase-apply/patch:174: trailing whitespace.
	
.git/rebase-apply/patch:180: trailing whitespace.
		
.git/rebase-apply/patch:222: trailing whitespace.
	} else {	
warning: squelched 4 whitespace errors
warning: 9 lines add whitespace errors.
.git/rebase-apply/patch:47: trailing whitespace.
	
.git/rebase-apply/patch:62: trailing whitespace.
	exec->snap = snap;	
warning: 2 lines add whitespace errors.
.git/rebase-apply/patch:51: trailing whitespace.
  
warning: 1 line adds whitespace errors.
.git/rebase-apply/patch:267: trailing whitespace.
	
warning: 1 line adds whitespace errors.
Applying: drm/ttm: Allow TTM LRU list nodes of different types
Applying: drm/ttm: Slightly clean up LRU list iteration
Applying: drm/ttm: Use LRU hitches
Applying: drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist moves
Applying: drm/exec: Rework contended locking
Applying: drm/ttm: Provide a generic LRU walker helper
Applying: drm/ttm: Use restartable LRU and sleeping locks for swapping.
Applying: drm/ttm: sleeping evict lock.
Applying: drm/ttm: Add a virtual base class for graphics memory backup
Applying: drm/ttm/pool: Provide a helper to shrink pages.
Applying: drm/ttm: Use fault-injection to test error paths
Applying: drm/ttm, drm/xe: Add a shrinker for xe bos
Applying: dma-buf/dma-resv: Introduce dma_resv_trylock_ctx()
Applying: drm/exec: drm_exec_trylock()
Applying: drm/exec: Add a snapshot capability.
Applying: drm/exec: Introduce an evict mode
Applying: drm/ttm: Support drm_exec locking for eviction and swapping
Applying: drm/ttm: Convert ttm vm to using drm_exec.
Applying: drm/xe: Use drm_exec for fault locking
Applying: drm/ttm: Use drm_exec_trylock for bo initialization
Applying: drm/xe: Initial support for drm exec locking during validate.


