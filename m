Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79FBC5AC80
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 18:44:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6B410E44F;
	Fri,  7 Aug 2026 18:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QCXQwZq+";
	dkim-atps=neutral
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E004D10F5A0
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 18:44:29 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-c15c42a45adso356366766b.0
 for <intel-xe@lists.freedesktop.org>; Fri, 07 Aug 2026 11:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1786128268; x=1786733068;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=JvGVlcH7x6TGfUTjYN3iZdn+SL6UTSdew5rMIN/ak0Q=;
 b=QCXQwZq+ClDerU+JlSphAFV78uS4+bXJpD6s3XKKqfArRsYrHCi3fRu17Abx4e/6+5
 /e/dWO4rJjvPFLM7+NnmFlHRHPdFYgLZMa0KKO0XeN8CIzj1hiwn0rZoNudPMkOnNpER
 AV9v+r6skjWmAlDWx7qsz0xSGU5efmASMXKwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786128268; x=1786733068;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=JvGVlcH7x6TGfUTjYN3iZdn+SL6UTSdew5rMIN/ak0Q=;
 b=PyWWrddESJC3fYEDuqfMBiK/xbL0j+gznif2FqZafpbYksZ+OMAqAFHyJc7nbMaM5b
 p7XnhI5FRjT7ELbGebp3wO4WcqoKTYr+kJNHcOH75V8M17n1BScsGS9G+ky0TF8tkKos
 1ZhI2T/B/51fez2ftRDB9XANCBUxCqWo+DDEy1EjFPP1wJRiYrHHwj4CvOQ80IqrMo55
 vieeCsI7OgoNfGyR9JC+Vf4zzQeevnDg+3ZipEgDtpR+EClyLXQ2NK2ZhzMXxQb0dB2Z
 FyGjNdCL2YwDpFV4zJ2u/sbf1bchXihOOoeOFylGleOdkOrdk4r50UXY+znHk87zRzCk
 GkOg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrgwiuX/xsGgi8mUQee9G+R89fUXW9xzetX+afG7/MMM1fZ9JNCArUx2/rVQdmuOdXv+2S6VgSq/A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUWF/FtZuUCmvv5dKbKYVOV8TtaiwCiLlZgFFaSbxoZEau7l3V
 VMwW2aFnqfv5bsSb+q1XNwN3JP+rQ+2ZsKPbdRaFVA1wMqtd5N+6pX8d13nuYcOGsIxM66Gvt2i
 V/4RVm9I=
X-Gm-Gg: AR+sD13bJ84WLnrGplpFUiWn4HSQIIDCRqcJzqyBSJijGGMTntFivZpTwwMDLMhl3hp
 DRIobX0IbYBSH4TPOBN7CzD8qGcVMiF1RndI4ubz1Uxay0CEpSp4zMAcnd5IQvFH5U+MOBUUe/A
 wkglmMuNe7reAodP8VyRDkdB1J3IFZ/QQhSWRZ1HiYL6gIV81o/DX0AzZAimHUOro/yQ+p83ryE
 YzjM+kTn3B9R3HgsqrnX2mOKROtxV6gC7P8DoCN6+Jg0eJ26oHPz32YDrXSlL1bIp/Gj+joqF2j
 UwtUr/Icduny6u0kXz/DlPMx1BysiUTtCCywtS5tIzZO8lWJQeoD/vkwLCK496jTlpMRI6It7sT
 YCmSuU43uhjAQO5Wa5e403t8ADcKkuCaF9NbEd+Iz+iVp2lozLDblovyH3rMDkNfkl3oziAoBoJ
 Ryi+E+r7uuZqFUfM3kAKgYh8E4yjt6GrDJMS6YNkxQxmmgye5Y3TQvVSzG3pyxk774WFowAAJq+
 Ay2cCkcuv6Mi2vj7WdYMCJdVVE6etDE1NgbPA==
X-Received: by 2002:a17:907:97cc:b0:c12:3cbf:9f6d with SMTP id
 a640c23a62f3a-c208d2defbfmr30569866b.1.1786128267689; 
 Fri, 07 Aug 2026 11:44:27 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2080a29a57sm87119866b.13.2026.08.07.11.44.27
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2026 11:44:27 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-c169ae1cb26so433034966b.1
 for <intel-xe@lists.freedesktop.org>; Fri, 07 Aug 2026 11:44:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RpvzvT1WSYHomj/r+Wnj+G/oJ85yWHtFMnIV2RCdJAP9+Q2CbwUi9knE0YT1OWnkNyl9mS1HOZ+pw==@lists.freedesktop.org
X-Received: by 2002:a17:906:c153:b0:c0d:7c31:26a9 with SMTP id
 a640c23a62f3a-c208d2df2d5mr36200466b.2.1786128266959; Fri, 07 Aug 2026
 11:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=whiv=b+dAvjaZDsZkfUEzjZMSSLExDOWVcbJ0exsCj6_Q@mail.gmail.com>
 <6874536d-ab1a-4dd7-a23f-2a071bda145e@lankhorst.se>
 <CAHk-=wj5aE1yVMb8RM2AuNUHSMnQDaGT+Vy+At5ds1vxBA+Kng@mail.gmail.com>
 <ahDAErDSE-SFA0oM@intel.com>
 <CAHk-=whX59mtUnU2ayMWoDQX6Ee2NXLK2NxQ+dZnb-Qc_mF1hw@mail.gmail.com>
 <af9278d3-4002-4e09-9bcf-bc75d1cf8145@lankhorst.se>
 <CAADWXX-pfvA3mKWSjdahnihAXHQB2VP9BOJDCXonG3Q_nxurLg@mail.gmail.com>
 <anYZ8nUFP5dnRy/h@gsse-cloud1.jf.intel.com>
In-Reply-To: <anYZ8nUFP5dnRy/h@gsse-cloud1.jf.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 7 Aug 2026 11:44:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=whjNj9WNGgGKRC-nqh9_yHxHTEtV2Hpa_+4gJ=e+Exdxw@mail.gmail.com>
X-Gm-Features: AUfX_mylGnts_HhKz5OUdr1TkChd8YF5gFEyzSFicxqa-mKJ_sbIgq9Z5CWxI_0
Message-ID: <CAHk-=whjNj9WNGgGKRC-nqh9_yHxHTEtV2Hpa_+4gJ=e+Exdxw@mail.gmail.com>
Subject: Re: drm: xe: Kernel-submitted job timed out
To: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, 
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

On Fri, 7 Aug 2026 at 10:46, Matthew Brost <matthew.brost@intel.com> wrote:
>
> I think we may have found one. I haven't been able to reproduce any
> kernel job timeouts on drm-tip with this patch applied [1].
>
> If you're still seeing the issue on your end, it's probably worth
> pulling it in.

Just checked: I haven't seen any "job timeout" cases since May 26, so
it really seems to be a very rare occurrence for me.

It might have been that something else changed too, of course - some
user program behavior change could have simply made the trigger go
away. Not that I know what such a trigger might have been.

Looking at the logs around the last two cases, one was just after a
dnf update - maybe triggered by some restart swarm issue. The other
was fairly soon after kicad had a core dump. The kicad core dump may
have been a symptom of something going wrong, or the cause.

I dunno. Nothing looks obvious, but clearly this is not biting me very
often. Months in between events.

               Linus
