Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68F1FCA182
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 18:56:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F1110E59C;
	Mon,  9 Mar 2026 18:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WUvOjVxV";
	dkim-atps=neutral
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com
 [74.125.224.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2556E10EB53
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 12:48:28 +0000 (UTC)
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-64c9cabfe5dso9815942d50.0
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Mar 2026 04:48:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772714907; cv=none;
 d=google.com; s=arc-20240605;
 b=jCDrn4z2q0DU1HkCS/hLkw6sUTsj0gWOKJjP9UhcLbb8gHRKddGBoUnX8NOBTz+2TV
 b7MV9vXMq5ma8K7ImDNV7bAMjVqd3JqnLQgCyyOGRG8vSkQ2FmPXqkRs6c/TAoT03WQ+
 WaKEgIKEJlvyFzAwqCM7Iqn7X0xl5ZcHCTV4WWO8X7otAwk6St19B+7G0nlEf2qJ+RkE
 fcLDv5kzRYgWIxWrVBPNfvgNS6G/fp1JfmTQamyRtcYu5TQ1Bh2g9J6BO8lk6pEG3r/d
 dPxd6Ggg6Hw3BBWiE0Jw9F2L8KVrkSQRAbF8kc9EGC4M98bZMUPGKBM1S0ku9p1PX3mx
 woqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1lktPQKoQSBAfb3VN4Ge3cjP6qp5Dqrkk2aMRnMzmQU=;
 fh=rhli47MXRB0XRQaWlA6hXMV70YaNWbzH5Wr24GqaXZA=;
 b=JhhOW3Pm1Gxb8QB1/yl0wpCBbLfPZvBh0Q/plgh2+r4dUNYqkDdbiQMTKCHbxEQJo0
 MFtLhCE/YpNhiU5i5dq078UohzW5Ibqhn0PHipNGYsb3XGhFcd9jPe6d26eBFL0trkiX
 EzagyUvAZTdZ3Esozs151Bn1p0IwfA7qpTnRFMvS14Y2zXF2aXGkomuIk+MPoI9Caqoi
 drqd6FQCe5OTHwMwCW3RpdjSUrDakISpCxLys0lxp6gpMq1I6c+w3xm8EOMwJJ9U0Ng7
 e1cLXxi3shJnbgtu6W/77A0M41c6LMFWqahudBoYdwGpiJV1MuOIuXKdp/v164bTutHQ
 7gJQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772714907; x=1773319707; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1lktPQKoQSBAfb3VN4Ge3cjP6qp5Dqrkk2aMRnMzmQU=;
 b=WUvOjVxVYmvlFCz2wLqGuLgfqDe/59F0g8Fv9fbhjOfJVmhZ5lCLC4qVNE3ZWG/ix9
 EH6o7JcU1heDnwx0a93PtJT8kvUuNHTDNpG3NnoHwefgdt9RP0vgVeLdYTHsK3aK7KQk
 BogJxpoQCRHTAdfu6Et3hjl3ZdO/cbWMJBDdcSkJdA1gJ5t+72RfFIyz/IgpVja9379A
 mxwwyMYfMnqGQJp8Wdrn/E81iQ4kt8hQZjVdu+UNksdBOjgY8ppAEcgioIyHTGXNOuuq
 FeB7lKBWeXdp+r6MdlGsYbiXzs2Ufd3JPZzeh2qH3kbmsQJwQd9rUzVLhwxhZGipsN6/
 UXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772714907; x=1773319707;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1lktPQKoQSBAfb3VN4Ge3cjP6qp5Dqrkk2aMRnMzmQU=;
 b=ZetgWPKkcnZ4Nv17Y+ezpx/D/7rOMEZ8cG7YfdZEiyRiexri+pxZwwWtPBeNNdW63+
 Ax6JoPKOas9sTey3Y+RAWBP9sG8uMm9sbwV/DtmBr3cgbFe0thrHNP4rImTMRaijYnmp
 HdVpKCVcNBwuiDWDVBf6OzDO7LngnLSCcWjN9AfVJphfOI4JkFhnvj4LEKhShF5Qm1DS
 VcBObaOJGjoDeI258F8+AmBFG6k/3PjJkhUaEGy75yBoUYK3j7dFJGi4grqkR8y/+mBD
 s7uzUUjdqpIUPEp5nzDxlxy8R3DD5SsaThMvWrvPKb8dnKca/AlJz9N7CN5FGFjTGjcE
 i+XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmMRHt2GxKLvBPQWB4nZchyt50qp7iey8Pi/i2U7RoHh+l6OqY79fSKjzvWzmW9E5T/55t9LjXbA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzABXiPFdV7aJxQ7q51BSoQ6DAazcyI3IUQStion0IE3rNiethY
 hm8Ya/k6TXlNbLzkyluUdWU7qtzJBRJXQeRgKWW/FXews07SzlOC5VWkGWc89pQr/Ka90t7DBgj
 SI/zLzijr6Xw3cAFXdZkBHP64dOezAnk=
X-Gm-Gg: ATEYQzwpuJevoZV9uXQpEcVJa1CasFmt89xAWlOwGbqL2vFI8T3KkNkifYFh3t7LgfO
 KmugdYA8un6hjMtSy1mbms6j3mdyLE5wpPtZDIIAinnWHLZK44tZaS3ZEu1H6T7ZIzJpaKn5uIu
 Pqq1VCBid0n6OHcNz+lCud1585H7H2piY22q2zCP0A3Ho0GlLy0NK5om0yy8KcIgqkUZA3TQ89Y
 MHemyy12DeDvJVdyUZS39C/9KibG6k5OO/h4TDYIaP2hJsSS7gaB6AN0N+BVEZPMv8OuE4q++Wo
 kn55JrcqzPYEjXja/b6TcEyjx43SWL3hIsouwIXXNBk+EzH8AjYaq6Mmzqc=
X-Received: by 2002:a53:ee45:0:b0:644:4eec:22a with SMTP id
 956f58d0204a3-64d070e70c5mr1224522d50.2.1772714907019; Thu, 05 Mar 2026
 04:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20260305113734.1309238-1-dev@lankhorst.se>
 <CAHijbEWKN8EY0uy73XR2RRh1ScgarZTLibu5ECR08OeqTje54Q@mail.gmail.com>
 <fbf457b5-cec0-41c6-bd04-55b5aabe23f6@lankhorst.se>
In-Reply-To: <fbf457b5-cec0-41c6-bd04-55b5aabe23f6@lankhorst.se>
From: Julian Orth <ju.orth@gmail.com>
Date: Thu, 5 Mar 2026 13:48:15 +0100
X-Gm-Features: AaiRm518_BUJv0RyHHbOkpmnKK1VfGy9VBLZeNjusPjqMBC-hTsbeyACk-nSYN0
Message-ID: <CAHijbEUeCHhqKwhcTDu9v5S7K5KHC2pcSELD3P3ttqQcf0pRvQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/syncobj: Fix handle <-> fd ioctls with dirty
 stack"
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 09 Mar 2026 18:55:56 +0000
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

On Thu, Mar 5, 2026 at 1:45=E2=80=AFPM Maarten Lankhorst <dev@lankhorst.se>=
 wrote:
>
> Hey,
>
> Den 2026-03-05 kl. 12:48, skrev Julian Orth:
> > On Thu, Mar 5, 2026 at 12:37=E2=80=AFPM Maarten Lankhorst <dev@lankhors=
t.se> wrote:
> >>
> >> This reverts commit 2e3649e237237258a08d75afef96648dd2b379f7.
> >>
> >> The problem occurs when userspace is compiled against new headers
> >> with new members, but don't correctly initialise those new members.
> >>
> >> This is not a kernel problem, and should be fixed in userspace by
> >> correctly zero'ing all members.
> >
> > I don't mind it being reverted since userspace rust code is not
> > affected by this failure mode.
> >
> > However, if you're committed to the idea that this is a userspace
> > issue, then I think the correct solution would be to instead apply the
> > patch you suggested. It clarifies the intention of the code in my
> > opinion.
>
> Thanks for having a better understanding of the issue now. :)
> I will resend the original patch I mentioned later. I just wanted to get
> this revert in drm/drm-fixes before it reaches a rc kernel.
>
> Can I read your reply as an acked-by?

