Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC44C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 10:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C0010E773;
	Thu, 31 Jul 2025 10:48:18 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C0110E773
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 10:48:17 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 557563F108;
 Thu, 31 Jul 2025 12:48:12 +0200 (CEST)
Message-ID: <9cc7c5f9-2b1c-4b45-ad44-67923ed61757@hogyros.de>
Date: Thu, 31 Jul 2025 19:48:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/xe/bo: fix alignment with non-4KiB kernel page
 sizes
To: Mingcong Bai <jeffbai@aosc.io>, intel-xe@lists.freedesktop.org
Cc: Wenbin Fang <fangwenbin@vip.qq.com>, Haien Liang <27873200@qq.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, Shirong Liu <lsr1024@qq.com>,
 Haofeng Wu <s2600cw2@126.com>, Shang Yatsen <429839446@qq.com>
References: <20250723074540.2660-1-Simon.Richter@hogyros.de>
 <20250723074540.2660-2-Simon.Richter@hogyros.de>
 <0b4df78a-5740-415e-9939-b9c00ead84e7@aosc.io>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <0b4df78a-5740-415e-9939-b9c00ead84e7@aosc.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 7/31/25 18:55, Mingcong Bai wrote:

> -    bo->size = size;
> +    bo->size = aligned_size;

> Is actually still needed. Without this change, the kernel does not start 
> up with an Intel B580.

bo->size has been removed in commit ec9223b49, though -- instead, the 
size is taken from the underlying GEM object, and the size field there 
is taken from the third parameter to drm_gem_private_object_init, which 
is "aligned_size" in your patch already, so this field is fully 
redundant even if the size has been aligned.

Tested on ppc64le with B580 using 64k pages, still survives a piglit run 
just fine.

The field being removed was the reason for me resubmitting the patch 
stack: it stopped compiling without dropping this line.

    Simon
