Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A21C7EE2D
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 11:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB4010E147;
	Thu, 25 May 2023 11:29:48 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F2910E054
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 11:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685014186; x=1716550186;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5WZaXLdpk0xZonhFUp9BrYIqxKrxSxYtuvd9xccY56A=;
 b=iupEVzNQHjOe2R9KTQTEEBIt1NzH19zj9GBLwEI06zQxbqNyz4WGzkDL
 RlcMNyk1Tf+Wa5zYwx11ZDkgOdpAYgbZi5CrTdMhd3+MEAWMMU2C8Sdid
 /jLhD2Mt1HCEJWwPhdZpu40P7T2kBwvW1HAxH1Mfcr9Ps8cLqWc2W4RPe
 jaONCGIkwpmKAbC56xvwZxoJf4EA6Q+MdVT0ZSSqr7P9aHbMnK6zYrYq6
 GoZNBjrb1vbgh63phWzniR953Tr7tR/NMto5ehmd2Yaz+ljhnF8MqXpYy
 ZDbcV05OfsnyAYKeru4qqFZ/g17LM2Fx8/bmZsmOe5eMfQeq5Oc3JhXka g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="353881583"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="353881583"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 04:29:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="704759236"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="704759236"
Received: from lsilistr-mobl.ger.corp.intel.com (HELO [10.249.254.226])
 ([10.249.254.226])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 04:29:44 -0700
Message-ID: <8948d145041ab990a8826fcdcf4404714e53371a.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 25 May 2023 13:29:43 +0200
In-Reply-To: <CAM0jSHPUrKtB3C=d7m3tUW2SNJ0hPwtQy9c9=NjxF6UXCc1sHQ@mail.gmail.com>
References: <20230525081615.179819-1-thomas.hellstrom@linux.intel.com>
 <CAM0jSHPUrKtB3C=d7m3tUW2SNJ0hPwtQy9c9=NjxF6UXCc1sHQ@mail.gmail.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix engine lookup refcount race
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 2023-05-25 at 11:52 +0100, Matthew Auld wrote:
> On Thu, 25 May 2023 at 09:16, Thomas Hellstr=C3=B6m
> <thomas.hellstrom@linux.intel.com> wrote:
> >=20
> > Fix a race where the engine could disappear between lookup unlock
> > and
> > xe_engine_get().
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_engine.c | 3 +--
> > =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_engine.c
> > b/drivers/gpu/drm/xe/xe_engine.c
> > index 094ec17d3004..3a400a546dfe 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > @@ -161,10 +161,9 @@ struct xe_engine *xe_engine_lookup(struct
> > xe_file *xef, u32 id)
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&xef->engine.lock=
);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e =3D xa_load(&xef->engine.x=
a, id);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&xef->engine.lock);
> > -
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (e)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 xe_engine_get(e);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&xef->engine.lock);
>=20
> Makes sense to me.
>=20
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>=20
> But looking around a bit, why does engine_get_property_ioctl() not
> use
> this? It also does a raw xa_load() and then touches the engine
> without
> holding the lock or keeping a ref?

Yeah, the lookups / xa_load()s probably needs an audit Also should
probably check if we can reuse the xa_lock for some lookups.

/Thomas


>=20
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return e;
> > =C2=A0}
>=20
> > --
> > 2.39.2
> >=20