Yes.

>
> Kind regards,
> ~Maarten Lankhorst
>
> >>
> >> Cc: Rob Clark <robdclark@chromium.org>
> >> Cc: Julian Orth <ju.orth@gmail.com>
> >> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> Cc: Michel D=C3=A4nzer <michel.daenzer@mailbox.org>
> >> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> >> ---
> >>  drivers/gpu/drm/drm_syncobj.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_synco=
bj.c
> >> index 49eccb43ce63d..250734dee928e 100644
> >> --- a/drivers/gpu/drm/drm_syncobj.c
> >> +++ b/drivers/gpu/drm/drm_syncobj.c
> >> @@ -875,7 +875,7 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *=
dev, void *data,
> >>                 return drm_syncobj_export_sync_file(file_private, args=
->handle,
> >>                                                     point, &args->fd);
> >>
> >> -       if (point)
> >> +       if (args->point)
> >>                 return -EINVAL;
> >>
> >>         return drm_syncobj_handle_to_fd(file_private, args->handle,
> >> @@ -909,7 +909,7 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *=
dev, void *data,
> >>                                                           args->handle=
,
> >>                                                           point);
> >>
> >> -       if (point)
> >> +       if (args->point)
> >>                 return -EINVAL;
> >>
> >>         return drm_syncobj_fd_to_handle(file_private, args->fd,
> >> --
> >> 2.51.0
> >>
>
