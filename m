Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F90EC44512
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 22:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FEE10F408;
	Thu, 16 Jul 2026 22:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.b="WCwkuSub";
	dkim-atps=neutral
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C26710F408
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 22:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F0787408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1784241602; bh=iuB3B2RLZz1h/Y9E1kMEcY617JUGpaxS73dqr9cERbQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=WCwkuSubcjdTNeTw7NbdnXyKuIXZJyamwKa/InXk51d4oHWVTTKZV9IxxeKaYfkow
 fMqKXmWLCFRYHqKB8LIwmvBjo+XBjgE1yp//R2VwcGl3z+nfax7F8eosxKPIuELFpW
 STYi7cVk2PQr4WjzMG5EAD8q+9XW6DQc+DWdI4SVaacRTbboCg6xcvZqMhEWDdOnnZ
 gipn15VWoBePneIRnminqrejYCn7/HN4SN/LdyEKy7V6kU8iXerMn/LAsjI+ZEW84c
 FtQJStaTcr6ETQnl3KGFJFybKt/g0S/Fe9YOTjiRz7R0KtMWiWcC+IPDCCoMsEfu0t
 rRDcUNqXnJaNQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1)
 server-digest SHA256) (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id F0787408B2;
 Thu, 16 Jul 2026 22:40:01 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ryszard Knop <ryszard.knop@intel.com>, linux-doc@vger.kernel.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, Randy Dunlap
 <rdunlap@infradead.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] scripts/kernel-doc: Suggest possible names for excess
 descriptions
In-Reply-To: <20260714111208.323108-1-ryszard.knop@intel.com>
References: <20260714111208.323108-1-ryszard.knop@intel.com>
Date: Thu, 16 Jul 2026 16:40:01 -0600
Message-ID: <87tspy5zjy.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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

Ryszard Knop <ryszard.knop@intel.com> writes:

> Since check_sections() now warns if a documentation tag member name is
> the same as defined in the struct, we can suggest names the checker
> knows, so that it's more obvious how to deal with the warning.
>
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

So I almost applied this version of this patch.  For future reference,
please:

- Post new versions standalone, not as a reply

- Do not include version information in the changelog (put it below the
  "---" line)

- Provide a more coherent changelog; the one above does not say what is
  actually going on here.

- CC the maintainer (me).

Thanks,

jon
