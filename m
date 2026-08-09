Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84281C5AE49
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 13:15:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1414410E846;
	Mon, 10 Aug 2026 13:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kIqao121";
	dkim-atps=neutral
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C8710E0BC
 for <intel-xe@lists.freedesktop.org>; Sun,  9 Aug 2026 00:50:02 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-51c15a5b265so178041cf.0
 for <intel-xe@lists.freedesktop.org>; Sat, 08 Aug 2026 17:50:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786236601; cv=none;
 d=google.com; s=arc-20260327;
 b=XjUf88bo/2f31SGX1/qcxWEK+ENT0kVXHbqupTLh8G2BfHw4eTFfexmRb5eMFcPvVr
 44qwnGuCy0cdAsbE31gvao/00zySDRektGdDFMMfLhCscC5KYXMfU0JtUA6GEc2ywK8V
 fUggvDcoWel0+On1T+x6O/TOhy+/v2QR+sMc0yGfko2timEzkw7Nya9b/gtB/7QVIHQf
 C6ZqQ8Oiustzyk9NzO2UeolnaapAAVc4PMk61dSkvQuhTndngUlYKljS/z5lcPdl8kVU
 Kw3a+I6JFJOwhwOu604qJNvc/+G8JoZ+o0eRQfEN1N5QkhmXXMmxQbNuYQjJ3yFnCzjN
 cSrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=glHudYQR7Sx8Ip0RwDHznG86gS5ZxNzd6JiJvbqbi6Y=;
 fh=9avsqJlAcMhiqelf7sTPR/V9MzrDlCPkaaWZWFfZ/Cw=;
 b=Iyq7irzz/1CNpS6R6TcWlTjhjZtcBS43cYXJS+3npbo2wyPkFZOPaOAw9uW6ucp1LX
 vrBfm4uhqGw6+idjlxLglB8OtgJ6qJtMKGvWvH7vTbfbq/eZ6blymOjvE/JlIvywPiPN
 mZB5jdmF5HHiJd1/xBcNyBxBbauMcvuZ1b06S/+dRDI+HcmSSIwDwuzZSYhSj1b7CfQ0
 CWzDjBqv/GpFi/xoaDgDKN7XhoR0PhAQiDNBfAuMdj1iFuPESu5dpc65DNWtjz16E94q
 kAJ8KJ+qQ/LXvkKqvitCwEIRTn3xuhYHPHWjfI2Cqnetgay8Zgss77eyEs4W4OdjXdxj
 H3+Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1786236601; x=1786841401;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=glHudYQR7Sx8Ip0RwDHznG86gS5ZxNzd6JiJvbqbi6Y=;
 b=kIqao121XodBEGi30viH5tfAILvCJ/ziPgvnYex1TOvCfhfJOWYgvM38hfKmTBSPWm
 HSqa3s1d9QngV819iwVu+usEKe/rtQ0JbiCLBKEd4UryYsgXAZQr+Iw2VBNkIbLhTs0u
 8WpGTejP4dV9WKRLoTWnIRkyffwNNGndrrDDGfCUvdwetRV1nXTPW42JXr/JOsecMuDn
 DK2kC8bFvLL1c0V2j7aouzMn+CM+fbeBMT8eCXGojG5k0Z7dq4GMCHn9VY+2qy/8h8zK
 8VkxBVe6Nde1Jz2n1MMRDQBs7xzuomCFc2uILvZRPcJVcAMxQGPD1Yj8qaMxT09StqyC
 OTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786236601; x=1786841401;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=glHudYQR7Sx8Ip0RwDHznG86gS5ZxNzd6JiJvbqbi6Y=;
 b=UBL6Jjp3h4etR/rlrSsQrWRtDfmhfZNEgG2V0rlEGIqx1UoNfIpBWGXCi3knHNtcYq
 tfNj5fd/4lj8TohpO1UdR8lrZ/v9FF3bR/V7l1HknsdQGYp1NUCavW8449vO5UAws/LG
 SfuSWebGvMM5k2yVekVFAS86VHAkini91NGlwnCAZK5JUFxv5NASVwn7nuRo+XP0p564
 v6HrXtiMj1E6Um9oimufBhbTh9YMQwyjYfk6+BEDJK3y+bJWC0doj/Jy5TwojeP+JRC3
 FaD+qeE/edj6MnHY+XcIhNXrS9nsgHI83FJpW/+dBn4eso/wECrhm89UC+7ihDij11oC
 PYIg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrAltaR0hgZG4KSQGAkPS79e5t9H5+F5CYUedp7SfNUD0iLOYJ8YsB9BbFCm4Xo41GSVUMfYPSqlg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVexyOuWQ3fVi9837A+r9Zj4ybRkoJldI02loTlCbDo9UoI/Ls
 i4tdz6kBM5pECnAODI1oERqm9m8J4XOa6vSSzW3lfvyZvF1klGB1PfqZiz/oQ6Ee2UhCQPrM2bG
 w1r+TWY1+12A35iX6nSt3bZdLJ1g3Mqg+Il0oFtTl
