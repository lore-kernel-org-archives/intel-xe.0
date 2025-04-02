Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B12C28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 16:06:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2703110E821;
	Wed,  2 Apr 2025 16:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JpcpZ3ID";
	dkim-atps=neutral
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778AC10E820
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 16:06:30 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9ebdfso6534894a12.3
 for <intel-xe@lists.freedesktop.org>; Wed, 02 Apr 2025 09:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1743609989; x=1744214789;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=025ywTe8X2oiiTY/KI73kld6gosblZKwh9c0eIC7QAo=;
 b=JpcpZ3IDulNOelRpsOh3/2EWfVuuE1eHzK/dBPToE6QrU/Od9+8x+mxp5EwSipNbEw
 Pv85f3N63V1ORiyo7F83F5abpSvOV995Ropz4lEOEh9WpenMFZ9zRBv4MCyFYyeWiFgM
 VXb8hQ/iRy4+a2oF9WalyR8KhO4K90e75w7Xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743609989; x=1744214789;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=025ywTe8X2oiiTY/KI73kld6gosblZKwh9c0eIC7QAo=;
 b=wufUTB/K40BlDC5cn22xW1DK8NLVpxxRurSD7uwU1YMQpql/desFvAUf66v5dWFudb
 /P+W80gxC82ZwDhi41pdIY6u8ne4o0enpx8t70krfpy3U1YYhjSQRudRy+t2mugeY5yW
 xUV8aeFm7Y4WxxACjl0+fOUXaxdS76DOUYIz0H0q8w7NY+X6PsheSMhD9ZsyqI8+3QCn
 Mx+5Z1zD3qcPRqz4xfw6GEq3hAcHM+PXlI/zLlVOJBQczh2n5F14AJ7hy6KKxR3BJTU3
 TFDOu+dGvOWYjAPKlGGzcUhwVamwXlt5s0olmhCjISl911tBkRCTRjb11hmUCaHvL7mf
 Soxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/XMMJ9EQOmnzTRc/a6gOHP6Vb0Ze9rRM5MhERX9XF8sYauPZVjoj3SOwGZUZ/n07kvoQVtDErBg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywlgw7pgwAUaSo8nheP4Dg1PN1UxPLwsM2A03zeotgpzqoJaywH
 EnYsChZoj4LYup5Vuy2FE/HK68/u4TIUyafarp1mbX6iVyj8Y2Z0x81wcsQdXW8TtIJZjxf6MCN
 0Vcc=
X-Gm-Gg: ASbGnctY47WObeLc8NVzNNKybJCcLkxyLsn0j2GC8FpYStgcn8Bebg+COY9+bVkXgfU
 jD2mc/qOVCGDvpse8QWlsf/v9PRTE/jlcrXG6d+zJk6dHBg0Qic0E3gcLaYyN1kqZ38US+yyBaa
 2hlKckRVjSd3S4OkO9+akLyRr21Ib3gF32M/+APhjkHURva6yHpgZfEngsag0KE0NebfYKE9znm
 Ti2RNqgL+PT4f4ifqICJl0iO1OR/zqx497+EmXOMJVDsNterH0RT1xGhDM5OFv2vPnI0R+XETWG
 8gGWe8QqsBiPwRCU65baUlsT/p8TAM9oemLhC0QgP1y1MKPHPuuzXBW5+/ksoslAcMjvZUBRN+x
 7PFwRsFJIW5TcXDkDfp4=
X-Google-Smtp-Source: AGHT+IGICSBrh2HAvZc9ZziVK/qj0/qPCJQqaBhTufnA9uIm238IYLxJ30cj8E2UTZ3iDCnFJPICkw==
X-Received: by 2002:a17:907:2d0d:b0:ac6:bf3d:bf45 with SMTP id
 a640c23a62f3a-ac738bae661mr1353685166b.36.1743609988692; 
 Wed, 02 Apr 2025 09:06:28 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com.
 [209.85.218.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7196c8281sm946869466b.149.2025.04.02.09.06.27
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 09:06:27 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ac3b12e8518so1321710766b.0
 for <intel-xe@lists.freedesktop.org>; Wed, 02 Apr 2025 09:06:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVZojfKGJtVCiDHvwJHH/B+kuaPMlGkaUiX1Cb8niF5LodjsffS7MCaxXVngus8NoSiL4RBoTWyGw==@lists.freedesktop.org
X-Received: by 2002:a17:906:dc95:b0:ac7:36c2:aed5 with SMTP id
 a640c23a62f3a-ac738a5aa5amr1649611366b.28.1743609986968; Wed, 02 Apr 2025
 09:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250402124656.629226-1-jani.nikula@intel.com>
In-Reply-To: <20250402124656.629226-1-jani.nikula@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Apr 2025 09:06:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=whkpFR93_rX2Wi5bQErH1-bzFXkWZP2wgBGCRgsFQuOhg@mail.gmail.com>
X-Gm-Features: AQ5f1Jqd6jCqv34VGPiVcJowK6E-xTG9BBy-7Ow_2MxO0m2aPE5XhfB34p0FnyE
Message-ID: <CAHk-=whkpFR93_rX2Wi5bQErH1-bzFXkWZP2wgBGCRgsFQuOhg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] kbuild: resurrect generic header check facility
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, linux-kbuild@vger.kernel.org, 
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

On Wed, 2 Apr 2025 at 05:47, Jani Nikula <jani.nikula@intel.com> wrote:
>
> Another go at hiding the turds.

The patches look sane to me.

I didn't _test_ them - because that's not how I roll - but they look
like they would do the right thing and not interfere with my odd TAB
lifestyle (I say "odd", because apparently I'm the only one who lives
and dies by auto-complete, but obviously my way is never really odd.
By definition).

         Linus
