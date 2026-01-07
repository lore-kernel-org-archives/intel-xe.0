Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47C0CF6C12
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 09:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CF510E2CC;
	Wed,  7 Jan 2026 09:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="gB4IpXDv";
	dkim-atps=neutral
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB17710E0CB
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 09:04:42 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-59b685d2b79so1498799e87.3
 for <intel-xe@lists.freedesktop.org>; Wed, 07 Jan 2026 01:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1767776681; x=1768381481; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P860dl5dFiwItmzc2F929R5q02m2T4u2vNqmbkSFah8=;
 b=gB4IpXDvP2YVdrNWPfdzGwgfbHrfbwuUu+joMVmLRSrNHuH2/bXXOmyJI/lRpBQNdw
 FO0RgjoOhS4+ll2lLzds/gFJEGSfjya2xZ7oUKyytJzJTp7NXg3aIbTy5SBmpMkXGHaO
 3mv4mcC8CBWkAvfHepRKqTMrj717susenTtjjnLYCgCBJnyy82BES/3sl1Ffsjtx7JXU
 89W9kti6YDdefS8qsfPqsR9A2W+2mQ7qNK5FTYeaCOZ0JO33o7P47nLvnGDVuNKtfaSY
 2CAlBI3K27lq91piBpRRQ1gpnFB3ae2SRUnbsP4zmqdEEby/4EUmFXurqW14qshmY8T4
 oTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767776681; x=1768381481;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P860dl5dFiwItmzc2F929R5q02m2T4u2vNqmbkSFah8=;
 b=lQ678fXiubMwZzMRsVFwOijL2ToGxyD51t+m5J2KumAGQorQ19d+vILZfy4yYz7Xkw
 SNWWDe1fi/ZTv/r+F5mxutAspmMBZw6Gu++gEDVaN3/CiWXpp7Lgbmxxn/KVzIRaKv4X
 230IpE+C4Gpm4m8h5WSTxyIRptrcaNOrm1xf2OLtYlvw+7qDIqmg0t/41P/GBrxhnP8z
 JMq5eMyFLPfzlhvPeHkbCbRIAJN6oHWWbaxLQs5IJvIiKFcmmTmvIU+gv0a9Hk2Gigmp
 ybhYSeTEDA8o7Xarf8oPvUnenKVKpbKJ2FOgOOVlfURl1CuPToqUzYcYs3Y9Z9v8vdHQ
 6gVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR9erAnXQ0lxUCWVEQ8UfuL41fiORGlLYaiZNW78uVlaRNeOw9WvxBCflldoN2e46LQOkJUJf9yw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyH8BUMILGbnT4To2zAkoakpLCBNl9TlJENDS1SoNzU5+R8rYck
 Eo2h7fMj2+6D4RrWgW3DybCKdmywnNMY2as05krHIZyhBRH50o3MkQK6zD56gvNpxE/0femCXxm
 UdD/QQUFR/PZU9ybvToV4ii38Z/5ja1lvicxy13Ioig==
X-Gm-Gg: AY/fxX5mY/aaCUvRe6E95BUDF9+puX9Yw4puD5cOij9QqK3RKFGixYCMG+9XORbJYIY
 EETwY9m53cTuAN3ikmNjwzhCpmbY8XavdEOT0R/xBClZPSMz3btCLaqGsuO8rllWvZxzddn8u6X
 QI2jvJtT81HJASmCcYgmxgQw+u2tWd8HK4UI5Ds2hZUi2YPAIUuDk2C4HttNPwcDxtXLR4W0qzl
 UE/OCiSKmQSfszvwuFq3R3gSzIHMb5xhoR2DFh6z6R+GvY5GRIxXVPlf8XRd7UEy2dQDvolXEgG
 YmtVddlAgpIItDrFzSewOfJo37PY
X-Google-Smtp-Source: AGHT+IE/vVecxeQw9FSdKoRzdY2ykfcbzK336JLNVyBk3q8P1Ey2AD1rcvt5snh6RIf6Ep1oXLzwgOjH/NEwmoZccIA=
X-Received: by 2002:a05:6512:a83:b0:598:8f92:c33f with SMTP id
 2adb3069b0e04-59b6f05536cmr556291e87.51.1767776681287; Wed, 07 Jan 2026
 01:04:41 -0800 (PST)
MIME-Version: 1.0
References: <20251224160026.124106-1-marco.crivellari@suse.com>
 <aUwwunqiFw3YdKUo@lstrano-desk.jf.intel.com>
 <CAAofZF7H_sPKh=oG7C=fN-mtevZjZ038DjOL0rwDVuOib9p4Dw@mail.gmail.com>
 <aVSJfKkE0SiKrPDz@lstrano-desk.jf.intel.com>
In-Reply-To: <aVSJfKkE0SiKrPDz@lstrano-desk.jf.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 7 Jan 2026 10:04:29 +0100
X-Gm-Features: AQt7F2psGne0sVuLZTs4ThfrIzUXtoUeyTVShJ2kOg1cjCA3s33KOhPlcD4P7Uo
Message-ID: <CAAofZF5eVkddt0AH1pZJgPmXywOwUitjJ4r7Ftztf3Qm4QbxDg@mail.gmail.com>
Subject: Re: [PATCH] drm/xe: Replace use of system_wq with system_percpu_wq
To: Matthew Brost <matthew.brost@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
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

On Wed, Dec 31, 2025 at 3:25=E2=80=AFAM Matthew Brost <matthew.brost@intel.=
com> wrote:
> What I'd probably do here is store a WQ pointer in 'struct
> xe_tlb_inval' and update all calls in xe_tlb_inval to use that work
> queue.
>
> Since these are tied to a GT currently - see xe_gt_tlb_inval_init_early,
> I'd set the WQ pointer in 'struct xe_tlb_inval' to 'gt->ordered_wq'.
> 'gt->ordered_wq' is the per-GT WQ for resets, jobs timeouts, VF
> migrations (all operations in reclaim path), so this seems to fit here
> as well.

Hi Matthew,

Thanks for your hint, I will send a new version with this change or
if I don't have something properly clear I will get back to you here!

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
