Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A3FC5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 14:32:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA9310E02C;
	Wed,  4 Jun 2025 14:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="F0qeJcvy";
	dkim-atps=neutral
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B75D10E79E
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 14:32:27 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9ebdfso13373158a12.3
 for <intel-xe@lists.freedesktop.org>; Wed, 04 Jun 2025 07:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1749047546; x=1749652346; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LiCJZRXxQ22qvEdr6hj6o0eGF/XqnaTkN1sI1I0TyPA=;
 b=F0qeJcvyoBkglg5cEzMskXTmNFK6+obpb8Ot4fc57k2pXrCdsOO5T5LZ73LTPmKTs3
 //XHBn6kBAgV59JNHwIPorc9y/JWKeDgomgJ89RHpxRTX8vBshD0tiCKhMdUlw4cXN+6
 hYnKqF9tTOYed1z2pIbhBu1otCJ+ODD4olpCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749047546; x=1749652346;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LiCJZRXxQ22qvEdr6hj6o0eGF/XqnaTkN1sI1I0TyPA=;
 b=A/8ppE9JCG2negFApSFh/T4XQFuDoBikWWJZA6sAXk+hir/DDVQi1Y704UY6eLa5f9
 7ChdpximLsfzGaTLF0NJXTXmjKOA2/NVNkaQVrm1yQO/w90RroP+Fm4u0+RqEKK3Vnep
 +YEGMTj7zsoR9MccpSAKKd7BqC3VWXySZIbNB2CZEZKuHW4XDRF1LsOu620H44T7ieNl
 3HpWJuqcUPpEyinGNQfgAsWQz+PIpQC+NSQjsXbyB98CqegltTv+ITW6kiV6RSyEcBjd
 DUvhTu9A6dW70J12XqQkSBWD8LHFq5m5E+rD5ac7w9i5PFA0bhRM18c2JiCLVVJUQwHh
 /TGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSMemtVORHYUu0dZ7MrK4agSooXGnew6pGyoGEywQU+/73gOMk65Zo5EzXzpSATzofzYYrbRQGYg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4T7LhkaOZjzm9JxkIs5Tlh+VoNco+IlUqaEfH/jKI//8yxa7k
 HLYVH9IZeQ6uN8EQo9kpwmi/vd+sV0krW1YqN6BZ1oWULOOoIWLib5c7FIy9gn07tJE=
X-Gm-Gg: ASbGncuGcPcHV5wjcjXPQYp2TMJaGJmWDZqRyOYRZAo7QeFj7KmMtMIIHcjiQA/vn6m
 VVAZbXDleksXT/S6TTEA4SnkHMfT9mSa4W6QiuQUgkUIzRwc4MTHpp2e5LBAcOegmI8g3be6sIk
 d9ir7lLRVVtYGDEv9NnzU9M+PWbcC2aBbZxOstIurImw7aVfNBXvmT+kQ0wIVkk26ViQ9dzGP3z
 Gfnw/yO54sPYSc1DlaW6GV/g0dD7R1gglZAq2ukvMa3nx/yzx5w6/PEokcqpMbg3z4ZWDhvGAJ0
 DFTSJndNShGM592lwWqGJu//p6oOxE4DvghdhHSjqScxj/qHhlSMCDh485lrEsSWF41AcUl8nQ=
 =
X-Google-Smtp-Source: AGHT+IHWBPNKher7erJJIw2BIlmGlA6CCe74D81LssPVBOINSD1G4hB1iAnv2WFU5o2XR1FtCeSXpQ==
X-Received: by 2002:a17:907:3c8f:b0:ad4:d00f:b4ca with SMTP id
 a640c23a62f3a-addf8fcf97amr260899766b.50.1749047545608; 
 Wed, 04 Jun 2025 07:32:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada6ad394e5sm1105982666b.137.2025.06.04.07.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 07:32:25 -0700 (PDT)
Date: Wed, 4 Jun 2025 16:32:22 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: VM madvise semantics
Message-ID: <aEBY9hLSlgNJM5GH@phenom.ffwll.local>
References: <0e5a09490934b1332e13829c705af98026372300.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e5a09490934b1332e13829c705af98026372300.camel@linux.intel.com>
X-Operating-System: Linux phenom 6.12.25-amd64 
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

On Wed, Jun 04, 2025 at 02:57:50PM +0200, Thomas Hellström wrote:
> Hi!
> 
> I'm starting an email thread to move forward the questions Himal had on
> the madvise semantics:
> 
> 1) Whether to support an array of ops? 
> 
> IMO the VM_BIND implementation got very complicated due to this and the
> needed rollback support. Perhaps due to single op splitting turning to
> multiple ops it would've been hard to avoid that. Can we avoid
> supporting an array of ops for madvise? If so I'd vote for single op.

Just seen this fly by and wondering why you even want rollback support?

Looking at core mm and the various m* syscalls that manipulate vma, they
just bail out if things fail halfway through. Or at least don't make any
guarantees, userspace gets to keep the pieces.

And I think that's the semantics we want, because making global promises
around rollback means we need atomicity, which means fine-grained locking
is out. And that doesn't sound like the right way to design this stuff to
me?

Or is there some userspace requirement that wants rollback for some
strange reason?

Cheers, Sima

> 2) Purgeability. If it's not implemented yet we shouldn't merge an uapi
> for it, but ensure that it would at least be possible moving forward. 
> 
> 3) Multi-device. In the spirit of the above I guess it makes sense if
> UMD wants to select between VRAM and SRAM now to merge an interface
> that supports *only* that. When we add multi-device support we could
> perhaps add another op, or an extension to support agreed multi-device
> semantics. Even if this means rolling back to Himal's original
> suggestion of a preferred placement UAPI.
> 
> Thoughts?
> 
> Thomas
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
