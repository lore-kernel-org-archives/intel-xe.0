Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6903EC79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 14:24:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C5F10E2D2;
	Thu, 10 Sep 2026 14:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.b="h6d+Ybgb";
	dkim-atps=neutral
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com
 [74.125.230.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE6110F0CB
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 11:44:39 +0000 (UTC)
Received: by mail-qk2-f12.google.com with SMTP id
 d75a77b69052e-52fb76543e1so7863791cf.0
 for <intel-xe@lists.freedesktop.org>; Wed, 09 Sep 2026 04:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788954278; cv=none;
 d=google.com; s=arc-20260327;
 b=Xnku5pyv6uyT9VUoyZXNm5rSyhVpO5yDfcSBIIKsGlICBXY8G+8PYRCYNecZ6EDxz5
 v9m5bjZhlF3/EBUSyMzaG6ZUnb4RUsz71orGOpuu9HD0rVrME5szY193kLbhI4vXiOx2
 we3ZBLE2HmNV3Be2xx0HpS6LV7er0PzziXHBr4Bv38FkHgxyYZkrbZ6VxXs5zHHjKsHl
 wf1ISmWV12L3TwBw2UrxZClUWj9xOUMJjp7SIdUXETxCQ944kt+S4ZeyJy7Wvat3AQaE
 14Ua5ERLdWemwPHCXP5Z1swBTEzIKMi4UxajoE+++/sbeeWC6k+0nSpvcmBhKZdk5P09
 3Cfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=/N+0yVy13tQgS5+ScpnESpLk/uyTrS9jGVGpFKTxRCA=;
 fh=KBt64CEOiXjhS8GvMKCZbBUMLEvIZAbod3aKkrB33kQ=;
 b=iniZopes9SBcii5DeYKwOkF5ft+e339iX79zzF6ur2wAiCm6LDEwSp5N8GfwKcHTu2
 /cOC5F7S3kU4ibUzOf1YnwX7xt+W9MBWPE5BgJu+Hvgwo+Lw3wvgGI9sZPoxKA5NWn1U
 8EaLfOj3/vO7i3fsVZkW7toN+f28VbQ3zZv1n8aeWcSaHovJTJxwIGec50u2KYCnB2ST
 tGxCBsg/WhRqAQu4qlRG1m51/WboZg/j/ZJdklI4R40fWnnmkTZ/qugwcuZsOzk9uc+R
 b2/IkKkO0zrjyeBMaOXazpswJ1YcHYtYSlNFUWDg1FgMucxSz6yw/5L+21zrrxQeyNkN
 FsbA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=szeredi.hu; s=google; t=1788954278; x=1789559078; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=/N+0yVy13tQgS5+ScpnESpLk/uyTrS9jGVGpFKTxRCA=;
 b=h6d+YbgbyqEbfKK/b+tCcIWZGSFIHvml3Na7AppBgPBjexN1pjNACqIXHCGMJi8SW1
 kP7LR0ed8dF3PBDXsMCrQdZUINaq/0tIwrZ4+pE6HPhRhg2yvxRISv3p7yuxSJnlGGd0
 MYmPWOyjvKXebJxyE8suryiy0SSaQm+KW/QkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788954278; x=1789559078;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=/N+0yVy13tQgS5+ScpnESpLk/uyTrS9jGVGpFKTxRCA=;
 b=hFYB+G8Y2G9/RXzbCp+pvGiWmh8AFmy+QAU7bTfz3qMhGEQlujsGbGI1BXNVPqrLIJ
 ZHiig7KcyivnONKdzxdnL61Xwd0g6WNQK+0NB+WRUDCeE2cEDNDadu8Mp8np3kAU2izH
 qD7aM4KV1tKO2bDNQbl5O2DdMH4LgdDs4RcwZ5srQcIxa5Q1r3K39zfq1+SnJ4SRva/F
 llsyyDWQwwhOeL66dWd31KL+k/xDAWTqsxQtF3IMyAqQFmkveXmt+1ntJfVHiPCA0vNP
 dtHaKAIXTJGwKbEfKj/Hz2AXlJFEYzVsWBz/wi/an1MTaH/MpMgIh+1PF0q2ebmWHP1i
 jDDw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwnCODfW/UAbyPQW2/FJujCkompJ9KLupdbG9BH0OxFnPQtqaGVzXoZ7SKgOcCsqX8l3a70IPBjEA==@lists.freedesktop.org
X-Gm-Message-State: AFuF++l2yA+XDejxXQlQTP/rlQSTPoEbaptrxgfLHn60/54mObNT7SoJ
 LK1RtC7eRpWvTbfS/Q+N5MkMxy2mRUYZnDaKz4bMvta2wjvICxQ6sxszee4be60c3rWvIntXC2s
 0bUYujI3Q3mYM2AnPve36OuhlXwAEki9OuHOqgCHoDA==
X-Gm-Gg: AYBFou0VlwYcya1bVxDCJc+nj4XSGT2OY+ZggHW2tXUbMevJNOMl4ZfWvJidWaRoKBD
 pmQrYcucwVVja4bCI+SW0JMRO3ozTNymxvHdYcqneKNKCRsnZ6OscYfZ6z4NjQYU33zEOQ+17KO
 718t3XaXPC/53s64DQfM5IAV8EczYLOcFTAix+QfMqeL+PRau4TjhTCvjFvz5SmpUQbnZiUcL4o
 B/oKZgq3ZUVp3OlKii0ZmUJstqXD/Zlv3rl1DHng5/YXEm1yvCAyYPP0zhV2zGiJp9+50sFifjc
 1rpF4iw6Ur0qXJAlZgm8w/8J0cP8/BNQ9IqBslDgbpKuZccqgOC+D0KDlX8ATykwv3/CTUEuxpZ
 gAk+VKw1OrgI+
X-Received: by 2002:a05:622a:308:b0:530:42e5:f39d with SMTP id
 d75a77b69052e-530913734b9mr126064511cf.25.1788954278478; Wed, 09 Sep 2026
 04:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-5-mika.kuoppala@linux.intel.com>
 <20260903152224.AD48C1F00A3F@smtp.kernel.org>
 <178878748003.179185.16833574173741290547@jlahtine-mobl>
 <178894801687.37859.4186888279082797860@jlahtine-mobl>
 <aqEzHQMrI8p9XVcu@phenom.ffwll.local>
 <785085e8-c9db-4d84-ab55-3a8caf9f4a35@amd.com>
 <178895308548.62143.17472983986994555742@jlahtine-mobl>
In-Reply-To: <178895308548.62143.17472983986994555742@jlahtine-mobl>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 9 Sep 2026 13:44:26 +0200
X-Gm-Features: AcwNN1V9qQ9dKCqab0SB2yrcU61pfAYqyf8l3R94yNLcs1Mbssj6NoYvC5wSIfw
Message-ID: <CAJfpegv_qh6u+GSFuPp8-PDXLoAqVWwz+kkwXv_zsxyL1PnkPA@mail.gmail.com>
Subject: Re: FUSE deadlocks vs. copy_from_user() and locks (Was: Re: [PATCH
 v10 04/27] drm/xe/eudebug: Introduce discovery for resources)
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, Bernd Schubert <bernd@bsbernd.com>, 
 Joanne Koong <joannelkoong@gmail.com>, Amir Goldstein <amir73il@gmail.com>, 
 intel-xe@lists.freedesktop.org, fuse-devel@lists.linux.dev, 
 sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 10 Sep 2026 14:24:03 +0000
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

On Wed, 9 Sept 2026 at 13:24, Joonas Lahtinen
<joonas.lahtinen@linux.intel.com> wrote:

> From my position, if userspace is injected to the dependency path for
> resolving page-faults, with potentially unbounded execution times, the
> timeouts would better be asserted at the FUSE/UFFD side and then simply
> failing the operations with a bang if not met.

It's possible to set request timeouts in fuse, but it's not going to
be made universal.   There's just no good general timeout value.
Whatever you choose it's going to be too short for one case and too
long for another.

Thanks,
Miklos
