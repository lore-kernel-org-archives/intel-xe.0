Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EB7606A326
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 12:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=I3vW/wMK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98F110FC0C;
	Wed, 25 Nov 2026 12:06:01 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D5210FC0D
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 12:05:55 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4ac109a8a12so3329602f8f.3
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 04:05:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795608353; cv=none;
 d=google.com; s=arc-20260327;
 b=Ka3D4C0AXQU865PFxXA5RBECkHYOKAg/be1dWPoPjpWdMIQU2EGHlWH+cPllWN5qXH
 7P8vB1RYtytqiE/s4U0MOxl/o08s8unfilyf/94vtzehJB07BELEy/Ty+wkPaJ0Ytyns
 vYUWzNITpPQJvCS+ifnwLB8e5Xs3qjcNV0vWyojAMUFHpChC52ea4bTiPPt8TDCnTzgl
 FAo3XayJG2NeJLKZX/nnhukyUAcvWWdQzx7myeYMd0PPYawIG6T99D+IxruV957DfBpz
 Mq7ntzqcQ4f4CMVby52mpfOETwtuN70DSmi2L37EWd5vV1ScpLHB/sG8jeC+afBqK6NW
 +kgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=mmpzCTGF7idKvkeds9ux4PCjDdw81921HPWjTxWauKM=;
 fh=GDGzwQI+BZsKtNGp0QpTjDZj0VtXtrmWjiwcTw5GxJg=;
 b=qhEdRosadUJjsnJ1NGhGLJBmqCHN92659N4DzKvRQEq9qbL9lPHe/lAEJDVwyELVbs
 xxvr1N91Lw0llXr8tzy2RwMXrIb8yeRj7U06/ht2c2x55Q1kAhXLmTINdqsgR0uEUcX+
 O0JUi0b68I92q4d0VLxQR6aAmo0CPDBolUbU+OI5oRqrW51Yll5S1ZoM+EJmgIs39uaF
 bSLKrXV5VOeJAyCtiwVs7IYNmmVcVlygBMHbHkkDSle+B9m8LxGyK8GUJxiFDLKzFYs3
 Q6oOtrDL2DZK7d9+XiclkHJCjzlvEnqcuKg5JUhLn/4UTkha6NL76mq9ICf7fROkimrh
 xbGA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1795608353; x=1796213153;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=mmpzCTGF7idKvkeds9ux4PCjDdw81921HPWjTxWauKM=;
 b=I3vW/wMK6nREWVSnNM68OApURRLynde0VyoL+hqZQFoYXs87RPoiI0yMGRFcHOEpiB
 LEQTtdSvwGVlYCbdY6YEOR3T9cQCa7i1Mes+UbXOg2jW6807wFedRhSwytTSRWcbK4m/
 HOoFU0/BY2JCvdLpGfpeWhH4NdM8fnOJ290258z3PgtE3bvzLB/YYG+4M7MR3A/V2SsW
 WqtIggSG1GgmgMIHoWa0zA9tqsnCmvFbV17qaHarQ9HAkGem3SM2x7Yb0oXXCVwQX/4H
 n2SGAdiaJbu5A2hgtGmXGFkxbMBruwgW8SJfvv7evcRMYhmID1HM61Yo/CG6+c8nm+fC
 Ev6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795608353; x=1796213153;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mmpzCTGF7idKvkeds9ux4PCjDdw81921HPWjTxWauKM=;
 b=Bj7bT/gwGZJVI9CSpnXGByt3HjETRPzJy2Q2382mAS9wJ1KmUrAZCAWP5zwnSjTiY7
 0WDd0mQxF4xlrt/Ky+b6DJ22TYXadRZo+7Trh9JpibnJAY6c6ORomRFKycP/VbWMoxFK
 pY6mCeQOphGa8B71ljCYGrSHVEjpZlaFhnbQ4k/0Rm7noBlar2ftnn2ubN4vPlaJRXQw
 Cl2HjfSbPEWio3mhB/ifvNvshXeU2kfoI5eNrIuAqufxU9jHlgZwOJeE1GPL/qampJJa
 VpWuNsmSknPdePbStjuO0wjnKXWaOG8XMfdIwKv/k2NzExK2/RnwLE7dG1o6M9s5qQYO
 6KOw==
