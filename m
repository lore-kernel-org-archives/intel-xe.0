Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC24CCD1AB
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 08:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A055210E0DB;
	Fri, 24 Oct 2025 08:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="bHQR8Qu5";
	dkim-atps=neutral
X-Greylist: delayed 1640 seconds by postgrey-1.36 at gabe;
 Fri, 24 Oct 2025 08:39:45 UTC
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B77E10E0DB
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 08:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=2cMlx6dBNBmuoC08wN2ZIHtm4MB/TmlTbPKY6RErk4M=; 
 t=1761295185; x=1762504785; b=bHQR8Qu5jNN+atWCUw8vLPEoUJssFDtU0yohMEruaMf6RNe
 g9/dlAcGdLLopj3VMgCpNU8bYu02ufEJUZxV0+atNMXpVh80EFEGeKilhU5lp4nvp6zXxA6sWaTgG
 oWegKj5sr56FxaktrdDxEuNOd0NLk5k9kzSN60xo0V9Pja2OQQqaW23E+mWUsCZqFKTRFecJuaaLQ
 8jMf+bPRpB2NRPO6NBc9yZbUrBEPpQoqayPYlppomnEk7Z8i6EKnPpkrIo3OnjgKwkdi47w/61n95
 PjY8MjDqC5rF+1VqYpRpWphyV2lqdkz5glAQq8Fa7d6ZKOWuY69huZPqcwIrkHdA==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.98.2) (envelope-from <johannes@sipsolutions.net>)
 id 1vCDKm-00000002PRW-3W1T; Fri, 24 Oct 2025 10:39:41 +0200
Message-ID: <247568f47e1955be454e951e80a9063123f97c66.camel@sipsolutions.net>
Subject: Re: [PATCH] devcoredump: Fix circular locking dependency with
 devcd->mutex.
From: Johannes Berg <johannes@sipsolutions.net>
To: Maarten Lankhorst <dev@lankhorst.se>, linux-kernel@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org, Mukesh Ojha <quic_mojha@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich	 <dakr@kernel.org>,
 stable@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>
Date: Fri, 24 Oct 2025 10:39:39 +0200
In-Reply-To: <c4bd0ddb-4104-4074-b04a-27577afeaa46@lankhorst.se>
References: <20250723142416.1020423-1-dev@lankhorst.se>
 <e683355a9a9f700d98ae0a057063a975bb11fadc.camel@sipsolutions.net>
 <c4bd0ddb-4104-4074-b04a-27577afeaa46@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
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

On Fri, 2025-10-24 at 10:37 +0200, Maarten Lankhorst wrote:
> >=20
> > CPU 0				CPU 1
> >=20
> > dev_coredump_put()		devcd_del()
> >  -> devcd_free()
> >    -> locked
> >      -> !deleted
> >      -> __devcd_del()
> > 				-> __devcd_del()
> >=20
> > no?
> >=20
> > johannes
>=20
>=20
> Yeah don't you love the races in the design? All intricate and subtle.

:)

> In this case it's handled by disable_delayed_work_sync(),
> which waits for devcd_del() to be completed. devcd_del is called from the=
 workqueue,
> and the first step devcd_free does is calling disable_delayed_work_sync, =
which means
> devcd_del() either fully completed or was not run at all.

Oh... right, I totally missed the _sync. My bad, sorry.

I guess I really should say

Reviewed-by: Johannes Berg <johannes@sipsolutions.net>

since I finally _did_ review it carefully. Sorry it took forever.

johannes
