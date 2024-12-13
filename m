Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23845E7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 13:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B9C10E322;
	Fri, 13 Dec 2024 13:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="boBHWnff";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8B710E318
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 13:07:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4DAD95C6C45;
 Fri, 13 Dec 2024 13:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CF5C4CED0;
 Fri, 13 Dec 2024 13:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734095269;
 bh=uMeScOuP+OJQ7++MVgDmQiNlrlV1cFBdw7c/2oZGj7M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=boBHWnff/hgF7FYpIcsbAdtTvCOOWyqgQsee2l9hMkLuPWV4IsqpqT/Zol8V/qD5f
 vcJ08nFVsJudxKOCrDLx9T1Y5+/XYlXgrAtLgSApA2Ww9+2K9uMW3ARAVPHr+A8eow
 p/9UANhuvy7QD6Ui1V9/9c2FRbbEEkUor1MFWxGq0yrd0hNDxlfYNH0aKfe7qDvLXq
 UIazpUkuxj8v0414ScUCdzRNaj2WA7GJUo0EeSs9coMoh5uZtOcX8AX329P+qdoFXz
 ja9Hbp47XFsAbR39aR7Bp2Mu4smGtkouBFVMarZKi7Sal39ezC2CggPXSeWaBFa1QK
 OPyLB2/6FvJWQ==
Date: Fri, 13 Dec 2024 14:07:46 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Friedrich Vock <friedrich.vock@gmx.de>
Cc: Maarten Lankhorst <dev@lankhorst.se>, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tejun Heo <tj@kernel.org>, 
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 0/7] kernel/cgroups: Add "dmem" memory accounting
 cgroup.
Message-ID: <20241213-sceptical-maize-gazelle-fadc34@houat>
References: <20241204134410.1161769-1-dev@lankhorst.se>
 <29a71119-04de-4c76-a98a-d0fcb906390f@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xokrzpyhqued3d7l"
Content-Disposition: inline
In-Reply-To: <29a71119-04de-4c76-a98a-d0fcb906390f@gmx.de>
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


--xokrzpyhqued3d7l
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/7] kernel/cgroups: Add "dmem" memory accounting
 cgroup.
MIME-Version: 1.0

On Sun, Dec 08, 2024 at 01:15:34PM +0100, Friedrich Vock wrote:
> Hi,
>=20
> On 04.12.24 14:44, Maarten Lankhorst wrote:
>
> > Because it only deals with memory regions, the UAPI has been updated
> > to use dmem.min/low/max/current, and to make the API cleaner, the
> > names are changed too.
> >=20
> > dmem.current could contain a line like:
> > "drm/0000:03:00.0/vram0 1073741824"
> >=20
> > But I think using "drm/card0/vram0" instead of PCIID would perhaps
> > be good too. I'm open to changing it to that based on feedback.
>=20
> Agree, allowing userspace to reference DRM devices via "cardN" syntax
> sounds good.
>
> What about other subsystems potentially using dmem cgroups?
> I'm not familiar with the media subsystem, but I imagine we might be
> dealing with things like USB devices there? Is something like a
> "deviceN" possible there as well, or would device IDs look completely
> different?

I have some patches to enable the cgroup in GEM-based drivers, media
ones and dma-buf heaps. The dma-buf heaps are simple enough since the
heaps names are supposed to be stable.

I don't think using card0 vs card1 (or v4l0 vs v4l1 for example) will
work because I don't think we have any sort of guarantee that these
names will always point to the same devices across reboots or updates.

If the module is loaded later than it used to for example, we could very
well end up in a situation where card0 and card1 are swapped, while the
constraints apply to the previous situation.

Maxime

--xokrzpyhqued3d7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ1wxogAKCRAnX84Zoj2+
dq5iAX4rcVUShdPwwoe/RfA57qN/7Mx6+hgYbzJMWnzIBnKJz0dn+kbUlv3KGdwz
hWlIPsoBgJvEzg91vZJBiGdsdYRPIlkVHTfuFH/UOtHiSzM1KliMd5zv+JdtITN3
VU2IF4OnZg==
=efDB
-----END PGP SIGNATURE-----

--xokrzpyhqued3d7l--
