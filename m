Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48057C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 21:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A711710E2A0;
	Thu, 30 May 2024 20:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HaqsaWmP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E1310E2A0
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 20:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717102798; x=1748638798;
 h=message-id:subject:from:reply-to:to:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dlFPR0i0yESEl0c5Mu/xjnoy1T+zU/FkTtzmGQWZGFc=;
 b=HaqsaWmP0Rbe209/xncY13500axE2KZfhTgup5k4n7yZ8qn/NBMTU0A6
 Qeerm95YkDFbbMjyJ/9NMGBugVRWcGL5r+/ZvaoJgCpW7RxWUxqWITUaC
 adTrIF1Q3pReFzaMBXZW+43lVh26ka8EvU0dayuevHPaWfMemCZoSo/PW
 Zaq8eSKl2ULrdkXRS+bndL/RiK/RkR5svzKQ/IjCAaPxRXHWXv5VP7L4u
 JQcVxLomMd6p2dpl68rfg37YwhUPl7x0Xa/cXz53Xv2qKUt7Vjh9PEhgh
 5XsCUVEYSrfvazJ+bcMVJNPeS8e5MEj/uO6nmX5X5QfFholQfc6lRIHQi Q==;
X-CSE-ConnectionGUID: NtnCjJTTRQeZO05Aez+sng==
X-CSE-MsgGUID: MrcQ0peDTxu0MtGQzm+Vdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13443387"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="13443387"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 13:59:58 -0700
X-CSE-ConnectionGUID: Rg/TAFN6R9aEEaQWdvH5FA==
X-CSE-MsgGUID: x+9dsE7NQ8i2Apo4Sck2OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="36522077"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 13:59:58 -0700
Received: from [10.54.75.156] (debox1-desk1.jf.intel.com [10.54.75.156])
 by linux.intel.com (Postfix) with ESMTP id 82D622078A10;
 Thu, 30 May 2024 13:59:57 -0700 (PDT)
Message-ID: <f6c0cabd8807e27e9d3751df302531dcd67fa1f7.camel@linux.intel.com>
Subject: Re: [PATCH 4/6] platform/x86/intel/pmt: Add quirk for BAR0 offset
 adjustment
From: "David E. Box" <david.e.box@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 intel-xe@lists.freedesktop.org
Date: Thu, 30 May 2024 13:59:57 -0700
In-Reply-To: <20240510205948.904409-5-michael.j.ruhl@intel.com>
References: <20240510205948.904409-1-michael.j.ruhl@intel.com>
 <20240510205948.904409-5-michael.j.ruhl@intel.com>
Autocrypt: addr=david.e.box@linux.intel.com; prefer-encrypt=mutual;
 keydata=mQENBF2w2YABCACw5TpqmFTR6SgsrNqZE8ro1q2lUgVZda26qIi8GeHmVBmu572RfPydisEpCK246rYM5YY9XAps810ZxgFlLyBqpE/rxB4Dqvh04QePD6fQNui/QCSpyZ6j9F8zl0zutOjfNTIQBkcar28hazL9I8CGnnMko21QDl4pkrq1dgLSgl2r2N1a6LJ2l8lLnQ1NJgPAev4BWo4WAwH2rZ94aukzAlkFizjZXmB/6em+lhinTR9hUeXpTwcaAvmCHmrUMxeOyhx+csO1uAPUjxL7olj2J83dv297RrpjMkDyuUOv8EJlPjvVogJF1QOd5MlkWdj+6vnVDRfO8zUwm2pqg25DABEBAAG0KkRhdmlkIEUuIEJveCA8ZGF2aWQuZS5ib3hAbGludXguaW50ZWwuY29tPokBTgQTAQgAOBYhBBFoZ8DYRC+DyeuV6X7Mry1gl3p/BQJdsNmAAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEH7Mry1gl3p/NusIAK9z1xnXphedgZMGNzifGUs2UUw/xNl91Q9qRaYGyNYATI6E7zBYmynsUL/4yNFnXK8P/I7WMffiLoMqmUvNp9pG6oYYj8ouvbCexS21jgw54I3m61M+wTokieRIO/GettVlCGhz7YHlHtGGqhzzWB3CGPSJMwsouDPvyFFE+28p5d2v9l6rXSb7T297Kh50VX9Ele8QEKngrG+Z/u2lr/bHEhvx24vI8ka22cuTaZvThYMwLTSC4kq9L9WgRv31JBSa1pcbcHLOCoUl0RaQwe6J8w9hN2uxCssHrrfhSA4YjxKNIIp3YH4IpvzuDR3AadYz1klFTnEOxIM7fvQ2iGu5AQ0EXbDZgAEIAPGbL3wvbYUDGMoBSN89GtiC6ybWo28JSiYIN5N9LhDTwfWROenkRvmTESaE5fAM24sh8S0h+F+eQ7j/E/RF3pM31gSovTKw0Pxk7GorK
 FSa25CWemxSV97zV8fVegGkgfZkBMLUId+AYCD1d2R+tndtgjrHtVq/AeN0N09xv/d3a+Xzc4ib/SQh9mM50ksqiDY70EDe8hgPddYH80jHJtXFVA7Ar1ew24TIBF2rxYZQJGLe+Mt2zAzxOYeQTCW7WumD/ZoyMm7bg46/2rtricKnpaACM7M0r7g+1gUBowFjF4gFqY0tbLVQEB/H5e9We/C2zLG9r5/Lt22dj7I8A6kAEQEAAYkBNgQYAQgAIBYhBBFoZ8DYRC+DyeuV6X7Mry1gl3p/BQJdsNmAAhsMAAoJEH7Mry1gl3p/Z/AH/Re8YwzY5I9ByPM56B3Vkrh8qihZjsF7/WB14Ygl0HFzKSkSMTJ+fvZv19bk3lPIQi5lUBuU5rNruDNowCsnvXr+sFxFyTbXw0AQXIsnX+EkMg/JO+/V/UszZiqZPkvHsQipCFVLod/3G/yig9RUO7A/1efRi0E1iJAa6qHrPqE/kJANbz/x+9wcx1VfFwraFXbdT/P2JeOcW/USW89wzMRmOo+AiBSnTI4xvb1s/TxSfoLZvtoj2MR+2PW1zBALWYUKHOzhfFKs3cMufwIIoQUPVqGVeH+u6Asun6ZpNRxdDONop+uEXHe6q6LzI/NnczqoZQLhM8d1XqokYax/IZ4=
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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
Reply-To: david.e.box@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 2024-05-10 at 16:59 -0400, Michael J. Ruhl wrote:
> The offset for the discovery table is based on the P2SB bar.
> If this bar is not available, the parent driver may need to
> adjust the offset,
>=20
> Add a quirk to allow for this adjustment.

