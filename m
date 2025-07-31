Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB26BC87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 10:04:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807C910E263;
	Thu, 31 Jul 2025 10:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="llKVSWGX";
	dkim-atps=neutral
X-Greylist: delayed 506 seconds by postgrey-1.36 at gabe;
 Thu, 31 Jul 2025 10:04:25 UTC
Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com
 [51.81.35.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CAC10E263
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 10:04:25 +0000 (UTC)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com
 [159.100.248.207])
 by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 4270F223BE
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 09:55:58 +0000 (UTC)
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com
 [217.182.113.132])
 by relay5.mymailcheap.com (Postfix) with ESMTPS id BCB11262C0
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 09:55:55 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
 by relay2.mymailcheap.com (Postfix) with ESMTPS id 5C91B3E8CA;
 Thu, 31 Jul 2025 09:55:53 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 by nf2.mymailcheap.com (Postfix) with ESMTPSA id 622E7400F0;
 Thu, 31 Jul 2025 09:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1753955751; bh=WigGKFbgtCVAFw2VbTCB01cMzYJQXuFISWadikcrpjk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=llKVSWGXoIKsVRCYYxy5skiSzvnNfmVBbfwadXWaxvBgNHEa2GH4ZiR7uu0f2dF+t
 b3FhT7NdnsIDHkLTeBizl2RE/gO3EcKKzY6RNNlO/eVhzyGi7kDSyxMDMQ7wlMUeRs
 j3ItWm29VS9iKZ/adulVluG7KlZY1kNm8kEYt4us=
Received: from [127.0.0.1] (unknown [203.175.14.48])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 704C74168E;
 Thu, 31 Jul 2025 09:55:47 +0000 (UTC)
Message-ID: <0b4df78a-5740-415e-9939-b9c00ead84e7@aosc.io>
Date: Thu, 31 Jul 2025 17:55:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/xe/bo: fix alignment with non-4KiB kernel page
 sizes
To: Simon Richter <Simon.Richter@hogyros.de>, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org, Wenbin Fang <fangwenbin@vip.qq.com>,
 Haien Liang <27873200@qq.com>, Jianfeng Liu <liujianfeng1994@gmail.com>,
 Shirong Liu <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>,
 Shang Yatsen <429839446@qq.com>
References: <20250723074540.2660-1-Simon.Richter@hogyros.de>
 <20250723074540.2660-2-Simon.Richter@hogyros.de>
Content-Language: en-US
From: Mingcong Bai <jeffbai@aosc.io>
In-Reply-To: <20250723074540.2660-2-Simon.Richter@hogyros.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 622E7400F0
X-Rspamd-Server: nf2.mymailcheap.com
X-Spamd-Result: default: False [-0.10 / 10.00]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 MID_RHS_MATCH_FROM(0.00)[]; ARC_NA(0.00)[];
 RCVD_COUNT_ONE(0.00)[1];
 ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RECEIVED_HELO_LOCALHOST(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_CC(0.00)[vger.kernel.org,vip.qq.com,qq.com,gmail.com,126.com];
 FREEMAIL_ENVRCPT(0.00)[126.com,gmail.com,qq.com,vip.qq.com];
 TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
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

Thanks for your revision, however, there is an issue with this patch.

在 2025/7/23 15:45, Simon Richter 写道:

<snip>

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 00ce067d5fd3..649e6d0e05a1 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1861,9 +1861,9 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>   		flags |= XE_BO_FLAG_INTERNAL_64K;
>   		alignment = align >> PAGE_SHIFT;
>   	} else {
> -		aligned_size = ALIGN(size, SZ_4K);
> +		aligned_size = ALIGN(size, PAGE_SIZE);
>   		flags &= ~XE_BO_FLAG_INTERNAL_64K;
> -		alignment = SZ_4K >> PAGE_SHIFT;
> +		alignment = PAGE_SIZE >> PAGE_SHIFT;
>   	}
>   
>   	if (type == ttm_bo_type_device && aligned_size != size)

A previous change under this struct:

-	bo->size = size;
+	bo->size = aligned_size;

Is actually still needed. Without this change, the kernel does not start 
up with an Intel B580.

Best Regards,
Mingcong Bai
