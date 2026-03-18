Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBFEF483C4
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 16:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458E010E576;
	Mon, 23 Mar 2026 16:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L0DTtRSj";
	dkim-atps=neutral
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D45010E715
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 18:57:23 +0000 (UTC)
Received: by mail-dl1-f52.google.com with SMTP id
 a92af1059eb24-12714f01940so25276c88.0
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 11:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773860243; cv=none;
 d=google.com; s=arc-20240605;
 b=O/+VV7iq9mXlrJfu3dtvuMZ+Ikua6JRsLgI9VXQNEED9dH+WMcjAGQ+sNc/yHFyvKS
 zQKtWzMtrxe30gNzFIbRmt47u+Rpf45AWxOdPiYuoF2yHw/XCJbz0yFMKp/AxAzsHjwB
 n5Kymab39E0k/KAOkWoNH3xYfYd6g7PbrNxrsBoEUIbTJqtvuhSGawEM8qeZn2Y353ly
 RRYV2F6xHfVImFNDC/1afFN0/ttWY8xPo920X6ho6hW3WNhQCaseCZZcRImgqTTKbXDP
 zmTc28dkldvHPTEUjYQZAUNECX5pBCff7FhVMnB6O65guykBOs87YMRQyf9KISzeLWRb
 gAmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=VupaCI1OwER3l7ohvi40E+Y56v6gbAu+x5/VVVtmeFc=;
 fh=i4BGheRqZXL3rymAGyPI852lLzPAPeopseX2mQ+floQ=;
 b=E7uo+ig2nd+1xApU3kSkfWOvQhLAAvyjCvoxZ6tz/rvdXEZg4aYOxTGesu1T7AwBO6
 VzEvWMkXi5JZHbccIGpMzRr9+0J2cODL5dxezBTTxA15ENMk1mJDJ2STaQ+KKNpJRwlv
 fhkebC+kKOhFgVOD2e0us/5yelm2o7Pfombsw+1quU6c8HeWVQLHukUrrkhgcK9vTfSK
 bXfjiLz3824ECd0hjE4ucUV4C8X4aZ/vLOlf53gko2LSLuThLglJDLqZFye0pWjhBrrf
 TCl1mEZ2HFMYVQEoIVOXGNs9jGOPABy0/A0wlHjf8oKE4wKX7jLDLzJyyhZ0wca6KUxm
 JdMA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773860243; x=1774465043; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VupaCI1OwER3l7ohvi40E+Y56v6gbAu+x5/VVVtmeFc=;
 b=L0DTtRSjD3P3foLZzcumBUqXBNdSjOrQZwtECp9tPcgS0q9LqHnvJaH7dj94Sxq/sr
 PUtC+N5h1uLnGRTOxod6NNqMaqXGx48v8gHJ2IQVnb8CjT9EBQ+KRLYMnqvtqn34seen
 V3g9URV6HjGebB3Tenn4M5DkDPl8vZDMYL4/1urXKbasaSZFknDwmg17N8CaIrosgceb
 +ZST64CeDqVD1cHP3sXqLhyS3XTCHF7iM7ihUMzKaostxn2QgSAQymx72ePvSrRaH77p
 UpGQrWPmWVLBKoGU2Zl5A8Bj9RwsUcOlWNLcrjVzHIrs/lKK/3JIh6PuVUmnX9SCaiEX
 sduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773860243; x=1774465043;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VupaCI1OwER3l7ohvi40E+Y56v6gbAu+x5/VVVtmeFc=;
 b=HT4SVZnHJGTy1gv0mPiR117qqnc3sCuoDtO2tHvXvzL7Yb+DOyxdVF0u8MjXTz771s
 g4KVRvXdDO2n71LD3sonXpRN4eA1+0YAkI53Jbe6qcFBIEamO+Zu/tZhewU8HOcY55B+
 PMakfvWdWB1KKs4IhsbELb7TiWp1AxpvYPKfY9q07U6k1XiwDtl+HFTCu4bEZT2ulwLe
 WON5Ct2Y+WNuQ+ObjuZdpyKiKQ5TXLwy9N232hMv+BWwV/6eKNRm98JcvlNvcJVewgGo
 kczr6aNwDFNsQfK8jTFvKJEalvo+z8Y5Z6p2YJXQMrcYI0aaFckr/grcOj/OUppBPf4j
 NMxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTFH3j6tQ7zH0tvJQ19fDNQ9ZPVL/NBZ5fPfzRy/WIoXLACAVYaZrnBAhfznaYPcfv4IkoIpQ9Yg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwryzP3DLbuKUZyomyfaMgdQJDfwbNBe+ENcl9/onG9OAhgC9Au
 1ZJSutQXslKYY3c+xNGY05e6tLFwFM4v8DssDi/OukmoRuZ+dVRN/WoZR4shW3UPtm5ovD5nvF6
 FpTyqqgz1rB+WVGVFCIfD2x4ZBoO1qO4=
