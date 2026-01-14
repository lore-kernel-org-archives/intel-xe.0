Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7686CD31A30
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 09:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354CB10E5E0;
	Wed, 14 Jan 2026 09:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="GitTTAag";
	dkim-atps=neutral
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6338510E5E0
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 09:22:03 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-59b76c092acso5661270e87.2
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 01:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768382521; x=1768987321; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+TLqsVb+BwjF4lG8vt/DUf2U0UB8iRBHws2zuhJqE0=;
 b=GitTTAagiASRB8+XuQcGzgIEhGVSe15tBfwUBHHpm6TWgGJ+XWATW4cxLS8w6sik1l
 E3Xkvtxu0T5jwjA8QphII4efF8BV2N8nRaw8/ejznl9172PxNuUZWsHLjmMmWJHctXNq
 UsLzyhhmRV1yIAh67CSzf1nx9NJAFYDY7+gvO7WoR0yMaAcpi9E5mjNHpQCejRqbalQ4
 ttZBsclgWip19wIzsyw/kPGtEEftZCmpkTR6liaQ1BkJ1G9XLaCTQQx1R7R3lk19YAZB
 QdoPaM2rPQX1YBkZ6Nmeva58S8w1DcsDBHg5TSprcOMc7umlU7JJkuqf1cnH/ybb5DAZ
 seNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768382521; x=1768987321;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B+TLqsVb+BwjF4lG8vt/DUf2U0UB8iRBHws2zuhJqE0=;
 b=hcRyXR3tiVcQIZmaK1H1wOaU7ToDH/Sd7NhfzrqMYY4Tvkb3wYm/IVRAVL9fsLcj4g
 0xKsumkzmZj0Swx8KqR2IwqorRdHBPOv4i84bnzoxpDTEviAtmeoHCXJQ7ymhCw72f3b
 U8yF9STopDMiU18TJr4U18ohenJxtrwBZ4rhqW7hNVJAEqR0M431mkGYtHSf5DYfBBEi
 l+7xIGmdD4leWz4HYZ4lqYZSgdIaNw82BbKg+9n5sknq9lPqxl0ItImXB9odDmxJISa2
 hosDj287mrUJ6bL85Buku46vX2q4qoC8a3ml7IRLACqpEincH7gntRCFFC0B1zMb/hyO
 uisw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYPUDMGf1PPvSbzdI0+9ampGPc3bwTspMPEDYtnKtHKCKWtAxSkFcV6V81gsdgmr2i/c6CKAgqMA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyianoh7keI/NVtCq6FW7kOhfaK17iKO3Xi5htEBnWkpeoY+kOA
 n9/YqscyeNKVs6uuvPk5x/GEQgScENC2a8RFoFvtSCSkqBzlASTiHQNvGIbALLLCrH1yHZtsEut
 6QtqbSi2vv0fZtRUhc8LLthbSW4oBZrAM8EXEsM1JaQ==
X-Gm-Gg: AY/fxX4dzTtlo2Ywj3VQovgHIiIFEGCxw9IkW3t1pivC0kK4H7fHoAJ7dLMQ5NdJ1t3
 y01PiL6Wd2GYy8ZA8IhcRRbVKGnMujoLyk7pFNOp+Ur5TprB7BhnZhMhgPTs5f6m6RbB/Paec9j
 Ib73fYZBCsX8rsyHdPZI0K9oxwO16RTu9Vf4/5XsVCla84R+hpU+0+H8f4OD9ELScKdLJ23jf4K
 5LnhVAksFfnQktVIYVFdpgzDBZr3/uKlfLQq1wOMN43nC3gNDdx6tuwbgPfMKT2EbeDZDMazkFz
 pOdz+Z5YdrWBGPMlm6hxN87u75y53GTZb93c4vI=
X-Received: by 2002:a05:6512:3d0f:b0:59a:183c:4863 with SMTP id
 2adb3069b0e04-59ba1523e7bmr438957e87.8.1768382521040; Wed, 14 Jan 2026
 01:22:01 -0800 (PST)
MIME-Version: 1.0
References: <20260112094406.82641-1-marco.crivellari@suse.com>
 <aWWz9pJ30Hxa0USG@lstrano-desk.jf.intel.com>
 <aWdKdllO8ZTRfYgp@lstrano-desk.jf.intel.com>
In-Reply-To: <aWdKdllO8ZTRfYgp@lstrano-desk.jf.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 14 Jan 2026 10:21:50 +0100
X-Gm-Features: AZwV_Qhc6Bkk42aHGgyAMokWFyQuIbojktnom_cU3CoHLLk2SojYqiL1guAlJ4g
Message-ID: <CAAofZF5X97shEA6a8-v=Qu6QtWwKg44O7pqLKs1XHQYSn+_f1Q@mail.gmail.com>
Subject: Re: [PATCH v3] drm/xe: Replace use of system_wq with
 tlb_inval->timeout_wq
To: Matthew Brost <matthew.brost@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

On Wed, Jan 14, 2026 at 8:49=E2=80=AFAM Matthew Brost <matthew.brost@intel.=
com> wrote:
> [...]
>
> Merged to drm-xe-next, thanks for the patch.

Many thanks!

--=20

Marco Crivellari

L3 Support Engineer
