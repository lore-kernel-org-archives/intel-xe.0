Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E579B606A321
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 15:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iB1Umo06
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC8E10EF2F;
	Mon, 23 Nov 2026 15:18:10 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAFF10E1B8
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 14:10:41 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4bb5b8ef642so8219555e9.1
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 06:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1795183840; x=1795788640;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5S4P9EVhrzfLBPEUlAs5RhZwbxTfoymelcBjiUJ2aGo=;
 b=iB1Umo06fZVhtY8QkXZrHakiUgHIQAYm1yniF0HFhNNTrgrpHCL+g+HkMaMCKf/QaS
 M+bvF3IDxWVMX4d47H99mh9EkthdlQpcDW4MWOZ0I3pYMkg+T504v5J058jpoMkD0mJ4
 5BbkrVCu8rSUiIQ3/SKMXieS9F1NcVOe/lbSuDz+LobzziGQNRRfPPNPWeZF7hqphQ+X
 Wgln24r9Iy0Q+RJmaYgmZRJz2AOmR+FSjEW+KL/FXypmEb22soqcq77hWjvZNy1mwfsV
 VU874ngAOvdeD4QNV3GoTWdawOSahfEgC2UWcRlu2aY2AzFYg3d2X8fhfNIp0BK/cHVv
 2f/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795183840; x=1795788640;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5S4P9EVhrzfLBPEUlAs5RhZwbxTfoymelcBjiUJ2aGo=;
 b=F+FOQRSmftBmvgNshpxHQGYPE5OHj1h3VpDpH4QM6T0iNYbBBLxOixO108USKPb3lF
 eiH1QP3kB6zb38ZaMYZFy6E++Xpvf+IetOheryRbl8h6/b7Gd7B6sPswSJ3GV5pMiVtY
 I3c1B5Yn2s8jj/xDySAOoRNwKoxs81YO20VjRRRdKlmsd34Rom/QIqM/zw1X/z+QITBb
 8/82tXk7u6Tc9HCiTu1wb/haebpjQdRe0JmHPuGk7IUb3avBv6ds98yy6kCabjVNdF0D
 SrGO8TnipTZ44Ixv8AvEhqxbiQqsrJT8Q+Uw6eDWnqFLJx5nnZCdWkznLBrRKdfCGjPr
 sn1g==
X-Forwarded-Encrypted: i=1;
 AL+hErFfuHHzxtuj+jI0EJYAvu/zxMaFNND9550w6gJgcClkurGie7igbxBVFZdgXYDQ8TpM9RZwiMj37Q==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9ZE/kdlkot6UIQhiXvAx8wV4V+IfbgMelrVte7iDe0ECu/9B9/
 dI/JqpFMXRZt5ou4VXJ9+l2e/a250aBFjscTL1RtQ/drK4g37ImU+28DYLmRjxfmRNQ=
X-Gm-Gg: AYBFou14h7mXSnOy2w7e0ilqVA0B5AZWIuXptDVGkvnNCGqYYLFdyyPi8REA85YLSD4
 gYeCICpaYNkRnY3E6AeM8/z+aAWtOb62wgj+FwvwLjSyOyQWBzGr2Kzan9Z/4Cep9CKcZC440SD
 xL+T60s+gZp0m5wKZRjJKV1U3m1QEIhXBXwbcAkETtNq9mj63244owZ1aNh7zFREQeAzQqUYmhb
 +b30Rt4YQ0AY1lW8fJw0UiRPgUgq/NvGk/3D1VFJ8oJBOY1KCZViXn7vMKCv1DHiwkT//63fCpo
 w8/N0AtwDEfMRl89hXCW/ExGKDfocrdW7cdE10qZfJLQfn45zhJzHAbH4MxssO8Tgtvhu5O4qd4
 2HLSY143W1kMY8RiUDlb+Zzz245TJSIYGYhlZCBTvb8LNDe8MWsh9V7Ber8USAW53ahTBGZDhVf
 oAOEOWRzHpHnlz1oTDkg5dk0hRFda3DrSmqaYbvMnaJe+c45izXNOKKlb4DgpYdaJ7c1MU77DlQ
 fJGZZzqv1xTKIOuqcLERMLBG+Ae7IqUC1Oa7DThdhydVBGvbcaJ7OrDO2gI7b9z1iKL3rne1HuD
 V4F5kTtbyv1eaJ+/Ri+D9LYSZQJHuVKOjqVj9x9G1Opms2laFV6i53k6jhse8I41olKT7c76zZ6
 MkhMFQdejO+08SUA8
X-Received: by 2002:a05:600c:3b1a:b0:4a7:8fe8:130c with SMTP id
 5b1f17b1804b1-4bb8881d4damr71087005e9.28.1795183840190; 
 Fri, 20 Nov 2026 06:10:40 -0800 (PST)
