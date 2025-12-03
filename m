Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26282D1269D
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 10:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D957A10E104;
	Wed,  3 Dec 2025 10:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TrME8E5T";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4642810E104
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 10:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764757746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qblXqn/QMpqYaXbwXzu9x9sZsuNG8VFo90RKrBLW2Kc=;
 b=TrME8E5TSXHtbu2w+Rl7nMDtZI2og1lS3njbwZMlCh/ALg8w5zFCulicezHar6ZOlvMGgp
 glsVzMFl+B7+lPjU3wyFdYCpKEZnUY28mqGnpraePKgB7MGAgw6SZeUVB3w8QPCkJY9V56
 l655N8JF2QaFo4cX/BnS6oBaJhWs5U8=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-1o4t21WuM-CjF27sdGmoyQ-1; Wed, 03 Dec 2025 05:29:05 -0500
X-MC-Unique: 1o4t21WuM-CjF27sdGmoyQ-1
X-Mimecast-MFC-AGG-ID: 1o4t21WuM-CjF27sdGmoyQ_1764757744
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7b89c1ce9cfso5851463b3a.2
 for <intel-xe@lists.freedesktop.org>; Wed, 03 Dec 2025 02:29:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764757744; x=1765362544;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XGS+mHYG4PrWbToZur3MeIRA7pWGjQeZAp+77QWSays=;
 b=pcqgGgL29jDWvowH9EgT5da8BErg/q+GFedvM1u0lMxBg8CtxmXGKk3SCEOmCughMF
 hxijkqV3DjLCk55mx22NNGX9ApIkaUeaO9fXR8haB/Wdlyy4TeEnhIDHbpaH0XT0n+CR
 Spg2LzLFHc/GtIJwy4bMadE69Y4tGsrKAQksFNCk01+sAKfUkBrNmht1nDBgwb8lSy8y
 bZNW1bdawDg2htPiup6AtO5EEFBMExrg48u04RBQ1mLrwpRx0BfTI7EmgSeO0vh8dqwZ
 5WWUlY6Me4wgdi6FGyfMhjgq4nm0/eMk28uGXVZ2gOmOl46L+0cIOA7I4KkfJyYSgISt
 B8UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjaak2HrTtVHII0CWpdrA2vsu9iHkIepMiJGnUMVql8tz4x/9fcUaxlQRKkOsT3pc6OZGaGFCRMA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfKIfjTWSr4fnmps3tpIrBMkddstlM85MPGpHoQBi3Hd5MNZMG
 sCpTdAFZW657snPUiGI5RBn/yaGhkNztq8NFzhNPbNmtoaSreFotyVlllJuoNNBTnAQ/k3sginA
 +YOseza8vj97ZUjV34NyFAdkEeKxPwo8JvP0HIrpGpJek6enLnZorCTfByhGnr2j8wXB3
X-Gm-Gg: ASbGncvEW7p2g853a/AoepncHW2N/4vdsl58kUvG8F4WtSABiNIz1mhXqXcKkE9NQVi
 yz1bME0M4K33avxBmBGiwnnC7uZpn51firh5ErupjnuVH/39VT4ioQDnuEA3siA7l7ihQo+zIqQ
 eJeNAbZAL+AWhSJPRj1nF6aQvFF68xnTgSA3b7tDIupG2VWOaXxpJDWVLhgh0Sf0jAtYiZMg+43
 kwYAyKrBJUBeTiJhvYZp2XZJ12sCsMndZmMuQnFRNUuou103VNcClgRCsCqjlQdvdODFfXMFpBk
 zS3msqN/M4FwihUE1nMUq+q9r2Akf0q1QTC5cnQ7W3fbqh2w7eOmSPYUq736nJKzjj68hVZGkeL
 bR3+4AUtEKiteyQDPeA5SJKkoJRPL3KMaskc0
X-Received: by 2002:a05:6a21:999e:b0:35f:5fc4:d88c with SMTP id
 adf61e73a8af0-363f5d46ea5mr2380380637.13.1764757744196; 
 Wed, 03 Dec 2025 02:29:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjYpGTg+jJjhnKyQfPKG1ZG8GVqu/g7JqGfLsAio9vExnMALrh9T3CC5TQzWgOgAIPAFC6Eg==
X-Received: by 2002:a05:6a21:999e:b0:35f:5fc4:d88c with SMTP id
 adf61e73a8af0-363f5d46ea5mr2380357637.13.1764757743831; 
 Wed, 03 Dec 2025 02:29:03 -0800 (PST)
Received: from [10.200.68.138] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7d15e7db416sm19564819b3a.41.2025.12.03.02.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 02:29:03 -0800 (PST)
Message-ID: <56239a0c6f9a295d0124423c2701afb0de0da0a7.camel@redhat.com>
Subject: Re: [PATCH v7 2/9] drm/sched: Add pending job list iterator
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Alex Deucher
 <alexander.deucher@amd.com>,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, dakr@kernel.org
Date: Wed, 03 Dec 2025 11:28:54 +0100
In-Reply-To: <0088fe0dd0d62b876d77b0f9e3a1c7586bdc5557.camel@redhat.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
 <20251201183954.852637-3-matthew.brost@intel.com>
 <0088fe0dd0d62b876d77b0f9e3a1c7586bdc5557.camel@redhat.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: renKRIOHQmCPn6cXpvlzIDadeKSbgJMwvPUkR8Y0C50_1764757744
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

On Wed, 2025-12-03 at 10:07 +0100, Philipp Stanner wrote:
> +Cc Alex, Christian, Danilo
>=20
>=20
> On Mon, 2025-12-01 at 10:39 -0800, Matthew Brost wrote:
> >=20

[=E2=80=A6]

> > +
> > +/**
> > + * drm_sched_for_each_pending_job() - Iterator for each pending job in=
 scheduler
> > + * @__job: Current pending job being iterated over
> > + * @__sched: DRM scheduler to iterate over pending jobs
> > + * @__entity: DRM scheduler entity to filter jobs, NULL indicates no f=
ilter
> > + *
> > + * Iterator for each pending job in scheduler, filtering on an entity,=
 and
> > + * enforcing scheduler is fully stopped
> > + */
> > +#define drm_sched_for_each_pending_job(__job, __sched, __entity)=09=09=
\
> > +=09scoped_guard(drm_sched_pending_job_iter, (__sched))=09=09=09\
> > +=09=09list_for_each_entry((__job), &(__sched)->pending_list, list)=09\
> > +=09=09=09for_each_if(!(__entity) || (__job)->entity =3D=3D (__entity))
> > +
> > =C2=A0#endif
>=20
>=20
> See my comments in the first patch. The docu doesn't mention at all why
> this new functionality exists and when and why users would be expected
> to use it.
>=20
> As far as I remember from XDC, both AMD and Intel overwrite a timed out
> jobs buffer data in the rings on GPU reset. To do so, the driver needs
> the timedout job (passed through timedout_job() callback) and then
> needs all the pending non-broken jobs.
>=20
> AFAICS your patch provides a generic iterator over the entire
> pending_list. How is a driver then supposed to determine which are the
> non-broken jobs (just asking, but that needs to be documented)?
>=20
> Could it make sense to use a different iterator which only returns jobs
> of not belonging to the same context as the timedout-one?

(forget about that comment, you do that with the entity-filter
obviously)

P.