X-Gm-Gg: AR+sD12J67afcvIKUM9YUICfVclCfj2m4/SfcGsLtvXDZ1llx/zG4aW33ZtxmXz5sEm
 VTZIY01esS6bwC52NaMhrZYQ76FJIWubqHkEUm/xvdhTrD5jpOcmAD3t4wxia6jqcdLzG3yYycF
 0g/WiY5i2CTqPrLWfCT5NXbTZg1gZALxmoGbeGYz1j73abirLCffssLLGjy/i+QR/sqwl7bBapi
 FGRv+YnLeodpFp7jp5NtyYC6l8PoI8AQEX8uSbDOjd5weHHhvEsO6APGlp/aEiir7HiGGINZbLI
 CT+srQhGDSKXAYsJ8vxcA9wo70M6hi0ugWk8Szvud38=
X-Received: by 2002:ac8:7f4f:0:b0:52b:4ec6:52ba with SMTP id
 d75a77b69052e-52d23c37702mr15746931cf.6.1786236600065; Sat, 08 Aug 2026
 17:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260806-b4-scalable-cow-virt-pgoff-v4-0-ab318a350404@kernel.org>
 <20260806-b4-scalable-cow-virt-pgoff-v4-3-ab318a350404@kernel.org>
In-Reply-To: <20260806-b4-scalable-cow-virt-pgoff-v4-3-ab318a350404@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 8 Aug 2026 17:49:48 -0700
X-Gm-Features: AUfX_mw1Q82W2dZ-6X55NWg9zTGU5sEbnBW6U_FzEZzOIU5ZiJmeQXvgECKsKPA
Message-ID: <CAJuCfpGjE66Duhw0r8H0GKBFDExjroRar6n5MgVOOQjz4ZfTuA@mail.gmail.com>
Subject: Re: [PATCH v4 03/20] mm: introduce linear_anon_page_index()
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
X-Mailman-Approved-At: Mon, 10 Aug 2026 13:15:06 +0000
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

On Thu, Aug 6, 2026 at 1:23=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> This function provides the anonymous equivalent of linear_page_index(),
> instead offsetting based on the anonymous page offset of the VMA.
>
> It is valid only for anonymous or MAP_PRIVATE file-backed mappings, in
> other words CoW mappings.
>
> For pure anon VMAs, this will be equal to linear_page_index().
>
> Assert that both of these invariants are true In linear_anon_page_index()

s/In/in

