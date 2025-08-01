Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB85EC87FD3
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 01:06:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C8010E089;
	Fri,  1 Aug 2025 01:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="Ddd0YITd";
	dkim-atps=neutral
Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com
 [51.81.35.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E2410E089
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 01:06:33 +0000 (UTC)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
 by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 80B0B2037E
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 01:06:32 +0000 (UTC)
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.66.161])
 by relay5.mymailcheap.com (Postfix) with ESMTPS id 78308200AF
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 01:06:29 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
 by relay3.mymailcheap.com (Postfix) with ESMTPS id F25653EA78;
 Fri,  1 Aug 2025 01:06:26 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 by nf1.mymailcheap.com (Postfix) with ESMTPSA id 9A24C40078;
 Fri,  1 Aug 2025 01:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1754010386; bh=8MmiSPhzhtxh3u5NRPKvPCoGAeSjOtcIb0GweW5j6jE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ddd0YITdYaETEVBIP9kVtN3bE7rXzGnaK+m1FZ33JyWdSDulOjhQWht4tsUZfvoLN
 2tSHWPb2Uv1DjMgIFgB4c9z2wHastb7yPW33EyRn9ENCSTwKIEPrcvTq+0MX9gEXdA
 5I/LLVYKuRofUsa8WNhlPaKZr0vRX+AGa7qTKbaA=
Received: from [127.0.0.1] (unknown [203.175.14.48])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 2152B405E6;
 Fri,  1 Aug 2025 01:06:22 +0000 (UTC)
Message-ID: <dcc218a7-bd02-4c21-9986-2c4c29fbc8db@aosc.io>
Date: Fri, 1 Aug 2025 09:06:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/xe/bo: fix alignment with non-4KiB kernel page
 sizes
To: Simon Richter <Simon.Richter@hogyros.de>, intel-xe@lists.freedesktop.org
Cc: Wenbin Fang <fangwenbin@vip.qq.com>, Haien Liang <27873200@qq.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, Shirong Liu <lsr1024@qq.com>,
 Haofeng Wu <s2600cw2@126.com>, Shang Yatsen <429839446@qq.com>
References: <20250723074540.2660-1-Simon.Richter@hogyros.de>
 <20250723074540.2660-2-Simon.Richter@hogyros.de>
 <0b4df78a-5740-415e-9939-b9c00ead84e7@aosc.io>
 <9cc7c5f9-2b1c-4b45-ad44-67923ed61757@hogyros.de>
Content-Language: en-US
From: Mingcong Bai <jeffbai@aosc.io>
In-Reply-To: <9cc7c5f9-2b1c-4b45-ad44-67923ed61757@hogyros.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Queue-Id: 9A24C40078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 10.00]; BAYES_SPAM(0.24)[66.67%];
 MIME_GOOD(-0.10)[text/plain]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 ARC_NA(0.00)[]; RCVD_COUNT_ONE(0.00)[1];
 ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 URIBL_BLOCKED(0.00)[aosc.io:mid,mail20.mymailcheap.com:helo,mail20.mymailcheap.com:rdns];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RECEIVED_HELO_LOCALHOST(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[126.com,gmail.com,qq.com,vip.qq.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_CC(0.00)[vip.qq.com,qq.com,gmail.com,126.com];
 RCVD_TLS_ALL(0.00)[]
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

Hi Simon,

在 2025/7/31 18:48, Simon Richter 写道:
> Hi,
> 
> On 7/31/25 18:55, Mingcong Bai wrote:
> 
>> -    bo->size = size;
>> +    bo->size = aligned_size;
> 
>> Is actually still needed. Without this change, the kernel does not 
>> start up with an Intel B580.
> 
> bo->size has been removed in commit ec9223b49, though -- instead, the 
> size is taken from the underlying GEM object, and the size field there 
> is taken from the third parameter to drm_gem_private_object_init, which 
> is "aligned_size" in your patch already, so this field is fully 
> redundant even if the size has been aligned.

My mistake - sorry! We were testing with 6.16, the master source does 
work without this change.

That said, this patch is still marked Cc stable, so I would recommend 
either dropping that, or consider submitting a separate copy suitable 
for that purpose. I might be wrong though, so please, if any reviewers 
could help guide Simon (and correct me), go ahead.

Best Regards,
Mingcong Bai
> Tested on ppc64le with B580 using 64k pages, still survives a piglit run 
> just fine.
> 
> The field being removed was the reason for me resubmitting the patch 
> stack: it stopped compiling without dropping this line.
> 
>     Simon


