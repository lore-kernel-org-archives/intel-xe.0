Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B827C54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 11:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0006112A37;
	Tue,  5 Mar 2024 11:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="n1Td/qmK";
	dkim-atps=neutral
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289AE112A37
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 11:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=AvGk8qWdnTpD1Pt67t1al0f+4KIoSFfEqyejkyT+SkM=; 
 t=1709637432; x=1710847032; b=n1Td/qmK+xMSVdPysKRCunEaOAThLGjZuGXeVglts6ETxO4
 HfOJeVHZdcscYYiK/e2M/lC3KJBruECWt+UQfCOwe/j+32NWT0Q+f3vhcLiTnlpHp9qSwQyF/lqqR
 /J8JwGod8oUdlLWClDz92u7hj8A3cFTKhzoYyrR5/RFBZtkYv09uxAKks5JsUjKsUGmEH0oAfAIhE
 nmYZcxtXzWEqneDIilCgCloMxHsD6+bYa8Hp9o0EoipF3l8wQMiwIfsGJ8CkjbPF/nIszwVY4xIHs
 hJhlsAnxhrBmMHaGc5eMwHeo3vx8VFspxfxDD/40hBjX75qphfHp4/MuKs6EpzFA==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97) (envelope-from <johannes@sipsolutions.net>)
 id 1rhSnF-00000002jjy-1E4o; Tue, 05 Mar 2024 12:17:09 +0100
Message-ID: <85a255986ee577c655375d014402d4d650e7ca42.camel@sipsolutions.net>
Subject: Re: -Wmissing-prototypes warnings in user-mode linux
From: Johannes Berg <johannes@sipsolutions.net>
To: Jani Nikula <jani.nikula@intel.com>, Richard Weinberger
 <richard@nod.at>,  Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 linux-um@lists.infradead.org
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi
 <lucas.demarchi@intel.com>,  Tiwei Bie <tiwei.btw@antgroup.com>
Date: Tue, 05 Mar 2024 12:17:08 +0100
In-Reply-To: <87frx52btl.fsf@intel.com>
References: <87jzmh2chs.fsf@intel.com>
 <5d1dfb9fce5d7647ff3203080416eadc9806059a.camel@sipsolutions.net>
 <87frx52btl.fsf@intel.com>
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

On Tue, 2024-03-05 at 12:49 +0200, Jani Nikula wrote:
> On Tue, 05 Mar 2024, Johannes Berg <johannes@sipsolutions.net> wrote:
> > On Tue, 2024-03-05 at 12:34 +0200, Jani Nikula wrote:
> > > We're seeing a lot of -Wmissing-prototypes warnings when building
> > > user-mode Linux. For example, our CI hits things like [1], and it's j=
ust
> > > extra noise in the build.
> >=20
> > Yeah ...
> >=20
> > > I started adding some prototypes, but I lost my way around the arch/
> > > subdirectory a bit. I'm not always quite sure what should or could be
> > > included where, or whether a new header should be added instead, etc.=
,
> > > so it wasn't going as quickly as I'd hoped.
> > >=20
> > > Do you perhaps already have plans or, better yet, patches to address
> > > this? Feels like it should be fairly quick for someone familiar with =
the
> > > arch/um codebase.
> >=20
> > I think this series addressed most already?
> >=20
> > https://patchwork.ozlabs.org/project/linux-um/list/?series=3D393619
> >=20
> > But I haven't checked myself yet.
>=20
> Oh, nice, it certainly helps!
>=20
> But after applying that in my branch, I do still get a bunch of
> warnings.
>=20

I cleaned up the patchwork a bit now, but looks like we don't have
anything else yet :)

johannes
