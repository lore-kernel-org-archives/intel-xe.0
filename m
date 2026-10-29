Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A329606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 17:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cSsQRTZl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76C610E301;
	Thu, 29 Oct 2026 17:04:38 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BEF10E301
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 17:04:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E8A4741664;
 Thu, 29 Oct 2026 17:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263F21F01828;
 Thu, 29 Oct 2026 17:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793293471;
 bh=Z6XpcqaKkecvVz4cmXzAU5qUM0cwMwG9PwTI84LLWpI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=cSsQRTZl6hITmi/BqCbGbkSGVh6Xt8x0X/4hc1RsIjHwhjPydrsgi0nK0ZPdYtUeb
 LEs+QbK3C7qXIvF/lfVeBk5Cs9FBXWDmUa4rAU01f9ZOWDs2qTI/Jz3rQBa+7T+IXy
 T0EnrPnSlbtnLyEPaauFOsaj7dnxo14b59AlG4qpNSXQupn9hDc5LG1ptspNDX0BAe
 /nyNhGi/kAPMHH4wySmym9hOC9XX1wrcheM6UYROSlxhH7BNx++s1NikzeeWqcMuLz
 CKxO3fjYenHST3Vj85Q6gNk8BVA631///vAQdudjvDRhWwCps1napyyDUYewkLF+ft
 MBPpMMAILYS+g==
Date: Thu, 29 Oct 2026 18:04:26 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, 
 intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
Message-ID: <gdkx2gc2up64m2xnkazaoehk4ftckfoemvwaws6xevhnjddcyb@drcqglzj3hdy>
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
 <auC-ryi8PFiPgiLE@zenone.zhora.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auC-ryi8PFiPgiLE@zenone.zhora.eu>
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 04:11:51PM +0100, Andi Shyti wrote:
> 
> The patch looks fine to me but I still see that there are some
> concerns. Like Danilo's points are valid, can those be addressed
> later?
> 
> For now:
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Let's wait a little and if nothing arises I can apply this for
> XE.
>

Yes, the patch should probably go in anyway but the underlying issue
will need a separate fix.

Bart
