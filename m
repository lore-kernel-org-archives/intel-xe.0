Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2611F606A31C
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 13:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror header.d=shazbot.org header.i=@shazbot.org header.a=rsa-sha1 header.s=fm2 header.b=Tp7vFy+m;
	dkim=permerror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha1 header.s=fm3 header.b=lWtYIO5u
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D224C10F307;
	Mon,  9 Nov 2026 13:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=shazbot.org header.i=@shazbot.org header.b="Tp7vFy+m";
	dkim=permerror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lWtYIO5u";
	dkim-atps=neutral
X-Greylist: delayed 326 seconds by postgrey-1.36 at gabe;
 Thu, 05 Nov 2026 15:56:02 UTC
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2324211294E
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 15:56:02 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 42FA81400064
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 10:56:01 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Thu, 05 Nov 2026 10:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1793894161;
 x=1793980561; bh=+w/qXuZYlkYWda1Xs168VpdBCh2Dw2DrXwv9zMQs/hE=; b=
 Tp7vFy+ml/J+qoAsN9LR30B9FH0eTmcjDBsCzs7Gtz7KXXOIayDZ3Mw8x7+C4Lqj
 SxxWmB8uDfQAyCh6IdiyBtFU6hMcFqshBxBgzJdgGGO58D2XIfbdiVWzVJ0mnJvB
 9nkBfSHntLRYWfVi4GS6UNzKijwBGO0fVeSVIgTy/ewxQ8pi4Ri8m2/HySpNX6Ur
 Go15IvpdpOtkxOjSbDhaV9SHK/K3pj/TqSnaYZo+dGuz9DUiYpZLdWIzn8JiLNUy
 VTdzqKbEJ943zSlFP7f0hP32uExRVW5Tydm7dFi5ZcvjBmo2Bxktmy5yjtXRR/Yl
 5S9Ta/29t/CKwg/uP+93WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793894161; x=
 1793980561; bh=+w/qXuZYlkYWda1Xs168VpdBCh2Dw2DrXwv9zMQs/hE=; b=l
 WtYIO5u+p+RS5RW199ijq7wEp1HC3vwa9ey20jbF3rPtwkk8h8VC7GLdS0kOKZbU
 r2LD9u0BEixRC3EZ/4O+6JC+1xs5/UZ9nvHCiZr/b6ldVTGxqdTdCbweGLx0MU41
 uzHkyNwGC/MsOAlMWtHhJuJaOBu7wjWYwGYoVtK/tEodO/YJfHSQrmPoZGak0ZhM
 ffl/IbitJnsdXLcn/p11W83dBSntYB3TvPM+LSwYogAQhCAAyF3f9pqxBCZDodJe
 yUqbBp+toMB49yj/q7j+7Hfbs0ovoD20m1N2NJtAU/Fqp0lbSNaPJmznm8Ak+CiX
 KfBmcqQZzLpJ8w5hp+e0Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
 repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
 action=sign d=shazbot.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793894161; d=shazbot.org;
 mf=PGFsZXhAc2hhemJvdC5vcmc+;
 rt=PGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4=;
 s=fm2:rsa-sha256:i3JOJb5PY5+C9J9aWvMYYVYnDvokz1zH7xlLcZmIx/3D642
 lbSZXWJEnbihw+YajSo+Dfs5n6EjNb0pMFKwZE0OVsOw2aXv2fyzlwyaUyZi1wQ6
 tnTForLaj0FSc0cf+cWKfmBte3qfKvlSdMK4gvqeUnb51F2SifX2pubEYoMuOOkX
 x2thovha8alqdkNoXDNZ1PpcP5G/q1mt6mzxN+mMNUsW0E1P6funsv22sAIIF85R
 aFzCWrxzpOXg4Pppv/QuUbBQeZx+do8cRd9ojpdqyXtdW0Dq6INxEIKgWiEu2+1V
 6WzFLrfKluNv/5UOns8nXrF+gwa9m9eSnIndnug==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
 repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
 action=mi-m=1; hc=12;
 hn=cc,content-transfer-encoding,content-type,date,feedback-id,
 from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1;
 h=sha256:QA3IHDmvKSgxkp/sTa87qrbZu/nPmIWtFO2Jb4VWasw=:IlYIUMRd+p2tmJ/4ATkU1O6vMgxes57IUB7wLLb0i6E=;
X-ME-Sender: <xms:Eafsal1wc3Yowo0VN7Gaa9xb5VpYRlEG4Rr9sI53NztFzt0xOH4lLg>
 <xme:EafsahAbY2_WoTA46vzl1WLPvvpsd6m5aWGnhlZEAPhMRFDmn7QD9BmNeFVmzltLg
 cnrR_xI6KgmxzDAf21DPo5NVkTBCbQ6DhMsWBtJ7gOd2Fp41p-W3Zj0>
