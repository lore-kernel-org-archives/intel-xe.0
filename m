Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9C3CCF9F0
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 15:06:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56FE10E7F8;
	Wed, 29 Oct 2025 15:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QsqMwvur";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F95B10E7F6;
 Wed, 29 Oct 2025 15:06:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E182E447BC;
 Wed, 29 Oct 2025 15:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3F2C4CEF7;
 Wed, 29 Oct 2025 15:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761750408;
 bh=x4tq1577DDMCaHW3fTcMZ1a5KydbuBLTN+yqRePgwcg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QsqMwvurh6t/xZMpEDwlS2InZJzz9Bh9oJpaJ9ISVQTJWSBOwYn6SZjMQvVyIoxla
 dbjetpiIGRIu97loeqgJEZMZ/pHBMo7CKIoh+vcjq3HTfcknz/FC/NWpRfIxtWYXcm
 21/11Z35cVqHB23xlDJUmHJI62tieaztlO3aOXty41BPNzjd8u/pXYCSRMt3bjVZns
 EM0zNLHYK0LnzEtmlb+yjBqZ13A5WQknpqvNcIyk2vwPKOC/DwoWJTmab1pGeBUmKw
 9uQ1QsgUkwzlMgBUzsGXIWtWLRX0lJ0jiUy7u0ZrgjTOhUyQ0TbKCu81PN5QaSJX9A
 eNCReRnTcEkfA==
Date: Wed, 29 Oct 2025 05:06:46 -1000
From: Tejun Heo <tj@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jiangshanlai@gmail.com,
 simona.vetter@ffwll.ch, pstanner@redhat.com, dakr@kernel.org
Subject: Re: [RFC PATCH 1/3] workqueue: Add an interface to taint workqueue
 lockdep with reclaim
Message-ID: <aQIthmQmKfztyaQZ@slm.duckdns.org>
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-2-matthew.brost@intel.com>
 <2e1e9d6f-4f9e-49f7-90f0-6759c260701f@amd.com>
 <aQEkq7DYy5/AaJ4R@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQEkq7DYy5/AaJ4R@lstrano-desk.jf.intel.com>
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

Hello,

On Tue, Oct 28, 2025 at 01:16:43PM -0700, Matthew Brost wrote:
> On Tue, Oct 28, 2025 at 10:32:54AM +0100, Christian König wrote:
> > On 10/21/25 23:39, Matthew Brost wrote:
> > > Drivers often use workqueues that are in the reclaim path (e.g., DRM
> > > scheduler workqueues). It is useful to teach lockdep that memory cannot
> > > be allocated on these workqueues. Add an interface to taint workqueue
> > > lockdep with reclaim.
> > 
> > Oh that is so wonderfully evil. I'm absolutely in favor of doing this.
> > 
> > But can't we check for the existing WQ_MEM_RECLAIM flag in the workqueue handling instead?
> > 
> 
> Tejun suggested tying the lockdep annotation to WQ_MEM_RECLAIM, but the
> entire kernel explodes because many workqueues throughout Linux don’t
> adhere to this rule. Here's a link to my latest reply to Tejun [1].

How about making it a WQ flag?

Thanks.

-- 
tejun
