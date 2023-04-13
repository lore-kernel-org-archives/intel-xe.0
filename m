Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8139EC77B61
	for <intel-xe@archiver.kernel.org>; Thu, 13 Apr 2023 08:48:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE9010EA7D;
	Thu, 13 Apr 2023 08:48:38 +0000 (UTC)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DA010EA7D
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Apr 2023 08:48:37 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 q33-20020a056830442100b006a419d3fd20so2360305otv.7
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Apr 2023 01:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681375716; x=1683967716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ufmJM9c3Bm1DOZstsKt3/tNZmtaBnFVb0R2t7xVZ0DY=;
 b=gPsoakCs8m36H56hKXiLuGP9TFe4CFLqjH/qkznL9pMfa6VqYwaD8Lf77pJUidigeM
 VMGckCdJKOcSWhiMyOZ5FYPIW3XZZ5YfKIOEvi54aSQF5WSQC62dGIn6NxQFTpIPELzL
 YSe7wNNFXeyauGtP0/GY8xR9KbI9ltYglaCHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681375716; x=1683967716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ufmJM9c3Bm1DOZstsKt3/tNZmtaBnFVb0R2t7xVZ0DY=;
 b=G8eBnrV/iawYZ6sNl52Arcl79c/r3ItcBzzA/iDO9etkkyVkEtU7MTS4Q6Uf90ZRmA
 +nhc+N5UO3G2M91McTpqhiyeSeHgzwNyrYi70BlUdPeW6Yh/VcBtnqRWQci0obMA3g8i
 osK/05a+2xJCzQe0GFuz0XX+kUkdgnAKLSw8No5327v14NI88EY1UKl81LMmAwih5BLS
 IgvEcfQ7F6pHPU/JKHIN7vEMkXDMNa5LEs6aA4v2gLRalxkJsFS/JotWsyDqvq9PpUBE
 1VQzOF3n4rT44LXDNEaBUpwlZ46wfpFWfxNX3/83V77HZzid9US0cEX//+W0uVPAw3hd
 mdXw==
X-Gm-Message-State: AAQBX9evOCr5mety/ILGeWt1eD30ajaF3IKF8zvCAC/Tt3h1L5SdH/kI
 TD5rd209mKI0cRP4KZd+YIhsS/Bu1GrYdSn4Z6XhLw==
X-Google-Smtp-Source: AKy350Z/bNpJ8qUzjfuwSN54ULUIN3jHnsTnSlUXbdE6M5Ao9ZR1GOruTbWwc4gQAa6sMVmBWKL9QLI7KySwKtwjF48=
X-Received: by 2002:a9d:6283:0:b0:6a1:1bd4:d8c4 with SMTP id
 x3-20020a9d6283000000b006a11bd4d8c4mr334330otk.6.1681375716154; Thu, 13 Apr
 2023 01:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
 <20230404200650.11043-3-thomas.hellstrom@linux.intel.com>
 <ZDUtqsNtXcU4W3O6@phenom.ffwll.local>
 <33b145f1-fce5-95f1-357d-dda128e3548d@amd.com>
 <ZDVkhtx1/uToLM5R@phenom.ffwll.local>
 <CAKMK7uEZdWjs9snGdNpzBthOWz0YSCZh-rNKOGywLWozzpFwbA@mail.gmail.com>
 <ae672182-f7a4-7107-1071-1561c49bc122@amd.com>
In-Reply-To: <ae672182-f7a4-7107-1071-1561c49bc122@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 13 Apr 2023 10:48:25 +0200
Message-ID: <CAKMK7uFVWh16ng_tyuTu-0k4k7Wq5LjpwvJgYuidy-YVPEEQ=A@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH RESEND v3 2/3] drm/ttm: Reduce the number of
 used allocation orders for TTM pages
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
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 12 Apr 2023 at 16:18, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Am 12.04.23 um 11:08 schrieb Daniel Vetter:
> > On Tue, 11 Apr 2023 at 15:45, Daniel Vetter <daniel@ffwll.ch> wrote:
> >> On Tue, Apr 11, 2023 at 02:11:18PM +0200, Christian K=C3=B6nig wrote:
> >>> Am 11.04.23 um 11:51 schrieb Daniel Vetter:
> >>>> On Tue, Apr 04, 2023 at 10:06:49PM +0200, Thomas Hellstr=C3=B6m wrot=
e:
> >>>>> When swapping out, we will split multi-order pages both in order to
> >>>>> move them to the swap-cache and to be able to return memory to the
> >>>>> swap cache as soon as possible on a page-by-page basis.
> >>>>> Reduce the page max order to the system PMD size, as we can then be=
 nicer
