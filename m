Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF48CCCF9E8
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 16:52:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F25510E932;
	Thu, 23 Oct 2025 16:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aPZIU8bO";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F22010E932
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 16:52:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2DF2840538;
 Thu, 23 Oct 2025 16:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2891BC4CEFF;
 Thu, 23 Oct 2025 16:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761238330;
 bh=+xRBkG3Yznei7bfa+btKlosF8EF6f3qzPwRiGCSSb3Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aPZIU8bOdrBTvimBJyVcMU+/In0iMQ5P6Wj1bUu6miPgDBd9Wxsh6puE7gYTDffOw
 nxEnXqPhPjTuqFKE1gy+JqJ39OaiR6S29lmQg6ObvZjqylBQqwflQr1W7aVsBPpKbC
 zmOI3B7yYIULLT+yKh5u3c4KHY39ii3TK0XBkKniaqNocgyofHO6F7l4BNp0341j3Y
 Bv6LxLxdS/hwvz0cTRy5kgLblQVjuC+VdOhoCKNSfOkkzFkdumst3nIbPTjtNACNjV
 N2MmGRVQEZwecoUIsmnYHVf4NHHjHg4U4ySR3cNE72dhB6tPuie/V5Og4uNTxEpD8T
 5bTLIfjc9ZSvA==
Date: Thu, 23 Oct 2025 18:52:05 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mei: late_bind: Fix
 -Wincompatible-function-pointer-types-strict
Message-ID: <20251023165205.GD2090923@ax162>
References: <20250920-drm-xe-fix-wifpts-v1-1-c89b5357c7ba@kernel.org>
 <qxvmx7nawbqjj5luzzken3psdei7pvgliieiv4vdxgumb2wpkx@p4ckdsds66ak>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qxvmx7nawbqjj5luzzken3psdei7pvgliieiv4vdxgumb2wpkx@p4ckdsds66ak>
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

On Thu, Oct 23, 2025 at 09:27:03AM -0500, Lucas De Marchi wrote:
> On Sat, Sep 20, 2025 at 04:17:50PM -0700, Nathan Chancellor wrote:
> > When building with -Wincompatible-function-pointer-types-strict, a
> > warning designed to catch kernel control flow integrity (kCFI) issues at
> > build time, there is an instance in the new mei late binding code
> > originating from the type parameter of mei_lb_push_payload():
> > 
> >  drivers/misc/mei/mei_lb.c:211:18: error: incompatible function pointer types initializing 'int (*)(struct device *, u32, u32, const void *, size_t)' (aka 'int (*)(struct device *, unsigned int, unsigned int, const void *, unsigned long)') with an expression of type 'int (struct device *, enum intel_lb_type, u32, const void *, size_t)' (aka 'int (struct device *, enum intel_lb_type, unsigned int, const void *, unsigned long)') [-Werror,-Wincompatible-function-pointer-types-strict]
> >    211 |         .push_payload = mei_lb_push_payload,
> >        |                         ^~~~~~~~~~~~~~~~~~~
> > 
> > While 'unsigned int' and 'enum intel_lb_type' are ABI compatible, hence
> > no regular warning from -Wincompatible-function-pointer-types, the
> > mismatch will trigger a kCFI violation when mei_lb_push_payload() is
> > called indirectly.
> > 
> > Update the type parameter of mei_lb_push_payload() to be 'u32' to match
> > the prototype in 'struct intel_lb_component_ops', clearing up the
> > warning and kCFI violation.
> > 
> > Fixes: 741eeabb7c78 ("mei: late_bind: add late binding component driver")
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Sasha, is this fix something you are taking through char-misc since the
> commits that added it already propagated through the 6.18-rc?

It looks like Greg already took this via char-misc-linus:

https://git.kernel.org/gregkh/char-misc/c/98718e80af0bb1cd80f4bfe565dd60c57debad51

Cheers,
Nathan
