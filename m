Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB36BC27C53
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 12:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1FA10E849;
	Wed, 12 Jun 2024 12:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="jt086iYZ";
	dkim-atps=neutral
X-Greylist: delayed 2341 seconds by postgrey-1.36 at gabe;
 Wed, 12 Jun 2024 12:41:44 UTC
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4F110E849
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 12:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=mL6cvqeW+xRR7/gR0vCFleXEVve6zwKquscdx7tNoCA=; 
 t=1718196104; x=1719405704; b=jt086iYZN8WQ2DKhnAhHOOoLIZ5lJIiAcQuqrGnzDFuT+R8
 gU7QhnvrlY1gEwyRWJdXFCwsXGxn3HGPGBKu61CAbdUT4imolgIiSoweSQPiTq3QBJtEGH8JPPf3p
 wwGsGLQ6Eo2UDZNNIu76nUR14x5Buo1zYjwSAWPbGM/AzCXuCAUVTL996yCDoGfiBaNlcvWLhbyJN
 ytXAXIFLA3uQeFJxLY24RHfljwyCLR6+9gizrGF3nDJfdpQp7PGTKyH/5BGMRKW5DIwjtgNQHC1i5
 NGdAFq8jCUr5n4B0ysHxwZ4Bgi+QzXYYh/juF6RPG6OlynlWr57Tw2gIcbbE9hkg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97) (envelope-from <johannes@sipsolutions.net>)
 id 1sHMgZ-0000000AEXv-1ybR; Wed, 12 Jun 2024 14:02:39 +0200
Message-ID: <49c2fbdc91d128c5249d50d016d97c8e5162f7b7.camel@sipsolutions.net>
Subject: Re: [PATCH v6 1/2] devcoredump: Add dev_coredumpm_timeout()
From: Johannes Berg <johannes@sipsolutions.net>
To: =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, 
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Mukesh Ojha
 <quic_mojha@quicinc.com>,  Jonathan Cavitt <jonathan.cavitt@intel.com>
Date: Wed, 12 Jun 2024 14:02:37 +0200
In-Reply-To: <20240611174716.72660-1-jose.souza@intel.com>
References: <20240611174716.72660-1-jose.souza@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
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

On Tue, 2024-06-11 at 10:47 -0700, Jos=C3=A9 Roberto de Souza wrote:
> Add function to set a custom coredump timeout.
>=20
> For Xe driver usage, current 5 minutes timeout may be too short for
> users to search and understand what needs to be done to capture
> coredump to report bugs.
>=20
> We have plans to automate(distribute a udev script) it but at the end
> will be up to distros and users to pack it so having a option to
> increase the timeout is a safer option.
>=20
> v2:
> - replace dev_coredump_timeout_set() by dev_coredumpm_timeout() (Mukesh)
>=20
> v3:
> - make dev_coredumpm() static inline (Johannes)
>=20
> v5:
> - rename DEVCOREDUMP_TIMEOUT -> DEVCD_TIMEOUT to avoid redefinition
> in include/net/bluetooth/coredump.h
>=20
> v6:
> - fix definition of dev_coredumpm_timeout() when CONFIG_DEV_COREDUMP
> is disabled

Got to v6, heh.

I still don't think this is _right_, but I guess I'm OK with giving you
rope to hang yourself ;-)

Acked-by: Johannes Berg <johannes@sipsolutions.net>

Seems like you really should've CC'ed Greg though since these things
usually went through his tree, so if you want to take them through yours
he really should be at least aware ...

johannes

