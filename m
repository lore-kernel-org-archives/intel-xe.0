Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9500CCA5FFF
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 21:20:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CE610E6A6;
	Wed,  7 Oct 2026 21:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K/OnuOMN";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CFA10E693
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 21:20:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 977A341742;
 Wed,  7 Oct 2026 21:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D2A1F000FF;
 Wed,  7 Oct 2026 21:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791408018;
 bh=idg4rQeBnEI1cEchc10g125pd/KdPy6zz65hnEoKNTE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=K/OnuOMNSxGfBmxNjzKXfY49KyG/JxEPUzQFDMFSRSLSLOY5gNdXqbSXW/IZBU3G1
 hJR/MCVU8XkTeOmbPhNq+D59oJPB8joOlOJxkkPuzE10J+5HT/8NhOVHHLtxDrjAsF
 n2Ve1ItAAivQQLvbw6mzVChWPo2qTO3xSujx5bXS9wj9qWstmSr8RlY+8uXRYzy/B+
 yKUwz3aVZKj9P3EtUJNZ/3JCFPFY8ZYru1L9AIx/78HmVZqmL9KtP1GQd7hayPM7gs
 kJ7rjpBXeWN+/892Ar+7FEgizdfnEoOlY7eTkUUklxfDOlPil048B8cv96YRjLG7eh
 jPbw5Y18U44NQ==
Message-ID: <sashiko-outbox-163389@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/12] drm/xe/memirq: Report errors using structured
 xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261007211417.2093611-6-dnyaneshwar.bhadane@intel.com>
References: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
 <20261007211417.2093611-6-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 21:20:18 +0000
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
- [Low] xe: unused memirq_err macro left after xe_log_err conversion
--

commit 80879014db70d4e6f21e887b68845ca29011c158
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

    drm/xe/memirq: Report errors using structured xe_log API
   =20
    Replace memirq_err() calls with xe_log_err() using the MEMIRQ
    component tag for memory-based IRQ failures.

> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memir=
q.c
> index 9dfe965cb46ec..32b9f87a10ecf 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
[ ... ]
> @@ -232,7 +233,7 @@ static int memirq_alloc_pages(struct xe_memirq *memir=
q)
>  	return 0;
> =20
>  out:
> -	memirq_err(memirq, "Failed to allocate memirq page (%pe)\n", ERR_PTR(er=
r));
> +	xe_log_err(tile, MEMIRQ, err, "Failed to allocate memirq page\n");

[Severity: Low]
Is the definition of memirq_err() now completely unused?

Looking at drivers/gpu/drm/xe/xe_memirq.c, there is a macro definition that
appears to be orphaned by this conversion:

#define memirq_err(m, _fmt, ...)	memirq_printk(m, err, _fmt, ##__VA_ARGS__)

Should this macro be removed as well since all callers have been updated to=
 use
xe_log_err()?

>  	return err;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007211417.2093=
611-1-dnyaneshwar.bhadane@intel.com?part=3D5
