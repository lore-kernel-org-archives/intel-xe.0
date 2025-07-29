Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3834C87FC9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 08:22:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EE310E1D2;
	Tue, 29 Jul 2025 08:22:04 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7EC10E1D2
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 08:22:02 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 01DE23F116;
 Tue, 29 Jul 2025 10:21:56 +0200 (CEST)
Message-ID: <5020e4a6-971b-43db-8095-c5109c919839@hogyros.de>
Date: Tue, 29 Jul 2025 17:21:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/xe/bo: fix alignment with non-4KiB kernel page
 sizes
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, jeffbai@aosc.io,
 Wenbin Fang <fangwenbin@vip.qq.com>, Haien Liang <27873200@qq.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, Shirong Liu <lsr1024@qq.com>,
 Haofeng Wu <s2600cw2@126.com>, Shang Yatsen <429839446@qq.com>
References: <20250723074540.2660-1-Simon.Richter@hogyros.de>
 <20250723074540.2660-2-Simon.Richter@hogyros.de> <aId7hYAfMxlBTV8x@intel.com>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <aId7hYAfMxlBTV8x@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 7/28/25 22:30, Rodrigo Vivi wrote:

>> -	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>> +	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, aligned_size);

> but this is strange.
> think that we could get rid of the aligned_size variable and only go with
> size = ALIGN(size, PAGE_SIZE)

> but then there are some checks in between on the alignment
> and different handling in different if conditions.

I think this can be simplified to a set of conditions in a flat list 
that each impose a stronger alignment requirement, and the strongest 
just wins because aligning 4k to 64k gives 64k.

So, paraphrased:

  - BUG_ON not 4kB aligned (because all callers already ensure that)
  - if CPU visible, align to PAGE_SIZE
  - if 64kB constraint for VRAM allocation, align to 64kB
  - whatever else

 From what I can see, making the BO larger than requested is always 
safe, so the query parameter for the minimum alignment should be set to 
the smallest alignment we will ever see (so SZ_4K) and make the ioctl 
check consistent with that because any smaller request would get rounded 
up anyway, so we can let userspace do that for us, and then we silently 
fix any other requests.

I'm going to ask a few Mesa people about this.

> We need further clean-up there to make the change obviously right first.

I'll try to come up with something soon.

In the meantime, with my Debian hat on, do you have any opinion on the 
patch marking non-4kB pages as BROKEN? That one came out of a 
discussion[1] in the Debian kernel team how to avoid shipping a kernel 
that crashes on boot, and to me it seems locking this out now (and 
backporting that to stable), then reverting it along with the fix should 
give the best user experience.

    Simon

[1] https://salsa.debian.org/kernel-team/linux/-/merge_requests/1589
