Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216BEC9830D
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 09:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFD610F966;
	Fri, 25 Sep 2026 09:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="Jm2UAcpx";
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2B110F966;
 Fri, 25 Sep 2026 09:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=KCyV94oyn7UgoSfgjaYpx+E0zyZIPbxzlpyxYGj8GX8=; b=Jm2UAcpxToTAxr+Svp1O2pM4D2
 ctatdOQnUip7JuJmrAlj1RMH8E1zlPVFjc8sc3mciWWVQmMLyYIHqH6Dt3Ybcu1hVdMkiUxVlKcZm
 vsaiUPmIHUutP2/fkDKowSq04+IjHyu0g+bD0oub1gDqlD1X//vJV2jAxVBwKQ0T7SrSIgZmEuLMA
 TWrMDsdz+q2WtqoY4X5ZhkOHQ+YepDxsc64ieSY1Z6kAa6eKz8J5zGgZ7jQkjjGS9x0Q9gOKNdwBI
 gwaQUDi8N7wC3NC23QU+ZP6EXyWXQMEjCMzpNMlGq0CnJo/u8+RkdqU/1TVMrE2UJNuYHEwRG7tOh
 OmV4cLhA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red
 Hat Linux)) id 1xA1ts-0000000CyOj-3qzm;
 Fri, 25 Sep 2026 09:07:24 +0000
Date: Fri, 25 Sep 2026 02:07:24 -0700
From: Christoph Hellwig <hch@infradead.org>
To: mpenttil@redhat.com
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v15 00/11] migrate on fault for device pages
Message-ID: <arY5zKsLuf7f_EYw@infradead.org>
References: <20260924065313.899730-1-mpenttil@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924065313.899730-1-mpenttil@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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

On Thu, Sep 24, 2026 at 09:53:02AM +0300, mpenttil@redhat.com wrote:
> Add a new flag to HMM APIs, HMM_PFN_REQ_MIGRATE,
> which tells to prepare for migration also during fault handling.
> For the migrate_vma_setup() call paths, new flags, MIGRATE_VMA_FAULT,
> and MIGRATE_VMA_WRITE are added to tell to add fault handling to migrate.

Who is going to use this?  The series seems to lack an actual user for
it.

