Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A671BC369A1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 19:48:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DED10E72A;
	Tue,  8 Apr 2025 19:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eo7BURHk";
	dkim-atps=neutral
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E075B10E72F
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Apr 2025 19:48:33 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5ec9d24acfbso83959a12.0
 for <intel-xe@lists.freedesktop.org>; Tue, 08 Apr 2025 12:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1744141712; x=1744746512;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zL/uwXeWfg7A6QPOJUAVWLRzIe3+HicAR6S1WGa4/4A=;
 b=eo7BURHkUjmrQZ3VmiKAh6Z8KXy25KLlBU+kfkrBV6U6g64XkoaDtf+3nfSvBK9DBQ
 DlxnM+obDUJukvgn+pfvkXSjF9NN7oGNsYjhZ5NOV3F3pagxUU07tKb0PaYXjtMyUqrj
 Ce7t4jBsEgo33aSscezA0a0LMsIVmAho4DlqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744141712; x=1744746512;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zL/uwXeWfg7A6QPOJUAVWLRzIe3+HicAR6S1WGa4/4A=;
 b=Hip8qgFEf6+kDZtxMd7bJxvshIjSGJyfWVa66yzkDWuYI8mXrjGU91gX+KC8GsF164
 urM0u72weE596JO0RQkLv27Gv+LE5krnkc7uN+8odfAJDohCPMDnMoZDaSdwxzU07uSe
 2h2+8N1neCKPRkYZU2ooU+6xS5mGGourFW6WwxtKV1lqQ+va+a2fWtGbnAEgXG+/ZMUW
 jksuxHI9HhpFmBoflLDjlXJKECf/r2NoYRKq2P7XvkRUU17bhrRDq2EdZgm1N893PP9b
 p0UB4fKyP5VAOdC8DrPKaulAoIzfgxTKvMTq8gK76mghTmAfHztYn5H0SQkGHUg3lmUv
 aX1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZBh9WVBFF2iQAcMFwNW2B3cO/YC8RrMowkmN/hq/miW+EgpN+3ZLkoPmWNLT+PO7jG5wXSiv7Fg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx58dEblMqfCQVwd97Tmn1mEhfnZ5J873Gwxe6TMzUQta6z4etY
 yjyFmXJ3JLKi6zQV6f/26gClpnK30NM4FumyiHbqGdG/iGlUCmNYuLtzyY9BtNUk/gsWra2Rbh4
 /WG8=
X-Gm-Gg: ASbGnctwvMqMj/vYTaxwrd5ID5Mgo5NRcCAMJ+am2OT2JpO9Ed+wbtwegGaUn4gsIrc
 mBkuwdxCScOQZkahovSlqQQrz7TvmGCUegozPenBG5CmVwznz/Q1zHGkRH9+gshS10/pSvhoiXo
 VT4pwYfQEF8UPSK6MVyEM4PCdXZ3xhVR+17TJZNdvU5Xp2C4W2NoZn7rYgAXSzkWqITa58sOU7q
 7ySGZnA/NX4bRVKWL9MwGdKgTIft5ffNIS7YKROMxy7yD/9tmFUs45o8W09AV5D3qKsxHOk3zOP
 /VqKPvvaWu9NmYoY4g/sodF9bj4r12P81oIJhgi4NAgTeHrk2KmU+nWO5N/V9sBsX9VxlXL+ZX6
 NjQ3hJ4Ywkvzvj8uivObSEjzyAzAUow==
X-Google-Smtp-Source: AGHT+IH36U722zX4ne5SBmgAJpef26PZirQtXKM04YZHTW1G1GiDYYuj9Q0aRAKCRHLMPSQW4xprkw==
X-Received: by 2002:a17:906:6a26:b0:ac7:e4b5:4827 with SMTP id
 a640c23a62f3a-ac81a879165mr583786666b.28.1744141711945; 
 Tue, 08 Apr 2025 12:48:31 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7bfe5d794sm981133766b.11.2025.04.08.12.48.30
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 12:48:30 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ac2aeada833so9217266b.0
 for <intel-xe@lists.freedesktop.org>; Tue, 08 Apr 2025 12:48:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUo/MEEilxTO36quZXSNf095B+R8H3ddLZhJdeCsgOfb7PTcio551ZIi3F7kUAoatyaMeNEocEfZg==@lists.freedesktop.org
X-Received: by 2002:a17:906:6a06:b0:ac7:3929:25f9 with SMTP id
 a640c23a62f3a-ac81a87912bmr311971566b.29.1744141709943; Tue, 08 Apr 2025
 12:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250402124656.629226-1-jani.nikula@intel.com>
 <CAK7LNAS6o_66bUB6-qj6NnaTRNKvu5ycxOP+kGfizYVBNjZAyw@mail.gmail.com>
 <878qoczbhn.fsf@intel.com> <20250407171209.GJ1557073@nvidia.com>
 <871pu3ys4x.fsf@intel.com>
In-Reply-To: <871pu3ys4x.fsf@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 8 Apr 2025 12:48:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgXb5ZVd+=b49957gm2Uo58h8EHBX5_mZfX4R_MJFqd0w@mail.gmail.com>
X-Gm-Features: ATxdqUEdLh_PIaVo8IEhaJ-xWVSdvij9xBxWmcQMsdyDiXQo9KjbMpRmjfCGH_0
Message-ID: <CAHk-=wgXb5ZVd+=b49957gm2Uo58h8EHBX5_mZfX4R_MJFqd0w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] kbuild: resurrect generic header check facility
To: Jani Nikula <jani.nikula@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 linux-kbuild@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org
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

On Tue, 8 Apr 2025 at 01:28, Jani Nikula <jani.nikula@intel.com> wrote:
>
> Your goal may be to make everything self-contained, but AFAICS there is
> no agreement on that goal.

Yeah, absolutely not.

I'm not interested in making some general rule that all headers should
be self-contained.

We already have some fairly obvious and clear exceptions to that, in
how some headers are special and get included early on and headers are
*not* supposed to include them themselves (ie things like
compiler-version.h and kconfig.h)

And while those are *really* special and end up being done
automatically by our compiler flags, they are by no means the only
special cases.

Quite a *lot* of our headers have things like

    # error "Please do not include this file directly."

because those headers are literally *designed* to not be
self-sufficient. And that is absolutely not a mistake. These are
headers that are meant to be included in very specific situations by
specific other header files.

So no. The whole "everything is going to be self-contained" is simply
not going to happen. It's not even worth discussing. It's a
no-starter, and limits our header file design much too much.

Honestly, I think the whole "headers have to be self-contained in
general" thing is a mistake. But I think it's fine for people to mark
their "generic" headers for some kind of checking.

I think it's a bad bad idea to make it a rule, though.

              Linus
