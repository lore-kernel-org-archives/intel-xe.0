Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DE1CD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 20:55:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5313A10E037;
	Fri, 22 May 2026 20:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EnNk1pNu";
	dkim-atps=neutral
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9350F10E090
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 20:55:10 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-67179ed133dso9061782a12.2
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 13:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1779483309; x=1780088109;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=teoGmOmvuonVsi8XRn7z1ELueXhQFKoxdcW1mi9qb4s=;
 b=EnNk1pNumpgYbnaJFlT0uGLm3w2Nxc0kHd98gZXCz8Ox64Ho/HMZGW9PQXxGO4da9P
 S2H8hWnFdiJH/aVrLitrsASnzvhmm8O/cadie7IJSQJIwz24Ztw30FaYcoMTt2d2OFP5
 Lw4zUVND2b3ll14Vcswl9W87wf3w0V0+D++zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779483309; x=1780088109;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=teoGmOmvuonVsi8XRn7z1ELueXhQFKoxdcW1mi9qb4s=;
 b=ESYThhz+dmoaQ58rqakLJb+zniBA04ZmhekRMOgKmD3P1CpGvpcn/B+n8M+rusXHKQ
 x+Z8BcYwE1c6MUjXtyzuyoo80o0wk8u0Do38ZMJ8fVruHTnbuldvfyfvnNZYWUMwCi6Q
 9jpodIWYyyWu3Kb9uNaSIkMkj+XdPZr3aeeAyqNraWtmMvK4avXhFvXdArBWYcEPovgd
 Di2Fa/EjgBgk1Ya9rmWTUwcyG9sbCAairpSHk8y8ZnQ2G3EKNvyR6zMKMDuYEElLGoIt
 GPOussarLwbIM4yKGjgVDIV6DJsCCUfyVbtyEaLjyUK8mu5kze33adSSSIv+zZRfb4D7
 2cjA==
X-Forwarded-Encrypted: i=1;
 AFNElJ99Oe1LgyjwXDlnwr1UucJrf2iRoc8WQcQG7VohLtDy+Sr/OGNVp0J1KA4O8Zxzh01O8a9aG6k2Uw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCDrByoAqmyezcQFABJocBybbK+14vLvnw5Q0UiElA1mbV1z7g
 3ugBCmN17ex5Nsc8U2mmG5pmWsyUGkNCg+gBj06FnJGVg/xg6yuMf2VXFX2qu4yE++uyJwqkfOJ
 Ldd0FK3E=
X-Gm-Gg: Acq92OE6e60G9KnDHL1waJP+Z4OIr3sTtcmfEaOdD4cHZiSJAPTOzbhIMo7FhoF7bB3
 Df/B6MVQXf0L+EMisEYcrE7yDFBCgY8NGuIHKenlayaq84dVb7NKghsuBZNM6REJ4JFuC+DVhVn
 nwqhszYz0jL8s9WhhWyvAAMLWXSQU7HnTnC5QQMQPObndevLdpRNa86N0zwck1PtPZFOleAU3jK
 H1EqbEEJ9BNbob19PqSXe/dm5FFhmtommO4HlIPrvE5j0VRpKNU8DUVC4ielRpaMvwFzYBfDHky
 03+1kW1jQbsqahnO2vLBJphIcKQ5mN14yBFX5KSTOeGdUKmo7MgxzTluEfnsvBxXgIIH+ERBpAq
 13bsEWXNkp07zYxCiBaVf/w4+XEi+DhzJ61mJSmPmOl5T3KdZh3NwGVqqC19AnJFAHgwcxZbkjH
 PeaPv7Z3iFMKeONVwig8m25ML4yCTgI0V5DlM99N+YVitWJTFmoW1elobULvXc/qRMlBAArBRM
X-Received: by 2002:a17:907:3e0a:b0:bd8:f7f5:269f with SMTP id
 a640c23a62f3a-bdd282a7439mr372676366b.6.1779483308832; 
 Fri, 22 May 2026 13:55:08 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bddc5ed2d38sm90228366b.34.2026.05.22.13.55.07
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 13:55:08 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-bcceb394417so970994166b.0
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 13:55:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ+EQTokjwAixn71ErxDUBUSAks2U3keAPoXl9SYrKfHv8Gwv5tHXbGy1Ydv4WDRV6WaiHTueNo/MA==@lists.freedesktop.org
X-Received: by 2002:a17:907:388b:b0:bd5:ca8:768c with SMTP id
 a640c23a62f3a-bdd2a4fdcf4mr356604766b.31.1779483307741; Fri, 22 May 2026
 13:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=whiv=b+dAvjaZDsZkfUEzjZMSSLExDOWVcbJ0exsCj6_Q@mail.gmail.com>
 <6874536d-ab1a-4dd7-a23f-2a071bda145e@lankhorst.se>
 <CAHk-=wj5aE1yVMb8RM2AuNUHSMnQDaGT+Vy+At5ds1vxBA+Kng@mail.gmail.com>
 <ahDAErDSE-SFA0oM@intel.com>
In-Reply-To: <ahDAErDSE-SFA0oM@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 22 May 2026 13:54:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=whX59mtUnU2ayMWoDQX6Ee2NXLK2NxQ+dZnb-Qc_mF1hw@mail.gmail.com>
X-Gm-Features: AVHnY4LSUSZZISY4Ze9pTdgwUNigEigmkg54d8irkN8W4SGjeBwz0QiHQuJ9u38
Message-ID: <CAHk-=whX59mtUnU2ayMWoDQX6Ee2NXLK2NxQ+dZnb-Qc_mF1hw@mail.gmail.com>
Subject: Re: drm: xe: Kernel-submitted job timed out
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 Matthew Brost <matthew.brost@intel.com>, 
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

On Fri, 22 May 2026 at 13:44, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> Any journal saving the kernel buf log of previous boots? Preferably with
> some drm.debug flags enabled 0xf likely

Note that this is very much not repeatable. I have no idea what
triggered it, and I don't think it was necessarily brought on by
anything recent.

I've seen timeouts before, but looking at my logs, the last time it
caused a complete hang was Feb 3. So a few months ago...

> What was the last drm-fixes pull you got in this 7.1.0-rc3-00073-ga6920214ba75 ?

That's just mainline commit v7.1-rc3-71-g31e62c2ebbfd with two random
small patches on top that change some build flags (this is my "built
by clang" tree)

So the last drm merge would have been 51d24842acb9 Merge tag
'drm-fixes-2026-05-08-1' of https://gitlab.freedesktop.org/drm/kernel

                    Linus