Received: from localhost
 (p200300f65f19a9041d3eb07d772156f3.dip0.t-ipconnect.de.
 [2003:f6:5f19:a904:1d3e:b07d:7721:56f3])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4bb895f66e1sm37012445e9.0.2026.11.20.06.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 06:10:39 -0800 (PST)
Date: Fri, 20 Nov 2026 15:10:38 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Yao Yuan <yaoyuan@linux.alibaba.com>
Cc: Alex Williamson <alex@shazbot.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
 "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 David Lechner <dlechner@baylibre.com>, Armin Wolf <W_Armin@gmx.de>, 
 Thierry Reding <thierry.reding@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Karl Mehltretter <kmehltretter@gmail.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, 
 Borislav Petkov <bp@alien8.de>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
 Marco Elver <elver@google.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
 Jeff Layton <jlayton@kernel.org>, Bradley Morgan <brads@mainlining.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
 Pnina Feder <pnina.feder@mobileye.com>, Mete Durlu <meted@linux.ibm.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Rio <rioo.tsukatsukii@gmail.com>, 
 Feng Tang <feng.tang@linux.alibaba.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Yishai Hadas <yishaih@nvidia.com>, Longfang Liu <liulongfang@huawei.com>, 
 Ankit Agrawal <ankita@nvidia.com>, Brett Creeley <brett.creeley@amd.com>, 
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, 
 Julian Ruess <julianr@linux.ibm.com>, Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Eric Auger <eric.auger@redhat.com>, 
 Mostafa Saleh <smostafa@google.com>, Pranjal Shrivastava <praan@google.com>, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, qat-linux@intel.com,
 virtualization@lists.linux.dev, 
 intel-xe@lists.freedesktop.org, kvm@vger.kernel.org
Subject: Re: [PATCH] vfio: Allow untainted use of driver_override
Message-ID: <awBUG7-QzXplEiUT@monoceros>
References: <DMYH4ED3GWDO.29DGXPK4M82VR@kernel.org>
 <20261118235645.2907908-2-alex@shazbot.org>
 <xzp5gljhburzbpol5bgnyyzwdrgpw3fj6ff3j23ein27raiidw@kti7moeuwvb5>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="76ybofus6n5n73yb"
Content-Disposition: inline
In-Reply-To: <xzp5gljhburzbpol5bgnyyzwdrgpw3fj6ff3j23ein27raiidw@kti7moeuwvb5>
X-Mailman-Approved-At: Mon, 23 Nov 2026 15:17:28 +0000
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--76ybofus6n5n73yb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] vfio: Allow untainted use of driver_override
MIME-Version: 1.0

On Fri, Nov 20, 2026 at 10:17:46AM +0800, Yao Yuan wrote:
> On Wed, Nov 18, 2026 at 04:56:44PM +0800, Alex Williamson wrote:
> > Driver overrides are the standard mechanism for binding vfio drivers
> > to devices.  With the introduction of the support_driver_override flag
> > in the core driver struct, it's now required for drivers to declare
> > themselves as driver_override compatible, otherwise driver_override
> > bindings will be denied or generate a kernel taint.
> >
>=20
> Hi Alex,
>=20
> > Set the support_driver_override flag on the driver struct across all
> > vfio drivers.
>=20
> LGTM.
>=20
> Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

I missed your reply when I sent the next revision of this patch. I had
to trim the recipients of the v2 because gmail refused to send it with
everyone on Cc: who was emitted by get_maintainer.pl. So please see
https://lore.kernel.org/kvm/fb0df5c89336b77a373ae0f890f63427e4adbb28.179517=
1088.git.u.kleine-koenig@baylibre.com

But also note, that if v2 is picked up using `b4 am`, your Reviewed-by:
is considered as the patch didn't change.

Best regards
Uwe

--76ybofus6n5n73yb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsAVNwACgkQj4D7WH0S
/k5TyQf/eHBkTiGwub1DLzfSI9Ji/DkzXua0OriEhTmok4cd+2dbl8OfLn0CXg3e
B7W5T3PuQPmIapUivPRGpIJ31hN6+UScHDdfNvj1Xbret/ZoqA+0l48dqU/ikpgB
X4WK2ENvhE+glZpB32rPkpeMadqauuBUmh1TjWnpLKn4QmgLyf+pHIJSnUmH7XkQ
BV2i7AIctyUc2PP/Y+URhj62+6B5pxn3+5BlligAvpjkpg98TxVTctcCEgP4apyk
TI6uZtnd9maFMXHbUJHEArWhVKI8FLAzZySY9/E7u4+tsY0gz/JMib7RngFR2IY4
MPZB/liFV473f+eDblZh9CKsu8DAJA==
=wiOu
-----END PGP SIGNATURE-----

--76ybofus6n5n73yb--
