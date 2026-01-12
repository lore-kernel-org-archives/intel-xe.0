Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1882D2504A
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 08:22:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95ED510E1EE;
	Mon, 12 Jan 2026 08:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="CP8+jxNw";
	dkim-atps=neutral
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FF410E25E
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 08:22:03 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-382f9930e54so35906651fa.1
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 00:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768206122; x=1768810922; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XsyXyJP6Y/3pXJrsSmemWHA6G4lKJakyXCrRJ0Arp2E=;
 b=CP8+jxNwFh+ZAvlLKJ/WLlkugDHaIOlOyBGZTIhCndSRmfyom2xcEtQcCSYAa2qZ+k
 uXxOAYAePtJV7fSEu9a8rnzEBEYM7NxNyWdrRnwo/sUKQJxAGWnWN6eMV70V7v1McvOf
 WXLs6ui8zt2OwxwOlU2hM5wd7Nh4iFwDBHwQ+kauzbHSGqcsyoLLK3A9/oQ2wK8opp6D
 3q8BpEtuOlr+aaZNi0O3Fv2zOY8V1Zc2eHfd+uzj1SnvYmvF5Io3dCGPp7B+YV9P7SyU
 uDyEed0Uhchq2o5MgZVboSkjjtfJUINSTO8ZsTzrQb5r8czRjffekphqjmnlczCI1iav
 2pAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768206122; x=1768810922;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XsyXyJP6Y/3pXJrsSmemWHA6G4lKJakyXCrRJ0Arp2E=;
 b=EvyM7mhy+sEAurqaEcqCuu+nQz/7sXg5GMoNVL/e86dIrq3blSbJ4K9VY4BuSvs/17
 J4TUpXG175o813fGP4VT4qCG3lnHkaZ38bOnh2oJkuUfFLdJ99nNVr+ckv+cMRt1uGCo
 Z2p4l4yDZQdmH/fvTDzv82aPU18XZ1Bobl/DY6nEetS6Jv5L51GubM9HY4w1YtVNrsG2
 uBYvIUcELjy7SrsIjXdK9QswU1jbTktvk7Fbm4I4YXs9x5z+hRIbPcezOWfLKTivi3nF
 2euBH6FDjHAZ1RlLwwpcZRGJA2QrVT8bwfdD7DjjYfhigevk+CS4lCNA34sMBBqMuZ0p
 11hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjJN0Z9GlTw6Hc/EfqP+CHsPqt1v0zZDvIZHQe+yCeXrqS0CjGH8vSutijHTsLiQ+7EL9wEEZC9g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKB8uTb8bOLed3cwTY+88RuoxzHmXPcFtxVzeBCYQ++Qo4NhGd
 cfFuNHvLFKj61ONGEHoS5PDckvCYVAMZw10tXktMk/+YxFZO1u3fGwWqSvBQw1c682K1AW4tcA2
 D6KNLGMd6CPBnaLdOLv21B1odqNMsp2KvuGkDWeMOZQ==
X-Gm-Gg: AY/fxX6tBsDgvWjpANhy7iemd/G7qf1PpYT+00CK8lGiP85rbWI+p4zoA+Bjx0paBiC
 hxReKcg06HDOazU1dhR+n3T+x9TVGI4mYcV6a9zdyxAF4yL6hZ0zAg+MU345YbaW5bcLhc9noR2
 JbRUBry0oQErPu0DCcsCZfistRWcvTE6dr2vLi090Ibjb/zWtrIR388DVG0UeiWQ1S3Wlnzz1Ub
 bs7nTAxBNKwP+7H3v/KCcdDLp8ceP5fbP70ZZjjpwlzGO/iUX/+pEmcLgO6lfGgZiNxol1+qkvv
 1x+nMkSDda4PdYr8tV9aY231YBV7
X-Google-Smtp-Source: AGHT+IFuACUf1fWUB9ZbsS9Sdz3QYI9+Xh93xr/4w50+jKvzzUPK2Cpq3akkyt4wX04ScI0yktbmcb7GtHOnPKgWtos=
X-Received: by 2002:a05:651c:3044:b0:37f:d634:ba27 with SMTP id
 38308e7fff4ca-382eae93866mr56991641fa.9.1768206122134; Mon, 12 Jan 2026
 00:22:02 -0800 (PST)
MIME-Version: 1.0
References: <20260109155717.269221-1-marco.crivellari@suse.com>
 <aWFO5bWNIy+N5/AS@lstrano-desk.jf.intel.com>
In-Reply-To: <aWFO5bWNIy+N5/AS@lstrano-desk.jf.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 12 Jan 2026 09:21:51 +0100
X-Gm-Features: AZwV_Qgkje68RNYGplu1gjIwyLliDf0WfCkpizl2GJC68hku_3XVzv-uAgzd4Ec
Message-ID: <CAAofZF7iaXC-KEp_Mq0pFWyVGi1R6Zd_REx-SBBMuhPZwa8eYw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/xe: Replace use of system_wq with
 tlb_inval->fence_signal_wq
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

On Fri, Jan 9, 2026 at 7:54=E2=80=AFPM Matthew Brost <matthew.brost@intel.c=
om> wrote:
>
> I hate to be nitpicky but this name / kernel doc isn't great.
>
> How about:
>
> /** @timeout_wq: schedules TLB invalidation fence timeouts */
> struct workqueue_struct *timeout_wq;
>
> Functionality everything in this patch looks correct.

Hi,

Sure sounds good, I will send the v3.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
