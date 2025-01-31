Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784FAC0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 12:08:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4039A10EA85;
	Fri, 31 Jan 2025 12:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Y4fcVU9r";
	dkim-atps=neutral
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CD310EA85
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 12:08:14 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso13295835e9.0
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 04:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1738325293; x=1738930093;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BCLnnUBMgp5rh5YkqbXxJl7JMIX2ZvsppQIf60U6yEI=;
 b=Y4fcVU9r+ARsbtIcpL+OxqP2Aypsj0b/J52FljPtGy3/+VL2LkrrYnvBvnm39+dWMz
 j491muFbSlwW9afUfSgsfs6F/6N0Piruzu3KKC5XvDz24/UuL9v6jlFenbW37mg/MC2q
 MBxkY+btrb/Z2YWBx+MXJGKbEIxfRbgMcrS1M96jyd6tlQjTFJyomftoe5/iv6CJaeFb
 HxHBbbob9E7lJItzjXASJTKQSJeq1WpcYaaG3eEbdrs6Ax5pekRVwxcM98PtK99qskge
 C4Q0EZXySp3D4HFAkVttUUbtqN6DiU1Gr71jWZF2WP0QyXiYU3sCqsIqVglIPcMylphD
 GfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738325293; x=1738930093;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BCLnnUBMgp5rh5YkqbXxJl7JMIX2ZvsppQIf60U6yEI=;
 b=i88XwhIR7Vnub7V923EBFmPLLXQXbKsBBMiNzThu98mgEGgN3gWKeQw7Md1BeAFsAo
 w1b9bKWDqS73O6FQwlmtGl8mclGP2ewKyPGA9VcjoTXHXbXUcxBfrmtOO8kxZx/PFR+l
 BwD7zZpAtLjHxlkRXkMuOIkZ3gO56wwNopF8CJyUEK/0wG7spiDzD8KKvLqmw2k5XvP+
 YtmjqTgtOgx+DjcwHWqTwBEWNoYBbVHSYfo33rNVp+B4a43NHx8nu/BguvJXIVrxOqyW
 as04SS3pGZJFF3Q8Rdf/tYlHk0rvRB2otHpYIFPNUpL0Ld7QVYNEU+lVKEAHYwAVaQul
 m7dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn2x66V2kaBvHWUhsG1SVK9YDzazPbSPKtDQaH/QITqGX2vRzn8saehVBS/T6cpgtZ8R53wP/BkQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVOMi6LJ9aqG4omd6/u/ZH0De1gtwgVgrgsnEg0qr/k5ldXuiG
 95MAJIQ1N71cc1fUCtPfzFs7YK44XxwlTGFyAN7BdcMvDyOgXmO1OpWOkBYNNRg=
X-Gm-Gg: ASbGncv6IT7CQQ5H5L4PX6peVoz52/XT1WVEyVY2b0zm8o8LsTehosb645c4Lc7iFqd
 hhmbaTllmWib4mFajokD2JbSqqlPGrl9jDdO/iPin+dJIi+PBpnMe2H+I/+kgkaM91Avn/awMd3
 oAvY1+tQ6nQgcTyIpxF4VUiY+xqP33OSZZ+0KrC53WW5jxPTVFFRnjcUfTeGZ06i1RGeiiUQhty
 /tkcVQgHf00LBW/MMjli97564v6Xm1vMOxRUBsNZOMTimHC7Et3KItv5C5Eu762ldqb8//yHC+b
 ACA19bprSuzj5zMl6Qu4ecHsPo/ZdGw=
X-Google-Smtp-Source: AGHT+IHstboWAgYydp3Fx9eSvkuVsP73U6C7evDjLZnLu/f0qYfEAfR8ouMC6Yu2iagZO6+/uO8qqg==
X-Received: by 2002:a05:600c:4e06:b0:434:f335:855 with SMTP id
 5b1f17b1804b1-438dc42930cmr80545695e9.28.1738325292555; 
 Fri, 31 Jan 2025 04:08:12 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b5122sm4487722f8f.76.2025.01.31.04.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2025 04:08:12 -0800 (PST)
Message-ID: <77eee325-21dd-42cc-b6e8-44e41d0f5044@ursulin.net>
Date: Fri, 31 Jan 2025 12:08:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] drm/xe/pxp: Enable PXP for MTL and LNL
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: John Harrison <John.C.Harrison@Intel.com>
References: <20250116001110.4158032-1-daniele.ceraolospurio@intel.com>
 <20250116001110.4158032-14-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250116001110.4158032-14-daniele.ceraolospurio@intel.com>
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

On 16/01/2025 00:11, Daniele Ceraolo Spurio wrote:
> Now that are the pieces are there, we can turn the feature on.

Would it be possible to have this on Aderlake too?

Regards,

Tvrtko

> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 44f59af94652..c9c88a818b2d 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -336,11 +336,13 @@ static const struct xe_device_desc mtl_desc = {
>   	.require_force_probe = true,
>   	PLATFORM(METEORLAKE),
>   	.has_display = true,
> +	.has_pxp = true,
>   };
>   
>   static const struct xe_device_desc lnl_desc = {
>   	PLATFORM(LUNARLAKE),
>   	.has_display = true,
> +	.has_pxp = true,
>   };
>   
>   static const struct xe_device_desc bmg_desc = {
