Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461DEC48BF8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 17:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1A010E9D9;
	Thu, 22 Feb 2024 17:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IHDGqMUv";
	dkim-atps=neutral
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F0B10E9DA
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 17:57:21 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-512c2e8c6cfso56241e87.1
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 09:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1708624639; x=1709229439;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2n36AeyXiuh8a+bUOx1L+r2cwQosoX8vn/3R6qLfBBs=;
 b=IHDGqMUvX9qa1UOgO9k6DAht7iDQtLpOrmbYQGWoFNt6doXrxeOA8Ho9U+ZYgPitYF
 XadEjUI/kmew5tWKWjmvl/aHmnTZvUtksIo2aZemp1Begc8tyPxS5E2PqdKAb10gdL5y
 r5kfWrvYpyp9gS8t8Y4JqwWflnfhxLZnX1/3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708624639; x=1709229439;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2n36AeyXiuh8a+bUOx1L+r2cwQosoX8vn/3R6qLfBBs=;
 b=AdCVBRQIz0TNjXpuILo0PatlgNxHE6MsXWJgUwuk76MlwFzYbYv/7xRUPhR4qRSx+M
 EHQMxkFozkEv5qNxkRh/VZjuQ2LnlB0QKFznNagdlu/x33V3N5YRswPeSy3h6ffUmSwO
 kgh6hm6WOlFXwjBIrMQsaXtWxwGnwEqqHkCHTVatQ+HRI4CVssdphglr81wTtuYchnnm
 /O+Re7JqijSPsegs1gYGkNYqAExPQAB9fI8ngE9Rzgvy10fu393Wu0wisRqnKWitR80N
 XvAz1LBylH8+Tef3Nwff4HxLPAJW3RM2DkQjqEnDYNMKP/muWgUYG5/MtYI9dwYjcL0U
 KM+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiZLe368upLY3+BAn+Ocitzddej1IuCKndyY/BfsZzXeZxuwBfQvcG/v8YF2DjjB3mpcqu4e1t8OzS2WD6UbCrLXTfyHc59YBWxi3tTDY=
X-Gm-Message-State: AOJu0Yw7vygcXAb12CFOp2Xj+gh82GKmAGUVuAZ6TT9Bwf12Z0ptPr5j
 hamgaGECMXj/dKV/rV7Naz4ZxBKGvbbjx2l+JnWNVnhMYio53hDoY/lqH8JeClAbuaHL9zUZmqS
 hyRLdlA==
X-Google-Smtp-Source: AGHT+IHla9w4nO3B7dEVNjk/GrVJLmE5p9bgfQpi3CbdrF3qLy1ebG1ot0/6yE5bj5K80cEoBCQ6EA==
X-Received: by 2002:a05:6512:3d9e:b0:512:e0a8:39d8 with SMTP id
 k30-20020a0565123d9e00b00512e0a839d8mr1469634lfv.43.1708624638863; 
 Thu, 22 Feb 2024 09:57:18 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180]) by smtp.gmail.com with ESMTPSA id
 p20-20020ac246d4000000b00512d8cecd78sm475934lfo.197.2024.02.22.09.57.18
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 09:57:18 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d2533089f6so569251fa.1
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 09:57:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWbNBNlE1qJTM+Ax23WVvNyLNyG4zf58F6uEf40kYinrG8iYdHC+yPPAEtcH+oXi7qekEjvycG20I0cDOjnybS0oDPdp84gN4KCwXJLAlw=
X-Received: by 2002:a05:6512:3089:b0:512:acf1:6970 with SMTP id
 z9-20020a056512308900b00512acf16970mr11555378lfd.35.1708624617484; Thu, 22
 Feb 2024 09:56:57 -0800 (PST)
MIME-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-3-davidgow@google.com>
 <20240221201008.ez5tu7xvkedtln3o@google.com>
 <CABVgOSn+VxTb5TOmZd82HN04j_ZG9J2G-AoJmdxWG8QDh9xGxg@mail.gmail.com>
 <CAGS_qxoW0v0eM646zLu=SWL1O5UUp5k08SZsQO51gCDx_LnhcQ@mail.gmail.com>
In-Reply-To: <CAGS_qxoW0v0eM646zLu=SWL1O5UUp5k08SZsQO51gCDx_LnhcQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 22 Feb 2024 09:56:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiODww51Kz-TTWn0ka5T8oMtt0AfbO9t0U3iJqfLZO+8w@mail.gmail.com>
Message-ID: <CAHk-=wiODww51Kz-TTWn0ka5T8oMtt0AfbO9t0U3iJqfLZO+8w@mail.gmail.com>
Subject: Re: [PATCH 2/9] lib/cmdline: Fix an invalid format specifier in an
 assertion msg
To: Daniel Latypov <dlatypov@google.com>
Cc: David Gow <davidgow@google.com>, Justin Stitt <justinstitt@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 Rae Moar <rmoar@google.com>, Matthew Auld <matthew.auld@intel.com>, 
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>, 
 Brendan Higgins <brendan.higgins@linux.dev>, Stephen Boyd <sboyd@kernel.org>, 
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 netdev@vger.kernel.org
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

On Thu, 22 Feb 2024 at 09:36, Daniel Latypov <dlatypov@google.com> wrote:
>
> Copying the line for context, it's about `p-r` where
>   p = memchr_inv(&r[1], 0, sizeof(r) - sizeof(r[0]));
> `p-r` should never be negative unless something has gone horribly
> horribly wrong.

Sure it would - if 'p' is NULL.

Of course, then a negative value wouldn't be helpful either, and in
this case that's what the EXPECT_PTR_EQ checking is testing in the
first place, so it's a non-issue.

IOW, in practice clearly the sign should simply not matter here.

I do think that the default case for pointer differences should be
that they are signed, because they *can* be.

Just because of that "default case", unless there's some actual reason
to use '%tu', I think '%td' should be seen as the normal case to use.

That said, just as a quick aside: be careful with pointer differences
in the kernel.

For this particular case, when we're talking about just 'char *', it's
not a big deal, but we've had code where people didn't think about
what it means to do a pointer difference in C, and how it can be often
unnecessarily expensive due to the implied "divide by the size of the
pointed object".

Sometimes it's actually worth writing the code in ways that avoids
pointer differences entirely (which might involve passing around
indexes instead of pointers).

                 Linus
