Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BBDC54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 10:35:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6584D10E8FC;
	Tue,  5 Mar 2024 10:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="HftBPSbe";
	dkim-atps=neutral
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D36210E8FC
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 10:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=pI7/JaYM4GUmwB7VUnN2pyZZuAWLxsng++hIQ/NUv8A=; 
 t=1709634951; x=1710844551; b=HftBPSbeMBBJvEv3ELslFxlNQDTd9fg3qVtqi2qhccqk9zh
 Ti4piNmhknPkr37/pp7dyVoRUK1wC4NyzMOocUKLmS3Tt3ibK/vCPYdi1lZBlqfebieE+qzuNXDoa
 B98gaP176wqqv87oTNXMuXV7tGCK0n9QxY+Mboo9NsMPHv6iIRp9sOnfEEHrW86Ym0TFssZ0B1D7a
 rCvbKF02MBX43Y42TwHYy9IQa1pCf5TXIlICDWYymp5ZPPUDjFQi3yOTPyU+3g/t9GZ4abj0oVsrg
 b43dAKxGxLmrXkGs0uGPs8l/MNnK3baGhtQMMMv/UA9Ot8v5iO7IGnu+OtbfT9fw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97) (envelope-from <johannes@sipsolutions.net>)
 id 1rhS9E-00000002i7c-13tD; Tue, 05 Mar 2024 11:35:48 +0100
Message-ID: <5d1dfb9fce5d7647ff3203080416eadc9806059a.camel@sipsolutions.net>
Subject: Re: -Wmissing-prototypes warnings in user-mode linux
From: Johannes Berg <johannes@sipsolutions.net>
To: Jani Nikula <jani.nikula@intel.com>, Richard Weinberger
 <richard@nod.at>,  Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 linux-um@lists.infradead.org
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Date: Tue, 05 Mar 2024 11:35:46 +0100
In-Reply-To: <87jzmh2chs.fsf@intel.com>
References: <87jzmh2chs.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Tue, 2024-03-05 at 12:34 +0200, Jani Nikula wrote:
> We're seeing a lot of -Wmissing-prototypes warnings when building
> user-mode Linux. For example, our CI hits things like [1], and it's just
> extra noise in the build.

Yeah ...

> I started adding some prototypes, but I lost my way around the arch/
> subdirectory a bit. I'm not always quite sure what should or could be
> included where, or whether a new header should be added instead, etc.,
> so it wasn't going as quickly as I'd hoped.
>=20
> Do you perhaps already have plans or, better yet, patches to address
> this? Feels like it should be fairly quick for someone familiar with the
> arch/um codebase.

I think this series addressed most already?

https://patchwork.ozlabs.org/project/linux-um/list/?series=3D393619

But I haven't checked myself yet.

johannes
