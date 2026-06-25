Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D890ACDB466
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 09:19:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A5F892A1;
	Thu, 25 Jun 2026 09:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="FS2ks8jw";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998B2892A1
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 09:19:24 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-490b7866869so17854075e9.2
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 02:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1782379163; x=1782983963; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ECEn+V2NhWD3Cl+wFoaowjzh5mZpSqtDy2oOQW/aJbc=;
 b=FS2ks8jw2gnHlF0ksmkAV3+FuaABl+YUDnA6qcsTIELaroYsoYuJlUh8G3FsZvq5jJ
 dYAYawETVSwA4lYCORlXqHPZye7Jc8/B7vNxQGvnXG4pVpOjIfUdXQYZmQH3CmaL7nMC
 1ojQGh2ZcbKR3EnAsK01CV5jdsUtLS/dGcFdJZsAuol2bas+7x8fTMGo3Ao6A7Q5HUBF
 EyGiLZYdbdgRFcxi4i8E2CN6foNib5ZxLNmTBKUKpRpX4+5QDfkmkRxLpCGIgy5S4k83
 TO0clZXiqNE9gNdbgcFKxfZtokUqs5jEkL4PAZmdmImAVKWTmfym43L8I9tcuIuuEC73
 qquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782379163; x=1782983963;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ECEn+V2NhWD3Cl+wFoaowjzh5mZpSqtDy2oOQW/aJbc=;
 b=FuId0Bv6m0NULqs41ZjAq39PqK20KcRhcis9qBxZQNJH+6adP7vxCh7FUhNhKXb1T8
 cI9ln2EiXB0DPgRbW0tq65gke9NWpEDiE3xNgQxmsqQgdNK41xURCx3MnlsHzbLVoLiW
 Sewc1jY4/TuqiK2lqNaNeOTSi8QiEA2scBULYu1ZrS6Y8hdB/kVU455AoH0Vkxb/7t3d
 qLQcQH8HKalAAoONPkKKkGi41E626j4ebwTAeCHI+sfY6quUgNgIBu3ctEYZpfM9tBls
 zV1lubZSrKJ+VmDHgZoEiiWQuNoNRTdAzUw7cZUpsNwv42Yyw/fr/nemoddMVlmxLDU8
 m96w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Wha+SVktCcgOM+5eHdXfvnSxX9V0MyQBK/Vda1vfa5a0bqlPbDrn48LHAVRgA9z8dEOmeA2+qQA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2C1vqa6Eqn89MQTKRbAFZysA7aUuVWQzr7j6JyOJN7O0y8ohS
 kb3kZBtnkwTMzWPG2QI9yC6T9Ry1ShZ8QdQcQ4YVyH9/ouB2SJai6qz1cMarQTdwar0=
X-Gm-Gg: AfdE7cm3TtLHrj1aXsHyaP7w3lQkHh4r0ar5kcJUsj7Sn4bmB8Zcvo8jwnMYMK0SZ++
 6whIKsbojOIRhO52Sx8/MTHCo85diFNjpWJIHtRLd1NZMpzeSDZkqW5miUwYhM5uySXrStxowwD
 bBkUJElPOww4hBARMdJ5bgHr8X7iPVhrT76kFnxS2SPW6pGqtnxBw+Zam/wzHU7R7MnoDoFGeMS
 wCQzaFBqSWR5PSa/d8Vsgjrsl3McvIwNv6XGB15UGVH6pQHxSYwyk8mTfzk0aLLzo/Ee2NigdDC
 c785D+GSq+bPx9GVTeVvDE9/DegBKbhPSwQSHXl7h1HonIaBncXEBAyCkShoEHboHEPSnuNX2ze
 suwCMZWIK455bXPgKUDtGxeO2YpKNJ8niyelVD0Zjh72XSKas+l9v1lFHZt1uvg803L0Y07Vl35
 7tRNxeR0lMxGbOyHyFsw==
X-Received: by 2002:a05:600d:8443:10b0:490:d32b:39c3 with SMTP id
 5b1f17b1804b1-4926685feb6mr16924745e9.6.1782379163017; 
 Thu, 25 Jun 2026 02:19:23 -0700 (PDT)
Received: from localhost.localdomain ([62.77.90.70])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49264082426sm60418065e9.9.2026.06.25.02.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 02:19:22 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:19:19 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Tejun Heo <tj@kernel.org>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, 
 Natalie Vock <natalie.vock@gmx.de>, Johannes Weiner <hannes@cmpxchg.org>,
 cgroups@vger.kernel.org, 
 Huang Rui <ray.huang@amd.com>, Matthew Brost <matthew.brost@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/6] [PATCH v6 0/6] Add reclaim to the dmem cgroup
 controller
Message-ID: <ajzxLABtnWym81Dp@localhost.localdomain>
References: <20260611173301.17473-1-thomas.hellstrom@linux.intel.com>
 <ajBJU-Jp2QVy14qt@slm.duckdns.org>
 <ajBLAsNoKesXmFcs@slm.duckdns.org>
 <ajlUPmaMsa2gxOLg@quatroqueijos.cascardo.eti.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lrl2vho5y5eomexp"
Content-Disposition: inline
In-Reply-To: <ajlUPmaMsa2gxOLg@quatroqueijos.cascardo.eti.br>
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


--lrl2vho5y5eomexp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 0/6] [PATCH v6 0/6] Add reclaim to the dmem cgroup
 controller
MIME-Version: 1.0

On Mon, Jun 22, 2026 at 12:26:54PM -0300, Thadeu Lima de Souza Cascardo <ca=
scardo@igalia.com> wrote:
> As far as I understood the patchset, it doesn't fail the write if it fails
> to reclaim. It sets the new max, then, if the write is blocking, starts
> reclaim and eventually returns after multiple attempts. But it still
> returns success.
>=20
> So I believe this is behaving as you would expect.

I was alarmed by the EBUSY mention similarly to Tejun but then I
couldn't find it in pre-patch (840ef6c78e6a2) nor in patched (v5) code.
Please make sure the EBUSY return behavior is not introduced
(essentially match memory.max behavior) and that the accompanying
message refers up to date code ;-)

Michal

--lrl2vho5y5eomexp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCajzykhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AihGwEA1SCEBfnAwyeubLR7IllY
8xY1mJBt88wz9mCIeM9+iY8A/0e+2PnPs29VJ7kdk24/ZbM72Eltcu2Pv4++6deM
lMAL
=i/jW
-----END PGP SIGNATURE-----

--lrl2vho5y5eomexp--
