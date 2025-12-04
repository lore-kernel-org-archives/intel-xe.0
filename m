Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AF3D2A536
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 20:49:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25BB10E9C0;
	Thu,  4 Dec 2025 20:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QKtpVVCM";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547D810E9BD
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 20:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764881355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XihbxyNOWKvwzb1hOVY2xnF0q0hWz1wS+HjreADM5/Y=;
 b=QKtpVVCMYQKmp7JSQn1PgKhLOBkTt5WSnDbDaWUUE/c3UZL+EpRzjnqw+/qTZtnNltK5gE
 yCIC6rsIV+RGhEN/vfv5gUh9qQJrg9+kXT8ix/TRVLS561CNalM6TIskejZHBWWfK0J0kU
 XLrUoF3MRhxv3TL/o/kC5YayITf/jPw=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-f6lucSu0NZyktbKxOyPrVA-1; Thu, 04 Dec 2025 15:49:14 -0500
X-MC-Unique: f6lucSu0NZyktbKxOyPrVA-1
X-Mimecast-MFC-AGG-ID: f6lucSu0NZyktbKxOyPrVA_1764881353
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-bde2d88e5e3so2373463a12.2
 for <intel-xe@lists.freedesktop.org>; Thu, 04 Dec 2025 12:49:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764881352; x=1765486152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XihbxyNOWKvwzb1hOVY2xnF0q0hWz1wS+HjreADM5/Y=;
 b=uGQeGNlsJCr5hn1nHl9eniqgnnQOQFGR2WImzLKMzJE6taTPcGmyY67CQWLh3c1G0p
 fXE7ruYHd/XtwlHR7nbRso5A7w6aVx81zP3PabMb5/GfML/a2/B1w0pNB54EyM8VPuDp
 GIPZg5mT3oh6V+lAbHwxUz6+3M+mZuu9LFMDsXKsaoXg7Z2AgQigk/z8m/Cms/4g88TL
 J8cSh9mfyrbJZozikXmHuyk/nuPMExu2V0//T8w7hJJkkxSRv4zTpFK4g1QIHJWTvLUx
 N6B8/htWU4r47K1a5N8Sr3woRccERz3N7QDeWlAe0vgCXAOJGdwZs0aRI4X77KcUmYn5
 DydQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUS3hQTLd0jXzLAenKpZviMSHkTHN9+BMmQNCi/W75wqJx+y4L7G6qC4zyhvmwCiPtz1qkaWu7fQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOmAp0g6AYO3kquGw8gs7SekfVaoMD9D36YDS9Om/JjGtzZ0l3
 F87d+fmLAtgypp008oFmllLwT8ZgI3Uz7lhPLcUFgrrpGB2uLNLOtkvn2N9U23ywy23oDnGa/7w
 IeIoXIrV1IVtRITmkKrPaLY6kCMJkohr7KaOX513biVB8aFwxz2hWoNSe9GjaXw9tF2664veLrO
 liU4n3Ws8aaZyqAGutYswPyhJPuEvrZD2CvUtfCTVYHsJwaSgib88=
X-Gm-Gg: ASbGncvRU95t063KCkhuKrhKEsqfluQ2udYAhtg7l0pVPg5Ff/gbe+RqeZQVnJtTZuE
 GBqjxxL6BdjPjh/pY0o2/bzaRvORtvauRuJ5OtZdFO6lVxyOXorv1CtmemxPuKKqRqOwbQzAVvY
 mW+RW0WpKDvdVz4quOKbcQzwpLjLlq5MzFe8K1l+e/tHS/qBCgnfI4YY43o4vbUU4X
X-Received: by 2002:a05:7301:b11:b0:2a4:3593:6451 with SMTP id
 5a478bee46e88-2ab92d77f2bmr4226723eec.1.1764881352364; 
 Thu, 04 Dec 2025 12:49:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8x9ZmXfAE2orkznNeuwgvAV+wy0YEIWZ/Ws1yH7UK9HKbPlckyoSRBNXvJzp/Axh389VW7NyFhaHGOLyoB0g=
X-Received: by 2002:a05:7301:b11:b0:2a4:3593:6451 with SMTP id
 5a478bee46e88-2ab92d77f2bmr4226708eec.1.1764881351920; Thu, 04 Dec 2025
 12:49:11 -0800 (PST)
MIME-Version: 1.0
References: <20251204202059.326605-1-thomas.hellstrom@linux.intel.com>
 <CAHk-=wja02iemw40Sn4Vio6b1-rr3idFBcUrOV+=vodhOmZZ=Q@mail.gmail.com>
 <e3fe071073ae54dc58012c1c2d892a18be8036d8.camel@linux.intel.com>
In-Reply-To: <e3fe071073ae54dc58012c1c2d892a18be8036d8.camel@linux.intel.com>
From: David Airlie <airlied@redhat.com>
Date: Fri, 5 Dec 2025 06:48:59 +1000
X-Gm-Features: AWmQ_bkeIZHanr11IeXDa1WIAIDpNz8wVly5_2vWVXLwYP2FxSYJdAZpHExT--I
Message-ID: <CAMwc25ounBF8xxTbTdK=4GChhzNs93yWr95GP2RoKMMNQ3G6Gg@mail.gmail.com>
Subject: Re: [PATCH] drm/xe: Fix duplicated put due to merge resolution
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NLKVyjYajjAmP3aX_mHvPKOuynUrL29gMvcCAOW3dIk_1764881353
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Dec 5, 2025 at 6:44=E2=80=AFAM Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Hi, Linus
>
> On Thu, 2025-12-04 at 12:41 -0800, Linus Torvalds wrote:
> > On Thu, 4 Dec 2025 at 12:21, Thomas Hellstr=C3=B6m
> > <thomas.hellstrom@linux.intel.com> wrote:
> > >
> > > An incorrect backmerge resolution resulted in an
> > > incorrect duplicate put. Fix.
> >
> > Ack. I can confirm that this seems to fix the issue for me. Thanks
> > for
> > the quick response.
> >
> > Should I just apply it directly?
> >
> >            Linus
>
> OK with me if ok with Dave.

Please do.

Acked-by: Dave Airlie <airlied@redhat.com>

>
> Thanks,
> Thomas
>

