Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC78103E18F
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 14:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3342E10E120;
	Wed, 18 Mar 2026 14:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="tZiWVFHj";
	dkim-atps=neutral
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF9F10E70B
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 14:31:26 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-43b4f48c47cso1429869f8f.0
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773844285; cv=none;
 d=google.com; s=arc-20240605;
 b=CsBGcwikP4SA3NiHioMNKSZf3NLvHHKGcuJn+u4+ZpIbavjpJNqpjOk/DTjOKVEOMZ
 dTTbTRpw3PGAZl7tQ6pYIZ2LaP5hUa0R0iEXT/Xrh8X7rm+Fcxkw77rz1lQctb4vC8EX
 VkvQlnqaYf1l+m6h+yoAjmzUv0sbwu5HR7uuBlm5PHjBVDme09hX7CSAcnoSD9nY4aWK
 X0pTH8hhyuHk9birBQAb6V4EuTV5ppIjqdPrh6cqghtgvMZ5yJsCp4abkjBfzyEFpjKs
 5nQFMVKaWuzdVojEhOCViXjviXBqJKp+itLFSfU9XnBwhAvUSkgW8aJbuqQYhBpv4FHx
 ntAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=9Oke8F3j0iNZ3cSK0OCeOVMy+GmzWDcEKfA0PeIuC3c=;
 fh=iLRl8AobosZU/grh1PkRlOMqTjt5GXPBRo4u/cNRh6Y=;
 b=aY4UznHUpP84tpZmdvovS4aaoTMJx76QGbM4OnG2VTBfJIIoyVScIUczsH2hwkuMHf
 47gQe8dzDjTVPNqeIbQ4Q/BV4FJhUgXAomM0ZUUXXFzuguSGdCjZr1hwJ9djfHpKWUZ0
 zgFn4bnxqJqMs/AIbOJlg/98j52f+JTx2oG2Ur9NaVf9CStGuRTbtkAWztR4DgyWeao8
 2Burd4fyjUcLEAy5C+QSXh/sZTguiVSXlc9s1ARUVG/K92rVtSrP7rN/c0HwPQZfE8Fo
 SojnQYt/HBVK6kNm3X0bjliMSw5Iy1Ve3CQsP2ptoOYU8bQvTDHIOfU9RdW7314dqWcS
 rpWQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773844285; x=1774449085;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Oke8F3j0iNZ3cSK0OCeOVMy+GmzWDcEKfA0PeIuC3c=;
 b=tZiWVFHj2+g9DuubpbvnUXJzjWS5yRLIEcmLhSkfowhQcU3h/pW3rjvyiXbGjc+J/c
 yMXzCnq5OHsbQLHh4+cBCjDzAMD/CWOZz+ZIib1V9AfKHxoUg6I6Sstd6ZwvHtXhhnvu
 Le9Pe1kBpFN1rF8CWmgr+R2SZT1/2+bgHO9STvNDgbH0RHMrGJvOWtiSDTBHKi1Up97I
 Vm4gFHYOBRIfifX6Of4PjHpHX1fogGRo6PaqPa/7hsv56sri5qan9WKTEzb7iMUUV6Uo
 rlE1gPcXYzpDPNPYKYLtupYS2L64GX0H45xTr4ip0Ra8LQNhT46Mvpvy9/Da4Nb8lTwp
 ZVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773844285; x=1774449085;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9Oke8F3j0iNZ3cSK0OCeOVMy+GmzWDcEKfA0PeIuC3c=;
 b=Yq8Q4ssgZZjVNzesQVMyI5irUouWoMymDqT8gyR10RS4PaC44p9Cv/bh7kCY4XySHC
 GCNW+w0lBHBnbbP9DdWWfmhj8/Pnvepz8/KiVVCPZTuKeHRxRTnJOVu3im+aFUZ2jTAp
 KSREKPfY0/85FOPDfYSOPjKpEFvrAXWr/Jimg/ZJyvynwPfkAYoWxBqcX+CGzldSZurt
 KRG6vhvLrmoUHKm9o2HZx8hWN/Qqq/3pl14Q/wrxnNRsyfJRTw9Jk0117TgCfGUU8H3G
 JCoCgOM+sUG0SbT+zkMAitIMCtHv1CJG/jVIX+jDCJJJL9XOfiKoE7BD22pr6TAmnKXH
 cluQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwAUX6p/sw5yNOYpDhG6cs2Yq6gSDPfIvDO5qwZ30UD2JfOTbTw4b6jBeBxd04wdNiij3CNVQmYQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMTdPiyIRZJyJwP4HZI04Otl1dfAgkVEk0WV18+fow36oCgtj+
 a8qpTMUAbmXap+CoPIY6BS1Z9Hq5y9XHhHif79NAed3rTDIdqBR7h1krWG/o+Yz9jZPifkhH+tq
 EXQXYeVCP+fVqaklAGgWT8dBHqxu4IgxwnGByKQgQ
X-Gm-Gg: ATEYQzyAZJZeZP+fLe5fwGLqMqLVLmzOczF2dSy9L9UoWL0tZOwKm5VKkMqe2QT5qhs
 FwyM6sSpKyzbjGgMDY5sji2HTBuGPhPIQljreFsGjgxmOEBklCYiNbEOKEpoqwmx/ATautfSFKP
 YxhMhFWq2EZVquXQf5+6lQzoUHoYUMPmzinhsYoU38Eg+BXgcOBJzC50t10yIMKdimwk1mgPDdG
 XfHtnufyJm05pqp/KFwkg8aWa2ChiQxKHpc82RaHvViZplnbV8VBCwpsnnmB0Zm+I45dInBKXKY
 b5acXkGhvkqN+YcOcq83FcpjvZzV/J6PtLQxvfjjuyPcUn3rvnlbrXJAucH8tSc32/6RcA==
X-Received: by 2002:a5d:5f43:0:b0:439:ca85:8848 with SMTP id
 ffacd0b85a97d-43b527aa344mr6004289f8f.16.1773844284463; Wed, 18 Mar 2026
 07:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com>
 <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
 <abppV3e91iVzplcv@google.com> <DH5UOS96171T.Z8XSRX583Q60@nvidia.com>
 <CANiq72=bmJ_GWKowAgv+DWQ8FcWK_HePwjaVgeDmRH+gVD-z5g@mail.gmail.com>
In-Reply-To: <CANiq72=bmJ_GWKowAgv+DWQ8FcWK_HePwjaVgeDmRH+gVD-z5g@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Mar 2026 15:31:12 +0100
X-Gm-Features: AaiRm51O3ZORqMPG2oSnP3bbIvsHXlypg7QXuPo86XIFyKOog2BgXzbGuVDuzJY
Message-ID: <CAH5fLgg-kgeBw3Py-EZmAEJhm357u5NJP6na4qJe8v3aeFW5Cg@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list
 interface
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@gmail.com>, 
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

On Wed, Mar 18, 2026 at 3:21=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> [*] I would have preferred a middle ground like  modules being inside
> but repeating the folder name, e.g. `.../pci/pci.rs`, but I doubt that
> will ever be supported upstream since one probably wants to support
> the other ways at the same time.

In principle this is possible using

#[path =3D "pci/pci.rs"]
pub mod pci;

Alice
