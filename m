Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE965C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 11:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EE510E109;
	Tue, 15 Apr 2025 11:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="uWnir4OV";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E7A10E109
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 11:45:07 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso57222625e9.0
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 04:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1744717506; x=1745322306;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1XKT+rKnaooaZrK8b3AtpUgq+nm29jyEp9UG+kc18EY=;
 b=uWnir4OVMOOjnByW7N1DJ8oryz1zlZKM1d5QTXTuBOv6CSheFDnx/5u+Gtw46yds3V
 u9vQ84LTruiSQbsx+QpY+ZG1/PZjm0ZTmbdBads9K4OjLSAvgggFf0TDrMpCcBIlZLNY
 qz68acYKF6Hr7VOIE2RBCm22HhHIDpyxgIqZZhGz3+dfg2hS2E8GrkhkpLEtOMoRP+9u
 SlZ9PMawP+gc4Rzve8ajiuhDKXM1Qt8daBdfs7vQLVpUeZstPvF8cJqHgVtY6FEaZPOW
 frsVmUt30ty7dFJQ30UE1nebZXA5SxmG2x0TYYUsi8sYvmXvIy8Y+j1ZDJXz0D1DTxAi
 Hb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744717506; x=1745322306;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1XKT+rKnaooaZrK8b3AtpUgq+nm29jyEp9UG+kc18EY=;
 b=sGtKoOEKvdzy3s/aAXKzQrsfpnFp5xcqnSspSDlpP/c3i/o1pMNIue1zXxWNmhRZVd
 253ejFZsJVGyG3WVBqD2yeabol4FnTyBU1nxVy72XmcJG3sVbh4KnIfCKu5NrlpTeAD8
 G/p27CPI2XcrnQXyktUXtc+Y6Ix2aXfkyHVlFaa6UBujFSDoN782H+UBMLGu1ZQCopm5
 sNIotqWBCN0hnR5l6YEZihy6cUiLxIF/kwTxtKJMMe27JNbwr0Eu+jtaYdQtmy8ll8qj
 OsBooSmXiSahFLLVudCfP/K+fw4xnAw4PB7GVRu3rhyEqxPQDdFxfyZ29vZi6VhAryjB
 Smjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSIzeZhCFlLe7Jy+1bCRnpanNJJ1HXTq+Sv1GcvOxuBmiCAxYol7LHASBU4j9BAiOapvYffEYhiQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEyUOBlxEjZrgDt6eT0AKh0FKMnRIfAbLFoAvz+68LoPEIl7p9
 fqF+aYxemwQCWrZrlv/s87KPZwgJzwe3M5MTIqiKWbSO91XL0gCW9cx93zbtP064wnBEIUWmmDA
 l
X-Gm-Gg: ASbGnctFIUQ7Yprur08UQlExFpwR3v8/GpqgDZk4UOhel+lSP248W6yTffo4+ZSQr9U
 GZSsqZHCZ2OdYS67FDF4J13sk7GpDYujJH1uMFTpjUANYAoxfYbYyhEnCN1smQQJc1nnyPRzIvG
 gWCCIv2WqAYVgtfQ0fk42tW0cnuL7J0CUUxveZA+oN1OBRH4CCcTzJa/NFzoCNT4tlWGs3+8rjw
 f6HLDwav09RgN4pStqeb9zr1EZX7PURG2bfp9cXBGGWprudk7NLLzZO40TpQ2j+0uCdrCsaLQU/
 YbVGXAhCjge0O4TP1cXtPHub9E278ljq80lEVriJJf1QRMgUqz2o1iyJSdTXP3BUL48=
X-Google-Smtp-Source: AGHT+IEMAOkHxgL3aK5aKuwMMMpdUfMtdd/UnPi48Dk/36NODlx8bVeM9jDlj5gtjKdp9gcb/VmeRg==
X-Received: by 2002:a05:6000:2403:b0:391:41c9:7a87 with SMTP id
 ffacd0b85a97d-39eaaedca7fmr12658464f8f.51.1744717505627; 
 Tue, 15 Apr 2025 04:45:05 -0700 (PDT)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae97c243sm14111168f8f.59.2025.04.15.04.45.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 04:45:05 -0700 (PDT)
Message-ID: <7f71ca43-8b14-4dbe-8225-5ee58e93d22a@ursulin.net>
Date: Tue, 15 Apr 2025 12:45:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ring_ops_types: Increase MAX_JOB_SIZE_DW
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
References: <20250415111523.149214-1-francois.dugast@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250415111523.149214-1-francois.dugast@intel.com>
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

On 15/04/2025 12:15, Francois Dugast wrote:
> This limit can be hit, for example when running IGT compute-square on MTL:
> 
>      [   63.582385] xe 0000:00:02.0: [drm] Assertion `i <= 48` failed!
>                     platform: METEORLAKE subplatform: 1
>                     graphics: Xe_LPG 12.71 step B0
>                     media: Xe_LPM+ 13.00 step C0
>                     tile: 0 VRAM 0 B
>                     GT: 0 type 1
>      [   63.582408] WARNING: CPU: 0 PID: 2439 at drivers/gpu/drm/xe/xe_ring_ops.c:395 __emit_job_gen12_render_compute+0xa7c/0xc70 [xe]
> 
> Increase the value to allow this test to pass.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ring_ops_types.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> index 1ae56e2ee7b4..121279c826eb 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> @@ -8,7 +8,7 @@
>   
>   struct xe_sched_job;
>   
> -#define MAX_JOB_SIZE_DW 48
> +#define MAX_JOB_SIZE_DW 64
>   #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
>   
>   /**

I've sent the same fix two weeks ago:

https://patchwork.freedesktop.org/patch/646815/?series=144186&rev=5

I hand counted 58 dwords is enough. You think I undercounted?

Regards,

Tvrtko

