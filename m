Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8358E77184
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 01:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F04910E822;
	Tue, 17 Dec 2024 01:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YUYdKOBc";
	dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAB610E81B
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 01:08:34 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa1e6ecd353so635890466b.1
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Dec 2024 17:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1734397713; x=1735002513;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=x5HbsH3y11AUtX77RP9ShUJxU46vkQ8YNLD+VoIrduA=;
 b=YUYdKOBcd9WVBHXGzuPY6kcXglLhIBYTshE17la0/mdq4SqcHtHkl8KVcBhBVWupvq
 Rv+Y3CPYnRzc0bMdvSMT2489CI7sx8WD09dgIqzd3vfiILaxJZKwxNRYGDtOvJquIlu2
 oHTgWe14CURB78kZ8YMeyvQ+7dmThPGrVsxRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734397713; x=1735002513;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x5HbsH3y11AUtX77RP9ShUJxU46vkQ8YNLD+VoIrduA=;
 b=S8L1VvOBU7N2A4GBFrEcH4xDHTLzqXa/ijxP1M3mIXISu9PeWD6ssOlIQliWfQp710
 M8PQCzmkDiR6+tJDID1X008ZuSGPo77hCqq2i7GZrIO8GYPZUJZfRSZqXJMu8nO0maQj
 oCddP5oT4DdDWF2sb9sBjX3G65WGbBrPrw4TXa+3zZt44/DrvKY/Hf15CvYaDB9Y85IU
 PpKbJ6pKyCjgq5a3PBwd5NvZpXX8lzylP2u6NvNdqqIj2hDibSVQ8ba4QxVJyS7d82Ly
 vDeHRvm9KL8DwDiFASNpviWt/Tce1GkbAeIGiZw95kTlgVmrqFCK0hsc84qBA4O+gC+G
 hsWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLcaY3cHJEqMfggbMhXD7Udrakp+hes29VQThq1fWyBv4rV8DJumkePoQDuaaSP8GoJJqBn/7qLg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2QSdgMc17jeLkWYAn7jjIcK8U5wuT0fFt637zJq/tW/RhBIMJ
 gQmN99JStP1QRZVBQBJs1lrxRUZWAm/rt+dCkTAvhxfWKlnIeTjvAEQ0iiUiTcbqCwdF35bGFRS
 qrDw=
X-Gm-Gg: ASbGncvFa0h2Uvr3/Czu96+0+3MNovdFqv3H22wKIHU/QEyJL67IWfZHbzYczd1xWxT
 56AoQrs1BGFlqwePpahF/Z7Wy1SIfSSPgXA8vfSvmrmxwUuhmxTK+Xj3q4/NBMHgypB8eW5Sxmd
 AnNIBobCpnuG1wY9ZGSZI91T8LVJTa/sJqWPGptQiJO5ZlY7awBWEdAXDXzpPKfIJDOncWLPjp9
 tA1dg6P2EjD/aSKQB28953+CLYoQa7+vzC4mDMFOn1h4zsOygPF7IdKY9fJA0xboBTBiJgnPFVX
 UPFVh2xHw/g2+OFgYt/8Zz/5PGNiLqA=
X-Google-Smtp-Source: AGHT+IFwtU+vPsASkq09UmJzbnt8AIbkNas8zWuiVbF4Vysf3YGUJdnE0E5GmEBUBSS5bMc+QAkcEg==
X-Received: by 2002:a05:6402:5189:b0:5d3:da65:ff26 with SMTP id
 4fb4d7f45d1cf-5d63c4078d7mr30391704a12.31.1734397712668; 
 Mon, 16 Dec 2024 17:08:32 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab96006456sm383674466b.31.2024.12.16.17.08.30
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 17:08:31 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5d3f249f3b2so6746962a12.3
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Dec 2024 17:08:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXUxsaF+cjuCdVJs3PyZLlzJqqsBP0zwmNvOdqT5Do2/xPYIPbd9WlJBOsyoT6gJjo3G4kU4HXykw==@lists.freedesktop.org
X-Received: by 2002:a05:6402:27d4:b0:5d0:d91d:c197 with SMTP id
 4fb4d7f45d1cf-5d63c3db906mr36599487a12.27.1734397709817; Mon, 16 Dec 2024
 17:08:29 -0800 (PST)
MIME-Version: 1.0
References: <20241213054610.55843-1-laoar.shao@gmail.com>
 <20241213054610.55843-6-laoar.shao@gmail.com>
In-Reply-To: <20241213054610.55843-6-laoar.shao@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Dec 2024 17:08:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj=W-4Eu=g83QPUDB+thtL=uY=_1OAVRvXJP=zay+K4Qg@mail.gmail.com>
Message-ID: <CAHk-=wj=W-4Eu=g83QPUDB+thtL=uY=_1OAVRvXJP=zay+K4Qg@mail.gmail.com>
Subject: Re: [PATCH 5/7] security: Replace get_task_comm() with %pTN
To: Yafang Shao <laoar.shao@gmail.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
 linux-security-module@vger.kernel.org, x86@kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-wireless@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 ocfs2-devel@lists.linux.dev, Kees Cook <kees@kernel.org>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>
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

On Thu, 12 Dec 2024 at 21:47, Yafang Shao <laoar.shao@gmail.com> wrote:
>
> Since task->comm is guaranteed to be NUL-terminated, we can print it
> directly without the need to copy it into a separate buffer.

So i think we should do the "without copying into a separate buffer"
part of this series, but I do think we should just accept "%s" and
"task->comm".

IOW - getting rid of get_task_comm() is good.

But the "%pTN" pointer format ends up being unnecessary.

          Linus
