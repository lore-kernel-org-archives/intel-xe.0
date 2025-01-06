Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFCAE77197
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 14:50:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102FE10EAE9;
	Tue,  7 Jan 2025 14:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="BXqKpr0X";
	dkim-atps=neutral
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599EF10E9B4
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jan 2025 18:15:10 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-385f07cd1a4so9648907f8f.1
 for <intel-xe@lists.freedesktop.org>; Mon, 06 Jan 2025 10:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1736187249; x=1736792049; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iyGA4lAiCzsKD8bpG2OLbm7SvOEgsIMLWbFXGinwzoo=;
 b=BXqKpr0XXHbiGGHirb0TCuI7HWKCOJJsMiLyeUU0xbV6hqXq6FihrLVoV+gHNAtfVP
 nOrxBeUUMnE6nj3VHKDPBUjmCKv1oCbG/wf4HBhZkBd92V562u47a97N5kqtq6Dsg/9X
 NZ1dBZlYAWvr4Vkoh0MGOj8A0WHaaCeTGCJWwwYmWLoRd9BBJZoULwIQ/Saus77l1gF6
 6q4mGaC07IlL2hR4cVHB7K1KZD7d268jcVBpvARcEXdbmUKg8ueyK2ieRb5716KflSHB
 Q4cMdhh+ablw2lJLOLRkwHrmMlV5+aHiwgvHOOzPZFgX8MOkjcp3piphd6M9p1m2k7/x
 bEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736187249; x=1736792049;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iyGA4lAiCzsKD8bpG2OLbm7SvOEgsIMLWbFXGinwzoo=;
 b=Xc1gsiMUcJ+Mg8o6PpelGUNmpyTnGUNM42mK8U6xR+J384dyiV2jfqQfQcfv2R729V
 zyGErIII0TGpZZvJ8e/DNYBeTlwry/LPmsL+hvRQHXiQB1BlG3MFZQIIZ4IQwpeAaPcJ
 i8O9XUaFHe9+IE19r89xVlpe+afmdZECEfgvUGkisqWQNi/ViH4/rrpYia64qPOY1Sb/
 3JL3QWOPJWvF7S6M4tg30bOeVDLuUi6+LffTn8j3GLf8DdPLGCtacSbbnD2jpdMSyKBy
 EnYXiVRMs2wj/L0hTxP0v3ro/y4D3Ht+GFz0h6yW54jv7DsDdkz5eV0pZg7lYiDyNL27
 2kiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlBLYbqK5bU7JzoeuDZUl1NW3mP2JD9gU0JiwJZ3YfkPgGSwlXGgBFkSBvrTN0gKpA0VRio0+ukw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrqxVucfXF+k+ZfSju2zPqL1eGMhTVDilJJRck2lrePsn3Tq3H
 WmfQ5/qtK2eqklsqFMv7VD/W813UqSK/B9oFpSXDAhgprlgLpqrxMbZ74hciklNF6l+GN/dgi1H
 P
X-Gm-Gg: ASbGncvY/OWVMOCLNyxwgGAoFAQbEBbQiDUTKrlbIzgfbB/GvlMIuH3Cu7ZjapS5hsV
 efu/V77LcSXTw884fUmeBI4fT4t2wnuAf+Y+VSUsEvC4NDu59LUoAoILDCm6uDMCLFz3NvUYDQ+
 24Vhz8CzhOy0tqa2h5pubmLeZVYDLqBclpxeGS7zeCzA+38fXud3e6fYOwaTZQyfR1HbYDWkdvF
 awKCsE+D4RiJGYWic83ihFj117KJt9tTHLMpy48gl1r3cvM1msMT6IIGsc=
X-Google-Smtp-Source: AGHT+IGkwIuJtbwbUThZtAjQyXw8sV6HWFXnREb8nnP6DrTXZ11YQLIKmj95wr8m/cODFINVqbqcRA==
X-Received: by 2002:a7b:cb14:0:b0:436:90d4:5f3e with SMTP id
 5b1f17b1804b1-43690d46037mr324429325e9.6.1736185713421; 
 Mon, 06 Jan 2025 09:48:33 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43661289d3dsm580766155e9.41.2025.01.06.09.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 09:48:33 -0800 (PST)
Date: Mon, 6 Jan 2025 18:48:31 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, Maxime Ripard <mripard@kernel.org>,
 cgroups@vger.kernel.org, 
 linux-mm@kvack.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 1/7] kernel/cgroup: Add "dmem" memory accounting cgroup
Message-ID: <uj6railxyazpu6ocl2ygo6lw4lavbsgg26oq57pxxqe5uzxw42@fhnqvq3tia6n>
References: <20241204134410.1161769-1-dev@lankhorst.se>
 <20241204134410.1161769-2-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3gfwd2ja7fjanltd"
Content-Disposition: inline
In-Reply-To: <20241204134410.1161769-2-dev@lankhorst.se>
X-Mailman-Approved-At: Tue, 07 Jan 2025 14:50:50 +0000
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


--3gfwd2ja7fjanltd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/7] kernel/cgroup: Add "dmem" memory accounting cgroup
MIME-Version: 1.0

Hello.

On Wed, Dec 04, 2024 at 02:44:01PM +0100, Maarten Lankhorst <dev@lankhorst.=
se> wrote:
> +bool dmem_cgroup_state_evict_valuable(struct dmem_cgroup_pool_state *lim=
it_pool,
> +				      struct dmem_cgroup_pool_state *test_pool,
> +				      bool ignore_low, bool *ret_hit_low)
> +{
> +	struct dmem_cgroup_pool_state *pool =3D test_pool;
> +	struct page_counter *climit, *ctest;
> +	u64 used, min, low;
> +
> +	/* Can always evict from current pool, despite limits */
> +	if (limit_pool =3D=3D test_pool)
> +		return true;
> +

> +	if (limit_pool) {
> +		if (!parent_dmemcs(limit_pool->cs))
> +			return true;
> +
> +		for (pool =3D test_pool; pool && limit_pool !=3D pool; pool =3D pool_p=
arent(pool))
> +			{}
> +
> +		if (!pool)
> +			return false;
> +	} else {
> +		/*
> +		 * If there is no cgroup limiting memory usage, use the root
> +		 * cgroup instead for limit calculations.
> +		 */
> +		for (limit_pool =3D test_pool; pool_parent(limit_pool); limit_pool =3D=
 pool_parent(limit_pool))
> +			{}
> +	}

I'm trying to understand the two branches above. If limit_pool is a root
one, eviction is granted and no protection is evaluated.

Then it checks that test_pool is below limit_pool (can this ever fail,
given the limit_pool must have been above when charging in test_pool?).
(OK, this may be called arbitrarily by modules.)

I think it could be simplified and corrected like this:

	/* Resolve NULL limit_pool */
	if (!limit_pool)
		for (limit_pool =3D test_pool; pool_parent(limit_pool); limit_pool =3D po=
ol_parent(limit_pool));
=09
	/* Check ancestry */
	if (!cgroup_is_descendant(test_pool->cs->css.cgroup, limit_pool->cs->css.c=
group))
		return false;

HTH,
Michal

--3gfwd2ja7fjanltd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ3wXbAAKCRAt3Wney77B
Sc3yAP9ovqhdPX1shEVmXcwsztc0uf1lRR+Wsxf3kwK/GFzF/AEA62OrZTWy+e7K
cKrPC5As6ORKo4sBmoUVQk/+c0xCRgY=
=per/
-----END PGP SIGNATURE-----

--3gfwd2ja7fjanltd--
