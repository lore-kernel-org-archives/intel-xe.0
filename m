Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65AEF43854
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 16:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8D610E24C;
	Wed, 15 Apr 2026 16:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Mlfw7k+r";
	dkim-atps=neutral
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7A510E19F
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 16:28:35 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b9c3e2cf3c0so1090901266b.1
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 09:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1776270514; x=1776875314;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SVtPfhgGSMK7VhUt7eWOmIDqvBPOmQt89lyJEcl6ojk=;
 b=Mlfw7k+r00Vjk3eCLYeKzlu2zwS32MTle1jSZw4bdkWccGfzSX1GDFwO0kTETFFwPU
 cu4nn4otLutmkINy8vJMUIRxInSxaK/1vB6t0sLb0/JroMS4JiiZRxic+YjAJk16Qyxc
 mMPLYX9a4uqz8W2qqUTKmuUZAja9KHwnawM0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776270514; x=1776875314;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SVtPfhgGSMK7VhUt7eWOmIDqvBPOmQt89lyJEcl6ojk=;
 b=s/znIw2uWsHFSoiaKLrj4Wn5g7PHQY5wLRgxJv+TpTZleZ3RgHX2uXiGPne7Pxto/A
 EMcEE3P30hULRPmPslF13kphJGVTOHW3ySmcuBQyQr2SFkqzo4rVvqqp4kiR5Vsbkujq
 FcnmW7kwGn5ME9SvJnaRbgem+wAv0BB+DQOnB3ty/9DuPmgEvKZrF5gQOkAbBFWmR6BA
 DkHyLjUUFYNPPdpQskuZ1tduIsjF1vQfpGOThcYHeizTam96c2+zYOz01F6M1PGkpIvu
 yJb8KMvUh1w1bhs9pALZimxaTGCmyxnHWbxSMUGI5VhxKHaWa5Kk/OClAcTyMxsLvuXO
 N+zA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+xQD/DPJHWhUC5A2UzzLVyiBDpcWT5YjLI+07nUvb8OtK6zLlk0JxBFIXDMGH7wCbEpWUr8zDsBQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6ZPGkCZ3DMcCGhSH0Bl6QZNvw0tB71N5zCvTwm5HKwyQGLr7s
 oaik6to6ovOJjIC7F6/nCl6yzWDQ48e6tzKSfDqDrMFuLqPqrZB/ACaFD+YzFrxuublTUP+h+07
 BHL+4K5w=
X-Gm-Gg: AeBDieuS/SuMUgnxRXPhKTFnUlg7aGnfDq5gpZwKVCARAiVCIMkmn/P4AJriFIUJEki
 fORhwerhyfPXLmHLenfh53tlbNrhu8sPbw9DIVBQNDCTrOc9Z4292fpYWQf8Xhud4nymVGxgh50
 ewx1hIz+EFj54qwS7lXJPOcSeKUPatd0+uKnLW5VryxQr3AwY/XYQWHEP4dAqxLVS8BzLYIp20B
 ZGpDa7z6diaZ9VD+jllXCKGPwZrTKXMpaJpQiRcYR8GUeNwxDu+pZWwh/zwF0sLzUaJMfO7IvFq
 MhEM6iJp8UEHnfI3yqRa+25BMBC92+e4meRmNS89xGUilz/CMbOjj9nzXK3zk/ISuA+tVPXUwua
 nQcRTLfpELmL/2AINtyAsxsAeA0TDQhD4N6657J02G3subQ4bSP/WfD/69R4KgfK5T7x0jrEUPH
 iFQ/q3+kuYraGKAn8SfwAoXYIbXpbtxobitoFbZkmrDcheGuc0aVrDcIloih7UrCVLxNLxNyZ9
X-Received: by 2002:a17:907:c908:b0:b9d:3b68:954c with SMTP id
 a640c23a62f3a-b9d727aa0cbmr942650066b.24.1776270514073; 
 Wed, 15 Apr 2026 09:28:34 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ba17341ab49sm76658566b.12.2026.04.15.09.28.32
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2026 09:28:33 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ba23b5bcbd5so46457166b.2
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 09:28:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ8GU1lrweW3IZn2HebioYuEFcLzFbmLSiCNzYca5DgFGd/2Gs8Ofp2eVLJVangPAOQpmr+o0BkIcQ==@lists.freedesktop.org
X-Received: by 2002:a17:907:9801:b0:b9d:31c2:37f9 with SMTP id
 a640c23a62f3a-b9d724f01a5mr1184257666b.2.1776270512082; Wed, 15 Apr 2026
 09:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <d69501d53c233386d70ed10290af24aafebf434f@intel.com>
In-Reply-To: <d69501d53c233386d70ed10290af24aafebf434f@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 Apr 2026 09:28:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiAGevirr3=xC=u5_kN+m63JtjqA0C9NJLrd5PGrM0suw@mail.gmail.com>
X-Gm-Features: AQROBzAwO_jXF6Cc0zC7gGmeVDHe5c1N_2hgiklfnxVR1DaUU6j-D3KNwiqGohU
Message-ID: <CAHk-=wiAGevirr3=xC=u5_kN+m63JtjqA0C9NJLrd5PGrM0suw@mail.gmail.com>
Subject: Re: [PULL] topic/pipe-reorder for drm-intel-next and possibly v7.1-rc1
To: Jani Nikula <jani.nikula@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dim-tools@lists.freedesktop.org, 
 Ville Syrjala <ville.syrjala@linux.intel.com>
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

On Wed, 15 Apr 2026 at 09:09, Jani Nikula <jani.nikula@intel.com> wrote:
>
> We're fully aware this is beyond feature deadlines for v7.1 and it
> hasn't seen linux-next. But in the off-chance you might consider also
> pulling this as a fix for v7.1 (and really, distros might want this to
> be backported to stable) I'm sending this as a separate topic pull
> request.

Does this basically obviate the hack that I've been running for
several months now for my dual 6k setup?

I guess I'll test it just to verify, but if this fixes that known
issue I'm all for getting this fixed sooner rather than later.

                 Linus
