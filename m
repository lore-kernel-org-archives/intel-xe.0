Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C807606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CmtP6Soq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D6E10FD9F;
	Wed, 28 Oct 2026 16:26:20 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596D010E696
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 16:26:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 4051E601F7;
 Wed, 28 Oct 2026 16:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE8A11F01829;
 Wed, 28 Oct 2026 16:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793204773;
 bh=0FukKVETZEYFRqBaVgPg71bGU8Bho0Wr53uuDO5T88I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=CmtP6SoqOs1oW4oMLmzzxnNX4oVK04JZnfO/pBb+dsIJ4ebbluC6viUFRPrFOHCjw
 Vr5oXCIoFIT91iEOlCVo1HEXFEzAkVw9k2bdQMMVvQwccL9RJwUFTj3qxpkak49GCk
 jfXrzMY4tlNoCAYo4cUui1G1vUN7POFLQF9ax7FuOywJdpjBI6ywEAikTGQg6EGhMK
 wBQ47ej/0G9T6yJn6nIN0tAYxoN1l9WFgcoNYLATZEoXldkNnIwH/4y1v+GNubQIW0
 lvF40U4W9SIhaG0bYc1x8SzfrHO3nbV49D4J5DdHEXmuEYtWpoZbkv6SK3YwcWXDlk
 FWLUw+J8lKSQg==
Date: Wed, 28 Oct 2026 17:26:09 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com, 
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, 
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, tejas.upadhyay@intel.com
Subject: Re: [PATCH v2 9/9] drm/xe/ras: Skip double-bit ECC page offlining on
 AER path
Message-ID: <auIiEE3F7OTl1h4J@zenone.zhora.eu>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-20-riana.tauro@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026060459.771448-20-riana.tauro@intel.com>
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

Hi Riana,

On Mon, Oct 26, 2026 at 11:35:08AM +0530, Riana Tauro wrote:
> Device fatal errors trigger AER, which can race with non-fatal
> double-bit ECC errors reported via IRQ. If the AER PCI error handler
> runs first, it receives all errors as a single response from the
> system controller firmware, which can include the double-bit ECC errors.
> 
> Handling these on the AER path leads to unnecessary page offlining,
> since an SBR clears the offlined pages on reload and firmware drops them
> from its queue once read. Skip double-bit ECC handling when on the AER
> path to avoid this.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thankss,
Andi
