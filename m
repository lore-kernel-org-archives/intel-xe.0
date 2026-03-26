Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5326010A1E7D
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 11:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C6489C49;
	Thu, 26 Mar 2026 11:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gs84JcIK";
	dkim-atps=neutral
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAEB789C49
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 11:24:56 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-35b905e9dc0so539915a91.3
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 04:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774524296; x=1775129096; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=BX0MT01leMBG4BuGPpqJr+b5zRNKzVO7+wXXaiuziM4=;
 b=Gs84JcIKC9z/Wv+wiAiFP3CHa0MF/b0Qru+pD1eydcEPqMUMsJtr4VTIjsuFDNDNTP
 tH7uRJQy2XMQXBrvGRIR3Gb3SOqXQhsUa2w2rvj3+H4LqsEhw9WWbp8JSr6wD0IoVuxY
 f1OrH9rqwgsUeDgDpJB1Tn5RsFZKdZ/K3z4QK4/LeMcuWVKnxbgq+Rc5+/BzWpJCau9A
 xq/I0ihdY7Xfge28RvYMhsKYaqFmf0PIKmSPXxiGPF8RKtl15CM8hagJTS8tPVPDOV3V
 XeX4Y5cMkyEJUUm8IPG9pBykOlAVWUGZO64eeKco7MSx+PQTKwl5xsiZtYI6zqHd7CUj
 4YJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774524296; x=1775129096;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BX0MT01leMBG4BuGPpqJr+b5zRNKzVO7+wXXaiuziM4=;
 b=naA0C682z+aYbrO9WeL0gm4iaCEcdDCcGQ8Au67EWgl36IkvxdvFYXoEjDJaO7U56c
 gaFLVxxX0su3jYcohD94vZUSwcRZFmdV4bf306eP/tYTbNgohQ8tvuSmfSwIqAdXYXR9
 235AucoqwPTg52frSmB36zOYWTrcR2b2UsWzS7hhOrRGa9r3aqSco+uazxQ5h0i2/9YC
 Ki16Mymz6BYujwbe+HWEJ0Bd1ZhA7g6Anpm9/ETsJLbR/kVaYS72WONhEoIpO7z7wt5/
 6fqiF+vdb8GvpcC8HMhEvb1stDXcptPPIymw6vNNsF5cHaiva9i63Zd+c4AJ3ADMT7N2
 g19Q==
X-Gm-Message-State: AOJu0YzxwiC4iRLI8fT4Aha//HKElJSEIfCRP3kfl/hrw+CF89XH5Xmb
 KxyQl/jwkQjwBlGCKe4S+nkowkq+WJEvgCu4eLytKXip2DYAvmB+wfzK
X-Gm-Gg: ATEYQzztm6ZirWWKKcu14uLX6yTzmNAg6yYCGJd9DrEicmFl3ujoVsPfbTJV8Yrvw8Q
 lBHQ5vmnZzMg+uIfgBKJtnehDwwEJ7GzcoGr7Ve4jtdxH0MruipLffbkkOpjqDXWrNooCR9kreM
 h57GiU9CVbPvwz8Eexjz5KUj/yx/9w2qvNMFRV3MzNPBVmFEjsRdNZoBKfgv6h/8timggshLuI1
 0StSLaEjM9qYAjTnmKMEADiJzrYZXnA4bEv6Xc/HzawseOe28Y488I0KX3BJSfud4VTabYr3UG3
 Tqajgs1JrO00tbBkHzWZ6T8scdITKZwCNrWuWWhRyOw6+14y/QrrUwfOhsd4qoYBHwGKnzsJ0yE
 9KpG7lMFxNHveT3hqfEOlmB4FSbsVP/ZKASh5sAggss5ZtDcT5AdNTKWFphyBAChp2ZoXVlO5qw
 7yW5F6cn31MY9nKZBw6OX94SIUWzTjAmEDF/nNAk3ghaQ31t8ki9xgwpqNDOK64iS1d+E/dWFC
X-Received: by 2002:a17:90b:530d:b0:359:974a:3d65 with SMTP id
 98e67ed59e1d1-35c0ddadf71mr6902467a91.16.1774524296187; 
 Thu, 26 Mar 2026 04:24:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c22a54fd5sm1959276a91.2.2026.03.26.04.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 04:24:55 -0700 (PDT)
Message-ID: <18bd5247-a8d6-414f-9816-e131f471a7bf@roeck-us.net>
Date: Thu, 26 Mar 2026 04:24:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm: Fix use-after-free on framebuffers and
 property blobs when calling drm_dev_unplug"
To: Maarten Lankhorst <dev@lankhorst.se>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <acRPgts0pCLw8yLq@phenom.ffwll.local>
 <20260326082217.39941-2-dev@lankhorst.se>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260326082217.39941-2-dev@lankhorst.se>
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

On 3/26/26 01:22, Maarten Lankhorst wrote:
> This reverts commit 6bee098b91417654703e17eb5c1822c6dfd0c01d.
> 
[ ... ]
> Back to the drawing board, and fixing it in the intel display driver
> instead.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> Fixes: 6bee098b9141 ("drm: Fix use-after-free on framebuffers and property blobs when calling drm_dev_unplug")

Tested-by: Guenter Roeck <linux@roeck-us.net>

