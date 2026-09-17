Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E3FC88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 23:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8DD10EEA0;
	Thu, 17 Sep 2026 23:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q4RR+Sf9";
	dkim-atps=neutral
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com
 [74.125.224.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31CA10E4B5
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 23:19:03 +0000 (UTC)
Received: by mail-yx2-f12.google.com with SMTP id
 956f58d0204a3-66e4aac92dbso209621d50.2
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 16:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789687143; cv=none;
 d=google.com; s=arc-20260327;
 b=nmK8NrB1Ie5cEgGJYe4XtRAz7NIEMiXT/i8e9U/c2Ma+X8WKdmA3IAwCjbynP+hwY4
 KAtHRGWgOv7ktiEa5q1bXbrxo30kycOGA15Gl5YKnxXnjzvM0xLxM8Z4wTmKXgKlUVBM
 ld4BJcPXtYJflCjFM1F0L47P2yALJRsY0ej95375PNOwYGNDYq7uaENsYuU7oucmgmHR
 ChR2I5itS5vlfG8HxHzZoTl21mENJlxoIH1WrPc82f8xHqrlSWMisoJgiGriBsGgKzcl
 slsmaAIGckmNx79xPz6BDTqOiM2n4jge61QG3qk/r7JB70iCaR2Z5TxxZdaPt/+q+yW8
 pKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=U2XagsX8bBU1jjmpUfXKrlW1BPZCFHkmBoZ36ck5PtA=;
 fh=gfEc681R0i3FJ8dgzyR9qPe7TKiV81bK89zGhdxdKik=;
 b=G9zP5cH50F9frakEsGjrdXqdmG1Ild2eTMjiSd3n3Ms85iZR5I4FTbhfLZePLD8JCB
 VpCAFrj6/tNIcD+knrgWI24H2Vbjzb6Hobyt/KdKFNBLbPmShuB2CvdQAD0NFFohS1gB
 vCW8GQCTtpy6phhCga30Qzk0Z/c4E5tT6QPUBcYD2EJMQQ+ItZP79e5X2Acy4SNH5iqF
 x2sbqoAja5cIEMtLyWACN84utSACm1yH9gdyhlsy0hqPinwudiJtm4jmVMwi5Rc4m6yA
 9AeKCYN7xRbH8tquJ/O20aSo+D+E43lPKteIKM/QCJ2CUYBlWPtsX7y2Cx/WLdSsURnk
 cHOA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789687143; x=1790291943; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=U2XagsX8bBU1jjmpUfXKrlW1BPZCFHkmBoZ36ck5PtA=;
 b=Q4RR+Sf9YWEVrkN5NUzejbOvxqmIlwjZ2OdYjewSden7qTUktNlxYXa9r0xvn2wJN3
 Hurdgtxyj5goDGL1BIYCs0ZjThXLmwEZGfIOk1b1hdH5RpMW1+0UD+u52BwVL0kIst3E
 JuYE9QkTNCm+qIZGTa2d2RWilxXsfGHPus3sdpICBNRZTw3fNq/ZQyUwebIwm3CoikUe
 D6cnGHmdWqoCJVeafB55agHnp70yf3PYp+fEzav28c6h2HFNcKrDvYzPWmzs4ayBXvMx
 eQZJKHg1uxeRUPlmOReMrnu2wYf+M9rcVdUumRl7HYgUG9agaTT2yPTB8zqQTABhHhYe
 fXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789687143; x=1790291943;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=U2XagsX8bBU1jjmpUfXKrlW1BPZCFHkmBoZ36ck5PtA=;
 b=Hk8GjOa5mnydMtcUPYRMdjoIpNxES+seIcoee3ZQwW2VW50CCzVKsS5L7YkrSZ2Hjp
 k4f5FWVvooBwI7QTD3HFyYmmDbHgaa6ycBcO1/ZD+xHHHaOaJyTP2MyYmSp1hnou6QdP
 g9CFiyc4B3bMkGkybVFimuThM+YrCWov+XHwkJu8FeNvKJU95lzYmojRU9x3NY9o3j6i
 aQR7EI9YiVUOiAQsaPr3dow/72rXRr+2EF/U3dXAmhnwr5Nl4cVTEOgGqK1ss7KzyJdG
 UK6Y7LN8/3At8AUiTaW9iMmC25ZeZFiTXebP99jl+jePz0ju8Fme2bkoF9JbeVIjtuuG
 jhlw==
X-Gm-Message-State: AFuF++npZhMldQWnNXEoOoQdrA3mwY6Lz/ud1yJOzSl0iUUrz5us6GCp
 VLvyYSHGhwyHhIsyITXsjVv/7zAGWFNqfAnrIwevPciwLN5xngrgwbV6j/ZF/tkQIL18n2NjHUg
 QREvDUTrX/YkDpbm8SVEU54fshlcKOCQ=
X-Gm-Gg: AYBFou2WGxYk7xWDbT1WbKcUJcPcV9hoszRmfzRsQq5uIa6cOlg+i8SGXl4OT/NmGOS
 ZmNBU3BEbAon7DyXTMGzMeIFOwFQ8SSTTnqxPojRxwufU3BVfVh1xQsSIVEDL2Vo583n58PCcEN
 G1X4v93AcQ5/8sH6DCVsxF0JZyyM92HgSxeXqKVXZcmmrhY1j84MDHk/Nn/poJWHnsUFtAxZuMM
 sK82I2ItfPl3gDbfNR6sY23l4ApmjEIxh8C6YY7ZmD/v7Tx2NmF6RogBIyN/D7hqBuYrfb7DUIO
 5RGgSu3awBfQmXDmno+7hMuYk89+LVuKw0H5bvH+BPKXIti7z4YpCA0LFOsA8Moj62F1Y9ZhhvW
 /YcJeM/mBFxNcAGj5ubfVoh5Z8RIpGjYq0nbzWoYssUU=
X-Received: by 2002:a05:690e:440c:b0:66f:c1be:a644 with SMTP id
 956f58d0204a3-6717fd8f9b3mr177202d50.54.1789687142763; Thu, 17 Sep 2026
 16:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260917163553.1742580-1-talesam@gmail.com>
 <20260917163553.1742580-2-talesam@gmail.com>
 <20260917165042.7466A1F00893@smtp.kernel.org>
In-Reply-To: <20260917165042.7466A1F00893@smtp.kernel.org>
From: =?UTF-8?B?VGFsZXMgQS4gTWVuZG9uw6dh?= <talesam@gmail.com>
Date: Thu, 17 Sep 2026 20:18:49 -0300
X-Gm-Features: AcwNN1X2qQB50H7FD8zGbqFyjanOiNGftj2LssNSFrprx0J4Khv2MWqFXi1u3rk
Message-ID: <CAHBRX4HxqoXm=Y4CgNZkngPEZZDe4f=Ai1y6g8maRhuAeM5feA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] drm/xe: Capture devcoredump on TLB invalidation
 timeout
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

