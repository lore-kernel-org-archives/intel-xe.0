Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72292F483C1
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 16:04:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F5B10E58C;
	Mon, 23 Mar 2026 16:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eNcBzaHS";
	dkim-atps=neutral
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4167110E394
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 07:17:41 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-2c0bf0a0236so82970eec.1
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 00:17:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773731860; cv=none;
 d=google.com; s=arc-20240605;
 b=losFVZsDuE3p+xp0ebTzih+frjFz2aCV1x50EQ0vYxYeddXGBRD7JRbN+MT15qRkrZ
 eUGRKobR6jecAOEt/inB3+NNkXeLVlqGu3ZexwtnUgXZxMk5/AsjsHonZA5lYM0+TKtO
 asNgQMGJ5qi+b595Q2TzNjQwRDDl3NExI438Jb5YVR7pDkuelDIjnLlunaqF5ftqdQGW
 6UY3/t1DoBJkRnBcqfhgb5zBoYTf3URzs/qYF1wUD42xCKgGG2FELGXjHupbuwIlevmo
 eyUDEbFg2Lp+sJc1sJJtXhglPvmCvzkbMDRdVOcFnYgVQifjCv4hndqCIqz7f7MgoLM/
 k5Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=JRjFojoQ+ay0ef4If4kUCgywrpzkrXMMzGRlp08g/yk=;
 fh=eqe9hgJydoGYyHjAkBvDRlrYe2brkgIzG2tjdDePwmU=;
 b=ZyaH4zCnWmZCliuQrxjEdhNxVSBbhvGsppa7v73D8qQ4U9f4U93AEshAuuseNYe3rd
 IZhIWyQWuSJ6IPzWux8DgMhUi08UCcsUPZYEbQ6nGpSUnnFOIQinSWXOhGR96WWRn7R1
 vDJHe+/tyEF8tGoDBB7z7f/wruGE9hsqCwgzdY+Ll9xPUxNtYB7QFlieLPRq1loskfs9
 xjBenJXdrcwSJFaJ/gJCXvhYWUAidSHQOzlD/wwj0N2lLw8GoVEgbWPTCo2aVW03W7WR
 M50BiIQFLRbjUqLO/DhmeEbKsfCE3Nd2gbXu2NtAhVCXNMxl7Ko2zwlW5E8B0ESzr6Xe
 7oDQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773731860; x=1774336660; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JRjFojoQ+ay0ef4If4kUCgywrpzkrXMMzGRlp08g/yk=;
 b=eNcBzaHSXi12uck3uK7rd1qtEWdT1GBouy444mwDFT7j9oAPJl2vpAseB0cOVhA42x
 +9gmsGnqLkyZhtFdXEvmu7yOLCxdkTSCQPY1ZYVrgTgzAIL9I3GtrBTRn0QE1cHVbMKV
 n1xN7IdAuAqeAIdEbIi5PC7zvh630eaW+IJ8MGITiylQvoRGmxZEftq7ZMPTR8tym57x
 u3ufufPoSMGTArwXNQD0NZjaG9iP6PdLkYdeGTLIgONYR9y7Be7HhB3+CyQJWrNrXU9E
 cofOcI2mQP71B+duyYnsKHNhJkNKU/xcKpiVkqc1UwYpJcOvKVMyFl4qGOqVkQzsgcpV
 XSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773731860; x=1774336660;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JRjFojoQ+ay0ef4If4kUCgywrpzkrXMMzGRlp08g/yk=;
 b=p7Ri6cGKcybQNZIkjfchCblzYS7AERb57+QJtNwhnzzRcU2YCqa27gYizxXF9BoULn
 3vSPLeYg+9fi9Uv+yROwq1iuSNJt+Opk0SXbwUzELX2DUItodmznLHCPrn6sVmSUgnaC
 6i1QWmuLAOA0aOIWcF+1BuM62Ssc7kJb3KdPM0KyLAFma9kWhcNdTdYYJR/kMqN1KbWD
 YYZPGCxOIfPWty7H35oBCqcpKkYfHih78o37y4Lkj3MNwIUArqqSPOT4HKToWO/Sxk+Q
 xF8cRtd8fnCpjfQ0eknjBJts7wYYHLjYetNxf+Cpihy3AiwUXlJHbZSfAVEj0+Ekprz3
 ez2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJLuQIgW5nDzvD53gAgpXUK46Y48XXZffzMMj5QwcB4eaMuOfNygD8x8KvTi2D6/CmtwMYgUzGjA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxwPHg5QwNp0Oz2uQd30YMJC1eAPahHBpVcCpa2YPzzRHxfpAq
 FkMQzgJDbLPwxRToduXcrUQeQ6QURtdvNj/P5EDfIjRbb9Ec1slbgOh37jyta1m6D+rfYNoaJV/
 Z2+D61GxlCyYNnCD+KIKdn6ivVlYIDOo=
