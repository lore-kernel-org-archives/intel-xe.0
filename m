Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8A4606AA39
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 17:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vp8tMjxP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F2510E1BF;
	Tue, 20 Oct 2026 17:15:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A0C10E1BF
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 17:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792516538; x=1824052538;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=1yYloSzkP5LnVOLc5SDtK1b04md/Ph9SgnREBW9OSIg=;
 b=Vp8tMjxPgupPf/lUNQFiAZfwlrMwJIbJ9x96g2PK5jeg8Um1axFkIcgq
 NU4Ub4OPZqNUuLTelHgzw5kJGIk8ZRLNvtkXjU0NFBF4hr0du23UssgbF
 2RFDikgc/7N5lSyEzEKEX0O24i/7+90ywfwUAvEWshm80X6mYc2+igeEp
 0IvaL7QqvytYVW0DAG6r4xSZZf7jLDQ7ePf4lnNae/8qDcCdcyAy3SDSr
 At5QMgE6njUGNSqe00lWE/kCVBwqVuUK8ZvGsKhBbPRbSYyoEJqOWL/Dp
 rcRWcLnB2+BlQjm2rVeECYNAuTp3ZkFfBv3s0kvC4HliJBds0EnlFqAVA g==;
X-CSE-ConnectionGUID: wo8U/gvDTFCsU0DofNzQCA==
X-CSE-MsgGUID: d8zq9kgYTRCyAyItwvDwvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1255813"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1255813"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 10:15:38 -0700
X-CSE-ConnectionGUID: 2y7Ago9SQburOXxOj2+dzQ==
X-CSE-MsgGUID: pMdOI2d1TJ2bQVHTlVaKFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2909836"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.244.166])
 ([10.245.244.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 10:15:36 -0700
Message-ID: <70731055-cc54-4637-903d-4ca904f0e687@intel.com>
Date: Tue, 20 Oct 2026 18:15:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Tie BO TTM LRU priority to DONTNEED/WILLNEED
 madvise state
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20261020165137.765886-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20261020165137.765886-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20/10/2026 17:51, Matthew Brost wrote:
> The DRM_XE_MADVISE ioctl lets userspace mark a VMA's BO as DONTNEED,
> signalling that its contents are not needed right now and may be
> discarded under memory pressure (see madvise_purgeable() in
> xe_vm_madvise.c), or restore it back to WILLNEED. This is a stronger,
> explicit signal than a plain unbind: userspace has told us the BO is not
> just unused for now, but that it is actively fine to lose the data.
> There is no reason to keep such a BO competing for LRU space with
> actively used buffers, and conversely, once userspace marks it WILLNEED
> again it is back in active use and should be reprioritized accordingly.
> 
> Give xe two TTM LRU priority bands and tie them to that state:
> XE_BO_PRIORITY_LOW for DONTNEED BOs and XE_BO_PRIORITY_NORMAL for
> everything else. Since the TTM LRU is walked in ascending priority
> order, DONTNEED BOs become the first candidates for eviction and
> shrinking. The transition is driven from xe_bo_set_purgeable_state(),
> the single point through which a BO's aggregate purgeable state actually
> moves between WILLNEED and DONTNEED (PURGED is terminal and left at
> XE_BO_PRIORITY_LOW).
> 
> Changing bo->ttm.priority cannot be done by a plain store: private, user
> BOs have bo->ttm.bulk_move set to their VM's LRU bulk-move range, which
> tracks a contiguous [first, last] run of resources per (mem_type,
> priority) bucket. Writing the priority while the BO is still attached
> would leave the resource linked in the old priority's bucket while the
> bulk-move code looks it up under the new one, corrupting both. Add
> xe_bo_update_ttm_priority(), which temporarily detaches the BO from its
> bulk-move range, updates the priority with a plain non-bulk LRU update,
> and reattaches it into the new priority's bucket.
> xe_bo_set_purgeable_state() is always called with the BO's dma-resv
> held, so this is safe.
> 
> With DONTNEED BOs now clustered at XE_BO_PRIORITY_LOW, the shrinker's
> purge pass no longer needs to walk each memory type's whole LRU: nothing
> beyond XE_BO_PRIORITY_LOW can possibly be purgeable, so continuing past
> it just wastes time trylocking BOs that can never be purged in this
> pass. Break out of the per-mem_type LRU walk in __xe_shrinker_walk()
> once a BO's priority rises above XE_BO_PRIORITY_LOW during the purge
> pass. Behavior of the non-purge (regular shrink) pass is unchanged.
> 
> Assisted-by: LLM
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

