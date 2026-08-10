Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898A8C5B56A
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 16:24:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA2910E92D;
	Mon, 10 Aug 2026 16:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mROkK6kK";
	dkim-atps=neutral
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2274710E92D
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 16:24:37 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-51c10e86e52so428551cf.1
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 09:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786379076; cv=none;
 d=google.com; s=arc-20260327;
 b=paNYLT8Mlz8yVJuzxYWa9HKnq5WHqeyDhh/cxaiuqhwHtDPP0PtZcX+m4w8rAJfRpT
 IF19wQgWiP6s4AatsBKxPMemsJzxNI9mwrBnCoslaio9quzilUF2LJBQ6jVqyUbwbD9/
 k407ooQufDV9rvTrg6WKuUOVmUdB8jc95HZI89j8rsrYTFQxYRTYYtxhe5oMrWGFBSZG
 AD+/e3kIkB4rd1Gv96R074GyFxmRRjf+7fF9f8ghKuUR/aMrBfC1II2D968hgvqlh3Br
 CmeXfukkiK9ans0Y8SkFF4SNvNGpNDAi3X8izRFPC3PMHg/ejkZs7HChiwnNqrGeFcsD
 7zrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=JnpU+yjthofc0zpgkM1QSjOc8GqltDckB0JeUB3rUkg=;
 fh=uzM1+QW16Pt9wDMSSCJqP+fKT8I9g4ahqNfEtVYPHSw=;
 b=MDXDdD2kKyNDPHvMpqWZzwgvbv0dxs980QO6Tv/YHMLz1i4PdZm+AB6IyeWiwK65z4
 aPcipE7+KsoRN1bwHJml4XdrntG1LMk+m1vB1jwMXAeTfMY2aG7bg6cqEeYQLKX6FMVW
 gYlM8AB9GQDffnCFcmWb+40QYkiTxgYc2QG5+37F8EIOkCvXEdxwFxw2ak4LK8MzpeX/
 vz2Oe2ICVCPqQo23kPJjaHXG9YVw7AALMT9pDKx71H6znDt7Im2WLcF5A3OBTR0S4YxD
 R/BarH74VhYRZuMsp+9y6XlmQFxCMH8nrt/RszyArS3Axm3s0iLjM8B8fXOZMgZ+3HI/
 dCwg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1786379076; x=1786983876;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=JnpU+yjthofc0zpgkM1QSjOc8GqltDckB0JeUB3rUkg=;
 b=mROkK6kK8x+h1OUf3qEAUhJDBCtlhFeVVf0JezT7wIyMJE4zsInWXn2TYKoaJ0c6CU
 acS8ZnWhvn9z5TxEmDeCpzVnClUlWusPJwkBR94uyAuq78qRZpU3ITmO86zUOdJpOrOu
 zFloGgtrFnC0F/qhuC2hzdoYNNCH4GSlILCP+ZW4PCszLyNhKtbjHHyRFZ2rI7k78EPN
 smNfa69qers52gTxh6yXkTcpLxTTvvHCIDRyzZu4SJ1NlZD6N9iX26J9q7SNKEZLWhXm
 beUn2XG0hLZoiqUKNnevjL7ZnZ9vPtw58lfinlSlajvQDkQFMKM2K70r6NyvWC8coTaL
 UWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786379076; x=1786983876;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=JnpU+yjthofc0zpgkM1QSjOc8GqltDckB0JeUB3rUkg=;
 b=mptxlwaNd60yKjuB0pCm321yNplPZC15DWXFHov5jvRnHzGLOsD9ZMZH9X0JXVhK2z
 Bszrp55RYoeUvYvdrbFvFhQ8sF+EgyAjsZYSKlJZWHkCmwiA5Glq0uwNDD1pCTicxHl6
 bxjdS5pFUrd+02v2hYMm8sQ0TFFWitPOr4enAlTGdsJeDp7zauks7wu/+pJGoQ+RXQ1T
 FLvEELvdbxdXz7k4jpTER4AAnARsPRMf/LvrtXnHsAs5WdUuehN/53gpaxgEZDoBseeI
 qG5FZWEasaOEoGjzeE33hPV4MxYOgziZlcFJ/PZIm1l4jJ6BV+QRkjI3f4UZ86k7EFRF
 39dw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqAPGuWJ66Datb7GVmxrakQPp3oE/d98bzqWlHbqak/DrLqMPCHYwI2BtB1dE90Zogg6tDbv7PUFg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxw5l6tW9fnXnXcCIsL3sxtdaeTUiFmcmWQrm5wuNyS2ddwuxgx
 p2X84S1Jd4C8BnfXnteyi3zd02gnJ7yhizG669kmqdi4jCaPERbMLDFKc17qM6OXJiLxBkCdcPL
 eMUdCu8WFH2jYkETCOx5FKwErXziUM2akHB5BB+MA