> >>>>> to the system and avoid splitting gigantic pages.
> >>>>>
> >>>>> Looking forward to when we might be able to swap out PMD size folio=
s
> >>>>> without splitting, this will also be a benefit.
> >>>>>
> >>>>> v2:
> >>>>> - Include all orders up to the PMD size (Christian K=C3=B6nig)
> >>>>> v3:
> >>>>> - Avoid compilation errors for architectures with special PFN_SHIFT=
s
> >>>>>
> >>>>> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.=
com>
> >>>>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>> Apparently this fails on ppc build testing. Please supply build fix =
asap
> >>>> (or I guess we need to revert). I'm kinda not clear why this only sh=
owed
> >>>> up when I merged the drm-misc-next pr into drm-next ...
> >>> I'm really wondering this as well. It looks like PMD_SHIFT isn't a co=
nstant
> >>> on this particular platform.
> >>>
> >>> But from what I can find in the upstream 6.2 kernel PMD_SHIFT always =
seems
> >>> to be a constant.
> >>>
> >>> So how exactly can that here break?
> >> There's some in-flight patches to rework MAX_ORDER and other things in
> >> linux-next, maybe it's recent? If you check out linux-next then you ne=
ed
> >> to reapply the patch (since sfr reverted it).
> > So I looked and on ppc64 PMD_SHIFT is defined in terms of
> > PTE_INDEX_SIZE, which is defined (for book3s) in terms of the variable
> > __pte_index_size. This is in 6.3 already and seems pretty old.
>
> Ah! I missed that one, thanks.
>
> > So revert? Or fixup patch to make this work on ppc?
>
> I think for now just revert or change it so that we check if PMD_SHIFT
> is a constant.
>
> Thomas do you have any quick solution?

I guess Thomas is on vacations. Can you pls do the revert and push it
to drm-misc-next-fixes so this won't get lost?

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

preemptively for that. Normally I think we could wait a bit more but
it's really close to merge window PR and I don't like handing too many
open things to Dave when he's back :-)
-Daniel

