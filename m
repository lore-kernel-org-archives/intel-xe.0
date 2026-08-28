Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AC2C61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 20:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58DE10E036;
	Fri, 28 Aug 2026 20:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="U29mLddq";
	dkim-atps=neutral
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFBF10E036
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 20:32:52 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-c20ce3c118aso270439366b.0
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 13:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1787949171; x=1788553971;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=hE0PEz4igBhCEXznZ2g/8X3IKZpS6yclO4zo8GlxMwE=;
 b=U29mLddquZ7DILYwOFbvMrDO5GaKJ0JPMu+NxkLIrbyomGBHmDZox0dC/OT36pwas8
 KleqCsRtvh5u5i0RIfljI/k0X2amwwNxqsk852kGUJSRDsId8WbJSaK3i3mxHKKYjG/g
 yRwxaDoGXUcY28d7GTfFKWETPsAc5t9mZpM1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787949171; x=1788553971;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=hE0PEz4igBhCEXznZ2g/8X3IKZpS6yclO4zo8GlxMwE=;
 b=b8XCOEN7lsvb7/CaQD4Z88610suw1fbjfvrl7QqvYmS+M+3CC2cLKqrKgM1EnlsJfS
 7RZhhkL3y2HU8aAzAwBQ//szl6V1/jHSYjdsnpqWCGUIu7KcCKFYAPETidM1lPTXLbSu
 l+GXiXE8aunht+r7IpuHfQfb0xPzv0ZrhMhVybYMg8ATODphtaXSb/54a5tPD5ioklOU
 iTTbML0gkke6QUv/GEaSnemnK/gqGE521tRWVKPLM9J+SYGyCSdAYDVk0lLdBOvZhPcJ
 o31TqJchTxMT764bV8YPrhkaJPMmyktXg9hqtnbA3DjfcMLMDdSvoya9a4/wq6EMhMOX
 ES2Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Roh/ePLOqmKY800Ebs4sjdxF+/OW9/Kbz3roivDIB9lCOyn+5b1UOBCBLOPdEyqEcHHSJtXcjRHHw==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nfQYeasxvaL32cYPy3DXI5A4Lm+69ltVsSpDJ4CUccbgrLQL+t
 Fqiu9XyDfsLw0vip9UpINWeYvLxqSUWbPyhuwGU8DMAy6A80ra1uxvIvovglJO1hJmIBvOboIen
 MS3IEDA4=
X-Gm-Gg: AR+sD12FoaA7JvrIY+WssYmDAqL2vsOja6P7yIiVEMBJt+JSbwH336EwmFnOFdSfK77
 yzUhIa9asc/DFeNzX9snL92AxSKrzeVzFcj19L/qmdLOHlDa7UrDYYf8Cwvp/cYW4naE0IYHM2r
 XhaOnRLgCK4wg0U+MOqmKAE7RQWg6dcbsgnN6whhziVVqosNl1++nGxx71yGInTEaqMQqK+kGuy
 A3hUh5Yycag6o4SsYVTsE0zZh4pW51aggFZfsd5T478RME3+XDmlgxYmaB71EYdCZVbsE7K5dFk
 lRxDjfQQigaDvTzB/0mGJKTkaWMJ1rY0MJAiiS+kmxeFsFUNdLONJSV7r2TrBCa97eOq6T8wq6Q
 2w5fWBYVk57PsU6ZeMvsrSJAT9hSQoXb2ayjPJmhrbxfQP8wPP2TKrkRJlNQneRja3u8PmZKxCR
 HhvvIZWwmByZhqk175+t48GYbqgv4T9blXQ1zb01hVaf5GqJS8MrHyn1F2tUC68nDg1wgFLnvp+
 ddW37ZLTavpaur5PL9YupZlfHLWkEfTqYcYaQ==
X-Received: by 2002:a17:907:934b:b0:c20:7cb0:f33c with SMTP id
 a640c23a62f3a-c253614e259mr1096737766b.16.1787949170774; 
 Fri, 28 Aug 2026 13:32:50 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com.
 [209.85.218.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c255ee28677sm127451966b.21.2026.08.28.13.32.48
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 13:32:48 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-c169ae1cb26so524491766b.1
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 13:32:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RrkEdVE0L8twRcEH0qTvUNNnI1NsUOmVXVC30wtmB9JLJ5SC+Hbxd0m0ai409krdKnlL4buY12wGA==@lists.freedesktop.org
X-Received: by 2002:a17:907:9b8d:b0:c25:5081:a9f7 with SMTP id
 a640c23a62f3a-c255081ace9mr817021266b.14.1787949167809; Fri, 28 Aug 2026
 13:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260828151405.662533-7-matthew.auld@intel.com>
 <20260828151405.662533-12-matthew.auld@intel.com>
 <CAHk-=wg4W6rPEb_gEJVUSuOkhv32NDfXo2=V9gNGL_ACz3PQ1A@mail.gmail.com>
 <apHoVwMsJtrSDIVb@gsse-cloud1.jf.intel.com>
In-Reply-To: <apHoVwMsJtrSDIVb@gsse-cloud1.jf.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 28 Aug 2026 13:32:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgfOhJwVoe_5AZ5LYRG-hTmBZiBh1EydqCn2qjTakRWow@mail.gmail.com>
X-Gm-Features: AcwNN1W_hxt0OAM3B18tXJ31i1FgKn1H_A0cyM7vqhzmMT5zA2B9VnUxGd4GFGQ
Message-ID: <CAHk-=wgfOhJwVoe_5AZ5LYRG-hTmBZiBh1EydqCn2qjTakRWow@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/xe/vram: add early VRAM health check
To: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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

On Fri, 28 Aug 2026 at 12:58, Matthew Brost <matthew.brost@intel.com> wrote:
>
> I think it's OK to go ahead with backporting your patch to stable. I had
> an open question about whether we wanted to implement the fix slightly
> differently to avoid asserts triggering elsewhere in the code [1]

Hmm. That patch is odd.

It says

 "When VRAM limit (usable_size) is no longer 2M aligned (e.g. because flat
  CCS storage size rounds it down to 4K)," [...]

but that was never true, even before my fix. The usable size was
either 64kB aligned or 128kB aligned - it has *never* been 2M aligned
as far as I can tell.

Now, obviously, if alignment never did anything at all (because CCS
was already completely aligned), then that 2M alignment could be true.

So maybe the 2M alignment existed in practice, but it was certainly
never guaranteed by any code, and any 2M assumptions were completely
bogus long before my fix as far as I can tell.

But that commit is odd in another way: it changes the  code to do
something completely different.

Before, it didn't use "usable_size" at all, it used thje *actual*
physical size. Which really *was* 2M aligned, becuase I don't think
Intel has ever sold any other configurations than 16/24/64GB of
memory.

So I don't think [1] actually exposes anything in my fix and I think
the whole 2M limit wrt that code is actually an entirely separate
issue.

But I admittedly *really* don't know this hardware very well at all.

But yes, this kind of "my fix exposed *another* bug" was why I was
worried about backporting it without further testing.

              Linus