> and implement the algorithm in __linear_anon_page_index().
>
> Note that MAP_PRIVATE-/dev/zero mappings will satisfy vma_is_anonymous()
> but not fulfill this invariant, so when asserting this we check
> vma->vm_file to account for this.
>
> We do not update callsites yet, so no functional change intended.
>
> Also const-ify vma_is_anonymous() to make it compatible with the
> const-ified linear_anon_page_index().
>
> While we're here, update linear_page_index() to be more succinct.
>
> VMA userland tests are also updated accordingly.
>
> Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  include/linux/mm.h              |  2 +-
>  include/linux/pagemap.h         | 40 +++++++++++++++++++++++++++++++++++=
++---
>  tools/testing/vma/include/dup.h | 25 ++++++++++++++++++++++++-
>  3 files changed, 62 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index a3368c542947..da36a6cc907c 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1556,7 +1556,7 @@ static inline void vma_desc_set_anonymous(struct vm=
_area_desc *desc)
>         desc->vm_ops =3D NULL;
>  }
>
> -static inline bool vma_is_anonymous(struct vm_area_struct *vma)
> +static inline bool vma_is_anonymous(const struct vm_area_struct *vma)
>  {
>         return !vma->vm_ops;
>  }
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index c6fc783aaee5..0adfa6605653 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -1094,10 +1094,44 @@ static inline pgoff_t linear_page_delta(const str=
uct vm_area_struct *vma,
>  static inline pgoff_t linear_page_index(const struct vm_area_struct *vma=
,
>                                         const unsigned long address)
>  {
> -       pgoff_t pgoff;
> +       return linear_page_delta(vma, address) + vma_start_pgoff(vma);
> +}
> +
> +static inline pgoff_t __linear_anon_page_index(const struct vm_area_stru=
ct *vma,
> +               const unsigned long address)
> +{
> +       return linear_page_delta(vma, address) + vma_start_anon_pgoff(vma=
);
> +}
> +
> +/**
> + * linear_anon_page_index() - Determine the absolute anonymous page offs=
et of
> + * @address within @vma.
> + * @vma: An anonymous or MAP_PRIVATE file-backed VMA in which @address r=
esides.
> + * @address: The address whose absolute page offset is required.
> + *
> + * This returns the anonymous page offset of @address, which is the page=
 offset
> + * the address possessed at the time the VMA was first faulted.
> + *
> + * For anonymous mappings, this returns the same value as linear_page_in=
dex().
> + *
> + * For MAP_PRIVATE file-backed mappings, this returns the anonymous page=
 offset
> + * of @address, which is the page offset the address possessed at the ti=
me the
> + * VMA was first faulted.
> + *
> + * It is not valid to call this function for shared file-backed mappings=
.
> + *
> + * Returns: The absolute anonymous page offset of @address within @vma.
> + */
> +static inline pgoff_t linear_anon_page_index(const struct vm_area_struct=
 *vma,
> +               const unsigned long address)
> +{
> +       const pgoff_t pgoff =3D __linear_anon_page_index(vma, address);
> +
> +       VM_WARN_ON_ONCE(!vma_is_cow_mapping(vma));

As discussed off the list, this assertion works even for read-only
anon mappings because, as you said, "there's no such thing as a pure
anon mapping that is !VMA_MAYWRITE_BIT, there is no way to achieve
that."
It took me some time to see that after reading your discussion with
David at [1] and [2], and I don't think it's very intuitive. Could you
please add a comment explaining that? Maybe add a comment at
vma_is_cow_mapping() definition since you are using the same assertion
in another patch of this series?

[1] https://lore.kernel.org/linux-mm/anBjpdMicqaGADr-@lucifer/
[2] https://lore.kernel.org/linux-mm/anLyhaI6kW-EWk13@lucifer/



> +       /* Account for MAP_PRIVATE-/dev/zero which is only semi-anonymous=
. */
> +       if (vma_is_anonymous(vma) && !vma->vm_file)
> +               VM_WARN_ON_ONCE(pgoff !=3D linear_page_index(vma, address=
));
>
> -       pgoff =3D linear_page_delta(vma, address);
> -       pgoff +=3D vma_start_pgoff(vma);
>         return pgoff;
>  }
>
> diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/=
dup.h
> index 40ad83936b28..4c58487b764e 100644
> --- a/tools/testing/vma/include/dup.h
> +++ b/tools/testing/vma/include/dup.h
> @@ -1428,7 +1428,7 @@ static inline void vma_iter_set(struct vma_iterator=
 *vmi, unsigned long addr)
>         mas_set(&vmi->mas, addr);
>  }
>
> -static inline bool vma_is_anonymous(struct vm_area_struct *vma)
> +static inline bool vma_is_anonymous(const struct vm_area_struct *vma)
>  {
>         return !vma->vm_ops;
>  }
> @@ -1621,3 +1621,26 @@ static inline pgprot_t vma_get_page_prot(const str=
uct vm_area_struct *vma)
>  {
>         return vma_flags_to_page_prot(vma->flags);
>  }
> +
> +static inline pgoff_t __linear_anon_page_index(const struct vm_area_stru=
ct *vma,
> +                                              const unsigned long addres=
s)
> +{
> +       pgoff_t pgoff;
> +
> +       pgoff =3D linear_page_delta(vma, address);
> +       pgoff +=3D vma_start_anon_pgoff(vma);
> +       return pgoff;
> +}
> +
> +static inline pgoff_t linear_anon_page_index(const struct vm_area_struct=
 *vma,
> +               const unsigned long address)
> +{
> +       const pgoff_t pgoff =3D __linear_anon_page_index(vma, address);
> +
> +       VM_WARN_ON_ONCE(!vma_is_cow_mapping(vma));
> +       /* Account for MAP_PRIVATE-/dev/zero which is only semi-anonymous=
. */
> +       if (vma_is_anonymous(vma) && !vma->vm_file)
> +               VM_WARN_ON_ONCE(pgoff !=3D linear_page_index(vma, address=
));
> +
> +       return pgoff;
> +}
>
> --
> 2.55.0
>
