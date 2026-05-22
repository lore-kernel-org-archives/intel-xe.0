Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CC2CD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 19:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374D210E294;
	Fri, 22 May 2026 19:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QSxj5RKT";
	dkim-atps=neutral
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD55F10E2F8
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 19:05:54 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-676a89de629so12630050a12.1
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 12:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1779476753; x=1780081553;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8rBvsudGZR8H0khov1rpw2Hp8pJzILtOJ6oXxT/Ivh0=;
 b=QSxj5RKTGml9B7WtFBdo3jXAZcNZ255umknz/VSWa8qp+V2bol0qTD66axhUYApHsN
 TaPWoUwPU/o5zkY1Rp8wT2TUg//iyL7oHNUHFSfHLYOZSoviqrjGpc/SQN6UIH3JvgeL
 mDceyVva//YAv0Q51qU/lrSg0FAzM2LwVKssI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779476753; x=1780081553;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8rBvsudGZR8H0khov1rpw2Hp8pJzILtOJ6oXxT/Ivh0=;
 b=Z6Ed4sKAB6XtVHZZoelJW7I+czzuIul7nsddzyQsr1OV9Bma5yushJMUBzxZJfl3j2
 8MJRze1VqR1WpBnk+Dy44bN96AY+jN1nQk3a0GxmBV+MZ3ygnpwIB9Jxw2FmjW55LlAa
 V+7hC1ZgCNBEfxgrKthdkn/mli251I3y1QiwaCjACXCwJ274iba8oC8P0ogUC2oNvwHv
 r6CmsvSMrjAyex5Gwc91xXd2w+4kAJkl59Fhxiud1uxCMysZS+MJLE8KrpOaVpAyB1Kh
 /pttmy/imDomqbUkLmOVHxxykQmpGQbMhjXJFZbWZVGZehdAmBJM6DrxsBz7weHyuSyL
 qsdQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/AYgcGWlDsdgFDssdP15uIZ9YLXKN5U/tJkHi/06cJUSQzi7tMtK4RWUqwulSq+o9KQuHIumNZRQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzobUfnkCzTre4cbY5J06f0/z2P0tAuyWiuktBvFj8SQoMi+cWH
 jB98vFu06IMbfrgXqasgZFYrJh1QKMVPJGrplCGrK+EmYxaphNbndIkqLQT+Ti4vV9xYwspg+8O
 nni7LxV8=
X-Gm-Gg: Acq92OFBctH9oeZGDY+EwM8Xm4DzvBM2wdaYZ141QQ9X4D5Bte4E/Ia1IxjOwVdQ8B6
 GnrkVWfTxOHiM91ED1FJCt1OykdxeHwxxL0ZM/K2CN9OYBopD5f833+RfNJT9r0ah9MzMR2sUwo
 CY8pfYPu1dJSUtD4kN161AUWHAjCEHPkD79ZdP/BDalznxI0p5LmJvnWltzTIFOhCdp6yZYmg/M
 YArnGsdyOpqAUe5x+udCMk8DRCnt/kM4nSc1wsigjzjTPpmp5A8sMGa26+GTZYqbRVL+m0XjnIA
 Lm2NFIklJHBA/p8kwvxW3rzmycHAegAcio4v+c+Jp0stuKDOw60AMlcKqnLLmTCwGEilpscBLAg
 EtJXKoQBWktDIclkx7NKUfN1ZAdleIvjjmJNRuz6GDi85s+HVKdNXLS8g6SGBEttIW2RdF28o1q
 8q/9yHdmVVXaBOJBc60onMOeu5sCOSb9OBBYMZC+sMv/cHQSigoJK/IhoXouZHJInCpV0stFSO
X-Received: by 2002:a17:907:c317:b0:bda:d08:35ea with SMTP id
 a640c23a62f3a-bdd283a64bdmr341634766b.48.1779476753221; 
 Fri, 22 May 2026 12:05:53 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bddc5ece286sm81426366b.40.2026.05.22.12.05.52
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 12:05:53 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-bd22b2abaa4so1298273066b.0
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 12:05:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ/lTl6EyzfCwWsGEZi7mn9WyMJ9Y69vv/lCx9jpQqu2sr2AVj2uO/A5a96qRc9VeWvAly0zayEeeA==@lists.freedesktop.org
X-Received: by 2002:a17:907:72d2:b0:bdb:4cf3:7035 with SMTP id
 a640c23a62f3a-bdd253390b1mr306496066b.4.1779476751943; Fri, 22 May 2026
 12:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=whiv=b+dAvjaZDsZkfUEzjZMSSLExDOWVcbJ0exsCj6_Q@mail.gmail.com>
 <6874536d-ab1a-4dd7-a23f-2a071bda145e@lankhorst.se>
In-Reply-To: <6874536d-ab1a-4dd7-a23f-2a071bda145e@lankhorst.se>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 22 May 2026 12:05:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj5aE1yVMb8RM2AuNUHSMnQDaGT+Vy+At5ds1vxBA+Kng@mail.gmail.com>
X-Gm-Features: AVHnY4KMC4fPrp0Eg8xTd3oOcWUbDhv_gUsDIVjBlefbcy08ljXF6ll0V_6051s
Message-ID: <CAHk-=wj5aE1yVMb8RM2AuNUHSMnQDaGT+Vy+At5ds1vxBA+Kng@mail.gmail.com>
Subject: Re: drm: xe: Kernel-submitted job timed out
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Fri, 22 May 2026 at 11:55, Maarten Lankhorst <dev@lankhorst.se> wrote:
>
> There's a
> May 22 11:09:19 3970x kernel: xe 0000:4b:00.0: [drm] Tile0: GT0: Timedout job: seqno=4485322, lrc_seqno=4485322, guc_id=0, flags=0x73 in no process [-1]
> May 22 11:09:19 3970x kernel: xe 0000:4b:00.0: [drm] Xe device coredump has been created
> May 22 11:09:19 3970x kernel: xe 0000:4b:00.0: [drm] Check your /sys/class/drm/card0/device/devcoredump/data
>
> Do you have this coredump too?

Nope. I was assuming it didn't survive the reboot.

(This machine doesn't allow any remote logins - very much on purpose -
so when the GPU hangs, it's toast).

               Linus
