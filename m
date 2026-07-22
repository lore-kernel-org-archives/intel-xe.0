Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734C4C44539
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 09:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3049810ED1F;
	Wed, 22 Jul 2026 09:51:13 +0000 (UTC)
X-Greylist: delayed 436 seconds by postgrey-1.36 at gabe;
 Wed, 22 Jul 2026 09:51:11 UTC
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C932010ED1F
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 09:51:11 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 88ADA68C4E; Wed, 22 Jul 2026 11:43:50 +0200 (CEST)
Date: Wed, 22 Jul 2026 11:43:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/2] mm/shmem: add shmem_backup_folio() helper
Message-ID: <20260722094350.GA1057@lst.de>
References: <20260721174723.1039395-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721174723.1039395-1-matthew.brost@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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

On Tue, Jul 21, 2026 at 10:47:22AM -0700, Matthew Brost wrote:
> Add a new generic helper, shmem_backup_folio(), that copies the pages
> of an arbitrary source folio into a range of a shmem-backed file,
> optionally issuing writeback for each destination folio. It is
> extracted from drivers/gpu/drm/ttm's existing shmem-backup loop so
> that other subsystems (starting with TTM in a follow-up patch) can
> share the same implementation.

Hmm, what is the difference to just doing a ITER_BVEC write with a bvec
containing the folio for this the pure write to shmem part of this?

You'd probably want a kernel_write_iter helper wrapping
__kernel_write_iter for the writecount, but otherwise this sounds
like a normal write.

We'd want something for the writeback part, preferably a purely
range based API to be generic.
