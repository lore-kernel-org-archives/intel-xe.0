Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64020FF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 03:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE47410E0B1;
	Mon,  4 May 2026 03:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rw/fKRby";
	dkim-atps=neutral
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA30610E0B1
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 03:56:37 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-8d4f78fc9f6so406509885a.3
 for <intel-xe@lists.freedesktop.org>; Sun, 03 May 2026 20:56:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777866997; cv=none;
 d=google.com; s=arc-20240605;
 b=dJZ7qhZQbjKlAMkWXAGOcShKClEJqlNzrWnBsZOymwarZs8ujyvLh/GiRrIC7QDMBL
 4eF+o81C6daQLG9E89kyo8ORgrDKXEWEmepZ7G3QGdPQKQ3YBQn86osgP08RfJF+SMrC
 rqdOyWqHqhcTn9ya9lgqtpodHsedT1NQdgabsDSaLe/OAS5QcuWx+MRCms8awsaeBIS8
 61NOftNejuPK6sXcKJrZTd47h7W76X+QRvMHnRzqXHpRuTObYgtos2t4DEnozZt0Br8n
 K6HtNmZp2nDf6S2DvTc8S3fepf3P4HTsBiulMozVbIE1eR/jz7XxmzYcL7FY9dAUyV9T
 2Img==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Y19V3fSw2nLa3PgRwVgUrqV+zuSj+iC5aF2Sowscyc0=;
 fh=xx2bRTk1igNXHyQSgqqbc9BoNrxEoSQU3WqJ/QPGHYM=;
 b=Vf+Vl5kGMPntFpMK/NS3gKXWqjcBITOcGVYiQ3fq8dF48BmivdnqDz1JvJE7GTgRP3
 J3zLxYyy2ERdujINqgqC060WzMIf9pE1RH8JVYTsKevs+nmNO4TJV4cKxIm726KEYqdw
 10p58QId/kOXpaVM1h+mwi1LqgSXbecuJp3cSx4s1O6TnsgEeb/hWP8tgjlqH6HMVjS1
 NQ1ITTDoKNQetFsRXpfYWInhfLQkI9Z1kFHJBJ0LT/06KnXKUp1gzJAgDH4CqwlPwgOf
 H+CoRJCHW3GwRZaB1oekrEUT+2z594W0OBqPMfPQYaq5KQCBEylzsSamB3HXZwzThxgu
 kLVQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777866997; x=1778471797; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y19V3fSw2nLa3PgRwVgUrqV+zuSj+iC5aF2Sowscyc0=;
 b=Rw/fKRbyvjKXtg0WhWXx+e7J40C9omuvawP6HKVqva6Bt12Ej/YoLcIWva1RFmBB1L
 PkVs+s0h95HgEBmMpUXzdjjd6BpfUi9ev15azrAB0k9XtDaQwqxdRT9ldC6J+JPjyy2V
 hXzZ2lKnItYG/F22kDaAx+vy4DVROHxr+YDg3wAEZQUw7MuSslKjvcRKyzG6JPTALfYS
 HgzxwTvO/wywjaEAvUl7iawFIXwNaQBgXAAeui59+kQTH7kPA0fpsZ8bI97qYpx0fws4
 S+Pe41pVBCahtLUj+DLhZGc3V122xu9oUVnUMJkObxvReL7XCW0gfbo7klu7T6YtU6IT
 qRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777866997; x=1778471797;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y19V3fSw2nLa3PgRwVgUrqV+zuSj+iC5aF2Sowscyc0=;
 b=gj0pR07PlDB7P/yy4x/XDjHfEAPEjjhXBoKOsh3GgjsSE6ShB+CKCAOssqJ4iPYpdO
 SFgpybXgsyUVbVdaYGdB1ObTFLMMMgyJQkxJXhyMm5E4qypDjAMA302jH5ca9+Eh3cir
 PbMmnrI9oWsY9NeAEhtUidXVLVidxJwcwNEXOUa9y5nY4m6jQF3s2aA/W5UjsX6KRXki
 vooSho+SkAsi3Bg3UzqP5+dSfanY0OXps/b5a+RWYb3MQh4+Or6DOG9yeIrEvbihyRAq
 +9YI0war0+3RPXcU/dyepGGkzvJDiyLuaNr5+oGu+6T2+0f4ZfPMT/2WlCVxPVSXPbb9
 LbeA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+qSYllqa/JBiYAn2OhGklEZDFep8gilzCthAtgepCvubHIOWgR9gOnufjkME/Xg9f9vwwSIgKbHA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyAIHRk09fiBzbOmt/uPyJtknWx3ovbZdH5pAaUp+Gvg5vJ/0W
 6mkKDuu6wEl7sJfULY7xluWMTt3IEI+cCG1cSXUkp5zLKu6rt+NaMughjaOfYPYkIFvXscsCDar
 5EZAzGr0ue6RFi0z4MIVk3Xs9oXN7drE=
