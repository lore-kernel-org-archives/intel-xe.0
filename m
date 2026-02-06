Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865A1ECD9B7
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 01:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3707F10E00E;
	Fri,  6 Feb 2026 01:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FOGyYXNo";
	dkim-atps=neutral
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566C010E22F
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 01:48:59 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-8ca3807494eso107870885a.2
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Feb 2026 17:48:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770342538; cv=none;
 d=google.com; s=arc-20240605;
 b=RzWzlI7HU41eOKhdjxLFRhQKGY67bAWeb2VskP5pR1i28HamUOeM1qm/Z8cLzItO9d
 NvYsjHo5yn3at5deOXHcXxVspTdyE1ryeVhUBV/VSbcZsEzkQAj4dWcQkCN+2UCZhSa3
 xEyq3nFSxz05eaWD6cpy9WP2wF2ILlIKHYbKOzzBDZGqC9Z97gN7RC9sWi8ExnZ3HbRn
 WCjn+Xf8/QdaxJpbtfYOP9J4CCdXwMh75gRWc23UZsUI9W23nJ8J00AEEauJ/m5AF5yX
 3m3d2iTxEvVDaj52zJGPKzv4rpvGbZF9OghtH1KuxM0YnHT1UGD/rFYr6QiRYSQCuAr2
 pUyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
 fh=B0VURScxfnafL69N+f3VTrG9/S9+frhDg3MHr+qMq/Y=;
 b=VazFbqnCt4gFS262qxZHVq38a/fxumtqHM6NbxKXnezV8rfhROMTKj2wU7wJLoFEVf
 yReMgjHTa8PV5+S1xHDIynYdJAZBUKQNS4/t3Olc3D6C422lrFVyB65/8KW4akDZ8YUF
 4r8FtebrQnOk0pZefYD88gDfDOBt5baan6E/BBHQG+JNqYgIW3OcR/xJiiaLerezXKXV
 e+5Te7aheepJINMNYfIYF0i0HPNc8Jw7Zqt6mCUv+YKzNFTyYbIZmxbKvKJnM9yzcGeS
 cX3uM13SA7IhumkyHYfR3GjoiOCI5w8Zil+tu/MjXZSP2xMsJGMPxQMmJVxNu+7iOmhT
 spvQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770342538; x=1770947338; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
 b=FOGyYXNo3zdhE8TI2jZvS3WKO9tc0UOjwoHxA44fr3olnCUVAYjEt1s2Ijbcy9CmL2
 GFElgEB2Fr1AculDojwKTWUEFc2SOluzkosXBVs5mkwjPnE6h1z+NjkS0BYdU6n0AP9K
 +kzW+eVfatMIQNNNLNKd0sR5zpRzn+kY4CiUWEMgJIIz7bRi66pWAUmwKWErbxV0tNXl
 LKRSkp5cc2RO3Y1iy2cE+I7Ap40WKPBpD7xjqn9KMdGd1qhpZFMuSg51MrkyBDdjxZNj
 IEqfGOG6bZvOQWFId6fvab6/HojTvcCF2jsgSsYt0j9WgxiK90GEuC9HtvLCR8NO/sbf
 vOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770342538; x=1770947338;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
 b=iSsmXocch7xqaQBkESWCs6nQK+rxodURaQkggQRd/EnrVWeeW3SlYbp6b2EKeM/fEY
 jLT6kqji9uF47UABqtFxXODL+vJcqGMRnikk9scQbrpypDC+alBCTtbaShjePBLw050S
 59kpM51NlXf5H7oN0Mc93e6dEGthkLVfBywRbAC5fsQ+GfNpIMdhbflBJTgL5Hfads5F
 oVJnB1rV0LibuuJklaPRoTL3UZJcvP+NGDcXNQHa0Y2VygHZ3RjDeA0XSW9DPSK4UwZZ
 ybxHEgiwlUyQ3yK7qMKMsVSPeOgzAOkdWYiEqAR+lrFYcSyyF0m6AqIKDzMYFrEcWbAQ
 QcVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWry/FfXWGebiAEe/clovQWwfDGNGXYtFF0yY7VxGc5XReBUOmnqEP0N2c/8SJ/dNDJjkzCjtdg7g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwChX1RxQfP1E2ScoI6k9XjHNt3bYxS8II/w8PA435MYnb01ww9
 UhuOiezmy6rhayyAcIpQIubGho8DvKLjVasL7zcPrMvj63vEgok7czexrnt+li3me9ZgGDVK5+n
 N7N/z9O2T8aA0CtkHN5KOwH0NTWn7aks=
X-Gm-Gg: AZuq6aI3a81NCCgY8FQZhmRjehuI+dy+14ZAtazy6fyoFMzOknvKmptXY9aKmQcCVYk
 63Xc2Zcmx0vSqZD9F1wJd4xpBUnihCmsBPPGeOxI3bANENhTESO2wsiViEY/qwAAXLjBRtfHj8I
 FCyb83jiW4eXdXc6QLbOre5bxhkxNfQ9D3S2+w31w5HAvZZHvW+SNC63I5K2nDQxzDA2CtMdttL
 nOrS3ysYWh6WK65RzN94k3jTNeM5HT8CgO9dnn0rSOUwHLd6dq/rxywK2docaHRLlo0wZETLEX6
 PpcahchbQMf5aeBARDdcJlRnj9oE3NquhclHF0HiUEaAI60rdtk4moE=
X-Received: by 2002:a05:620a:470d:b0:8ca:123e:8194 with SMTP id
 af79cd13be357-8caef409c65mr147454885a.33.1770342537850; Thu, 05 Feb 2026
 17:48:57 -0800 (PST)
MIME-Version: 1.0
References: <20260206003451.1914130-1-joelagnelf@nvidia.com>
 <06ff773a-06bf-4d60-bd0a-75a0359ce41c@nvidia.com>
In-Reply-To: <06ff773a-06bf-4d60-bd0a-75a0359ce41c@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Feb 2026 11:48:46 +1000
X-Gm-Features: AZwV_QiCn6zHej5_Mme9jV7jp01t4GcOY8De2NKm9jmAO6FZQzlBgU_JLG2YX-I
Message-ID: <CAPM=9tw=jzQxGvVrsUSv14RxQtnaw2rH6K2b3Gxh_UUHnOGTkA@mail.gmail.com>
Subject: Re: [PATCH -next] gpu: Move DRM buddy allocator one level up
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, 
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, 
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 joel@joelfernandes.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
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

On Fri, 6 Feb 2026 at 11:06, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>
>
>
> On 2/5/2026 7:34 PM, Joel Fernandes wrote:
> > Move the DRM buddy allocator one level up so that it can be used by GPU
> > drivers (example, nova-core) that have usecases other than DRM (such as
> > VFIO vGPU support). Modify the API, structures and Kconfigs to use
> > "gpu_buddy" terminology. Adapt the drivers and tests to use the new API.
> >
> > The commit cannot be split due to bisectability, however no functional
> > change is intended. Verified by running K-UNIT tests and build tested
> > various configurations.
> >
> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>
> I forgot to add Dave Airlie's review tag here from his other email. When you
> apply, could you add it?
>
> Or, let me know if I should resend it. Thanks.
>

This one was a bit messy, so I've taken this into drm-misc-next now,
it doesn't quite end up in the same places as yours, but it looks the
same, and I updated MAINTAINERS at the end.

Now you can just care about the rust side of it.

Regards,
Dave.
