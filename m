Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A791C9830E
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 18:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0149310E13F;
	Wed, 23 Sep 2026 18:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dxuoxyXu";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFC610E13F
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 18:29:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1E59A418FE;
 Wed, 23 Sep 2026 18:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB55D1F0089E;
 Wed, 23 Sep 2026 18:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790188186;
 bh=+fYNVCNG/Qu28sg9rG3Sd18Ij+4+nQXpU/m0jlewaUs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=dxuoxyXujkq+g/uEZbb3akvb4G9Q31kLfHnRhntHnXhJD3sPtyHhnL31hCfms81q4
 lNvQEv7hJlSYPIPXyR2pBu2xIY5JSRZrOG8+XDWLV6MCZq9AtrQ20D+5kezkhZmkkp
 p2DXjGM29dS5cV4soGkgdHtg9GA+czQQy64mq9Nypr0wuQGAsWOaiuinztC8kIMgPk
 WQBxXOgkOHR/ctrjHZLLBBu6BuR7tbdJ7S9Rycjx1BiIspd4xgmf+BQJqIUQnJaCVv
 wSF7OYw2Hq5O0SVClQRox1EWeljalvrReCg9lwArTQr2rwZ3g96wPeAfqv8kSLiluw
 NPdUWzeyR289A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 05/20] platform/x86/intel/pmt: Do not remap when
 using callbacks
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260923181115.2514193-27-michael.j.ruhl@intel.com>
References: <20260923181115.2514193-22-michael.j.ruhl@intel.com>
 <20260923181115.2514193-27-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:29:45 +0000
Message-Id: <20260923182945.CB55D1F0089E@smtp.kernel.org>
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
- [Medium] intel_aet: silent telemetry read failure for PMT devices using c=
allbacks
--

commit 43eab3aee86b2e3202e1e7b01c4ce97411570441
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Subject: platform/x86/intel/pmt: Do not remap when using callbacks

A callback indicates that the parent driver is responsible for accessing
the data area. Creating a PMT memory remap is redundant. If a read_telem
callback has been provided, do not create a remap.

> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x8=
6/intel/pmt/class.c
> index 402d51df834a6..1c7a372b4fc42 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
[ ... ]
> @@ -403,14 +403,19 @@ static int intel_pmt_dev_register(struct intel_pmt_=
entry *entry,
>  	if (!entry->size)
>  		return 0;
> =20
> -	res.start =3D entry->base_addr;
> -	res.end =3D res.start + entry->size - 1;
> -	res.flags =3D IORESOURCE_MEM;
> +	/*
> +	 * The read_telem callback is responsible for this mapping, and may have
> +	 * different requirements for use. If the callback is present do not
> +	 * create the map.
> +	 */
> +	if (!(entry->cb && entry->cb->read_telem)) {
> +		struct resource res =3D DEFINE_RES_MEM(entry->base_addr, entry->size);
> =20
> -	entry->base =3D devm_ioremap_resource(dev, &res);
> -	if (IS_ERR(entry->base)) {
> -		ret =3D PTR_ERR(entry->base);
> -		goto fail_ioremap;
> +		entry->base =3D devm_ioremap_resource(dev, &res);
> +		if (IS_ERR(entry->base)) {
> +			ret =3D PTR_ERR(entry->base);
> +			goto fail_ioremap;
> +		}
>  	}
> =20

[Severity: Medium]
When a read_telem callback is provided, entry->base remains NULL.
Could this silently break telemetry reads for Intel AET?

If entry->base is NULL, it propagates to the telemetry endpoint:

drivers/platform/x86/intel/pmt/telemetry.c:pmt_telem_add_endpoint() {
    ...
    ep->base =3D entry->base;
    ...
}

Then pmt_copy_region() populates the telemetry region with this NULL addres=
s:

drivers/platform/x86/intel/pmt/telemetry.c:pmt_copy_region() {
    ...
    region->addr =3D entry->ep->base;
    ...
}

Finally, in intel_aet_read_event(), the region is skipped because the addre=
ss is
NULL:

arch/x86/kernel/cpu/resctrl/intel_aet.c:intel_aet_read_event() {
    ...
    for (int i =3D 0; i < e->pfg->count; i++) {
        if (!e->pfg->regions[i].addr)
            continue;
    ...
}

Because Intel AET strictly requires direct MMIO, it cannot support abstract=
ed
callbacks. This results in a silent failure to collect telemetry data from
AET-monitored devices that use callbacks, since intel_aet_read_event() will
skip the region and return -EINVAL on every read request.

>  	sysfs_bin_attr_init(&entry->pmt_bin_attr);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923181115.2514=
193-22-michael.j.ruhl@intel.com?part=3D5
