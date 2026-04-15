Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A67F43858
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 16:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAA810E24C;
	Wed, 15 Apr 2026 16:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LW9TohWP";
	dkim-atps=neutral
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED03210E24C
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 16:41:16 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-6720c7968e4so3563504a12.0
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 09:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1776271275; x=1776876075;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y7Lb39tX80cyqh4EoAouwl4tDKxTNBcVjFCL5GxqOEY=;
 b=LW9TohWP/DstWBTR4GKNbo91+AsuljF+5crXxPrQgKfMY2Xg8yfRBs9PBArEgSlmMg
 aUSaD2o5MI2ozRTJJuZXoR2+GNvGoQa/Oo5BvV9eBzp8XzbzlpqanGmfa0ZAtoqrhURn
 ZWN3A8YnB61Cezf8UtpjzknRP3VU8W/79884c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776271275; x=1776876075;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y7Lb39tX80cyqh4EoAouwl4tDKxTNBcVjFCL5GxqOEY=;
 b=Wc1lPq3lb2DBqOtgHsROvkFueA+gbkXutbMIdimPcgPCeuXeYdpfYl6MLLjcWx1EAb
 hHEMjB95DlfpKvMoaFAcuprnhJ/3Pw1sGvI38+El+p89V3dFhUeHa0+Hs4h9Ql0Dmf85
 n69uIOokZQTt5xoTJ7QS0WbETg73n7GeEiNz55xu8G41xsVw41B0+/2kfmdv5zfcALmp
 KzDQzuYInFL9xTNGOEUNogUCZodHL7jfkrcasiiR5p/LgDbWXaNmlaD+YGBYCBcGcmMJ
 m+zEAtgnuKXnDTcAzhdyLQPihMt/JoZWvaISOL7WLLzsFsM2jGqi2wokF72X8yXY464k
 DwAQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8bXTQvItzggkysVKEaYzzT54lx++3sJHevCNDRXmShpn6jVPcok5xrVt/lRfSKLf035nVqvnriMQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXlZp3z94BHA5KwoJmgMwfShbCzzk0n3KGZtAHoT8aRz+sjUL7
 mqE8oh2y4gkGN4s2eb84hk7FSELvJys2WVyXQ4rhrXOhc9a5AYbK21CiQL2DXPKKpSBx7EX2faD
 5g+U8dlE=
X-Gm-Gg: AeBDiestXtVhtGLiJlHMaQ9trS4h98Om8vHPIauegbDC5cIrjua+C5eN6uGhlJh7b5C
 j0trWhS0AQFNsO7/YEDhb0FBwOsSLQY9fdmfz74MwpAj3nqrjmtibyhYT4PZ5Pzz4bMfS1jVTl4
 sfFVPpk/04k1VM1+2UiDFSoCMdCxcq6gfCop952syf9B/AG+sPR4Qwh7CKn3wvT1QUYM31f4BB7
 SgQdEDDsqsYEbX6idJNDA4YzdcbmxRkLlOq2naiTWtOdDCMeHjXlbjl5EQLg51Qgfh5q/XmTP+s
 ROfJRaOKAiKZRWRmfYVdS2PdoiP8F0cPzYiGCG2g8VWPn7Olll01oz/VuTlXHs5Zx3AV0EJdCQV
 kKmCxxlYlPVkJJTf6IW8SYdx6/p9VNDKAjDYJIYEm6oM+8JaBd2GPMLhmxepUn6ufLborVPjymp
 OK6NnXdZnHYUdL1HI79XlRs5DHKu/WDgSPhyvwY3GimyANitvR3yqtaBsyRlm+z62GSdUywI7Qf
 duOxz3aajE=
X-Received: by 2002:a05:6402:342:b0:66b:f529:e7c with SMTP id
 4fb4d7f45d1cf-6727106f2f5mr117563a12.4.1776271275319; 
 Wed, 15 Apr 2026 09:41:15 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6723800edcbsm565593a12.30.2026.04.15.09.41.13
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2026 09:41:14 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6720c7968e4so3563415a12.0
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 09:41:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ/3v0iDXFU+vIR00/rmU0qgzo3lW1AfWNPKenLL+G+UU0woaZZI2maTYGCfjAKDHdC1MnIRDU+X+g==@lists.freedesktop.org
X-Received: by 2002:aa7:d88c:0:b0:66f:76c8:f747 with SMTP id
 4fb4d7f45d1cf-672711c49b4mr83740a12.6.1776271272830; Wed, 15 Apr 2026
 09:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <d69501d53c233386d70ed10290af24aafebf434f@intel.com>
 <CAHk-=wiAGevirr3=xC=u5_kN+m63JtjqA0C9NJLrd5PGrM0suw@mail.gmail.com>
In-Reply-To: <CAHk-=wiAGevirr3=xC=u5_kN+m63JtjqA0C9NJLrd5PGrM0suw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 Apr 2026 09:40:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjmTh4ESQE7ntR=ddF5JBToNerf4Dzt2zQQ2-Y3OEre-A@mail.gmail.com>
X-Gm-Features: AQROBzAzrmt1r9Lcsx11hYqA7ZFPDheNDl4Usu75n-ImSxQhTSjJgoByqAuzn5w
Message-ID: <CAHk-=wjmTh4ESQE7ntR=ddF5JBToNerf4Dzt2zQQ2-Y3OEre-A@mail.gmail.com>
Subject: Re: [PULL] topic/pipe-reorder for drm-intel-next and possibly v7.1-rc1
To: Jani Nikula <jani.nikula@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dim-tools@lists.freedesktop.org, 
 Ville Syrjala <ville.syrjala@linux.intel.com>
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

On Wed, 15 Apr 2026 at 09:28, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I guess I'll test it just to verify, but if this fixes that known
> issue I'm all for getting this fixed sooner rather than later.

Well, that was easy enough. I assume this was expected, but I can
indeed verify that that branch works for me as a replacement for (two
versions) of the local patch I have been running for the last six
months or so.

And maybe I'm the only person on the planet that runs this setup, but
it gets an ack from me. So I'm ok with a late pull as a fix, but
somebody who can better judge the risks for other setups should
eventually make the judgement call.

                Linus
