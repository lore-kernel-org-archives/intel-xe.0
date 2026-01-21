Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D86D3EE6D
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 13:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9561B10E9B1;
	Thu, 22 Jan 2026 13:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="va3Wo3uc";
	dkim-atps=neutral
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B61A10E851
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 18:13:00 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-8c52e25e644so12749185a.0
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 10:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google; t=1769019179; x=1769623979;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=odBgMeGleRPkwApB129VpN2tHRH7cELn9wuHglowA3c=;
 b=va3Wo3uc4PCH9CBrnqiRI4nd8mCaa1V4xh6Eb1Ixahcv/Y1G/cJskLPUutHYMn+LjN
 D3U9jbUClVAkqVeqTw7xf8y3RS8NPpvKQnmSxRjuzy52kUBb42r6DAyZN8x+1p/gpMAI
 DCGKqE9S/PRZXdxT1TEd6Rrnr1sA6t7PDxkCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769019179; x=1769623979;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=odBgMeGleRPkwApB129VpN2tHRH7cELn9wuHglowA3c=;
 b=pCFZq8hwRQzwVYgvGKcbepWdZ6kzOQdFjm/YSi/Y7M++R8CLliag3056fLFsyR591F
 bspPtJt+Cak+cwNZB7EskNZQKYEUmvZIpbb/Ha94P7s4meD9CCE/HLiMSfmmXGdg9EmX
 rS9Z+4O5WrfLQTyBGo43GYy0JVZ5Wim7JkX3xQxMM+u2UTLFPoNcGrJ5E1P+clw0PTOc
 bqHt1illsQt8+6yHqzh6HR4mblhmlgunf8bthMiwpHXPuZLF/LwZTbB2gCgpyNegUEZG
 ncWP6s0Mm0wNKBM2zr3r5eYvXDTITv8Sd2hYtk3F3jEiJIBv7n0gLi6zobxAuDvO8ckr
 Z51w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbJrAKYZBnnerwRIUZhqhPo7ew+seJa/FqMVFkpRX7/faYMaP/XXO5RDt46//diNCgxWT44PcspA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynwZGTYRIhOToY+aiMk8GUjUTVpBU6gevANalH0GIFQELhchPA
 ya9I1GtUjvojS5No24IqohKpUr+X+HtrfjpaG4NVkvxVRUPgD38LYuHiJ9CAyQwhmvE=
X-Gm-Gg: AZuq6aJO7PLU0yaZSRj5H3/4ajK7PG714QZhumLaNHvaA1059vn0gxtnJalD5iYbwFE
 uYh92eCYVz7AUHNIv972aIP4xXzbsQpPHdoUGx9LJa9mn4UCp00+VqKHp4gOZdj6dZh5IWS8I62
 TThirtNpcC6ZRzkxUc7QV2UAsG0cZXLZ2DiOxB8DfGxkMZvlJGIfPKigyUgFtWwzo/ekI+yyaM4
 8KNj95JS62LptfdYRNf4dcTWPB9gE2vvVlAlvg1HgV13b18E25wsiPyGD6POmginFhBjg6ghL1Z
 pTrAdE/qxZ/Rbb3ki8JcsLwCYSnOxgtU6FTzRclAEq+WF3LTfKvSPRvCFMwWi3rQTz7vSFfzPD9
 4DvvGBOIHWtTBOJVbeuYfbRLeGwScR8KfDZ6x2xub6bCNpSVsdmJJabj7ERcbq0bk75nwjNtEY+
 OW46tS9aAa3J6qAVEIAgzXplaqbg==
X-Received: by 2002:a05:620a:2d90:b0:8c6:a790:cd09 with SMTP id
 af79cd13be357-8c6a790cd9cmr1883910285a.40.1769019178697; 
 Wed, 21 Jan 2026 10:12:58 -0800 (PST)
Received: from [192.168.0.99] ([71.219.3.177])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a71ab288sm1356284885a.6.2026.01.21.10.12.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 10:12:58 -0800 (PST)
Message-ID: <237f94cc-dde6-4d91-b942-4854e62eeebb@joelfernandes.org>
Date: Wed, 21 Jan 2026 13:12:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 01/26] rust: clist: Add support to interface with C
 linked lists
To: Zhi Wang <zhiw@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-2-joelagnelf@nvidia.com>
 <20260121092730.3628d290.zhiw@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joel@joelfernandes.org>
In-Reply-To: <20260121092730.3628d290.zhiw@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 22 Jan 2026 13:38:39 +0000
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



On 1/21/2026 2:27 AM, Zhi Wang wrote:
> 
>> +/// Initialize a `list_head` object to point to itself.
>> +///
>> +/// # Safety
>> +///
>> +/// `list` must be a valid pointer to a `list_head` object.
>> +#[inline]
>> +pub unsafe fn init_list_head(list: *mut bindings::list_head) {
>> +    // SAFETY: Caller guarantees `list` is a valid pointer to a
>> `list_head`.
>> +    unsafe {
>> +        (*list).next = list;
>> +        (*list).prev = list;
>> +    }
>> +}
>> +
>
> Might be better to have a C helper? since INIT_LIST_HEAD() has WRITE_ONCE()
> for memory ordering. This one seems not equal to it.

WRITE_ONCE() is not really about CPU memory ordering though, it is about
compiler optimizations. On the C side, I think it is needed in case of
list_for_each_entry_rcu(), to avoid the case of invented stores or store fusing,
but here we are not doing RCU-based iteration.

Anyway, if we want to future proof that, I am Ok with adding the helper back
(which I actually initially had but feedback from past review was to just inline
it into rust).

But I am not sure if we have this issue for the Rust compiler, like we do for C.
Rust does not allow raw pointers to be concurrently read/written using plain
accesses, so should be already protected due to the borrow checker and compiler
itself right?

Adding some interested folks as well to CC for the topic of _ONCE, +Boqun +Paul.

--
Joel Fernandes