Good catch - that read is genuinely racy, and it is my patch that
introduced it. seqno_recv is written with WRITE_ONCE() from
xe_tlb_inval_done_handler(), and I deliberately moved the devcoredump
call outside pending_lock (the capture takes sleeping locks), which
left the read unsynchronised.

  Fixed locally by sampling it while the lock is still held:

        seqno_recv =3D tlb_inval->seqno_recv;
        spin_unlock_irq(&tlb_inval->pending_lock);
        ...
        if (timedout_seqno)
                xe_devcoredump_gt(tlb_inval_to_gt(tlb_inval),
                                  "TLB invalidation fence timeout,
seqno=3D%d recv=3D%d",
                                  timedout_seqno, seqno_recv);

  This will be in v5, together with any other review feedback.

Em qui., 17 de set. de 2026 =C3=A0s 13:50, <sashiko-bot@kernel.org> escreve=
u:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] drm/xe: data race in xe_tlb_inval_fence_timeout() reading seqno_r=
ecv
> --
>
> commit ef794f6bbaafa679257b9fec9405245af4942e68
> Author: Tales A. Mendon=C3=A7a <talesam@gmail.com>
>
> drm/xe: Capture devcoredump on TLB invalidation timeout
>
> This commit adds xe_devcoredump_gt(), a variant of xe_devcoredump() for h=
angs
> that are not tied to an exec queue or job. It hooks this new capture mech=
anism
> into the TLB invalidation timeout path to capture the GuC log and CT stat=
e.
>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678
>
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_=
tlb_inval.c
> > index 7c3bf32d9258b..7a0c04fac60aa 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> [ ... ]
> > @@ -97,6 +107,16 @@ static void xe_tlb_inval_fence_timeout(struct work_=
struct *work)
> >               queue_delayed_work(tlb_inval->timeout_wq, &tlb_inval->fen=
ce_tdr,
> >                                  timeout_delay);
> >       spin_unlock_irq(&tlb_inval->pending_lock);
> > +
> > +     /*
> > +      * Capture the GuC log and CT state so the firmware side of the h=
ang
> > +      * can be inspected; there is no queue or job to blame here. Must=
 be
> > +      * outside pending_lock as the capture takes sleeping locks.
> > +      */
> > +     if (timedout_seqno)
> > +             xe_devcoredump_gt(tlb_inval_to_gt(tlb_inval),
> > +                               "TLB invalidation fence timeout, seqno=
=3D%d recv=3D%d",
> > +                               timedout_seqno, tlb_inval->seqno_recv);
>
> [Severity: Low]
> Does this code introduce a data race when reading tlb_inval->seqno_recv?
>
> In xe_tlb_inval_fence_timeout() in drivers/gpu/drm/xe/xe_tlb_inval.c, the
> pending_lock spinlock is dropped just before this block. Because seqno_re=
cv
> is read locklessly here, and concurrent updates (such as those in
> xe_tlb_inval_done_handler()) use WRITE_ONCE(), reading it directly could
> result in a data race.
>
> Could this lead to KCSAN warnings or logging a corrupted value in the
> devcoredump reason string? Would it be safer to read this using READ_ONCE=
()
> or cache the value while the lock is held?
>
> >  }
> >
> >  /**
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917163553.17=
42580-1-talesam@gmail.com?part=3D1



--=20
Com os cumprimentos,

Tales A. Mendon=C3=A7a
talesam.org
communitybig.org
