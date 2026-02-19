Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D427DE9A03B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 10:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C95110E23C;
	Thu, 19 Feb 2026 10:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QTUIZPLo";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D0510E23C;
 Thu, 19 Feb 2026 10:09:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9B76060054;
 Thu, 19 Feb 2026 10:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EDFC4CEF7;
 Thu, 19 Feb 2026 10:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771495787;
 bh=q1/kcsmRETp7wspynddOCV7OlvJ+YvFQsBqiIrIMRr4=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=QTUIZPLoWDtllOmleDtmudvrTyW+aH6DHEaB39eE9nhw9OfqYWDoOUx1LcX3Iq/s/
 /07ir+pL485oJZgPmPrVVqdFgKQxU6nR9eN8MEMZr8CBihxbLJiu8g3cxyyumNXss6
 xTtZZeTGXUqaYTstOwP9xuqAbK6VIjF+8YiSFH4FeNP0PCCCxLW/v/uRwatJSl94pN
 4IIXd/+d3o1hWP7ZwukN3Wd41o+2HxBT3TR/rb7y5yVgrxiZqiZinv8Xm+olshjBAR
 Wa18gcI0xWgtVeWSPOd1PYI1wFtiq5zOjzXXZy74VAt8B2hh7ZbFTWz3Dp0sHgJUgN
 Rsf2sSPGAPLKw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 11:09:42 +0100
Message-Id: <DGIUUFLC31D5.2OZBF5FWQJWMZ@kernel.org>
Subject: Re: [PATCH v10 3/8] gpu: Fix uninitialized buddy for built-in drivers
Cc: <linux-kernel@vger.kernel.org>, "Matthew Auld" <matthew.auld@intel.com>,
 "Arun Pravin" <arunpravin.paneerselvam@amd.com>, "Christian Koenig"
 <christian.koenig@amd.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Dave Airlie" <airlied@redhat.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <intel-xe@lists.freedesktop.org>, "Peter Senna Tschudin"
 <peter.senna@linux.intel.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-4-joelagnelf@nvidia.com>
In-Reply-To: <20260218205507.689429-4-joelagnelf@nvidia.com>
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

On Wed Feb 18, 2026 at 9:55 PM CET, Joel Fernandes wrote:
> From: Koen Koning <koen.koning@linux.intel.com>
>
> Use subsys_initcall instead of module_init for the GPU buddy allocator,
> so its initialization code runs before any gpu drivers.
> Otherwise, a built-in driver that tries to use the buddy allocator will
> run into a kernel NULL pointer dereference because slab_blocks is
> uninitialized.
>
> Specifically, this fixes drm/xe (as built-in) running into a kernel
> panic during boot, because it uses buddy during device probe.
>
> Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part tw=
o)")

This Fixes: tag seems wrong. How is this code move related to this problem?

This should rather be:

Fixes: 6387a3c4b0c4 ("drm: move the buddy allocator from i915 into common d=
rm")

Also, please add:

Cc: stable@vger.kernel.org

> Cc: Joel Fernandes <joelagnelf@nvidia.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: intel-xe@lists.freedesktop.org
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Koen Koning <koen.koning@linux.intel.com>
> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

I also think this patch should be sent separately and go through drm-misc-f=
ixes.
