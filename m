Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A87C61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 16:13:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D840A10F41A;
	Fri, 28 Aug 2026 16:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QYypY8Jr";
	dkim-atps=neutral
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBD810F41A
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 16:13:26 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-c2533d83e3bso184059366b.2
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 09:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1787933605; x=1788538405;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=t6/Uua66w3YAcrx/pp5+VMJYN4HMtxsrIHrd8stvxgI=;
 b=QYypY8JrHIE+psLqquvcElF5oEabZGzVWTuPCgLzoJG77azJNft9yAGauMrwDzNJ2/
 0c/7beioDcLWSziilxDPepqfGhhjViuCSPEsf9gCUOtiFrukuCUzCk60FdRl4JB++ksh
 kfoLD79BUQnCD7qH3JOvBkr9JAGKtwStg1SeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787933605; x=1788538405;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=t6/Uua66w3YAcrx/pp5+VMJYN4HMtxsrIHrd8stvxgI=;
 b=VVjnwLSjvuJBduuh/qUw/tMOMLV4zhDl1jOVM8DjQdxOSThI5T10O4oJxobx/XEP/C
 QAM5kal+xOfDPMPYYbTO4pT9BDDwr8rCfBmanGejxC2ZVCnpLMrIkBxi8JgbdsKFO/yS
 xlcobxLmJhGFqA6mjCn3VU7Tc26PilzCX1xCN7NhvmP3cmlabx0+qxr1LJaq1Do4+0bC
 jO568mAdxOzshTcfT5MwVOKpewYej18t88CcTZMe0paRTGTfk+CoJAlG6fgKyEco/HEd
 LQ5tu4fMQjLADnufkk4UnqJc76xCX/4jqf1mWCYDvxIKvtQVaoGDYFp+t/v6C/mbgwx8
 VWMg==
X-Gm-Message-State: AFuF++l09bIH41kqwMGmsMHj41uHxvgTfymHG7CiqecYCJM6tR2Z9pBZ
 gX9OIuVStjK97GZsk14uPUWEPmLWCLASUVu+DGaKVH5naRWV8GjhilTJV/W90HGy5wvNITb0NT/
 MC+47Nyg=
X-Gm-Gg: AR+sD11qKYOMafWZumtT9mHZXbuSsuhBRkoDsbyAGpfWax+B/ywOwgp4VAtBIGtwY40
 Ru3uoSgV/2N/3aL1mZ7LRHMdbHx4sw6hSpkWcqL7ujQyMdM236HyZdDX2nDI/M5wNBDAVwBptux
 syMrwQK3d3yoBn84foEDSyB+4bLThY4NunImvZVx6EU9xWO/T0yFuOyAwilfVjH5j24reClvchw
 I3/pD9zHf5AVHx0rmA3+y32Mk8b+7MnOmH5cPJfletmH3Avyh/sCG5XgfdxnJc3sUy2ss2VcMrn
 WrvXy0bGc9gS0ntZ5m07ZYxssvGZwY5bQX4Ra2gRx2LZGAfQeCCanqCSvQZJ3ko+mADKmiEa839
 gE5p9SoW9a7cJOBEQlOG/P1q/Sy3Hzxp+zcgkKHRzDN0/VGInVZiFZCkDz1W+7NQM0L82O8Awbm
 ko4INflSXy1GEMVpUdgFqrNNAhp8nnI+2OMuWJJoixjigFq8ZDW5H4DLcdG/E7iXvIxUMSlqA0S
 qKQY0MdxXeAu6BUSo/jGWkkLX0SsLDs8tu+JkDBDCHuARvD
X-Received: by 2002:a17:907:7a13:b0:c24:87e5:6491 with SMTP id
 a640c23a62f3a-c2556bd3575mr628622866b.2.1787933604888; 
 Fri, 28 Aug 2026 09:13:24 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c255ee09eaasm98476966b.12.2026.08.28.09.13.24
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 09:13:24 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-6a60d406a5cso1753147a12.0
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 09:13:24 -0700 (PDT)
X-Received: by 2002:a17:906:9fc4:b0:c25:2ec9:db91 with SMTP id
 a640c23a62f3a-c255701839emr560200166b.14.1787933604005; Fri, 28 Aug 2026
 09:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260828151405.662533-7-matthew.auld@intel.com>
 <20260828151405.662533-12-matthew.auld@intel.com>
In-Reply-To: <20260828151405.662533-12-matthew.auld@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 28 Aug 2026 09:13:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg4W6rPEb_gEJVUSuOkhv32NDfXo2=V9gNGL_ACz3PQ1A@mail.gmail.com>
X-Gm-Features: AcwNN1VnpqwUKV9xbuiEcRLkIHcu5Fe8ubqAfng37sUczvRRUGaLKJQsnoLdL4Q
Message-ID: <CAHk-=wg4W6rPEb_gEJVUSuOkhv32NDfXo2=V9gNGL_ACz3PQ1A@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/xe/vram: add early VRAM health check
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
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

On Fri, 28 Aug 2026 at 08:14, Matthew Auld <matthew.auld@intel.com> wrote:
>
> With the fix from Linus, this goes away:

Side note: I told Greg KH that he should hold off on applying my fix
to stable - because while it looked ObviouslyCorrect(tm) to me, I had
only ever tested it on one single machine.

I'm taking it that the fix has now been tested much more widely and
found no subtle issues? If so, I should let Greg know to go ahead and
put it in the stable queue.

                    Linus
