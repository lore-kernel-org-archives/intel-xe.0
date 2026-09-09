Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0090C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A5A10F1EB;
	Wed,  9 Sep 2026 16:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R6OIZ3Lr";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A147310F1EB
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 16:00:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E782043B09;
 Wed,  9 Sep 2026 16:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12C61F00A3A;
 Wed,  9 Sep 2026 16:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788969651;
 bh=0YutiE2I6LY6knyCn6soNpoqFmJi5kd3ZhbkChGjbug=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=R6OIZ3LrYZ6hjfdGW+aTLdzgfTVRURWL8KKinObJOkWZ5FzjCHhOjbuReYceU33Ob
 zYJZlkN3PRrT+0lniP827ZlQHI/plGc1KzV0qHqUsWWS6ikqWJbwuXDHhf1Xi60Xxp
 hzzqKGorRbw22D1xUfT0aZ21DEboEyDW35kakpaT+r6KbVWoI3GBVt2tvqCuWQ8eGY
 qQJNnAWBqntWn9jOT8Kmb39xW6+KtYiQwWEKNpTmNQrhh7cGIMlzoVI5JmuK0Wcemh
 /qHqvxZBQ0hHt0NNTmIXoXNGFilkxLJ89Yv3dT+M5bj2uzSwGmQgBLlrL9mmjF6vps
 Sq5GJJCcylNcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/20] platform/x86/intel/pmt: Do not remap when
 using callbacks
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909154739.1515514-27-michael.j.ruhl@intel.com>
References: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
 <20260909154739.1515514-27-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 16:00:51 +0000
Message-Id: <20260909160051.A12C61F00A3A@smtp.kernel.org>
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
- [High] Unconditional sysfs `mmap` support allows userspace to bypass hard=
ware synchronization and power management.
--

commit 7fda3c54de1f0a266f9aa7c8acdc3ab9ae36340e
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Subject: platform/x86/intel/pmt: Do not remap when using callbacks

A callback indicates that the parent driver is responsible for accessing
the data area, making a PMT memory remap redundant. This commit skips
creating a remap if a read_telem callback has been provided.

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
>  	sysfs_bin_attr_init(&entry->pmt_bin_attr);
>  	entry->pmt_bin_attr.attr.name =3D ns->name;
>  	entry->pmt_bin_attr.attr.mode =3D 0440;
>  	entry->pmt_bin_attr.mmap =3D intel_pmt_mmap;

[Severity: High]
Does unconditionally assigning intel_pmt_mmap in intel_pmt_dev_register() a=
llow
userspace to bypass the read_telem callback requirements?

Since intel_pmt_mmap() in drivers/platform/x86/intel/pmt/class.c directly m=
aps
the physical BAR memory into userspace:

drivers/platform/x86/intel/pmt/class.c:intel_pmt_mmap() {
    ...
    if (io_remap_pfn_range(vma, vma->vm_start, pfn, vsize, vma->vm_page_pro=
t))
    ...
}

any process with read permissions can mmap the sysfs attribute. If the proc=
ess
then reads this mapping, won't it entirely bypass the parent driver's power
management (like xe_pm_runtime_get_if_active) and hardware synchronization?

If the device is in a low-power state, an unpowered MMIO read might cause a
system-level PCIe bus hang, or read corrupt state if the SoC re-mapper is n=
ot
configured.

Should mmap support on the sysfs attribute be disabled when a read_telem
callback is present?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909154739.1515=
514-22-michael.j.ruhl@intel.com?part=3D5
