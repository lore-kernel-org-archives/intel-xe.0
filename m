Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821E6EC1429
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 10:53:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34ED210E793;
	Tue,  3 Mar 2026 10:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsOJ4rcP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A8410E791;
 Tue,  3 Mar 2026 10:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772535179; x=1804071179;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DHAmQtiBu2zYk+h4U+GfMqpt9I4enHk0rekPcXnBthY=;
 b=fsOJ4rcPDBCxcsqQDZDfveBJsF9zxbJRXmLuYl1H/oi8OyrN/21fkqp0
 MU6l87LOmCNhtk7p1HYLeA8M/5ImRbiV7D0rMTBVG3zqzAdM+Y9+EVvpR
 1HCMtlBQEVhXv4OJoR8SUXf7yAlnq5ST2EF9GmUZGW4va14CGrtSlfsE7
 FWIagKNJyz3jkWxpw8sltPiWLc7+o3jTCnaK2aWgLR8YEbWNNhOrYW5Jb
 bXNptwRrFTYBeX5DRCj6LA9aW/wc5/K56v6M83lvRdjZ7bqmWymxI/NzK
 HfvvgzXU0qF/XHsG+nk+AlX/fvEIyUUy0A2+ZWKJhlf5gNYbcFQDFhtvO w==;
X-CSE-ConnectionGUID: gciMLMmKTl6oVU+R5f2cLw==
X-CSE-MsgGUID: mvG2nzMURBOU9fKK/g0J1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="91138802"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="91138802"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 02:52:59 -0800
X-CSE-ConnectionGUID: suqWUCBtRVS3WANgLskiHQ==
X-CSE-MsgGUID: 1iXi69h8RD6taWqKKQ1fCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="214302532"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.26])
 ([10.245.245.26])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 02:52:57 -0800
Message-ID: <9f13e0d0-4a4f-43ac-a2f2-72806b91c92a@intel.com>
Date: Tue, 3 Mar 2026 10:52:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu/tests/gpu_buddy: Add gpu_test_buddy_alloc_range for
 exact-range allocation
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20260302150947.47535-2-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260302150947.47535-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 02/03/2026 15:09, Sanjay Yadav wrote:
> Add a new kunit test gpu_test_buddy_alloc_range() that exercises the
> __gpu_buddy_alloc_range() exact-range allocation path, triggered when
> start + size == end with flags=0.
> 
> The test covers:
> - Basic exact-range allocation of the full mm
> - Exact-range allocation of equal sub-ranges (quarters)
> - Minimum chunk-size exact ranges at start, middle, and end offsets
> - Non power-of-two mm size with multiple roots, including cross-root
>    exact-range allocation
> - Randomized exact-range allocations of N contiguous page-aligned
>    slices in random order
> - Negative: partially allocated range must reject overlapping exact
>    alloc
> - Negative: checkerboard allocation pattern rejects exact range over
>    partially occupied pairs
> - Negative: misaligned start, unaligned size, and out-of-bounds end
> - Free and re-allocate the same exact range across multiple iterations
> - Various power-of-two exact ranges at natural alignment
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
