Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A1DC7EE2E
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 03:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4833E10E0D8;
	Mon,  8 May 2023 03:26:46 +0000 (UTC)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5B910E057
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 03:26:44 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-38bed577755so1423814b6e.0
 for <intel-xe@lists.freedesktop.org>; Sun, 07 May 2023 20:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683516403; x=1686108403;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KNJpFsvSGTMwIXTeDNxJfDdOWx+w80lmchNSZ6nGdVU=;
 b=qNkNW3TTUc65SwEkPVXAMnT3BIa/fWfNLyAMmO9rNp6nDaSpypHdj5e0bT0J7pKe0S
 ne00Fd2l8o7VDLYrEV7Nh3Yj/l4jaftJRuQU/lkJpOjxEfB5Uv6pRqFSAci3ZOtrOXhO
 PSFvz1ETrVY2RiZ6WpebMH9nbWBAahxRGBtbQzn5io3E8+8fBoVf5McjUExQWK3UGis+
 iyecPM41l1tKyZCXPviBaCWOFWody7kodmojWuufI+EsUsoa1AyEAepe7VV6qtSvtbmT
 kxnKvjiWE6AgABTyH5LPfUE3S6fbKoy4fd0vfzSeIG2KVkk+I9usMRyLuVO+WBLbUYbA
 V0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683516403; x=1686108403;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KNJpFsvSGTMwIXTeDNxJfDdOWx+w80lmchNSZ6nGdVU=;
 b=g1Zm4ZZXoFnxcAFdt1Li0KwSN4BQl6W5qnP1ESMCYjCjUcmlaxi8sdq0OlqcORj+xt
 h4s7pSdhece25qoYl0VsSJPE873RazABNKeqyKT72xgkKJIJlOQJiU9PetogfUPtzgL5
 BBN7xgBqj0Ooe0A5TBGj2CUinoZ9WOAGPBvMqG/h00L0zgwCchZaiqiSmCYwPraC0PF0
 4XsudqYP+upSa7zwpia00i9FLG+79NSMGS50U4gWPPjy6gLuU6Hoa27Tu/1WtoPF1Qb9
 SZV0TLB/jvtvu4gU6F91O2xbY2iAF/AXIvxzgkGgXcxJ39bMS5HBet0e2fhjydNXlprV
 3Aew==
X-Gm-Message-State: AC+VfDwKGeACYuAqKwiun1XS7o9bsd9+Kw+C10cIHZAL6o2dDb7GB1yN
 3q9pKWXK6uCWW62Llqnj6AiPZBfd6W1oFKeYgz8=
X-Google-Smtp-Source: ACHHUZ7A14kHHAv8GHTaiRB55lfPpUXfHITBOKeEqiGBdyEgWSiHRXr8qqN6zYq3DJHDAJ8nGBBaW98D2IhyGhLVCpw=
X-Received: by 2002:aca:1019:0:b0:38b:fbc3:a5c2 with SMTP id
 25-20020aca1019000000b0038bfbc3a5c2mr3788647oiq.50.1683516403608; Sun, 07 May
 2023 20:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230505144910.317943-1-matthew.auld@intel.com>
 <ZFhH7tppkQlfgZ9t@DUT025-TGLU.fm.intel.com>
 <CA+aRtuZC4E5+29nUC7=PSy+Q4obn6HMNCZDTPi4hE9Y=WC5R3w@mail.gmail.com>
In-Reply-To: <CA+aRtuZC4E5+29nUC7=PSy+Q4obn6HMNCZDTPi4hE9Y=WC5R3w@mail.gmail.com>
From: Christopher Snowhill <kode54@gmail.com>
Date: Sun, 7 May 2023 20:26:32 -0700
Message-ID: <CA+aRtuZ+DUg2Aaxb3AZbu3RFwgT8BbuF5-OWf8HxmU8eU=k8ZQ@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix tlb_invalidation_seqno_past()
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
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

False alarm. Looks like there's a different seqno overflow somewhere in her=
e:

[  854.230925] xe 0000:28:00.0: [drm] Engine reset: guc_id=3D59
[  854.236564] xe 0000:28:00.0: [drm] Timedout job: seqno=3D4294967169,
guc_id=3D59, flags=3D0x8
[  859.885349] xe 0000:28:00.0: [drm] Ioctl argument check failed at
drivers/gpu/drm/xe/xe_exec.c:178: engine->flags & ENGINE_FLAG_BANNED
[  859.885366] xe 0000:28:00.0: [drm] Ioctl argument check failed at
drivers/gpu/drm/xe/xe_exec.c:178: engine->flags & ENGINE_FLAG_BANNED

Also, curses to gmail for not defaulting to plain text mode.


On Sun, May 7, 2023 at 8:19=E2=80=AFPM Christopher Snowhill <kode54@gmail.c=
om> wrote:
>
> Wow, this patch made intel-compute-runtime suddenly start working properl=
y instead of causing a "GPU hang" that wasn't really a hang but instead a s=
eqno overflow.
>
> On Sun, May 7, 2023 at 5:53=E2=80=AFPM Matthew Brost <matthew.brost@intel=
.com> wrote:
>>
>> On Fri, May 05, 2023 at 03:49:10PM +0100, Matthew Auld wrote:
>> > Checking seqno_recv >=3D seqno looks like it will incorrectly report t=
rue
>> > when the seqno has wrapped (not unlikely given
>> > TLB_INVALIDATION_SEQNO_MAX). Calling xe_gt_tlb_invalidation_wait() mig=
ht
>> > then return before the flush has been completed by the GuC.
>> >
>> > Fix this by treating a large negative delta as an indication that the
>> > seqno has wrapped around. Similar to how we treat a large positive del=
ta
>> > as an indication that the seqno_recv must have wrapped around, but in
>> > that case the seqno has likely also signalled.
>> >
>> > It looks like we could also potentially make the seqno use the full
>> > 32bits as supported by the GuC.
>>
>> Yea we def could use more of the space but in the end we have the seqno
>> wrap issue. I think I set this to a low value to prove the wrapping
>> protection worked (it didn't) by triigering wraps more often than the
>> wrapping 32 bits.
>>
>> With, this patch LGTM.
>>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>
>> >
>> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>> > Cc: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 7 ++++---
>> >  1 file changed, 4 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu=
/drm/xe/xe_gt_tlb_invalidation.c
>> > index 604f189dbd70..67822b3dd353 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> > @@ -251,14 +251,15 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>> >
>> >  static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
>> >  {
>> > -     if (gt->tlb_invalidation.seqno_recv >=3D seqno)
>> > -             return true;
>> > +     if (seqno - gt->tlb_invalidation.seqno_recv <
>> > +         -(TLB_INVALIDATION_SEQNO_MAX / 2))
>> > +             return false;
>> >
>> >       if (seqno - gt->tlb_invalidation.seqno_recv >
>> >           (TLB_INVALIDATION_SEQNO_MAX / 2))
>> >               return true;
>> >
>> > -     return false;
>> > +     return gt->tlb_invalidation.seqno_recv >=3D seqno;
>> >  }
>> >
>> >  /**
>> > --
>> > 2.40.0
>> >