X-Gm-Gg: ATEYQzwrvWt6hezNwBYcALD3dGYk/zOLHINsbw9fN8+CxuSs9xuDTP6qIKgSDtVnMeM
 LaeatKOUNruT2nrUNJ8DH4VpVGNBJMidfKogcojnXj9gBAfuZ+yX1QFWa2czyFflZQ01XUszBPK
 wK8Ay3t/Sms6toBDcVORdkmUhZEwVB1OvW/tO65FDBdC1vPPws55TGCcoeHiMjCNTatJUNSvm+b
 0aZ9UizmPCN4i8MhAe4YsdEIHWl0QMZTInxj7Jw+KYY1639Y+7CwqRnVl9SpgiUGqI79maWSeQM
 dTgrxrgr8O/QqwjP08qGdjR00lMrucAGFDbkzkaO+aL1wXFqek9briPmCsAZen+AZrF5+KrgC9E
 3SWpKmjQJ5dlLvu+FNLT2a9RkSS3ZZLL8zg==
X-Received: by 2002:a05:7301:658a:b0:2bd:a3fa:9bdc with SMTP id
 5a478bee46e88-2c0e51afa4fmr1076751eec.5.1773860242532; Wed, 18 Mar 2026
 11:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com>
 <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
 <abppV3e91iVzplcv@google.com> <DH5UOS96171T.Z8XSRX583Q60@nvidia.com>
 <CANiq72=bmJ_GWKowAgv+DWQ8FcWK_HePwjaVgeDmRH+gVD-z5g@mail.gmail.com>
 <CAH5fLgg-kgeBw3Py-EZmAEJhm357u5NJP6na4qJe8v3aeFW5Cg@mail.gmail.com>
 <CANiq72nad-60tOJeAfkvHTFrWXQS_wbG4JUGQNnkjm_NvhhaYw@mail.gmail.com>
 <DH5ZP3IUEWMD.TOOZSEUTLV85@kernel.org>
In-Reply-To: <DH5ZP3IUEWMD.TOOZSEUTLV85@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Mar 2026 19:57:08 +0100
X-Gm-Features: AaiRm53Z-cAG5mIpOPhPdv8BAXPHEZ1FbMlHxMtUEupEIZpM9NVL3ZvZ5w4-nno
Message-ID: <CANiq72ndoX123PKYr4DbJpvQaM=1YjYoYhoTq7wMoY51X7PuNw@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list
 interface
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, 
 Nikola Djukic <ndjukic@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
 Elle Rhumsaa <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Helge Deller <deller@gmx.de>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, 
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, 
 Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com, 
 Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 23 Mar 2026 16:04:08 +0000
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

On Wed, Mar 18, 2026 at 3:49=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> What do you mean with extra file?

Right, sorry -- I was probably overfocused on the `mod.rs` symlink for
some reason. We may have talked about generating them on the fly in
the past too, I don't recall anymore.

Let's assume "s/an extra file/extra lines" on my message... If folks
are OK writing manually them, or that we generate them on the fly,
then I am happy I can get the option I always liked! :P

We can chat about it in one of the calls.

Cheers,
Miguel
