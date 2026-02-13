Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAB4EEA871
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 01:31:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7570510E778;
	Fri, 13 Feb 2026 01:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="LUrEHbQq";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="bZp0SR6k";
	dkim-atps=neutral
X-Greylist: delayed 480 seconds by postgrey-1.36 at gabe;
 Fri, 13 Feb 2026 01:31:09 UTC
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B828910E778
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 01:31:09 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id DB06D14000BE;
 Thu, 12 Feb 2026 20:23:08 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 12 Feb 2026 20:23:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1770945788;
 x=1771032188; bh=fQ40VqxOfTTtzqBNmdSQBJyJkvtwAyGECh/4w1BV088=; b=
 LUrEHbQq6RHSefhVA6nGxeSBciov0FUWMFWS+pF5EHdHBIXqWlTnaVqwMBapFSe3
 GoAVlnX03UAxPECrCtIQqbHHgN/p8nGYgdizVhhUnO63oLryE3lSKfDGcA+OT6ty
 1jl6dXDQVefl7WSgY4ZCJLUVzEBgc3ORUORlDdTgKWe2GK8+DZkEuxzhwu1MD2BW
 ROA1630J9FcQvd0XNCjPi6sTZ96zBB0ughDlX8ehiJXd8+uzsaiobcQi7ANs2Kyb
 QD1ZmNB9cNbWw0gHDshne0rW4eqHCtxcrzJlMO82ZDLWgxVTCrgv2/8QEjvt0hMs
 hmpa5Md/fa9KR3ayn6DMqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1770945788; x=1771032188; bh=fQ40VqxOfTTtzqBNmdSQBJyJkvtwAyGECh/
 4w1BV088=; b=bZp0SR6kYf66YSNBNNO81mDnCjRrFwq1+Wg6MAKc4gxc+iKrf0j
 W/tPqzGAhHg+IHY6roxr9HyzYVJS+jekLf0ag0ZwtSOT4b6t8GHlj/iYd25kkhil
 ohgM4yUdSf7MCmxkG1ThLZhu9emLTmCJ/Zz12S6Hknsn4Jcd3BiBCvx7vT2GpbfI
 p5vpi2w/5MYVN/+hzTWMeGo9M70tRnV1WXwhwdehuF8DPL5L/yGQ5p9snxeGE6bW
 zsBOMEZyegZEsnRLBcpLZ0yKbPOx6Jgp1MckqkEIQWJhKWMuFhx7f7LcN+e4QJC6
 auV0CN1vjT1t9acMmkYvBqUfQ2QkhmUg9AA==
X-ME-Sender: <xms:_HyOafMUORXuqfdHkJOavOR0G2RiMAFokMUQwyr_1sKuXYAJc9oSFQ>
 <xme:_HyOaRvB7kTKUBU8qh9_HUvDGMtnYnh5Y_mFNfCe5avh-isQdqcdP7ZO6K6bh5O5n
 C8f3GOQPGUpUWtgi1_h0VRkAppg7KLToksaIw05yNaXoeyOCQ>
X-ME-Received: <xmr:_HyOaRX2a7RgZo1S6qJ6caZnASfairDuGp0_HVj9i7zCaBuk1Q6cUzVrdpavgk2iz4OuyxgDtIcX9UUOL0FqQs8vywNKp7pCQO0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdeiledvucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
 feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
 nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepfedpmh
 houggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihig
 rdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojh
 gvtghtrdhorhhgpdhrtghpthhtohepihhnthgvlhdqgigvsehlihhsthhsrdhfrhgvvggu
 vghskhhtohhprdhorhhg
X-ME-Proxy: <xmx:_HyOaRsm_OzkZKXPCnJbZAX4jWIarDAlV4caFCce0qlWuH68Nir7xw>
 <xmx:_HyOaVWFT2o5_5I0c4FqBJc_ZGZo7KtRaj0QtWcosJ2CTYuO2n2AEQ>
 <xmx:_HyOacnjMLkItPH7fHt8tdNy--Ipc0jPddv4Yp5ATsNFvL8sT-KjOQ>
 <xmx:_HyOaWagrX-sihsYIiqlHJY6Aat35EgRDl5o7f7X8Sh-EqGUMvOlyQ>
 <xmx:_HyOaRxLvCIirLhYEAmZLD2SbYAeDhvzYN1UM3AbHeRusJ1V9LkDNPpx>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Feb 2026 20:23:07 -0500 (EST)
Date: Fri, 13 Feb 2026 02:23:06 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19
Message-ID: <aY58-gyarcVoBS2a@mail-itl>
References: <aYtznP_tT6xNPwf-@mail-itl>
 <aY3ttvtxGCPTNgsj@Mac.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MJFPgzPlR2IWv8LA"
Content-Disposition: inline
In-Reply-To: <aY3ttvtxGCPTNgsj@Mac.lan>
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


--MJFPgzPlR2IWv8LA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Feb 2026 02:23:06 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19

On Thu, Feb 12, 2026 at 04:11:50PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Tue, Feb 10, 2026 at 07:06:20PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Hi,
> >=20
> > Recently I started testing compatibility with Intel Lunar Lake. This is
> > the first one that uses "xe" instead of "i915" Linux driver for iGPU.
> > I test it with Qubes OS 4.3, which uses Xen 4.19.4 and PV dom0 running
> > Linux 6.17.9 in this test.
>=20
> Not sure it's going to help a lot, but does using a PVH dom0 make any
> difference?

Ok, now with the correct Xen version, it's better with PVH dom0. At
least on the login screen and few applications (from both dom0 and domU)
I don't see the glitches anymore. I can't do a full test, because PCI
passthrough doesn't seem to work with PVH dom0 on Xen 4.19 - and I need
it to start most VMs.

So, if the above test is representative, it's only about PV dom0.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--MJFPgzPlR2IWv8LA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmOfPoACgkQ24/THMrX
1yx9uwf/XS1nu9msraXWwrAMCdrtTwvbrC3EzRQbNtvAkRdYBmKEkWORstNdMyjM
ULC9BQ/a2vlknFIfmG0/PQc89oB3DZC2/TZQZmLM1uAq/bBiRPII3/a7pPB4NFm0
28CrVQCkckQ5Qo+yykB5KJk7cf8xeujC6eshJqSVHAPM3fJBclRJVAmHhe1QAjs5
1BFyUKVWkgZoUmuomJlg3VF3oJyyuBYsKmDyLreYrdJMH4pmKhOCJjTQ9Fe3zwM6
NkyIrCleg4BU2HBUy9Fk0RsD/MhD9F00br4ABOeXAUU+6Xfgs8Ape/RB6OYwonLq
+k+WMHfhYbPTGaWvgQZeEULXTVfEDw==
=ak9C
-----END PGP SIGNATURE-----

--MJFPgzPlR2IWv8LA--
