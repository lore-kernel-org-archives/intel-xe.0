Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599CCC54731
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 17:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEEA10E3D0;
	Tue, 27 Aug 2024 17:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ByNfTSMr";
	dkim-atps=neutral
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB36710E3C0
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 17:16:03 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-428243f928fso64143895e9.0
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 10:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724778962; x=1725383762; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=58403xbudumO3JNg+OZmLQLpJDBaCWXoTPjgTWSOtEw=;
 b=ByNfTSMrt/pqKxAZoM7us5fG6Uhsz4QfKLphNkMvtjAP3EwfkmmAmKNKiAncKQpasq
 2FYSvOSyGWHokVuAprvOD7213Skjw1fD4FruHYqVNh1DqOONvsy8uXl9rHGY4EkTf6S5
 PchWTyiYi05pStDLmdg7tNPkQtwzNeK4TCg00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724778962; x=1725383762;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=58403xbudumO3JNg+OZmLQLpJDBaCWXoTPjgTWSOtEw=;
 b=i4fRQ789GFV3rj69MSoYLaucB2sYUwh6sDs4yxAlpApGlpXU+SGA7JXqyeYMAmxG/0
 icI0FARhlLL8S5D2IL0bTmlAihdetmYrsg4RPMns3yOu5Dku2urCfhvBmhx3+ehJZWZw
 ZZh+JZdAcbucMkCKLksoSeKs1mf5EX+mlHT23dG65P/iN93mKDgNDGaCrtnzl/9rwnQq
 qzAT0QqDtVbaE+ZvpqXEgetTbNZn3PsEE2q9pEEYC+grTJSyHfVyCJ9Tw1rWLs5Ibj1L
 Jr19siq7a5NESxk2JbdD9fPE4QJHw7ncbe7T+afcTjE3GW4WdbBFr3QHyE1YvfngxttZ
 CiZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5DTzUXCQAg74QP8ax/XUTvncBcGf1EoWzBYjOLmWUGtxxUcNLnT3GnyCJVIDwu69ut5rDF9H2WQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzG8ZMpdswY5oWA/E66vUHmNGZs4YgAaIJ2af7yjfwGYTMxLZax
 ORXwzYZcOVwEwvi4HQwN0+ru+DG4kkZG3IVGHBbvgwXUsKrMPeiOwRceGOC2vlw=
X-Google-Smtp-Source: AGHT+IGR+88aHIYUAWR2VyxyLBZQ73WazlSN4kM7hsed9DKw3Zi4UpmqpWcLnUMtbsNUgfInUK1oGw==
X-Received: by 2002:a05:600c:3ba6:b0:428:e30:fa8d with SMTP id
 5b1f17b1804b1-42acd54244fmr114121745e9.6.1724778961898; 
 Tue, 27 Aug 2024 10:16:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730814602asm13600524f8f.44.2024.08.27.10.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 10:16:01 -0700 (PDT)
Date: Tue, 27 Aug 2024 19:15:59 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 sumit.semwal@linaro.org, daniel@ffwll.ch
Subject: Re: [PATCH v3 1/2] dma-buf: Split out dma fence array create into
 alloc and arm functions
Message-ID: <Zs4Jz0wwC7hGPLR8@phenom.ffwll.local>
References: <20240823045443.2132118-1-matthew.brost@intel.com>
 <20240823045443.2132118-2-matthew.brost@intel.com>
 <f7fcb678-afb2-428e-abad-af9892823e60@amd.com>
 <ZsiuvXACGYdm+Ons@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZsiuvXACGYdm+Ons@DUT025-TGLU.fm.intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Fri, Aug 23, 2024 at 03:46:05PM +0000, Matthew Brost wrote:
> On Fri, Aug 23, 2024 at 08:37:30AM +0200, Christian König wrote:
> > Am 23.08.24 um 06:54 schrieb Matthew Brost:
> > > Useful to preallocate dma fence array and then arm in path of reclaim or
> > > a dma fence.
> > 
> > Exactly that was rejected before because it allows to create circle
> > dependencies.
> > 
> 
> Can you explain or do you have link to that discussion? Trying to think
> how this would be problematic and failing to see how it is. 
> 
> > You would need a really really good argument why that is necessary.
> >
> 
> It seems quite useful when you have a code path in which you know N fences
> will be generated, prealloc a dma fence array, then populate at
> later time ensuring no failures points (malloc), and then finally
> install dma fence array in timeline sync obj (chain fences not allowed).
> 
> It fits nicely for VM bind operations in which a device has multple
> TLBs and the TLB invalidation completion is a fence. I suspect Intel
> can't be the only device out their with multiple TLBs, does VM bind, and
> use timeline sync obj.

I think the naming you've picked is a bit confusion, since all you're
splitting out is the kzalloc call. At that point the dma_fence_array isn't
yet useable as a fence, so there's no issues with with circles. It's only
when you call _arm that it becomes a real fence.

I think just renaming _arm to _init, so that we follow the standard naming
pattern for splitting _create() into kzalloc and everything else is all
that's needed here?

Plus updating the kernel doc to make it really clear that _alloc doesn't
give you a fence, just a pile of memory. And that _init must be called
with a compatible amount of fences, or it'll fail.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