X-Forwarded-Encrypted: i=1;
 AL+hErG/iFUFHox/41clUITflLynmsbmFo0UfBTF6ebwSSskM5Xu87PqnIV1JCO/VzFgCGn1f5Q1q16wfQ==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+LKlyaXxtzUnrBsP0qkCnKVOTgxU3/U4PndjKcYof2SFUXDfVk
 vSsDPWtjwhVgYYTX9Y/cwdJV58U4WScgRt4DTHVWUrqTBgNhmxir+FbBs5mkxzvgvA0pGn9W3HE
 NLqQDQw35FSRi2xFq1CH/z6Il0RPpUwuzee+D1WGp
X-Gm-Gg: AZFdTZdsuQl7NJevt+PlZJKZ8Gj6eXbjURfdoHDiGtGVHoW9Pja8+VpeOPrhje0Fuli
 DEjRMycj5fqaCdi+CDrmzGVK9PvkrFPC4KkLqyuxtOx46erxtiKvV5ezZccfvxGFv+l9xOHWdN9
 64K5z4JwSGDZ96nK+II5uRTbjede5dxrI+UbSgEOk+JpsSSfIPq3CvX6GXN1ax5jw/5uroV2mhe
 Bd+Vdy6HLpA9eY+kliaCIDevt5cCli2cCK2AZtslaF+dawPkgCfHV+pziYC6rQvZwShScOtLKF3
 cnhWSF5CI/jvJGQ4buRCVThDZ+hvBQKvYaxvXjPGBK9reN+kLakjSqONbIQib22DKtn0nvMfM3V
 hUAS0kWXCxkPuUBHlo4MKbmkfsXqc8I2kPMXmO11UTptK7XuYZ4yg4yEaLYEHluLxv/fx76WaXM
 jUifgQa09laTAGrXkTkRlUhgld/2K6M3UnP5k1H77L785Y
X-Received: by 2002:a05:6000:490a:b0:4b7:80c1:11bd with SMTP id
 ffacd0b85a97d-4b780c1127cmr8568730f8f.35.1795608352904; Wed, 25 Nov 2026
 04:05:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-ordered-wq-cancel-v1-0-916e01f9affe@google.com>
 <20261118-ordered-wq-cancel-v1-1-916e01f9affe@google.com>
 <2efd4eef27cbd033bae9e4f5d5ba30bb@kernel.org>
In-Reply-To: <2efd4eef27cbd033bae9e4f5d5ba30bb@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 25 Nov 2026 12:05:38 +0000
X-Gm-Features: Aa3M54oB_Bc5JJabfyDqaJiI78UWC2_tVPgPCR0cvXKqYj-o-7hWp3ZKJEhfypQ
Message-ID: <CAH5fLgh7b7vFj4y7Pi-s2-4KuwUQg1C1HD6VdDTTkd+xRWaURg@mail.gmail.com>
Subject: Re: [PATCH 1/2] workqueue: fix cancel_work_sync() on ordered
 workqueues
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 12:29=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
>
> Hello, Alice.
>
> On Wed, Nov 18, 2026 at 05:09:51PM +0000, Alice Ryhl wrote:
> > +             if (unlikely(pwq->wq->flags & __WQ_ORDERED)) {
> > +                     struct pool_workqueue *oldest_pwq =3D
> > +                             list_first_or_null_rcu(&pwq->wq->pwqs,
> > +                                                    struct pool_workqu=
eue,
> > +                                                    pwqs_node);
> > +
> > +                     if (oldest_pwq)
> > +                             offq_pool =3D oldest_pwq->pool;
> > +             }
>
> @pwq still has @work queued on it here, so it's linked on wq->pwqs and th=
e
> list can't be empty. Maybe drop the NULL check? e.g.
>
>   if (unlikely(pwq->wq->flags & __WQ_ORDERED))
>         offq_pool =3D list_entry_rcu(pwq->wq->pwqs.next, struct pool_work=
queue,
>                                    pwqs_node)->pool;
>
> Thanks.

Updated!

While I have you, is there any chance you could look at
https://lore.kernel.org/all/20261119-rust-workqueue-v4-0-707c68994940@googl=
e.com/
?

If possible, once folks from the Rust side have reviewed it, I'd like
to land it through drm-rust-next together with the things that depend
on it.

Alice
