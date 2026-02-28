Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665BCFEE4EF
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 16:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1062110E0F2;
	Sat, 28 Feb 2026 16:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MyibQhlj";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F27210E0F2;
 Sat, 28 Feb 2026 16:04:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 59D82600CB;
 Sat, 28 Feb 2026 16:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC098C116D0;
 Sat, 28 Feb 2026 16:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772294656;
 bh=VqoqwReNyK4D8hI7bVL5FnWWjw9JOwqFRBdBg0EIDo0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MyibQhljkF/0xj9qWOrOF8chMi/2NvrW1/QeXjahOp4xSseT3FkDVMncM5FOlDrGP
 ca/1hhlBRjytXhuYklzhUAmdF78wKg92TPnU+gAJxAMwD8C2/avdWz/y1gWfBkTZYA
 jIkknUSYpMy+z50Q2dEeEd3MVfHVJ7i/VyVeMhrHr4SOxrhMxni8aijh9RjMKciLFs
 yGFPdVD11bS3ZL8f0kfrnn3eUbNna1k00+H7YY4VleOjV806n/kY1jz2HEouKKMimu
 +cTDsIp4Zt7K4SLSIHY8VJiA72CMR165V1ZzTf1uVKsh7AQhyIWBFx3+/9T94KQ2l2
 VRNJKAw+T6DZQ==
Date: Sat, 28 Feb 2026 08:04:14 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, anvesh.bakwad@intel.com, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, "David S. Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet
 <edumazet@google.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v9 1/5] drm/ras: Introduce the DRM RAS infrastructure
 over generic netlink
Message-ID: <20260228080414.6f1256cc@kernel.org>
In-Reply-To: <20260228080858.3063532-8-riana.tauro@intel.com>
References: <20260228080858.3063532-7-riana.tauro@intel.com>
 <20260228080858.3063532-8-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 28 Feb 2026 13:38:25 +0530 Riana Tauro wrote:
>  Documentation/gpu/drm-ras.rst            | 103 +++++++
>  Documentation/gpu/index.rst              |   1 +
>  Documentation/netlink/specs/drm_ras.yaml | 115 ++++++++
>  drivers/gpu/drm/Kconfig                  |  10 +
>  drivers/gpu/drm/Makefile                 |   1 +
>  drivers/gpu/drm/drm_drv.c                |   6 +
>  drivers/gpu/drm/drm_ras.c                | 354 +++++++++++++++++++++++
>  drivers/gpu/drm/drm_ras_genl_family.c    |  42 +++
>  drivers/gpu/drm/drm_ras_nl.c             |  56 ++++
>  drivers/gpu/drm/drm_ras_nl.h             |  24 ++
>  include/drm/drm_ras.h                    |  75 +++++
>  include/drm/drm_ras_genl_family.h        |  17 ++
>  include/uapi/drm/drm_ras.h               |  49 ++++

Doesn't apply to my local trees any more but _looks_ right :)
Assuming ./tools/net/ynl/ynl-regen.sh -f doesn't result in a dirty tree:

Acked-by: Jakub Kicinski <kuba@kernel.org>

> +	if (!info->attrs ||
> +	    !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] ||
> +	    !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID])
> +		return -EINVAL;

Sorry for not noticing earlier but you could use GENL_REQ_ATTR_CHECK()
here. It will give the user a nice error pointing out which attr was
missing (assuming user space uses a competent ynl-based library).