X-ME-Received: <xmr:EafsaqIVw8uf_MhkBJ6jnadbOz8inXaERR2vWU53CjZHMhGa-kjAv5uBLtVizQ>
X-ME-Proxy-Cause: dmFkZTEJhUV9GZq7jdzC1PgG1hjRQjI1vid1nMaRF6RGvBf7WUx3vry9QM7nA0rfpPyMf/
 sEBD95XaWRz4mwDvZqHXIogCQgZM1tHEMOSqY23kipvUMEjh8OIVW6cfaNTqmEzpCn3U0F
 C6Y9pPuN1CmwoY9tvMQUy2h6eSp+j7mB2I7o6JT9zWUFe5MV/vPGe0jWhP8ys9CIhA9feY
 hviLgVlq2yiQXwC7vUlGk6sEz+ztaGL2InuBNu1lxdD6Vr5rjwC6WyTdkkoy0R6JIxYB9r
 EDnaVcHII3u7J3UMZEgVrV0yQGz1yIuz6vNL/upsSBImEXLEmAL6fcUhAwYDqwvs12xRSb
 94/BkP06WB4Z3TM4h6mF9plJaxBmY8bQxyYwEOTtYph3goq1GcLEs/Uw/FqMtGUNhaPd7l
 mkppxuYQ7SYZRlusznAjYIdG1/BSWgA1Y9KOyYkAP68pAmhRiZ//FhnvEOK92+kzeFKO/v
 v7AFP+Z77uEb6pD4tTjNhH7sWFMWEcuIdF+9fvyfq/bHM1RsDjTGpZR13NMLkeGoVNzlh3
 cpF8M7/FP6tH519Hx3RoHkZ7AKouddXvfIwmQiAGIXFmdIFeUHkqffsRHoR11ImVHc7Q6t
 l0kOzaOiIhmz0V1BERuH5mEUOsazzRVNAqXbvA9qnxD8+5+JNoqCL5roMbSg
X-ME-Proxy: <xmx:Eafsail4eYaOBZymuQNEtFOoESTo5-m_YnEN7kwa5kveTJD2-QJiNA>
 <xmx:Eafsarb7f4BTpsCYrrnEBzgvlOFuThtg55ELeATkxcX6gdSr5a2cOw>
 <xmx:Eafsam-XNwr-3Y972gYt_9Ig3HMYKCMpSBzBXJ-9_RQO9xghbvf7UA>
 <xmx:EafsaiZts5tFDquDe8Vsxu8SLKOu9l-xYU9IcG-u6tPAkMRbEqD76w>
 <xmx:EafsalHCZ-DcDQRxgDVNEn4bboqbz_iP3siSLvNihXqRwcsu4LhAvHf1>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 10:56:00 -0500 (EST)
Date: Thu, 5 Nov 2026 08:55:58 -0700
From: Alex Williamson <alex@shazbot.org>
To: "=?UTF-8?B?UGnDs3Jrb3dza2ks?= Piotr" <piotr.piorkowski@intel.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Cc: <kvm@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 =?UTF-8?B?TWljaGHFgg==?= Winiarski <michal.winiarski@intel.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, alex@shazbot.org
Subject: Re: [RFC PATCH 4/4] vfio/xe: Hide BAR ranges by default per device ID
Message-ID: <20261105085558.75666f25@shazbot.org>
In-Reply-To: <20261105153738.1938345-5-piotr.piorkowski@intel.com>
References: <20261105153738.1938345-1-piotr.piorkowski@intel.com>
 <20261105153738.1938345-5-piotr.piorkowski@intel.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 09 Nov 2026 13:57:00 +0000
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
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 5 Nov 2026 16:37:38 +0100
"Pi=C3=B3rkowski, Piotr" <piotr.piorkowski@intel.com> wrote:

> From: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
>=20
> xe-vfio-pci accesses the BARs only through vfio-pci-core, so opt in to
> hidden BAR ranges.
>=20
> Let each entry of the PCI ID table describe the ranges to hide by
> default. The description is always looked up in the static table, so
> binding through new_id or driver_override can't skip them.
>=20
> No device defines any ranges yet.

We don't merge dead code, so the whole series is to justify the
configfs mechanism to introduce excluded ranges without publishing them
to the community?  Hard no.  Thanks,

Alex

