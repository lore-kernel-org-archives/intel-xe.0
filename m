Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6427DF483C5
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 16:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A41110E536;
	Mon, 23 Mar 2026 16:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="APFO8JnJ";
	dkim-atps=neutral
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B37410E733
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 14:30:46 +0000 (UTC)
Received: by mail-dl1-f54.google.com with SMTP id
 a92af1059eb24-12714f01940so437029c88.0
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773844245; cv=none;
 d=google.com; s=arc-20240605;
 b=DhCpQgIXNNSzf6Vf/4BwUpNsFdd27/fBpB+NPNv6U+i2LFqbOw1hDqYt3B6FLYDWnj
 o/wHBGjuGAjpmG1kOucShjYlLfQmUn4fL86PJXdTFLG3BA3iUSVoDb5vZeje815hjwER
 bdOkNXoEjbEK1a6EaSxvdIy11xPBuraP6voQpU6zfaJkrFRnwYi+iLFQ9M/UcBNX1HkO
 KG/TryC2L5Ub5vf5qTIeQnt6uDMRoThZYfFPDm9bBDivWQjE+Vtp31GisF/2DDKbGiEA
 owqxA5iLxFmsaOutdTJpYJqWcHNlNe2Ynbp8s47TX6ONAuPbx5eRW02Af1HTHIgeMPT1
 OqsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Lz2XCxRPQhc2ZncmeIQiQRFj2Y2HhTtKvhZaZiMtVkM=;
 fh=q9oliFaPg0rn54nMh3bBMcFRwECTa5wOu/Lu43hHWZ8=;
 b=ZusDEyG2LRlrEupdkI8QiwHXZNzuISc5OXNfUO0YOBC0FxR984gxn8Xmx0QVifzO1Y
 UJz8ICPncIXhftIflq+nBAmDU9eBShoWXBNUuBweLVZFZYjr2bup6yNpmZl0Gw9kHLcV
 c3ETfALp/iKS+3Dl2lWQBYr3jKdg/1y29WOfICwvYD8DhOlgoEj9n6UqIU3GSHxJVToF
 F6hBDLoJ3VTWgTaLKi33z2Zvsi0QwzNZ5xu4EdZID5TR72RN/yloSLP1VthkiV+cC4Xb
 Y03GCeWCzETcTmuXnO80LIG8MEchTfgw5a9W6EJkFjWcIgoWlxyYhisFq3BThKZ/dZ/6
 GCPg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773844245; x=1774449045; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lz2XCxRPQhc2ZncmeIQiQRFj2Y2HhTtKvhZaZiMtVkM=;
 b=APFO8JnJ1yOoESUujcgaa6jVuaKJ+IvM89d3gFOWGcbiaYfaF8HgHZ5zc6lRral7r3
 ux2M8j6RSBU0vZ24PNLPK15xLa+ASU6gnt5Op8mDHwASbjJEuDEvQylNbQz8yO/G7yw9
 DdKbVOiN8J3DWqQADX4jPbr/V25XaW/0jzMyeHfCLkPViNXj3thVDqhw0/WzU7R3m55R
 SHZ/rziRd90fvETjLOvH3outj3i1jSnekOBcz+ZjlwuwgEZ+x1CTXb9dVZ4rikrJDYPo
 EpOAWkx+JhMC61oj78qloUcNQ+bL+a4xRuEgJ9QTSFKz3nt2QlvH3RysOtepAOYQhDm7
 S4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773844245; x=1774449045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Lz2XCxRPQhc2ZncmeIQiQRFj2Y2HhTtKvhZaZiMtVkM=;
 b=NgY3SFUgK3NugHIGtjhbCnWfaK2VqnYUyskQnFWOEyN6OgM7+IniIzKBtWuDeUhXyS
 Pbr61dKrxcG7/puaBCH4qpW+fvfpUbL9DYs7n69UCG05eyMTtl+2OhCzydeJnlsonBPW
 mizZ5sf4arSeUVOEbUdwPgN3YTz/Sg0TKccPI2M+91ZU+mhA3E2aD2XExJ58SmrT1+Qw
 Ae7cicN7LFE2Rf6RF5J3c4l9mKzgnlXWER1KISijkWdr3cnODXL8ZQrhESrkAcK5X/ng
 m8a1F56hCTpDBpB+C3pxwLpKcIl8IL1MI4/uwqY3noc0Zt2P6iL1oXoTpF2QdKKZFAS5
 rXRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqMHZCyrx0KqffU6xyEArR3r+L1G/i4d+oKtK6jqwy/d/Gc942LzUGcCZLcG2RFpQEML89UH58Jg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd3evXC+05wQKbMi6ycst6oXtgJjULB4dyh2l88Vw+JkdxiwX4
 VZvt+q0hwu+NlpDy442k+oR8Bbu+xfozdHPR+Ncw8U43/fLHditzUDNI19lZxZQ/Zy/QI1mfYjE
 0ZtlU6Vjzv8VM3MiTqUmCzDcIvBOoBfs=
X-Gm-Gg: ATEYQzy5jOWjptblTAX422GLA/odLtXEiynmtv/o0VlxCI5vcF+xGJt7zRRRjEfMuwt
 8u+KQvFUSS88QYq3Z6PtX5XZxwbPdUn8P+tsZh6FAb0++7QS7/gzrDAjCJUDs+MiBGYRq7lWmSl
 9e/XQq5GVShQw1vyvWrpZ+LJ+kJSbw2xVaen1FXFDm8zGAwPL3RxPSNGN8BGBumRyCCKmfnf4+f
 7ON2KUrG4RpGEhj+TAJSdDhml1S8RWbTOO0xwIMJz09x2D/g1xKjzqm8EyUnOTLlKrJPkBbj6AG
 d0q9FY/05hHi7+4Mh4PnXav/mE+YNSvUVWPNHNA9YjufYPnHWBpR+PbWpgFpp+Bp5YaQ2JF56s9
 ggvBDFm5a
X-Received: by 2002:a05:7301:1e96:b0:2bd:fa8f:77f4 with SMTP id
 5a478bee46e88-2c0e518610dmr846274eec.4.1773844245396; Wed, 18 Mar 2026
 07:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com>
 <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
 <abppV3e91iVzplcv@google.com> <DH5UOS96171T.Z8XSRX583Q60@nvidia.com>
 <CAH5fLgjUMaC5v3SERZLosdD1ajU-fvKSgNq6OgbBBcoTS21-Sg@mail.gmail.com>
In-Reply-To: <CAH5fLgjUMaC5v3SERZLosdD1ajU-fvKSgNq6OgbBBcoTS21-Sg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Mar 2026 15:30:32 +0100
X-Gm-Features: AaiRm50bVmwgAQrBl1Sd2LWxaRmG-ZY7uRxgxq5LrbNAlb0we3rijRktUCTLM4o
Message-ID: <CANiq72=GGicUCODkY3C8U53wQfsuRYeu9GiwrM5eFhkP99kiHw@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list
 interface
To: Alice Ryhl <aliceryhl@google.com>
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

On Wed, Mar 18, 2026 at 11:59=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> I'm not sure we have discussed it in detail yet. Both are used in-tree.

Yeah, we have discussed this several times in the list and in meetings
-- please see by other reply.

The handful existing ones I think were all created by Lina (so perhaps
some were kept as-is to avoid extra modifications of the patch -- not
sure) or by you (so those don't count ;)

Cheers,
Miguel
