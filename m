Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79937EFCD63
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 09:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABFD10E4BC;
	Mon,  9 Mar 2026 09:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="IdBAm2bZ";
	dkim-atps=neutral
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0CA10E4B8
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 09:36:40 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so20053195e9.0
 for <intel-xe@lists.freedesktop.org>; Mon, 09 Mar 2026 02:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1773048999; x=1773653799; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=a51Sey8VDQkf7osB3Kx2bymhC7fw4rtQCaVaDXNwQII=;
 b=IdBAm2bZV4OW4h0OoRxToq9vidLD3Jd8wzF9RgdsafVr+HhyKZBlcz/KLaZY80mvlm
 NSHmG8n3isn4Rm+XHJXELlrUM7M3Z3dUz7DW1kUGMyJeyfxWH8OJKiDFZNOV+ukds9EL
 ATZOD/Ck+ibDYmf5W1hnuRHH9NKTWpTxZO/G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773048999; x=1773653799;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a51Sey8VDQkf7osB3Kx2bymhC7fw4rtQCaVaDXNwQII=;
 b=VJPs7L5LY9Qdva6hlDUsyIo/YL5dA0gPYXOKh6j/f5DL8fQ1zyflFblP35YzAF3A0s
 3Sg3LXaTlZ96r/rw2jAlnrgFj3Vu0VeiCtLLaJbOmIvWIBx2GRcbivJIG4IeqqdYEyg2
 leObLGp7/riRNHZAk9KJ3UaQsXTr4laIyopFnyj8anKbxTHmPzn4Wb29Kw+W1mFFyFOA
 Y6RHgtofy+M4FOXcunrYI5PERIHkCRIQWmGr40NZoqA8nTj9VDq6VJCt703Q9ouf2hfF
 ZJavjH0l3wcNbXt9J2VxseQgwkDgZE0uLJEtdqu9ejBGo4EjJRcnKDlMnT9NwuDoNTpo
 Pp7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYHxAeEHz+ZC/aF5dj4vnnK4KUMlT2lmmkOeDPGolM0ddALu3xHuSez5N0BP3PWC5Y7csW4EEfOQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiuFh2F9JJiQ4EbAAln8ooO37QsMd6sfXIC7eCQnBnBkcpAEiJ
 b9y+MALMeJcOjfZTGDGyeOHyYyAci6+aF8bpAa2rz4DvJGl6DHJjXnmBgTP9bpZWNGI=
X-Gm-Gg: ATEYQzyYEEdLAG9XP1EHvigtaWWOGmE973VUbFVO1ulj1yKtQAuIV4NPJ7gnq8vzhM5
 E4rxPaJShcu9Qu9Ruenqyiy5yD18+W4oFkdjVLWzmlOI83GXuiT9Xj6ZYMh6cXlqAOw7LX14R50
 ZCkGpxTPvIi4mK7wmvbTNWi6IIyVZQQ4AKDFOyiX2yTrOPPc1zgRuy/i7wRecRd+gHgx3w9ophp
 pzT1i9FJyDpDRLh/EfxFeEQWr/OWOUqHDjJBJapk+TW1ttPp+9Sbkqw7LH3yDBzkbg08ZT+5aSJ
 rFVmPEMZ7BIXP/aXbKcB19++f70EO16HzOYA60+pRJyjrU5xaSjozEf1XaewJRCQ7ZmiVLhRgRq
 w+5zFteO0QRwSlmyZqoZNfWtWq5l149P/u66dqwK1s4FfsWXHE7xTs8ixTZmfhyN3n0vdbpNOkD
 UI7HaFTYCcE29ataMTmUGWRddt1r0C5i8InYI=
X-Received: by 2002:a05:600c:4752:b0:483:7783:537b with SMTP id
 5b1f17b1804b1-4852697a593mr181033875e9.24.1773048998726; 
 Mon, 09 Mar 2026 02:36:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2b9ccsm24331163f8f.19.2026.03.09.02.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 02:36:38 -0700 (PDT)
