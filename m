Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB05CCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 09:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1C410E38A;
	Tue, 28 Oct 2025 09:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C+WkTFQA";
	dkim-atps=neutral
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B89810E5C5
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 09:36:31 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-33b9dc8d517so5490498a91.0
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 02:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761644191; x=1762248991; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E8OqaS0LJf0RhhBIJTbX4O/X0/UHs6OlrEdWf31xwmk=;
 b=C+WkTFQAM0ToU0ErzYFpslT6FwViSH3gfXFXGbtEvzI0sCKnEQoemZVT8RdMX8KZwP
 u0dTkCCyxOR99QJvR8xUMnGRVfQ1ygG3AlwlayLKhUk1RHiqZa3lzXtKKRduwzymghLg
 efK54I9gaeYK7TD7G8Ge6BX88JbdpfO7yDpm5LpI2/I1J3Ug3TDtTaavyDfmQR5Vm/AW
 n1QyVR/uDXr2IxftYkK7QnQMFYcZVpQlJbYd2pHveD0DGRkez67omcz6osS7m5h7xTE4
 X0fVIIOt7KAi4gPnQab2lbyS6CS6hQEkkM/ni8MKzv1DmtuApNdXqozOOdFnGZ2JUOPr
 Cz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761644191; x=1762248991;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E8OqaS0LJf0RhhBIJTbX4O/X0/UHs6OlrEdWf31xwmk=;
 b=KwFnY+LomXHqJok3gdzzArOfhfULCbEHN8iw8PCYBpytYuD9cVlWr98QuUKL0dMeZS
 Dm8knmM0RADh+/GDq0kAt6Kasa4NxTA1oJkvBOTA6zxuhzQwPVbcGh1Qz5fHmNwWVxjQ
 hz8C/O8fxJ3tcHw6DY6gc23vOnGUaMfJqRSiwhCuepsfK3vY8E28sVxsw5QwUCZMPGcY
 iwHhepHlqNiA/Mg/LqDitIY9U/YlwahpLlVVBkwujpNyaEvWW0MDeBoliDkh3FnpA+hs
 d9F4ec8f1Yjxqojml1wwGw5izj/NcKzLWmB687Md5XlQ+fYQ7j8gOHwzNZqTHvrGCE9U
 GheA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZGlXUfBBly8o+wOrorSlUNiOlyxwV9Ko3Qu4mfA9EtqrHaEohqEtphzl+0P83PC4vW+LIcJDehA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yytz7LbVqWoTnAgCw2AhGWZUmwnqVGM8NsczfaAHV99G+02zBGF
 jRl9jNY+RxB93nF54+2clmHPZi8bEEnxhHX+E9bef1zR60lKnVM0CafqgKxMRcMQzcYCR2PW5Rt
 dQN6XV/pxqyysrjp6Fw0h45mhhCIWyRI=
X-Gm-Gg: ASbGnctHcUZwQwvsAqe7xL0rf2kfNKYsXZ3h2FIY+Qk3ULvVg2Xd7PPFr66x3taWTyk
 K8QpJwTsPha89MWWeMWLpn2toim++/t3WqVHtqOblYi+9Z8ksl+uPuveR2eJPVtK2e19fc1J6Ng
 Mj3c565DcWzLEo8BsCJz2Go3L30EdXXaJgQ9bxRi4wLMSon7q+F/gRb2QH4pqxyWKHh7cBZnlUv
 ejC+W2cr4bzDrP3zWhorp71/wuCg65vSMBs61TgwwSP4mkupsq8EMVxemQH8vk=
X-Google-Smtp-Source: AGHT+IEbzxI8TMpmBVxJPU+xigYHl23wYN4e45pw2adMfFbiINXzA/tXIQTvxdTLKfrf98TUlttrtNY/pDwtyQ+kiVg=
X-Received: by 2002:a17:902:c40d:b0:292:64ec:8f4b with SMTP id
 d9443c01a7336-294cb4fe1dbmr40998265ad.43.1761644190486; Tue, 28 Oct 2025
 02:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251009211313.30234-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251009211313.30234-1-ville.syrjala@linux.intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Tue, 28 Oct 2025 11:36:18 +0200
X-Gm-Features: AWmQ_bk5rO9YX8tLqWKi1c5ooCXfelT5DAN0gIrb8n44mTjNfxQVxtLnbmlKlGM
Message-ID: <CAJ=qYWTASBWWFCDpL4pWkjyMhN9ZUCqEHYdb+hBy8bmXMhLBLQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] drm/i915: Some universal plane fixes and cleanups
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
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

Set is

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Only thing I was wondering about is that cbcr handling with that plane
min width but I assume you've tested it works as we're not getting
much of ci results for these.

/Juha-Pekka

On Fri, Oct 10, 2025 at 12:13=E2=80=AFAM Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
>
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Fix up some of the universal plane min size handling, and do
> a bit of random cleanup.
>
> Ville Syrj=C3=A4l=C3=A4 (8):
>   drm/i915: Rewrite icl_min_plane_width()
>   drm/i915: Drop the min plane width w/a adl+
>   drm/i915: Implement .min_plane_width() for PTL+
>   drm/i915: Start checking plane min size for the chroma plane
>   drm/i915: Introduce intel_plane_min_height()
>   drm/i915: Remove pointless crtc hw.enable check
>   drm/i915: Extract glk_plane_has_planar()
>   drm/i915: Unify the logic in {skl,glk}_plane_has_*()
>
>  .../drm/i915/display/skl_universal_plane.c    | 94 +++++++++----------
>  1 file changed, 44 insertions(+), 50 deletions(-)
>
> --
> 2.49.1
>