X-Gm-Gg: ATEYQzyt7x4temBg/HtuhEHF1WaDNPxmigRivfylBjXbL2JivU11P36oED37YEdgNkY
 w6FW3mKK/KJUZdhMSkNVpsj6S9h5O+ywTbZXiJPXfZC6pcAkCFc58z6pLsC+xXbYAMD+lQVZifz
 pBGfHwL/zevgTalO8oxv4i1xeePrkFZvBOObFPJAJnw43NIDPHuWN+qeRTWotHsuK3Iu/qYa/Ao
 sYNmBKwY+lS/DfkG1zMXF9SgbcJRKQMpqCa28ZhTw25s6VvdhTHoqEi+dbCnk7cf5eH9AjdUoK2
 pwweVkpN9CxK98sWHmQJTHbUNFou9N3EDyMD6MvNlpudsHVDtZYZl9H63mciteWHuFUFnkC/dYS
 NxKSHKFjxmojvPwXs6IQQ934=
X-Received: by 2002:a05:693c:2b17:b0:2be:6e6:e479 with SMTP id
 5a478bee46e88-2bea539710emr3854426eec.2.1773731860241; Tue, 17 Mar 2026
 00:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260316043255.226352-1-matthew.brost@intel.com>
 <20260316043255.226352-3-matthew.brost@intel.com>
 <7A8108C7-7CF0-4EA4-95ED-8003502DC35A@collabora.com>
 <abjqfXERS6Xk4FAQ@lstrano-desk.jf.intel.com>
In-Reply-To: <abjqfXERS6Xk4FAQ@lstrano-desk.jf.intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Mar 2026 08:17:27 +0100
X-Gm-Features: AaiRm53oFtZ4LcqzAMb48PPD1CPMNBFJZZjv3_kfdhsd5ZRjk5fQUoV8uzzbJKY
Message-ID: <CANiq72=Y2g_5=iEzU1L07pMPYD+wVapJXpp9rvYXEzCKEs59Zw@mail.gmail.com>
Subject: Re: [RFC PATCH 02/12] drm/dep: Add DRM dependency queue layer
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
 Jeffrey Vander Stoep <jeffv@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Stone <daniels@collabora.com>, Alexandre Courbot <acourbot@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>, shashanks@nvidia.com, jajones@nvidia.com, 
 Eliot Courtney <ecourtney@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 rust-for-linux <rust-for-linux@vger.kernel.org>
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

On Tue, Mar 17, 2026 at 6:46=E2=80=AFAM Matthew Brost <matthew.brost@intel.=
com> wrote:
>
> You can do RAII in C - see cleanup.h. Clear object lifetimes and
> ownership are what is important. Disciplined coding is the only to do
> this regardless of language. RAII doesn't help with help with bad object
> models / ownership / lifetime models either.

"Ownership", "lifetimes" and being "disciplined" *is* what Rust helps
with. That is the whole point (even if there are other advantages).

Yes, the cleanup attribute is nice, but even the whole `CLASS` thing
is meant to simplify code. Simplifying code does reduce bugs in
general, but it doesn't solve anything fundamental. Even if we had C++
and full-fledged smart pointers and so on, it doesn't improve
meaningfully the situation -- one can still mess things up very easily
with them.

And yes, sanitizers and lockdep and runtime solutions that require to
trigger paths are amazing, but not anywhere close to enforcing
something statically.

The fact that `unsafe` exists doesn't mean "Rust doesn't solve
anything". Quite the opposite: the goal is to provide safe
abstractions where possible, i.e. we minimize the need for `unsafe`.
And for the cases where there is no other way around it, the toolchain
will force you to write an explanation for your `unsafe` usage. Then
maintainers and reviewers will have to agree with your argument for
it.

In particular, it is not something that gets routinely (and
implicitly) used every second line like we do in C.

Cheers,
Miguel