X-Gm-Gg: AR+sD13z7QVj3J1SaFxHr3r/mUOuQJDu706dMC1bqlCB2EF25q9LKVrRH2AImIO4lbn
 0XEzrVBAOa4FJlr+pp5ZYzh4mKhm7eNFVtGV/fek9CV+toB8wQ8VBFMJhjl/nVyx3kiW2C1NJ3V
 w4rGnu2b/9DgFBPqZJAO9q5+gy8wXY2ACyKG9tmQ1VzdeWdM0uKGqEGJJlaJ50YGfG+kd4jOpVw
 jbowMG0ln8FSoYj3FRdKWDJK38cQX8s1Caw+HBqLycU1zXHlWAgQ4OeQ/Qqd0jMBnqud54/bU+z
 no5AUUt0N6ohtIP0W+cGFso3V4BIdNCcKk0CH9PKKuoRMfV5MNlpuA==
X-Received: by 2002:a05:622a:2b0a:b0:519:b655:235 with SMTP id
 d75a77b69052e-52d2810222bmr38915311cf.3.1786379075203; Mon, 10 Aug 2026
 09:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260806-b4-scalable-cow-virt-pgoff-v4-0-ab318a350404@kernel.org>
 <20260806-b4-scalable-cow-virt-pgoff-v4-1-ab318a350404@kernel.org>
 <CAJuCfpFAA1H2pOi6EOarNtrdzLQDJyhm6QOGsfZ4SFTuM5eiLQ@mail.gmail.com>
 <anmLnvWAyIJwjsXj@lucifer>
In-Reply-To: <anmLnvWAyIJwjsXj@lucifer>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 10 Aug 2026 09:24:23 -0700
X-Gm-Features: AUfX_mykce6fbL166nHsURFiLv_kMzKY9gOukzdEiVHYnjVKW8Vop-MtXqL00bE
Message-ID: <CAJuCfpGJuf3NOuPg4+7TaWhNOv5sN7WEY2awZOpDv1VV13J-DQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] mm/vma: introduce VMA anon page offset field and
 add helpers
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Kees Cook <kees@kernel.org>,
 Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, 
 Usama Arif <usama.arif@linux.dev>, Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 John Hubbard <jhubbard@nvidia.com>, Muchun Song <muchun.song@linux.dev>, 
 Oscar Salvador <osalvador@suse.de>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, 
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
 Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>,
 linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
 linux-s390@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-perf-users@vger.kernel.org, linux-trace-kernel@vger.kernel.org
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

On Mon, Aug 10, 2026 at 1:36=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> On Sat, Aug 08, 2026 at 05:51:10PM -0700, Suren Baghdasaryan wrote:
> > On Thu, Aug 6, 2026 at 1:22=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kerne=
l.org> wrote:
> > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > index 87feaa5a2b78..df78847f5f07 100644
> > > --- a/include/linux/mm.h
> > > +++ b/include/linux/mm.h
> > > @@ -4393,6 +4393,65 @@ static inline pgoff_t vma_last_pgoff(const str=
uct vm_area_struct *vma)
> > >         return vma_end_pgoff(vma) - 1;
> > >  }
> > >
> > > +/**
> > > + * vma_start_anon_pgoff() - Get the anonymous page offset of the sta=
rt of @vma
> > > + * @vma: The VMA whose anonymous page offset is required.
> > > + *
> > > + * If unfaulted, then this is vma->vm_start >> PAGE_SHIFT, if faulte=
d then the
> > > + * anonymous page offset at the time of first fault.
> > > + *
> > > + * If the VMA is anonymous, this returns the same value as vma_start=
_pgoff().
> > > + *
> > > + * This value is used for tracking MAP_PRIVATE file-backed mappings =
by their
> > > + * anonymous page offset.
> >
> > I assume this function should not be used with shared file-backed
> > mappings, right? If so, maybe add a comment like the one you have for
> > linear_anon_page_index(): "It is not valid to call this function for
> > shared file-backed mappings."?
>
> No that's not the case, it is valid to access this for any VMA though it'=
s only
> meaningful for MAP_PRIVATE and anonymous VMAs (though in the latter case =
pgoff
> =3D=3D anon pgoff).
>
> The code keeps the anon pgoff values consistent even for shared mappings =
because
> - hey - we have the field anyway and it's easiest and safest to just keep=
 it the
> same.
>
> One alternative would be to have code that checks the flags and zeroes th=
e field
> otherwise , but then you have problems like - early on initialisation now
> there's an ordering requirement which can easily go wrong.
>
> Another alternative is to just leave it stale, but then that seems object=
ively
> worse and again requires branching code on update and set.
>
> All-in-all it's easier to keep this working the same for any type of mapp=
ing,
> it's just useless to do anything with the anon pgoff for a shared mapping=
 :)

Makes sense. Thanks for the explanation!

>
> --
> Cheers, Lorenzo
