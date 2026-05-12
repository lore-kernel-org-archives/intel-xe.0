Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5952ECD4851
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 15:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E3510E036;
	Tue, 12 May 2026 15:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NPrzns29";
	dkim-atps=neutral
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EB810E2A5
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 15:29:36 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-38be5e86918so71419091fa.3
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 08:29:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778599775; cv=none;
 d=google.com; s=arc-20240605;
 b=g5QIcvkoIZDwjTo+yZTPxTsibuP/xB5DQmr3v3cul2VkqQhagQESA9PvrQmi/LxDy3
 6r62YDHwTtqvnsb9RapS+QWTBEXEBH0HC/+QrcrG3hha2hfEcJL0V/LE01bgaFk3YO3b
 JIu3PhMWhrZvMdBwtbE8FrlH0DvAOlrUMOaLPgv6t+ORWUUiL25Ob/MyHRtWa1e6iB4V
 rqp4jEO5s0T1y0C3Gr6pyYrSLp1BNYSJcYditTB7minXNX7Lfyjjz1oAr9Kpajnb5n/W
 xG3gN0F+KZo4/x/afMa6iw45DZ261RWSXQNbmOmv1Pvllkrpv21NdXI6CvAh4BjkF2/h
 dShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1m8Vx7sSpkFzoMEAPBBuv0g6bgC7CqPm0P/FXD5R46g=;
 fh=OWViUMHvxKAEDmJdITs/mKXa3Rq43kQETPSx0DTIYLk=;
 b=RdNHO6aq6a3gQVSnKsEPFBag4WLJvJeWmdAHDF9JsQpBA/b0wyjTsZCSc8jnWeRomZ
 TZwbwcIY0L/Vp0GeYI1E/+dtVk5+Xyd91Dony1Si0pF3YQOv4lO327lA96F7WIpUHWGT
 N6L21agX7octua712kQsi7OIF5b27vCwK5yH8IX6QntI3PAvPvI5tUIYT+EoGfi5r6Gn
 RQ0+cemZzyedKeQCjc1gNB++eE19B9x7BA66H7EgPy59YQKX1uneCyWYhljHGzbdAJJ4
 jGFuvKPlOrr550Rk85hdCWq2y+6CVcNnBJdqnl2m8ERmk7ChpW0Xl5Z5jQfnxSuOc9Qy
 N+/g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778599775; x=1779204575; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1m8Vx7sSpkFzoMEAPBBuv0g6bgC7CqPm0P/FXD5R46g=;
 b=NPrzns29sqKuxsm6ZI07hSK3sz3ywbqAK6Ov9zMTBC9wvh97idFtBg5HYDPTLmfEjl
 7Ycj87UiwE9Kz8Vpq3AqKIzZgShxmk2XT5PS5mTYKqrNo3iBKtQ+h0GB3tKE+qRuRR+m
 ZajwkOwV8fpHJnzAHiIeBNfX2MIQ2Y9F5BvN0hgAysPBjLfKZMDchoSyBq5lpWk6Za7u
 tEOYYRDVWquGmZfGVe8QpwtQvHLsRMM658vczt4VVV92rfD3xKJjr74+wTNzsAJV9g4g
 sYrYBvmDSPzXdEaWIHtYPIfYGRIfZ+Ygznadad/B0IPccI3/K5eyKHu9VX1TUeZECFYJ
 FVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778599775; x=1779204575;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1m8Vx7sSpkFzoMEAPBBuv0g6bgC7CqPm0P/FXD5R46g=;
 b=SGO7fWvWVx2uKNFY/QzZFgiYi0B9S5Ece+D1R1qHRam9LIRobYz82IclnyZPDHju4T
 zdAG4u9BAl/dqV4nMYyQijNOJBGrMfKbpXUUlirJuN7Q9ljFfbobvlVuZJc+drWlMpjg
 LeNdYDZb2nz2IO5nS/KUBcsDr9zS/6LuTkPvRAQbmFFznp1FmvoHFg+VjADReXMkYt3j
 /PIAFIQ7xfB9lqKaaX+I3IOgg/mZvBwJrGFOOyGXmbNHcZw6MGGiDegrAG0JtLM226BD
 BcL7mVl5lE/tTgm2EonrvN7Dy0xw0o0SxU1TGI1rmC61FkcN2yEOHUMvwYgJ00u+5JcM
 QE4Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8O3JmqqByKl4WbLdmATqjOLA2KLVLatvceEQMbHVtmjpktGIMEPsRLT2GHxwiFFjLM6+qYfr8Esg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypyhFOcNnPaVoAldqbcLSCpzAtXG+I0ag6ria6RLZht7F0U+xe
 5RFFYf8va2mAkHCIe6G7NxeetEEe8t2qUlezd/LkWdLkkk1XXxkXM42+GbHo/hzfBVYxGpsWHsu
 BXwBiAwthfRqE15e5Cf1AMIcv9zhNgyQ=
X-Gm-Gg: Acq92OF5OCXTRP/KszttU97fR4T7PRH4vYtp625yxjqo1L50J2jzfXkuSMvv9zsr/sp
 swpV5nSXzufOlA04lv8TZuxNtAL5tcirTNtyvLiEFG64Q3TuqnOr92efijow5Vy1A9j2czpZVdA
 CYtjgWOlR0sZl1VKOM1FDc9MG1V7G8htlN7zlAVWVb5wHrfoML6s1Ou0uSnigeOYYgy1pO1EUT1
 buFjJSdk7PVv0Dg7bDen2xtdEgA+n2jPr9FamxtqzzEG/BhNMr53oUZJ3tPpL23SXlD6V4MSWKo
 K1PWimGjY5nnltAjz0uqVDzsk5C+8Dlfbt1VkEadI2TaIBkyltsW1JnlSbHOcWE4p0ACvYxZXRr
 5rbmVKhIMONMdSDr19g==
X-Received: by 2002:a2e:bc28:0:b0:394:2b8a:234a with SMTP id
 38308e7fff4ca-3942b8a5e7fmr31619441fa.25.1778599775037; Tue, 12 May 2026
 08:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
 <20260512-swnode-remove-on-dev-unreg-v5-6-0035eff63812@oss.qualcomm.com>
In-Reply-To: <20260512-swnode-remove-on-dev-unreg-v5-6-0035eff63812@oss.qualcomm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 18:28:58 +0300
X-Gm-Features: AVHnY4L1_zJHNRi354c-jkblkHr8hmHJHYehCTnWbdMU5vf_KkUdHclsjlbuBjY
Message-ID: <CAHp75VcdbpY+DfFh6b61U61X6or0KoVs_akygnAgW27XmmXo2Q@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] kunit: provide kunit_software_node_register()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, brgl@kernel.org, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, platform-driver-x86@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Tue, May 12, 2026 at 3:00=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Implement a helper for registering kunit test-managed software nodes.

...

> @@ -10,7 +10,8 @@ kunit-objs +=3D                         test.o \
>                                         executor.o \
>                                         attributes.o \
>                                         device.o \
> -                                       platform.o
> +                                       platform.o \
> +                                       fwnode.o

You may put it after device.o, 1 line less to change.

--=20
With Best Regards,
Andy Shevchenko
