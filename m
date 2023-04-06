Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF94C76196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 10:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC56A10E0E7;
	Thu,  6 Apr 2023 10:23:03 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2AD10E0E7
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 10:23:01 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id a44so21554046ljr.10
 for <intel-xe@lists.freedesktop.org>; Thu, 06 Apr 2023 03:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680776579; x=1683368579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0JVGnx5y4v5clR5nRn9VO0g+X4U1fDdImyz5CwGhY4E=;
 b=VMZnlxYpfiY8L3WvwUen/fGYx0Ufhrm45818WhGoEtTikBHbqImXuDySvewCqFcP6Y
 oqZc8p6XXiaaXG5kiZ53X8lOl/1Tnh8GZpPwEQgidxlf/HyuLyqPrWcJH2OSVF670u+g
 X0TQ+EkD+EdjdIP1gPpWXgJzPCDzOkK9pVKdySA9JRh66qB6z2os5vLU7iJWbQ7zo9/u
 DZdPWxdqab0aGQHGKj3TjgYiA3F1gI4REkXhCUzBFwlrjCay3CPH9cQIBfUi83DGLphX
 UXO9YurZ04SWj7d2xsUTsfOZ2ivMnK1UaiudWxo5t9AMyU/OAoqgH1s+VWYhWZIbHJB4
 FhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680776579; x=1683368579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0JVGnx5y4v5clR5nRn9VO0g+X4U1fDdImyz5CwGhY4E=;
 b=sxdM3WWH0u5QjcbjOlCJGwolqH6J/wWHj9/ZpA7Dc8enxQvK7IaTrsLFA1r13mowBb
 JCjgm2vLXCyuk+LqXah4oO0ib3mLYwtn5BDNssZdYNArd+JtAuXVLmmQIbhry2oXpKSG
 dUs5OMNv2wXyWLrQBxD2DVdBmGQ5piY3+xfBNHl/vgldXLo4iEJDQp2DprDwRunHlWIW
 EoTzTkULwqmJ7l760u1WxxwcD3/mMBFQHkTdtdphlVPEXfb8Jo3kws4QqgYAqZdLSOnV
 Qd2jKF7neOGygOZzRKsgNZ7x7jlcYbLQJXPU3Yvu3ofKYfRorzDy2YEsZRtUikUwb5kM
 18Jg==
X-Gm-Message-State: AAQBX9cWJ1FhTsjMwLDrcrI3tj7CKzzlYTT3rBRVcV2kD8EirVW0CgS5
 M2xlJNVNBYq+7xiEEUcHQBjRzVZY3YEVszNvkRqJQefGTuk=
X-Google-Smtp-Source: AKy350aqeUD8cDJK8ufWBMxmMf4fFnYmXQwOrdiWY49eE1h1wj3iLYb0fcsotxIkpk5JXL2V94D9nTEegIDUGc/KcGk=
X-Received: by 2002:a2e:99c6:0:b0:2a6:16b4:40a2 with SMTP id
 l6-20020a2e99c6000000b002a616b440a2mr3208542ljj.5.1680776579128; Thu, 06 Apr
 2023 03:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230405041943.3980167-1-matthew.brost@intel.com>
 <CAM0jSHPRBXz4Vk=A0aTGh0wt=kFvncE-PNchvSCoc8dnHoFPQA@mail.gmail.com>
 <ZC2CPlIIHjdfSvZI@DUT025-TGLU.fm.intel.com>
 <ZC2FfgbxUJpI+FEI@DUT025-TGLU.fm.intel.com>
 <CAM0jSHNS0G3pTptm-3+6byuB7HmQiKswoWoceD7O9e5CgG9T6w@mail.gmail.com>
 <ee7fa331-5cfa-14a6-b25d-9e8b22654bf8@amd.com>
In-Reply-To: <ee7fa331-5cfa-14a6-b25d-9e8b22654bf8@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 6 Apr 2023 11:22:31 +0100
Message-ID: <CAM0jSHObr0ZMU-FL_zj8a_Wa_JLLjqTRDZjiw0Bsb0L1yemRRw@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use Xe BO pin / unpin functions for
 FB pin
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 6 Apr 2023 at 10:32, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> Am 05.04.23 um 19:04 schrieb Matthew Auld:
> > On Wed, 5 Apr 2023 at 15:28, Matthew Brost <matthew.brost@intel.com> wr=
ote:
> >> On Wed, Apr 05, 2023 at 02:14:22PM +0000, Matthew Brost wrote:
> >>> On Wed, Apr 05, 2023 at 02:19:35PM +0100, Matthew Auld wrote:
> >>>> On Wed, 5 Apr 2023 at 05:19, Matthew Brost <matthew.brost@intel.com>=
 wrote:
> >>>>> Need to use XE BO pin / unpin for suspend / resume to work properly=
.
> >>>>> Part this fix too is too allow xe_bo_pin to be called more than onc=
e.
> >>>>>
> >>>>> Should fix:
> >>>>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/244
> >>>>>
> >>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >>>> Change makes sense to me, but I think we also need to update xe_bo_u=
npin()?
> >>>>
> >>> Yep, thought that coded correctly but was looking at xe_bo_unpin_exte=
rnal().
> >>>
> >>>> But I must be misunderstanding something here. AFAICT we can have
> >>>> various pinned VRAM objects, and xe_bo_pin() still adds them to
> >>>> pinned.kernel_bo_present, where during suspend we evict everything o=
n
> >>>> that list to system memory. But as these are all still pinned, suspe=
nd
> >>>> is still going to fail with this patch, given the recent TTM changes=
.
> >>> What reference recent TTM changes? This all worked at one point in ti=
me.
> >>>
> >> Oh, I see:
> >> git format-patch -1 f87c1f0b7b79b
> >>
> >> I would've NAK'd that one as this broke us. What you think is the best
> >> way to move forward on this one? I like the idea of using TTM to move
> >> the objects...
> >>
> >> I know we could just hack this and set pin_count=3D0 before calling
> >> validate aand restore it after? Horried hack though?
> >>
> >> Revert the above patch + post upstream?
> > Christian, can you share your thoughts here?
> >
> > This is regarding the TTM change: f87c1f0b7b79 ("drm/ttm: prevent
> > moving of pinned BOs"). To quickly summarize, it looks like Xe was
> > relying on being able to move pinned BOs for suspend-resume, where the
> > driver has some special kernel-internal VRAM buffers that are
> > perma-pinned, but need to be moved to system memory during suspend and
> > then copied back when resuming. This was all handled by just doing
> > something like ttm_bo_validate(PL_SYSTEM), without needing any special
> > handling. But this ofc no longer works.
>
> Yeah, exactly that's what this check here should prevent :)
>
> > So wondering if it makes any sense to move the decision back into the
> > driver, for whether to treat moving pinned objects as an error or not,
> > given the above use case with suspend-resume in Xe?
>
> Well pinning a BO means that it's fixed and can't move any more.
>
> The background is that the physical location (domain, address whatever)
> for this BO is used somewhere in the hardware and you need to notify the
> hardware if that ever changes. Typical applications are scanout,
> firmware buffers etc....

Yeah, it looks like Xe already makes sure to save the [fpfn, lpfn] to
ensure it gets moved back to the exact same spot in VRAM (all
perma-pinned kernel stuff is allocated CONTIG), in case something was
referencing the address. And since this is suspend-resume I guess
we're pretty sure nothing is actively using the object.

>
> Now if you still want to evacuate those buffers during suspend/resume
> you basically have three options:
>
> 1. Manually make sure inside your driver that the location doesn't
> change during evacuation/moving it back in again.
>      You can easily allocate additional backing store for you BOs and
> then copy the content back/force manually similar to what
> ttm_bo_validate() would do.
>      This wouldn't trigger the warning above and should work as well,
> see functions ttm_bo_mem_space() and ttm_bo_move_null().

i915 is pretty much doing something similar. It just feels a bit like
re-implementing ttm_bo_validate(), so I was wondering if that could be
avoided.

>
> 2. Unpin them on suspend, re-pin them on resume.
>      This is what we do for example for scanout. Re-pinning then usually
> means that you also re-program the hw with the new location information.

Yeah, something along this line is probably the simplest. Otherwise I
guess we just need to do the proper solution with 1.

>
> 3. Stop caring about evacuation during suspend.
>      We actually started to do this for a bunch of the read-only
> firmware buffers and just re-load the firmware after resume.
>      Has some pitfalls as well (if for example the fw changes), but
> generally seems to work quite fine for a lot of use cases.
>
> If you want to keep moving the BOs just using approach #1 should work
> for you, but approach #2 or #3 is probably cleaner from a high level
> perspective.

Thanks for taking a look Christian.

>
> Regards,
> Christian.
>
> >
> >> BTW, this patch is needed regardless with the fix in xe_bo_unpin().
> >>
> >> Matt
> >>
> >>> Matt
> >>>
> >>>> What am I missing?
> >>>>
> >>>>> ---
> >>>>>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 4 ++--
> >>>>>   drivers/gpu/drm/xe/xe_bo.c             | 5 +++--
> >>>>>   2 files changed, 5 insertions(+), 4 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/d=
rm/xe/display/xe_fb_pin.c
> >>>>> index 65c0bc28a3d1..c7c849be288f 100644
> >>>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >>>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> >>>>> @@ -205,7 +205,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct =
intel_framebuffer *fb,
> >>>>>
> >>>>>          ret =3D xe_bo_validate(bo, NULL, true);
> >>>>>          if (!ret)
> >>>>> -               ttm_bo_pin(&bo->ttm);
> >>>>> +               xe_bo_pin(bo);
> >>>>>          ttm_bo_unreserve(&bo->ttm);
> >>>>>          if (ret)
> >>>>>                  goto err;
> >>>>> @@ -222,7 +222,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct =
intel_framebuffer *fb,
> >>>>>
> >>>>>   err_unpin:
> >>>>>          ttm_bo_reserve(&bo->ttm, false, false, NULL);
> >>>>> -       ttm_bo_unpin(&bo->ttm);
> >>>>> +       xe_bo_unpin(bo);
> >>>>>          ttm_bo_unreserve(&bo->ttm);
> >>>>>   err:
> >>>>>          kfree(vma);
> >>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.=
c
> >>>>> index 3a482c61c3ec..25c696bd380c 100644
> >>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
> >>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
> >>>>> @@ -1278,8 +1278,8 @@ int xe_bo_pin(struct xe_bo *bo)
> >>>>>           */
> >>>>>          XE_BUG_ON(bo->ttm.base.import_attach);
> >>>>>
> >>>>> -       /* We only expect at most 1 pin */
> >>>>> -       XE_BUG_ON(xe_bo_is_pinned(bo));
> >>>>> +       if (xe_bo_is_pinned(bo))
> >>>>> +               goto pin;
> >>>>>
> >>>>>          err =3D xe_bo_validate(bo, NULL, false);
> >>>>>          if (err)
> >>>>> @@ -1308,6 +1308,7 @@ int xe_bo_pin(struct xe_bo *bo)
> >>>>>                  }
> >>>>>          }
> >>>>>
> >>>>> +pin:
> >>>>>          ttm_bo_pin(&bo->ttm);
> >>>>>
> >>>>>          /*
> >>>>> --
> >>>>> 2.34.1
> >>>>>
>