>
> Christian.
>
> >
> >
> >>>>> ---
> >>>>>    drivers/gpu/drm/ttm/ttm_pool.c | 30 +++++++++++++++++++---------=
--
> >>>>>    1 file changed, 19 insertions(+), 11 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/t=
tm_pool.c
> >>>>> index dfce896c4bae..18c342a919a2 100644
> >>>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> >>>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> >>>>> @@ -47,6 +47,11 @@
> >>>>>    #include "ttm_module.h"
> >>>>> +#define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
> >>>>> +#define __TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
> >>>>> +/* Some architectures have a weird PMD_SHIFT */
> >>>>> +#define TTM_DIM_ORDER (__TTM_DIM_ORDER <=3D MAX_ORDER ? __TTM_DIM_=
ORDER : MAX_ORDER)
> >>>>> +
> >>>>>    /**
> >>>>>     * struct ttm_pool_dma - Helper object for coherent DMA mappings
> >>>>>     *
> >>>>> @@ -65,11 +70,11 @@ module_param(page_pool_size, ulong, 0644);
> >>>>>    static atomic_long_t allocated_pages;
> >>>>> -static struct ttm_pool_type global_write_combined[MAX_ORDER];
> >>>>> -static struct ttm_pool_type global_uncached[MAX_ORDER];
> >>>>> +static struct ttm_pool_type global_write_combined[TTM_DIM_ORDER];
> >>>>> +static struct ttm_pool_type global_uncached[TTM_DIM_ORDER];
> >>>>> -static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER]=
;
> >>>>> -static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
> >>>>> +static struct ttm_pool_type global_dma32_write_combined[TTM_DIM_OR=
DER];
> >>>>> +static struct ttm_pool_type global_dma32_uncached[TTM_DIM_ORDER];
> >>>>>    static spinlock_t shrinker_lock;
> >>>>>    static struct list_head shrinker_list;
> >>>>> @@ -444,7 +449,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struc=
t ttm_tt *tt,
> >>>>>            else
> >>>>>                    gfp_flags |=3D GFP_HIGHUSER;
> >>>>> - for (order =3D min_t(unsigned int, MAX_ORDER - 1, __fls(num_pages=
));
> >>>>> + for (order =3D min_t(unsigned int, TTM_MAX_ORDER, __fls(num_pages=
));
> >>>>>                 num_pages;
> >>>>>                 order =3D min_t(unsigned int, order, __fls(num_page=
s))) {
> >>>>>                    struct ttm_pool_type *pt;
> >>>>> @@ -563,7 +568,7 @@ void ttm_pool_init(struct ttm_pool *pool, struc=
t device *dev,
> >>>>>            if (use_dma_alloc) {
> >>>>>                    for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> >>>>> -                 for (j =3D 0; j < MAX_ORDER; ++j)
> >>>>> +                 for (j =3D 0; j < TTM_DIM_ORDER; ++j)
> >>>>>                                    ttm_pool_type_init(&pool->cachin=
g[i].orders[j],
> >>>>>                                                       pool, i, j);
> >>>>>            }
> >>>>> @@ -583,7 +588,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
> >>>>>            if (pool->use_dma_alloc) {
> >>>>>                    for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> >>>>> -                 for (j =3D 0; j < MAX_ORDER; ++j)
> >>>>> +                 for (j =3D 0; j < TTM_DIM_ORDER; ++j)
> >>>>>                                    ttm_pool_type_fini(&pool->cachin=
g[i].orders[j]);
> >>>>>            }
> >>>>> @@ -637,7 +642,7 @@ static void ttm_pool_debugfs_header(struct seq_=
file *m)
> >>>>>            unsigned int i;
> >>>>>            seq_puts(m, "\t ");
> >>>>> - for (i =3D 0; i < MAX_ORDER; ++i)
> >>>>> + for (i =3D 0; i < TTM_DIM_ORDER; ++i)
> >>>>>                    seq_printf(m, " ---%2u---", i);
> >>>>>            seq_puts(m, "\n");
> >>>>>    }
> >>>>> @@ -648,7 +653,7 @@ static void ttm_pool_debugfs_orders(struct ttm_=
pool_type *pt,
> >>>>>    {
> >>>>>            unsigned int i;
> >>>>> - for (i =3D 0; i < MAX_ORDER; ++i)
> >>>>> + for (i =3D 0; i < TTM_DIM_ORDER; ++i)
> >>>>>                    seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]=
));
> >>>>>            seq_puts(m, "\n");
> >>>>>    }
> >>>>> @@ -751,13 +756,16 @@ int ttm_pool_mgr_init(unsigned long num_pages=
)
> >>>>>    {
> >>>>>            unsigned int i;
> >>>>> + BUILD_BUG_ON(TTM_DIM_ORDER > MAX_ORDER);
> >>>>> + BUILD_BUG_ON(TTM_DIM_ORDER < 1);
> >>>>> +
> >>>>>            if (!page_pool_size)
> >>>>>                    page_pool_size =3D num_pages;
> >>>>>            spin_lock_init(&shrinker_lock);
> >>>>>            INIT_LIST_HEAD(&shrinker_list);
> >>>>> - for (i =3D 0; i < MAX_ORDER; ++i) {
> >>>>> + for (i =3D 0; i < TTM_DIM_ORDER; ++i) {
> >>>>>                    ttm_pool_type_init(&global_write_combined[i], NU=
LL,
> >>>>>                                       ttm_write_combined, i);
> >>>>>                    ttm_pool_type_init(&global_uncached[i], NULL, tt=
m_uncached, i);
> >>>>> @@ -790,7 +798,7 @@ void ttm_pool_mgr_fini(void)
> >>>>>    {
> >>>>>            unsigned int i;
> >>>>> - for (i =3D 0; i < MAX_ORDER; ++i) {
> >>>>> + for (i =3D 0; i < TTM_DIM_ORDER; ++i) {
> >>>>>                    ttm_pool_type_fini(&global_write_combined[i]);
> >>>>>                    ttm_pool_type_fini(&global_uncached[i]);
> >>>>> --
> >>>>> 2.39.2
> >>>>>
> >> --
> >> Daniel Vetter
> >> Software Engineer, Intel Corporation
> >> http://blog.ffwll.ch
> >
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
