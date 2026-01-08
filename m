Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2FED185F8
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 13:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D086610E730;
	Thu,  8 Jan 2026 13:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="f3/CcVG1";
	dkim-atps=neutral
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8508610E734
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 13:45:18 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-598f8136a24so3296338e87.3
 for <intel-xe@lists.freedesktop.org>; Thu, 08 Jan 2026 05:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1767879917; x=1768484717; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=57WnosdqODosJZTnTpnEoGznMRam2UK+IuBaIVvt90k=;
 b=f3/CcVG1n5Wv8JfsZ00i4K3yZMoIkmiAaGmHCS8GAFFNl37eMeWbVKn9lJVdsgvlOD
 eCYMr8+5VxHkOCjTUOMDJ6yGcWCmLPyOGb7ZzPSkzqh02cLWw3FCG1DXwHH5iTamVtyr
 a/J/jWQb9EqICjaKWzkuPzqLHzUsZ/eMfuOeKM+v+q2/IbORy0IPF797L8cme+cZ2G3X
 OYsEofmjnHurC3wU05X+Gg+BtMfmmiNQ0j1jfDGhIFmVSW2FXXS1fmc2bWqsCEWn4fum
 Qt7PU6n1Iq359apjoXZeW8nl9L5RFKUWXUR2Rst/aiyvWYar9HscDK0HaI0hb9qCFKcG
 oA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767879917; x=1768484717;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=57WnosdqODosJZTnTpnEoGznMRam2UK+IuBaIVvt90k=;
 b=qOH3PlUX0xMwanll6nZIjzNin0yp8iANVYnVlgQts/U0RFoqm2eGy1jggisVyQpWwl
 2N++dZvvLc1IhbpFis0Bn2FD81S5yr789NdDyYK9Cs0e4Ulnml8XTCVlcQJQvcchUpQ4
 ILB33oeAJiC7qo3WpBmkvHKnMe71b89egOshgaadR5kKmSsTTsemoCByusGkwRGjXmrE
 tZJomtJaIN0q0rcPcb8PU0gmL+/Ydrp1qB67Nl8qluKc6G8eFyuU5VrEC98AVnKfD52R
 UHFuE/l/QvI/csb5ACmEe1KsM/G89N1E23lXNomTr49oEkqxPHAI4/p1jYDTUqphoUy+
 cL+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9PjNk+RRHGeHoK39CHP2ngqJLBajxGg4yIvkQJkfvsTeaBcMOpZTHkGjjRIXrdmDe45VmWVcxig==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkXZX5cGAxGgsw1fo6rrsFYY9vxFuO3MK5SSsI39iBa6J16Mlb
 d9fYV+asNumlvQPyKM6Yd9gLExHMyRydIoTMmoaKHDq6UWGgbQILN3DpnbCG91TjSfLeLpqQu4T
 Gzq3AD7hHLIYCndZzhYOuSqhkO3kmgtFm5UW+coz4Nw==
X-Gm-Gg: AY/fxX6cwmID/x6JCFdo8ZimyGeA5S62D0CZC3i8qiwsvaZRRgzaJ7NcVzGAkslJO1L
 IrUXwZYkAm+dW3PYCNw+U9wUPUxim+1+4OepnFYreUAZPU/Pt3rntSvcw5cpnsea8x7bVrAevnz
 7WiNLfE2dQfttTYivIwVi0yCODZEymvEgw9WBa930yREUFuMe1pqIqmLvHAN92x9gadffs6lj4d
 FJ+q5G9rby3KRcYjaaC+VNro9gWmimy/ksjSDMgoYe7PJbcykSCPAWKI4SKNoYlmpCB5arcoy6D
 bVkIDBxKRk7plQuk3uJ1ypdgqwepGNYvmZZyRbI=
X-Google-Smtp-Source: AGHT+IGMqI/iZvTRGhFmoBHDfoJkE8zFzfVGT7taiQDmDkz3Qb1DNCz9w00arXjq1uq2WZ+x5tTUL27c2leyOAfcxMg=
X-Received: by 2002:a05:6512:b0d:b0:594:3004:ce37 with SMTP id
 2adb3069b0e04-59b6f04501emr2145731e87.44.1767879916595; Thu, 08 Jan 2026
 05:45:16 -0800 (PST)
MIME-Version: 1.0
References: <20251103170604.310895-1-marco.crivellari@suse.com>
 <20251103170604.310895-2-marco.crivellari@suse.com>
 <aV-xEjo5ejSM73DN@intel.com>
In-Reply-To: <aV-xEjo5ejSM73DN@intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 8 Jan 2026 14:45:05 +0100
X-Gm-Features: AQt7F2qegOvSFGwG-R0OwLu7gR7jxITAuTDYCqaymVCIP34UBPVWbtG2yiWHdvk
Message-ID: <CAAofZF4_uV+78JWq2FLaezv4qaVK7BiyVLXmXNtaPXB_jhvDYQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/xe: replace use of system_unbound_wq with
 system_dfl_wq
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
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

On Thu, Jan 8, 2026 at 2:29=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@intel.com=
> wrote:
> I'm sorry for the delay here, but could you please refactor this commit
> message?
>
> The first part of this commit message is the true justification for your
> original work, not for this patch here.

Hi Rodrigo,

Sure, I already have a new version of it:

---

This patch continues the effort to refactor workqueue APIs, which has begun
with the changes introducing new workqueues and a new alloc_workqueue flag:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq"=
)
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The point of the refactoring is to eventually alter the default behavior of
workqueues to become unbound by default so that their workload placement is
optimized by the scheduler.

Before that to happen, workqueue users must be converted to the better name=
d
new workqueues with no intended behaviour changes:

   system_wq -> system_percpu_wq
   system_unbound_wq -> system_dfl_wq

This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
removed in the future.


> Except for your last phrase, which indicates, some wish of removing
> the unbound_wq, it doesn't state clear on why we should change the
> unbound per the dfl (default?).
>
> Perhaps the authors of these cases below wanted to be unbound,
> but choosing the default will make us to be tied to whatever
> default might become in the future.
>
> Right now both unbound and dfl are identical. In the future
> you are planning to remove the unbound, but what about the dfl?
> Any plans or possible changes? If no change is planned to dfl,
> why create default and simply not stay with the unbound one
> that is much more clear on its intention?

Yes, "dfl" is "default".

With the new version above I think it is clear, but in short: the rename
is needed as a first refactoring step; the plan is to have an unbound workq=
ueue
as default.

system_unbound_wq will be removed and changed with system_dfl_wq.
system_dfl_wq is the new unbound workqueue, it works exactly the same as
system_unbound_wq.

system_wq will be replaced with system_percpu_wq; same thing as above,
no behavioral changes, system_percpu_wq is the new per-cpu workqueue.

This is to make clear that if a per-cpu workqueue is not needed, the correc=
t
choice is system_dfl_wq.

Also, during this conversion phase, I can tell many subsystems asked to
change system_wq (the name of the "old" per-cpu workqueue) with
system_dfl_wq, because they just wanted to use a system workqueue and
thought system_wq was already the unbound one.

All of this work has been discussed here:

https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/

I will add this Link to the above commit log. Let me know if it sounds good=
.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
