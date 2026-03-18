Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9A9103E199
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 15:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A260910E710;
	Wed, 18 Mar 2026 15:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="W9RzzBkm";
	dkim-atps=neutral
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EFE10E710
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 15:27:03 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com
 [74.125.224.45]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id E536F3240FB
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 15:27:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1773847621; bh=XUl21vHhL+LbY2Xi3MlPdKDu1f5OFFZcciY5bcT+eJ4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=W9RzzBkm/bxknGyD93+bdnHkqm6qXNXCyHz+B49rwpGz2YOqdrHL53uUpxKenLKu3
 +phX8CMxx922lGEOq7mAC5qSv/4CanzvgBdI4bKUoMx07lJ2FXn2xADTRyaECK6Hd4
 c5TgKqTaMBXMTBaXUmHM0Zt6oiqb9K3M7ZCZqKT07F4/0mWCr1GGRIHOrj+h2y9K13
 G6qmlg9RBzR3q4ZJ3IkF10FGRd9Rc5ytArAJw5JeVWBS326PxFsWDru0CNK+2xlZzk
 mhItIlITxMsgW8m+vj5nDeOzCxYue7yfPF1cygDmVk18vSET6l+OlX/ZJUbfUTHIbv
 11os1yMfaoXkQ==
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-649278a69c5so50118d50.3
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 08:27:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVNpkInF1EHM+KKUP8/qZyqUJIR6aWUvpuY4DpukU0EmZGPrSibxf9fXZcqiuEc1F1pcO3eVRscdA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxs7rp4z83V8YcpfpxnZEQmPnIW+dCWjp/DtA4QSzuyhAuQUbo/
 oaDpUEpVfBRZsOvhVCq8NJayHRKf63uKJUYiQhcrn1WuAsUNmd7tTWwbQV6KfwAmiNwlqxMCZ0J
 kq8jlOPSYXoW5beLNpAw0NwvwFfdxwTU=
X-Received: by 2002:a05:690e:4293:20b0:64c:e7a0:7eb8 with SMTP id
 956f58d0204a3-64e9134c59fmr3433276d50.24.1773847619255; Wed, 18 Mar 2026
 08:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260223-atomic-v10-0-f59c8def2e70@intel.com>
 <1a4462b8-def9-4474-8382-6e99b7c8276d@intel.com>
 <aZ1OIDsVfFvyHUK5@intel.com> <5f04b5f1-744e-449e-9a45-00fd477256fc@intel.com>
 <aZ1lbnop84k4du6N@intel.com>
 <f155fae0285684108e92887e963358ea0ea158e9@intel.com>
 <1a39b9d5-ed57-4f6b-a4e2-9e26a2734c32@intel.com>
 <21d7edcec1b6fd767b066de4ec6734cea8992904@intel.com>
In-Reply-To: <21d7edcec1b6fd767b066de4ec6734cea8992904@intel.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Wed, 18 Mar 2026 16:26:48 +0100
X-Gmail-Original-Message-ID: <CAFZQkGy=P_kymzU5CdsFth9cKmyQQuWZhy5BRryf0gxULhJX=g@mail.gmail.com>
X-Gm-Features: AaiRm51I2NGi-OkAtLpMwOYBB8XOow-ApWX-oWt-BkyKRFoBuRHFjzKq2mpknrI
Message-ID: <CAFZQkGy=P_kymzU5CdsFth9cKmyQQuWZhy5BRryf0gxULhJX=g@mail.gmail.com>
Subject: Re: [PATCH v10 0/7] User readable error codes on atomic_ioctl failure
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: "Murthy, Arun R" <arun.r.murthy@intel.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, harry.wentland@amd.com,
 uma.shankar@intel.com, 
 louis.chauvet@bootlin.com, naveen1.kumar@intel.com, 
 ramya.krishna.yella@intel.com, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Suraj Kandpal <suraj.kandpal@intel.com>
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

Am Di., 24. Feb. 2026 um 13:07 Uhr schrieb Jani Nikula
<jani.nikula@linux.intel.com>:
> Yes. But we can't guarantee all drivers will report the *same* first
> error in the same circumstances. We can't guarantee we will maintain the
> *same* first error over time, we can't make that promise without
> painting ourselves in the corner wrt driver maintenance.

That's ok. The point of the error code is to reduce the combinatorial
explosion of possible configurations compositors have to test in order
to get a working configuration, but they're still expected to do (if
necessary) many atomic tests in series, especially when modesets are
involved. If the first reported error changes, it should still
eventually reach a working configuration, even if it may take more or
less time than before.

- Xaver
