Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AE9D5D688
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 20:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0104510E17F;
	Thu,  7 Nov 2024 20:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="fbMq8Mip";
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006D910E8C8
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 20:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=HBvcWM0gK7/kTdXAO4nzwP9CRBKS7Dzym5COEsSvMQ0=; b=fbMq8MipzULggm8bQ5DxzOoeTd
 DZtHoCCFK5Yk9UGSWSFAsUgtBbpmaUKR59ya+JtpWzrpWa1+j3kRyd8bhqnZ21tadbfrm6sfELV5d
 wj7Cnfwzyc09EcRSTmNW670JWoGeTx74+2P63voAIFKJQQDnFvCFABr9M4zF1ELDK4Zdg/mJccs+O
 j2mqH8E9r0oSrVa3bwHAdyg7cK6PiZl4oVioJaLQF51Op6gmtnX2wr+MYlAHBx3pANkc4pVYZVfc/
 Xo6D/2zgBpbk6KwSPi0+bxvxhZuY/unEAeztjELz2QI/RhJq/S5jtk/kBgWzfOwQlD0z/ekJFF4Ap
 1Hh0Rt3A==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1t98t9-00000007KEO-2Ip2; Thu, 07 Nov 2024 20:13:55 +0000
Date: Thu, 7 Nov 2024 20:13:55 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/4] iov_iter: Provide copy_iomem_to|from_iter()
Message-ID: <Zy0fg6E7Fbmi6lsP@casper.infradead.org>
References: <20241107163448.2123-1-michal.wajdeczko@intel.com>
 <20241107163448.2123-2-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107163448.2123-2-michal.wajdeczko@intel.com>
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

On Thu, Nov 07, 2024 at 05:34:45PM +0100, Michal Wajdeczko wrote:
> +size_t copy_iomem_to_iter(const void __iomem *from, size_t offset,
> +			  size_t bytes, struct iov_iter *i)
> +{
> +	unsigned char buf[SMP_CACHE_BYTES];
> +	size_t progress = 0, copied, len;
> +
> +	from += offset;
> +	while (bytes) {
> +		len = min(bytes, sizeof(buf));
> +		memcpy_fromio(buf, from + progress, len);
> +		copied = _copy_to_iter(buf, len, i);
> +		if (!copied)
> +			break;
> +		bytes -= copied;
> +		progress += copied;
> +	}

This seems like a rather sad implementation.  Why not:

	if (WARN_ON_ONCE(i->data_source))
		return 0;
	if (user_backed_iter(i))
		might_fault();
	return iterate_and_advance(i, bytes, (void *)addr,
			copy_iomem_to_iter, memcpy_iomem_to_iter);

along with

size_t memcpy_iomem_to_iter()
{
	memcpy_fromio(iter_to, from + progress, len);
	return 0;
}`
