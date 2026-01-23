Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8A2D778AF
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 20:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8FB10E2E7;
	Fri, 23 Jan 2026 20:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e3SHTLkW";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4C710E2E7
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 20:16:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 29C5543907;
 Fri, 23 Jan 2026 20:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43F9C4CEF1;
 Fri, 23 Jan 2026 20:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769199369;
 bh=wt/m7TfqM0NEUsQw1nlxEE5l7zWRqjHxqhVxbsET1ss=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e3SHTLkWSOsKRgkRogL13SC0HE3icSspFGg1Xbc07cTup245RekuaZ81UTJObP+kE
 JUQX5sOhxc9urNopDvgtwcDo2kdXTqOQNCcMu1ZwR2+NeA6RTAbrphjvzDbP3+OUTV
 ipnoM0XFNClOnejO8hmRCPXMRvDwklFPdL27971wzEtH3svLoyPwzZKasBeB2ikgNW
 EjBYnXx+fbMdNx6dlaNdFws3l3fpIjm9LBaN9aGkjxTWsztt/KVDKsDEDfC3AFnatj
 3w3h/eQy+7FFQs1ePtQbypbA229lQ9gfBi7tkoAltrT/jUoKupdGSPBrIpfVABjOWa
 ElxCM4jeSvIFg==
Date: Fri, 23 Jan 2026 20:16:05 +0000
From: Mark Brown <broonie@kernel.org>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Souza, Jose" <jose.souza@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: Mail problems for Lucas De Marchi?
Message-ID: <585d9e41-8627-48cc-aa3e-efb1ab9cbb90@sirena.org.uk>
References: <3135e2fd-fdac-469c-be2e-6c1cb024883f@sirena.org.uk>
 <8542127c23736029c476033bc933e12503bc3fd3.camel@intel.com>
 <CYYPR11MB8430903D2AE8BDD782B59B128B94A@CYYPR11MB8430.namprd11.prod.outlook.com>
 <2919dcfb-68ec-46e4-858a-08a0d42c27ff@sirena.org.uk>
 <ca24e8a12732720302823d1571e217017e5744c4.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rqZr/a1vdxM8kDUs"
Content-Disposition: inline
In-Reply-To: <ca24e8a12732720302823d1571e217017e5744c4.camel@intel.com>
X-Cookie: HAIR TONICS, please!!
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


--rqZr/a1vdxM8kDUs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 23, 2026 at 08:13:07PM +0000, Vivi, Rodrigo wrote:
> On Fri, 2026-01-23 at 17:03 +0000, Mark Brown wrote:
> > On Fri, Jan 23, 2026 at 05:01:28PM +0000, Vivi, Rodrigo wrote:

> > > Commit aa8225d4ee87 ("MAINTAINERS: Remove myself from xe
> > > maintainers") address that

> > If this happens in future please remember to also update linux-next,
> > we've got a separate list of contacts for the various trees we merge.

> I could swear that drm-xe-next was feeding linux-next already, or
> perhaps drm-next?

It is, that's where the problem comes from - there was an issue which I
reported and got a bounce for since the contacts reported for the tree
included Lucas.  I'm asking for a notification of any changes in the
contacts similar to what's done with MAINTAINERS.

--rqZr/a1vdxM8kDUs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlz1wQACgkQJNaLcl1U
h9B4/wf+PghXXcaOkkX+huiPaDxRkqnCCTw7Fhk+8swuVQwAYmQ+Uo8KdzVLZmBm
TmZKkm08iJtS8iuADHYMir4QrdCAfnwDXHHG0N5LsAjqvWLoHrQmwDHxTUM1duOt
zlyfzMIrk/nz6lY0Y09qimOw2Q7Tpg7wBGQnrsOofFz5WXFt1Wq0XNmTFbfmrxQL
B2AX24KRVsfO61HCVQuc/3NBlFOrCAgcUHGF2T2W7Uw8KHzk93MGTDnDMMO/t76O
HQ6p3OaxQV7zkJJNIlX221px/kpYacJkd9TXFWRQC+P2tO9k4ZcBCLGx8SZ4hrO/
BjgYVHCCuzkCHri/0VZBgAy0YrSCfQ==
=eVyx
-----END PGP SIGNATURE-----

--rqZr/a1vdxM8kDUs--
