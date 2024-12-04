Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619CCE7716E
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 14:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7EC10E0DB;
	Wed,  4 Dec 2024 14:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kw9UZ11H";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D979710E0DB
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Dec 2024 14:18:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 621D55C6EB6;
 Wed,  4 Dec 2024 14:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B357C4CED1;
 Wed,  4 Dec 2024 14:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733321923;
 bh=3ayiCYKdCeeZmDby0tpBL5OzMxBMtlsn6IKrJFlYFh4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kw9UZ11HUAYdBJsMifrjAa18mRMEzktZVajukp5KWD1M/sJZqoDg7RnW72ILEALMY
 F2SWNKiRXX9JJKKrnRoF7e6gZGPtczMgMKSfH+7j0NUtOJ5QCGQR1m6hR2Q4+TnL9P
 mpHnImPpxFldkkOyTRcjj3ut/SdR2avsohwkxNLaiIU9ezE7mN5oKHW1ELRhqPDIqQ
 OefV3uorVMNUXC7gpuG1qVurnXsi3Ifn71NUskkw3HQ8PRgoDjJ0VAbNclVgdULTdI
 G1aQak+i3rWPWJVOBSNQ0R6Idcomt8V1xv2Zcuu5w75aROZoHYZsqVBZzGZfWAzi+7
 l1oyXeZQcFPoA==
Date: Wed, 4 Dec 2024 14:18:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Dave Airlie <airlied@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Message-ID: <57279266-d844-47d7-9c53-17fdae080b9e@sirena.org.uk>
References: <Z1BawrcFMsj0ByLk@sirena.org.uk>
 <87a5db36j6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IurF841KVjN5RdcV"
Content-Disposition: inline
In-Reply-To: <87a5db36j6.fsf@intel.com>
X-Cookie: My mind is a potato field ...
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


--IurF841KVjN5RdcV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 04, 2024 at 03:46:21PM +0200, Jani Nikula wrote:
> On Wed, 04 Dec 2024, Mark Brown <broonie@kernel.org> wrote:

> > You need to merge up cdd30ebb1b9f36159d66f088b61aee264e649d7a ("module:
> > Convert symbol namespace to string literal") from mainline and fix up
> > for the changes in MODULE_IMPORT_NS.  I'll apply a fixup for now.

> Commit cdd30ebb1b9f ("module: Convert symbol namespace to string
> literal") isn't even in a tagged release yet. We'll get it when -rc1 is
> out *and* backmerged to drm-next.

Yes, it's very disruptive :(

--IurF841KVjN5RdcV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdQZL0ACgkQJNaLcl1U
h9BNaQf/RRCVZDUfBV8IMrJHgZV8/JM2OJEoX30BUV0DsnX7wU7pvL3TJ4wH2utQ
bdg5p6bDnd0vxPhzxqy/rKu/r2frXWAI93t9PZe5B43W7rwp2Mi3b9qLAPEHY+fj
1MnVqlc4GCA4sCsdXp4RceARIrlCOFVYYdBv7ob3DyAwoxHSrbw32uoYIdFdmbGw
Q3VALlrenY5pbwmqBjolHcufNvuI1V5RcZxV70MBhf7aw1zBNSQWFo3SkC6g/tfx
InqGiM0XDRygIA0NLS6OaOJG+K+Ot4xcNTv5x/GhmMSMiYXSOaUNdKZUSmQS2iRL
aXihEaCvS3E1NlqoEB4UJfzT/R8fiQ==
=vMto
-----END PGP SIGNATURE-----

--IurF841KVjN5RdcV--
