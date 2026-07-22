Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE474C44532
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 16:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D1F10E49E;
	Wed, 22 Jul 2026 16:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.b="VWiQHXJG";
	dkim-atps=neutral
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B96610E49E
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 16:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 888B2408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1784736931; bh=ZLpvDn4QgPBvfntCUNJBmz0mWDjXAd4XvY3JSqNSHzs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VWiQHXJGEPl2ql6kn8ILZaIqpPT9VNVmjPKOgN2LwQFKcsfDHiwECrzh2QwgNZ1Mj
 7hEvWtSJfveHaF1HSq6BH+RKF6PlYHwLbj0KcgE+a37n03+iSB6jZrUkBQG10VrAFv
 th73MHwi8MjEoB6ksQi0hdEyfQOGSmNoPzgATXyBLnBLpZ4cnZl7o6aPwCrw8tQC+A
 Xi1r+87bn352mTe2pTZyQqAQlN/v0V3ekZOKSP+OmpzLxQs1YsiSvP9Ii0pw4IVLhA
 bMdFbk1PS/HEt1r5rTBScJjAXU/2WdqcCy0tLVLzF172cV9ij7Ua2xDj/B43jxc/o8
 M7jpwcZ9JScpA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1)
 server-digest SHA256) (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 888B2408B4;
 Wed, 22 Jul 2026 16:15:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ryszard Knop <ryszard.knop@intel.com>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3] scripts/kernel-doc: Suggest possible names for
 excess descriptions
In-Reply-To: <20260717125753.634550-1-ryszard.knop@intel.com>
References: <20260714111208.323108-1-ryszard.knop@intel.com>
 <20260717125753.634550-1-ryszard.knop@intel.com>
Date: Wed, 22 Jul 2026 10:15:30 -0600
Message-ID: <87jyqnc865.fsf@trenco.lwn.net>
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

> Recent check_sections() change added a warning if a documentation tag
> member name does not match the detected struct/union member names. Since
> the checker knows all possible names, we can suggest known names, so
> that it's more obvious how to deal with the warning.
>
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> ---
> Changes in v1:
> - Added the suggestion hint in the warning, with basic name substring checks
> - Link: https://lore.kernel.org/linux-doc/20260714111208.323108-1-ryszard.knop@intel.com/
>
> Changes in v2:
> - Strip trailing whitespace from the warning when the generated hint is empty
> - Link: https://lore.kernel.org/linux-doc/20260715111726.394565-1-ryszard.knop@intel.com/
>
> v3:
> - Use difflib to generate suggestions even if the tag member is mistyped
> - Suggest names based on the nested struct members too
> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 51 ++++++++++++++++++++++++++--
>  1 file changed, 49 insertions(+), 2 deletions(-)

Applied, thanks.

jon