X-Gm-Gg: AeBDietirGgBWUiDfiyxckf1v5/87fOj3iEUVaViaVtm8r2VwdwOXlCHdUrHg2IE+gG
 uRD9TucbjFoGGOk2qLxjhJVN3r8Fs/mSsxoJtnn8Um10+YtKTo3bxGFPw88DuEepYpgYQsr3NtS
 sH+/jpFb4Tr4kaII6g3GbhWLVPPKeV+FX/N5ZpJvFjcISNoDm7mmgJoWFyEUa9aap9tv2/Acz9E
 q0ejl7NHgkUq3BFL0/2uO0jBZn+uoIr1k++eRSclNGtGtyIfjOwU6XqMyT1LCLAxJgkPuVssS8R
 YcHjLZ/aUL/Z+0QO3Jhh7OnV1NS/w8xt5c3RqdAol/SbVAfRyPHgcmIa54QxSNErjD5C0nhWST7
 opz3t5TNZQIWd
X-Received: by 2002:a05:620a:4150:b0:8eb:605f:6cd6 with SMTP id
 af79cd13be357-8fd18834d2fmr1201121185a.60.1777866996695; Sun, 03 May 2026
 20:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260502065338.2720646-1-matthew.brost@intel.com>
 <7f927ef8-2d3d-4609-926d-b18535794f72@panix.com>
In-Reply-To: <7f927ef8-2d3d-4609-926d-b18535794f72@panix.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 4 May 2026 13:56:25 +1000
X-Gm-Features: AVHnY4I1DugeXn269d7bGPSVS8oaqFDQvQNdyXAeNtAJBZHN4bL6ea4BTB9Etjo
Message-ID: <CAPM=9txfkvL4pWW53Pk0OtJ=vBaa-SCv6npSCK5f0zuOOJUfSQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/ttm: Fix GPU MM stats during pool shrinking
To: Kenneth Crudup <kenny@panix.com>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>, 
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 2 May 2026 at 18:14, Kenneth Crudup <kenny@panix.com> wrote:
>
>
>
> On 5/1/26 23:53, Matthew Brost wrote:
> > TTM pool shrinking frees pages by calling __free_pages() directly,
> > which bypasses updates to NR_GPU_ACTIVE and leaves GPU MM accounting
> > out of sync.
> >
> > Introduce a helper, __free_pages_gpu_account(), and use it for all page
> > frees in ttm_pool.c so GPU MM statistics are updated consistently.
> >
> > Reported-by: Kenneth Crudup <kenny@panix.com>
> > Fixes: ae80122f3896 ("drm/ttm: use gpu mm stats to track gpu memory allocations. (v4)")
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Cc: Huang Rui <ray.huang@amd.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >
> > ---
> >
> > v2:

Oops, good catch,

Reviewed-by: Dave Airlie <airlied@redhat.com>

Dave.
