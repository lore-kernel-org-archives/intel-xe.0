Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B893AC79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A5B10EB1D;
	Tue,  8 Sep 2026 10:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bbpuIC13";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF4210EB1D
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:28:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2FB9660A9F;
 Tue,  8 Sep 2026 10:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE7E1F00A3A;
 Tue,  8 Sep 2026 10:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788863313;
 bh=kW7Dl4fY5P0nthChvL5kWT4nBxEaT0QO+nTI5GtjiH4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=bbpuIC13776/mANJTi8bRSJH0HufKTZMNItFzql2d2ZKT8SpN2rZmCLiaJ0NRwIKH
 SbOQsrzQglanZOZnmKeWTsklB0vht6KpVrZtlp+BN1XMdbZZvqmw8eixhqRHJd991T
 D3uT8Mzhigy7oduQbXLctlOzLUkzfrG0Jo0Hch9axD5cpHTgFAuZdRpjvSGCQvWV4Q
 Gxkg2wBUop5d4c73BBt1ICzkxzFaIBjEQKL78lHOuyc/XHpn9K8StzRB1u91+kQBPH
 gmI29odSQ+GIZkzumQXnidvwg+gej6wXs5GIA2jnFay1J+UKbINRYdK1cKw77QiaPb
 YtClF7DZL6+tA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/13] drm/xe/memirq: Report errors using structured
 xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260908101849.1219614-6-dnyaneshwar.bhadane@intel.com>
References: <20260908101849.1219614-1-dnyaneshwar.bhadane@intel.com>
 <20260908101849.1219614-6-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 10:28:33 +0000
Message-Id: <20260908102833.BBE7E1F00A3A@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `memirq_err` macro definition was left behind as dead code afte=
r all of its usages were replaced.
--

commit 391745f6a990d1f601917ad8a478f9eb84f04e45
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/memirq: Report errors using structured xe_log API

Replace memirq_err() calls with xe_log_err() using the MEMIRQ
component tag for memory-based IRQ failures

> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memir=
q.c
> index 9dfe965cb46ec..32b9f87a10ecf 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -232,7 +233,7 @@ static int memirq_alloc_pages(struct xe_memirq *memir=
q)
>  	return 0;
> =20
>  out:
> -	memirq_err(memirq, "Failed to allocate memirq page (%pe)\n", ERR_PTR(er=
r));
> +	xe_log_err(tile, MEMIRQ, err, "Failed to allocate memirq page\n");
>  	return err;
>  }

[Severity: Low]
Should the memirq_err() macro definition also be removed?

Since this patch replaced all of its usages, the macro definition at the top
of drivers/gpu/drm/xe/xe_memirq.c is left behind as unused dead code:

#define memirq_err(m, _fmt, ...)	memirq_printk(m, err, _fmt, ##__VA_ARGS__)

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908101849.1219=
614-1-dnyaneshwar.bhadane@intel.com?part=3D5
