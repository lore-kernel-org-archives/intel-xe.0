Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435FEC4829A
	for <intel-xe@archiver.kernel.org>; Sat, 10 Feb 2024 16:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8C810E18F;
	Sat, 10 Feb 2024 16:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.b="mi4KsncL";
	dkim-atps=neutral
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Sat, 10 Feb 2024 16:57:24 UTC
Received: from omta034.useast.a.cloudfilter.net
 (omta034.useast.a.cloudfilter.net [44.202.169.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECCE10E18F
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Feb 2024 16:57:24 +0000 (UTC)
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
 by cmsmtp with ESMTPS
 id YpZ5rAEDhAxAkYqYErwQOv; Sat, 10 Feb 2024 16:50:03 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id YqYDr4epTfXY3YqYEr0VwJ; Sat, 10 Feb 2024 16:50:02 +0000
X-Authority-Analysis: v=2.4 cv=bO21I++Z c=1 sm=1 tr=0 ts=65c7a93a
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=VhncohosazJxI00KdYJ/5A==:17
 a=IkcTkHD0fZMA:10 a=k7vzHIieQBIA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=NEAV23lmAAAA:8 a=7YfXLusrAAAA:8 a=PRyNG9Jn56gaZwuU5SgA:9 a=QEXdDO2ut3YA:10
 a=1F1461vogZIA:10 a=5kKzt1m56AEA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=SLz71HocmBbuEhFRYD3r:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fW1AM9Qzpti44/4DeXbYCV+nbyp1ZPTvg+v3ApEi5WE=; b=mi4KsncL9ls0mGZQ11Gjp11mzj
 10mOxb3XBgZtcev9Ui6v7zprTzwWlcitvXnYgcRiFSRTNd4LTHmUzs4muhsKcKtkvqpZTfE4e5uQa
 FrdzJgl1fmi+KwZAD7RCzfPMe0k8Uhy72r4SRH8MIUes9D65G8EuezoS03N2SBSYnts74l9eijAoH
 qtpL9wMGe3zb/rCp+B0ulvhTUDWU/ahrjvV3egswBe+ph/IGCNcnHDBAMDy4zEQaan7sWhaIx+ReW
 7E67F0ThfVnm2l0zHezQ0L+X+nIQdQ8jn3AsmzD+MUJ2fnQXDSScg7DgQEE2Zs2s6Uv+Ae/Qcy0P9
 eI2rMiYA==;
Received: from [201.172.172.225] (port=35494 helo=[192.168.15.10])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2)
 (envelope-from <gustavo@embeddedor.com>) id 1rYqYC-000VNR-0W;
 Sat, 10 Feb 2024 10:50:00 -0600
Message-ID: <30715dc4-3285-4f4a-a041-a718a8509721@embeddedor.com>
Date: Sat, 10 Feb 2024 10:49:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Prefer struct_size over open coded arithmetic
Content-Language: en-US
To: Erick Archer <erick.archer@gmx.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20240210141913.6611-1-erick.archer@gmx.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20240210141913.6611-1-erick.archer@gmx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.172.225
X-Source-L: No
X-Exim-ID: 1rYqYC-000VNR-0W
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.10]) [201.172.172.225]:35494
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFPj1kqCftyU+LUXedhhHTVXB5fm3SGX2auaLBBgca8mvJvglhUZzb8ccUgqmEe0pjnQd2o0hjyfaQz0rFVTwx5HZ8UrIFBdAeAYWx3NZgnH+aCOrF1A
 76nnkjNk4ZKSwjsylZ0pHlE9CXwdDKNkYHRzOiJFzGhBtFVovudS3TO4z2iXC7dr2oN+zML/PFI7A55yk9JyartOyQLpUbrBtAV1ndYkPA3eUIuSPoLxnEY1
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



On 2/10/24 08:19, Erick Archer wrote:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1].
> 
> As the "q" variable is a pointer to "struct xe_exec_queue" and this
> structure ends in a flexible array:
> 
> struct xe_exec_queue {
> 	[...]
> 	struct xe_lrc lrc[];
> };
> 
> the preferred way in the kernel is to use the struct_size() helper to
> do the arithmetic instead of the argument "size + size * count" in the
> kzalloc() function.
> 
> This way, the code is more readable and more safer.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/160 [2]
> Signed-off-by: Erick Archer <erick.archer@gmx.com>

LGTM:

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
-- 
Gustavo

> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index bcfc4127c7c5..f4e53cbccd04 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -44,7 +44,7 @@ static struct xe_exec_queue *__xe_exec_queue_create(struct xe_device *xe,
>   	/* only kernel queues can be permanent */
>   	XE_WARN_ON((flags & EXEC_QUEUE_FLAG_PERMANENT) && !(flags & EXEC_QUEUE_FLAG_KERNEL));
> 
> -	q = kzalloc(sizeof(*q) + sizeof(struct xe_lrc) * width, GFP_KERNEL);
> +	q = kzalloc(struct_size(q, lrc, width), GFP_KERNEL);
>   	if (!q)
>   		return ERR_PTR(-ENOMEM);
> 
> --
> 2.25.1
> 
> 