>=20
> Cc: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> Cc: Alex Williamson <alex@shazbot.org>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Yishai Hadas <yishaih@nvidia.com>
> Cc: Shameer Kolothum <skolothumtho@nvidia.com>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/vfio/pci/xe/main.c | 60 ++++++++++++++++++++++++++++----------
>  1 file changed, 45 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
> index 7dab3e024aa8a..e63af6123f598 100644
> --- a/drivers/vfio/pci/xe/main.c
> +++ b/drivers/vfio/pci/xe/main.c
> @@ -24,6 +24,16 @@ struct xe_vfio_pci_migration_file {
>  	u8 disabled:1;
>  };
> =20
> +/**
> + * struct xe_vfio_pci_desc - device specific description
> + * @hidden_ranges: BAR ranges hidden from the VFIO user by default
> + * @num_hidden_ranges: number of entries in @hidden_ranges
> + */
> +struct xe_vfio_pci_desc {
> +	const struct vfio_pci_bar_range *hidden_ranges;
> +	unsigned int num_hidden_ranges;
> +};
> +
>  struct xe_vfio_pci_core_device {
>  	struct vfio_pci_core_device core_device;
>  	struct xe_device *xe;
> @@ -543,8 +553,32 @@ static const struct vfio_device_ops xe_vfio_pci_ops =
=3D {
>  	.detach_ioas =3D vfio_iommufd_physical_detach_ioas,
>  };
> =20
> +#define INTEL_PCI_VFIO_DEVICE(_id, _desc) { \
> +	PCI_DRIVER_OVERRIDE_DEVICE_VFIO(PCI_VENDOR_ID_INTEL, (_id)), \
> +	.driver_data =3D (kernel_ulong_t)(_desc), \
> +}
> +
> +static const struct pci_device_id xe_vfio_pci_table[] =3D {
> +	INTEL_BMG_IDS(INTEL_PCI_VFIO_DEVICE, NULL),
> +	INTEL_CRI_IDS(INTEL_PCI_VFIO_DEVICE, NULL),
> +	INTEL_NVLS_IDS(INTEL_PCI_VFIO_DEVICE, NULL),
> +	INTEL_NVLP_IDS(INTEL_PCI_VFIO_DEVICE, NULL),
> +	INTEL_PTL_IDS(INTEL_PCI_VFIO_DEVICE, NULL),
> +	INTEL_WCL_IDS(INTEL_PCI_VFIO_DEVICE, NULL),
> +	{}
> +};
> +MODULE_DEVICE_TABLE(pci, xe_vfio_pci_table);
> +
>  static int xe_vfio_pci_probe(struct pci_dev *pdev, const struct pci_devi=
ce_id *id)
>  {
> +	/*
> +	 * Dynamic IDs added through new_id are matched before the static ones
> +	 * and carry no driver data, look the description up in the static
> +	 * table so that they can't bypass the default hidden ranges.
> +	 */
> +	const struct pci_device_id *match =3D pci_match_id(xe_vfio_pci_table, p=
dev);
> +	const struct xe_vfio_pci_desc *desc =3D
> +		match ? (const void *)match->driver_data : NULL;
>  	struct xe_vfio_pci_core_device *xe_vdev;
>  	int ret;
> =20
> @@ -554,6 +588,17 @@ static int xe_vfio_pci_probe(struct pci_dev *pdev, c=
onst struct pci_device_id *i
>  		return PTR_ERR(xe_vdev);
> =20
>  	dev_set_drvdata(&pdev->dev, xe_vdev);
> +	xe_vdev->core_device.hidden_ranges_supported =3D true;
> +
> +	if (desc) {
> +		ret =3D vfio_pci_core_hide_bar_ranges(&xe_vdev->core_device,
> +						    desc->hidden_ranges,
> +						    desc->num_hidden_ranges);
> +		if (ret) {
> +			vfio_put_device(&xe_vdev->core_device.vdev);
> +			return ret;
> +		}
> +	}
> =20
>  	ret =3D vfio_pci_core_register_device(&xe_vdev->core_device);
>  	if (ret) {
> @@ -572,21 +617,6 @@ static void xe_vfio_pci_remove(struct pci_dev *pdev)
>  	vfio_put_device(&xe_vdev->core_device.vdev);
>  }
> =20
> -#define INTEL_PCI_VFIO_DEVICE(_id) { \
> -	PCI_DRIVER_OVERRIDE_DEVICE_VFIO(PCI_VENDOR_ID_INTEL, (_id)) \
> -}
> -
> -static const struct pci_device_id xe_vfio_pci_table[] =3D {
> -	INTEL_BMG_IDS(INTEL_PCI_VFIO_DEVICE),
> -	INTEL_CRI_IDS(INTEL_PCI_VFIO_DEVICE),
> -	INTEL_NVLS_IDS(INTEL_PCI_VFIO_DEVICE),
> -	INTEL_NVLP_IDS(INTEL_PCI_VFIO_DEVICE),
> -	INTEL_PTL_IDS(INTEL_PCI_VFIO_DEVICE),
> -	INTEL_WCL_IDS(INTEL_PCI_VFIO_DEVICE),
> -	{}
> -};
> -MODULE_DEVICE_TABLE(pci, xe_vfio_pci_table);
> -
>  static struct pci_driver xe_vfio_pci_driver =3D {
>  	.name =3D "xe-vfio-pci",
>  	.id_table =3D xe_vfio_pci_table,