Date: Mon, 9 Mar 2026 10:36:36 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/ttm: Don't spam the log on buffer object backing
 store allocation failure
Message-ID: <aa6UpF-PlTLlb8Qv@phenom.ffwll.local>
References: <20260227160012.82309-1-thomas.hellstrom@linux.intel.com>
 <20260227160012.82309-2-thomas.hellstrom@linux.intel.com>
 <fe4d93d8-5c9c-460b-93e1-5d0d49a316ab@amd.com>
 <4e9ac4fe88f4b8aec161d4edb4b4f66e70554ec8.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e9ac4fe88f4b8aec161d4edb4b4f66e70554ec8.camel@linux.intel.com>
X-Operating-System: Linux phenom 6.18.5+deb14-amd64 
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

On Mon, Mar 02, 2026 at 10:39:10AM +0100, Thomas Hellström wrote:
> On Mon, 2026-03-02 at 10:02 +0100, Christian König wrote:
> > On 2/27/26 17:00, Thomas Hellström wrote:
> > > If the struct ttm_operation_ctx::gfp_retry_mayfail is true,
> > > buffer object backing store allocation failures are expected to
> > > silently fail with an error code to the caller. But currently an
> > > elaborate warning is printed to the system log.
> > > 
> > > Don't spam the log in this way.
> > 
> > That was intentionally removed or never added because Simona
> > absolutely didn't liked the gfp_retry_mayfail flag at that time.
> > 
> > In general I'm fine with this change since I think we have proved by
> > now that the flag is useful, but that probably need more wider
> > discussion.
> 
> Well for system memory it is a bit questionable to be honest, I think
> mostly because even if we return an error, the OOM killer might be
> invoked on an unrelated allocation immediately afterwards.
> 
> Still, even if the use of gfp_retry_mayfail can be discussed, I'm not
> sure why an error here needs to be printed when there are a number of
> other errors that are not printed or printed only on debug.

Yeah adding the NOWARN makes sense irrespective of the bigger question, so
on that:

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

For the mayfail I have honestly no recollection anymore of that, but
making a guess I wasn't a fan because way back it was used to hack around
locking inversions between alloc and reclaim paths. Much more with
dev->struct_mutex drivers before moving to dma_resv for non-ttm drivers
too. And that's not great.

Plus GL userspace did not cope with alloc failures, so punting to the OOM
killer like for everything else made sense. And hence there was really no
use for this. But with vk and other low-level gpu apis that changed, we do
want to just pass ENOMEM to userspace now in many conditions.

I think best would be to add a patch to this series to document when
gfp_retry_mayfail can be used (userspace expects the kernel to pass alloc
failures up the stack) and must not be used (hacking around locking
inversions with reclaim) and then ship this. Might also be a good excuse
to switch the kerneldoc for struct ttm_operation_ctx over to the inline
style so we can be appropriately verbose.

But yeah, going through current users (on a Monday morning without coffee)
I think the flag has solid users by now and there's no fundamental
objections from me.

Cheers, Sima

> 
> Thanks,
> Thomas
> 
> 
> > 
> > Regards,
> > Christian.
> > 
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/ttm/ttm_pool.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
> > > b/drivers/gpu/drm/ttm/ttm_pool.c
> > > index c0d95559197c..8fa9e09f6ee5 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > @@ -726,7 +726,7 @@ static int __ttm_pool_alloc(struct ttm_pool
> > > *pool, struct ttm_tt *tt,
> > >  		gfp_flags |= __GFP_ZERO;
> > >  
> > >  	if (ctx->gfp_retry_mayfail)
> > > -		gfp_flags |= __GFP_RETRY_MAYFAIL;
> > > +		gfp_flags |= __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
> > >  
> > >  	if (ttm_pool_uses_dma32(pool))
> > >  		gfp_flags |= GFP_DMA32;

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
