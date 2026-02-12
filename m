Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904DEEE3695
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 16:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9E510E27C;
	Thu, 12 Feb 2026 16:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="O1QSHMbF";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Y8YHu7SD";
	dkim-atps=neutral
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6821810E27C
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 16:22:38 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id A688E7A0141;
 Thu, 12 Feb 2026 11:22:37 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 12 Feb 2026 11:22:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1770913357;
 x=1770999757; bh=H9S1pcMvMufgeBBtWQu0pbw6BL9Wiszq/p8h/oHXstg=; b=
 O1QSHMbFFcbUhIzmS4TfzwmG2mM2eKs2OCt61diAXvDglb+pCQrvywEKUxEo5pnD
 J7ZSh/TwDBn9ixxSW1XyL1ZqQQuxucbtY6tCoy2E1A8HoPoWicba5Zekt8zO+zGG
 GlDGYCVTOD9gltcrx218Y+paDw1kft16B8YXAMyQF89d9ZGi3ne1nzanPzGJlHG2
 KQc1RT6ZAKVV/jrlHoXJuFTzylPfFZXjJEyU200Qz0BMiEriWvwNZ+0UjhzItBTi
 jUBJh1y57z9FaY6lg4+QclY9sG7CtvTLOnNyC43QCK1GVYkvuLhW8uQUzbpCZVDl
 RavbKXtIcR7XFcCPBHPzfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1770913357; x=1770999757; bh=H9S1pcMvMufgeBBtWQu0pbw6BL9Wiszq/p8
 h/oHXstg=; b=Y8YHu7SDI1SHVhK2t8WVwKVWc7K9W27/sWPE9jAR13k4y6d9G1H
 BLpdC2N2hjWIKcGr9UV1FQWbYJ9IRoCZRdmxkVeATUsenb/F5LuHu2Fbmo4KGofv
 wyvmPEvjAAN/TmLqOfTLX6CQOUC+6Z08O33iNHITz8S9ZCexDd+crNCAfZw+llDz
 0orndii4MSw/0vYK0Bl+WPHxMhA5Z1o6VkyoyMWgDv65DTfzj+4hBeEx+tDcz7h6
 4Nxn8QYRhopXHnh57N1AZ7otmFhhA3KixnzJLXKl6AMzgOwhtaGAwU8YwI47/PZF
 ZfspqI6FH6M3lTAeqK0OVKBVvQUXXZWufJA==
X-ME-Sender: <xms:Tf6NaTjTTpwdFbARAnwe9Z-sRe3F0kNVj_Na5jDL5rEfXdJjuZea_Q>
 <xme:Tf6NaXzCvo-YEzZ9ZpzQx8UvhBJb141EMJcQdkkLi0nYZmlX6AlU-FMhPgz6pHxuu
 1RvyRoaiho9cs29HbdWD7CDEhcQYC-z9f3YSYwaZPmOPzlK3A>
X-ME-Received: <xmr:Tf6NaWKypdPi4yqtd-uK0EANWwCpkZXygvukWEMmPyPr3ZQ7ig9yZ1BArns0WnQmwtpOEKCydH1-3nb2TIOT_sPwgEMPYjjRu1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdehkeegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:Tf6NaeSAunQ_o63VFXOaoOPYYvFtNpM5EJ8YSH64wXf2AmsxhZSWdA>
 <xmx:Tf6NaerCODtp3qkPOrUNno-XAc81ETB9ZdjpHqWrbG1iCUM4GB5kYQ>
 <xmx:Tf6NaTr6LzU_cLIkcgdKqmUgte3D0y8aFdHl7yH3WTtFQZPRUI6MaA>
 <xmx:Tf6NaYO0nyeeGlCk_hhSh17HNhp8l4FVQEZEGiiuTKahF_2rcBmZmg>
 <xmx:Tf6NaV1O8CsYsr0XQSWu0wZ-KPmwxdk-3KrIPKI5jgbWtiD6NrtbmKOI>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Feb 2026 11:22:36 -0500 (EST)
Date: Thu, 12 Feb 2026 17:22:34 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19
Message-ID: <aY3-Shto7px4M1RK@mail-itl>
References: <aYtznP_tT6xNPwf-@mail-itl> <aY3ttvtxGCPTNgsj@Mac.lan>
 <aY3yqOTn9EQfO4rF@mail-itl> <aY387XuhCEZ0JNTN@Mac.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jRRBc1ZgOtYQSbU+"
Content-Disposition: inline
In-Reply-To: <aY387XuhCEZ0JNTN@Mac.lan>
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


--jRRBc1ZgOtYQSbU+
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Feb 2026 17:22:34 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19

On Thu, Feb 12, 2026 at 05:16:45PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 12, 2026 at 04:32:56PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Thu, Feb 12, 2026 at 04:11:50PM +0100, Roger Pau Monn=C3=A9 wrote:
> > > On Tue, Feb 10, 2026 at 07:06:20PM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > Hi,
> > > >=20
> > > > Recently I started testing compatibility with Intel Lunar Lake. Thi=
s is
> > > > the first one that uses "xe" instead of "i915" Linux driver for iGP=
U.
> > > > I test it with Qubes OS 4.3, which uses Xen 4.19.4 and PV dom0 runn=
ing
> > > > Linux 6.17.9 in this test.
> > >=20
> > > Not sure it's going to help a lot, but does using a PVH dom0 make any
> > > difference?
> >=20
> > Yes, it makes a difference. I end up with black screen as soon as dom0
> > starts... And due to unrelated bug (in xhci console code?), I don't have
> > kernel messages :/
>=20
> Hm, that's ... very helpful.  We should fix the xhci stuff so we know
> what's going on there.  Is the xhci bug also PVH only, or PV is
> equally affected?

XHCI console works just fine with PV dom0. But I just noticed I had
older Xen binary there today, will re-test on the same 4.19.4 again. And
then will submit separate bug report (even if that's likely be me fixing
it anyway).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--jRRBc1ZgOtYQSbU+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmN/koACgkQ24/THMrX
1yx49wf+NBy2A+DagwA6RfHlLXBvuP5r2FQy2upo0kdOI6l/8Tr45/jVBb0i7QNj
UBqM2W+itJigC+a8e/2CsOZZOH8KzEB6zesumNG64EMvP8p4a64Y2x/yqRxj3/My
Hvuq27dKpCSoLNsKHDr+kuXPGni0TbZxA/Hp2+qjhzlMy9GhKhl4GmwtWyFVKWD3
k5X9TDN2G51ajwcGLDV100UqYqhg0VH1uWPNS4Z2OzZRahv0uWHyf1Xzm4P04lrP
yvQsgL7SEDCxr1H6hodnIblaERsyu3AhERIMqJ8jl7IeYOjDE2Xsd7hWGt65FZhI
Vim+as2uFZmL2+Lp9GIoIa8c85NeOQ==
=zQiG
-----END PGP SIGNATURE-----

--jRRBc1ZgOtYQSbU+--