I'm not a fan of using base_addr in this was to adjust the offset. There wa=
s a
version that provided a separate base_adjust field to adjust the offset. Is=
 this
change only needed for DG2?

David

>=20
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
> =C2=A0drivers/platform/x86/intel/pmt/class.c=C2=A0=C2=A0=C2=A0=C2=A0 | 3 =
+++
> =C2=A0drivers/platform/x86/intel/pmt/telemetry.c | 2 +-
> =C2=A0drivers/platform/x86/intel/vsec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0include/linux/intel_vsec.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
> =C2=A04 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/class.c
> b/drivers/platform/x86/intel/pmt/class.c
> index 62e36dd89137..957cf74234da 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -349,6 +349,9 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entr=
y,
> struct intel_pmt_namespa
> =C2=A0	if (IS_ERR(entry->disc_table))
> =C2=A0		return PTR_ERR(entry->disc_table);
> =C2=A0
> +	if (intel_vsec_dev->quirks & VSEC_QUIRK_P2SB_OFFSET)
> +		entry->base_addr =3D intel_vsec_dev->base_addr;
> +
> =C2=A0	ret =3D ns->pmt_header_decode(entry, dev);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c
> b/drivers/platform/x86/intel/pmt/telemetry.c
> index c9feac859e57..7be9f9746363 100644
> --- a/drivers/platform/x86/intel/pmt/telemetry.c
> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> @@ -77,7 +77,7 @@ static int pmt_telem_header_decode(struct intel_pmt_ent=
ry
> *entry,
> =C2=A0
> =C2=A0	header->access_type =3D TELEM_ACCESS(readl(disc_table));
> =C2=A0	header->guid =3D readl(disc_table + TELEM_GUID_OFFSET);
> -	header->base_offset =3D readl(disc_table + TELEM_BASE_OFFSET);
> +	header->base_offset =3D readl(disc_table + TELEM_BASE_OFFSET) + entry-
> >base_addr;
> =C2=A0
> =C2=A0	/* Size is measured in DWORDS, but accessor returns bytes */
> =C2=A0	header->size =3D TELEM_SIZE(readl(disc_table));
> diff --git a/drivers/platform/x86/intel/vsec.c
> b/drivers/platform/x86/intel/vsec.c
> index 5378da9354b6..5a0dfc21eb0f 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -185,7 +185,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, s=
truct
> intel_vsec_header *he
> =C2=A0	if (quirks & VSEC_QUIRK_TABLE_SHIFT)
> =C2=A0		header->offset >>=3D TABLE_OFFSET_SHIFT;
> =C2=A0
> -	if (info->base_addr)
> +	if (!(quirks & VSEC_QUIRK_P2SB_OFFSET) && info->base_addr)
> =C2=A0		base_addr =3D info->base_addr;
> =C2=A0	else
> =C2=A0		base_addr =3D pdev->resource[header->tbir].start;
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 04f915a1ba0b..68e3a42040e8 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -65,6 +65,9 @@ enum intel_vsec_quirks {
> =C2=A0
> =C2=A0	/* Platforms requiring quirk in the auxiliary driver */
> =C2=A0	VSEC_QUIRK_EARLY_HW=C2=A0=C2=A0=C2=A0=C2=A0 =3D BIT(4),
> +
> +	/* Broken P2SB access work around */
> +	VSEC_QUIRK_P2SB_OFFSET=C2=A0 =3D BIT(5),
> =C2=A0};
> =C2=A0
> =C2=A0struct pmt_callbacks {

