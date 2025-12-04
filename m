Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55069D2A532
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 20:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B91110E9CC;
	Thu,  4 Dec 2025 20:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Q09GJ1kU";
	dkim-atps=neutral
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B7710E9C2
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 20:41:41 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b770f4accc0so182345066b.1
 for <intel-xe@lists.freedesktop.org>; Thu, 04 Dec 2025 12:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1764880900; x=1765485700;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vRT4yUYSE3WGP0484rye1MMCnwhxSgmVhOyhfsSMpY=;
 b=Q09GJ1kUwJPpjsIVZqT3xPMBg4VUGZvV35N4vqVUuLPk00Gl5AkT4+OkgyWmNcVVqO
 HhTI/9XDJnL8Zo/bDoHbLqDyI1XN6s0Vh1k3AJb5oe1ptHpCLC3Aa25xsshl9rf/0CQ+
 w6w6bLH5dfFGEHQR0CBsMfqZOc1eF3yM/qtB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764880900; x=1765485700;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8vRT4yUYSE3WGP0484rye1MMCnwhxSgmVhOyhfsSMpY=;
 b=VQwzBUu0oKvGiIxjMNLlVLEZjkVsuLUHYv4/0qyXKxi1g9kqxWfThdoHSZgJUMOV6c
 lR24Xc7fnTwOgg+dcnxntHgTYwEN+0joA1S0A0IrQc/aHiiBlJGiHPQ/ot27dMgT627X
 yf8UwlG2sdq4E5AHlTiGh+zCtn4MvfcyMs36ZttWbYd9AT5Z9aNS40Atup4bPolYCU1w
 SbWis+9xEvjbjfqr5SVR4YEIihLg6TTNYsz5zTYYlpkc47qgdGd6Q1Qw1U2Yvq+7f3SH
 Fx0Ijza4nzBBBhQLp0lSonCVFpLKJIMaeLyjmA1CLGdp5nyLc+dUmaGupRm78IvAl8gS
 +gkg==
X-Gm-Message-State: AOJu0YzLz6CZhSZN3lna+j4qqzsxjQH5xs/PfWnW+m7nD8ZpKR74F235
 b7mTFjD4zwNpLCazq3MBR7G5d6wrY+aUJ9tYv0ZRNDmPazWLekaeDuZDPyHR1TxmbWWv10rMUMl
 aZXDf88Q=
X-Gm-Gg: ASbGncsgCi6fLROhbGRbDSZQO5NQvHzDm/eQEj7qBpqzx8q1LgUh0vCOtUM3RvsJI5J
 bFe9EGTRJx3XJLjGZg3nbrQBjfplmMORb4U2TtuZugGvZ+az3KGQFZus5QsUdTxt+4FP6hC5MFj
 PPggtyclD7p+lUGXBcgiOVFsTyMbknSMXSQ17IoKCvC4pSv5Eu5ExreSWa6NqobO7OPtRXosH1F
 kV78j1RCGoKuTVnRTG54sDkVfrlKJvprvImJiAz3GpYx9QTn/D08CnR1Au8XwsPtw4aDzCbQ21y
 hAZmx1eKd+OLJgk4/YiAenhH9LoFhg2Uvnn+i7wepzb7vLLVv770FGaVH89Yox7zjufy9A+4R+3
 XJnCy33WV2591aUojZin4RawPft6HTMPQyb3N0OYO/2Po7AKA345VB7A1H+iXf/6FPd76nQDAgl
 FIB5GNtIMfa8o2yxjQi/wlW8QxDoDyJOZ4Bs4YxU4N3KqpMDMgCu004fyOwZ2l
X-Google-Smtp-Source: AGHT+IGAdZH+wGpLQXdCmYLSjFnGrD5KlEjdsS2BoWj0UgCMkKmvTzjSlZmEsMxhyDuwJH/Os5g+JQ==
X-Received: by 2002:a17:906:4fc9:b0:b73:2a77:3128 with SMTP id
 a640c23a62f3a-b79ec4882e0mr427909566b.27.1764880900219; 
 Thu, 04 Dec 2025 12:41:40 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b4121f07sm2010232a12.28.2025.12.04.12.41.39
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 12:41:39 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-64312565c10so2234769a12.2
 for <intel-xe@lists.freedesktop.org>; Thu, 04 Dec 2025 12:41:39 -0800 (PST)
X-Received: by 2002:a05:6402:4403:b0:647:7a35:a7d5 with SMTP id
 4fb4d7f45d1cf-647abddda6fmr3395006a12.25.1764880898829; Thu, 04 Dec 2025
 12:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20251204202059.326605-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251204202059.326605-1-thomas.hellstrom@linux.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 Dec 2025 12:41:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=wja02iemw40Sn4Vio6b1-rr3idFBcUrOV+=vodhOmZZ=Q@mail.gmail.com>
X-Gm-Features: AWmQ_bmsz5TwQKSOV0Tls4iAlodXezQEqhtGPAxjbhq22DkUz4OOpxtAMlQ8eLg
Message-ID: <CAHk-=wja02iemw40Sn4Vio6b1-rr3idFBcUrOV+=vodhOmZZ=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/xe: Fix duplicated put due to merge resolution
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Dave Airlie <airlied@redhat.com>
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

On Thu, 4 Dec 2025 at 12:21, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> An incorrect backmerge resolution resulted in an
> incorrect duplicate put. Fix.

Ack. I can confirm that this seems to fix the issue for me. Thanks for
the quick response.

Should I just apply it directly?

           Linus
