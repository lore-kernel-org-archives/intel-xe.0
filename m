Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14410C3ABDD
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 09:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90B010E43D;
	Tue, 20 May 2025 09:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="LRooNQeh";
	dkim-atps=neutral
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C8210E43D
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 09:02:02 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3a36efcadb8so1590124f8f.0
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 02:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747731721; x=1748336521;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ibPdc6miWvjbqV2jluxnQ0G071NxN5YpbFe3XRM5ETY=;
 b=LRooNQehabORugxuYI6aTx4IRA1lpWbQqFfkbo1ibfPsx11PlqMkwilx3MugJmEEiC
 /fq9+IozD6dOdhTFLTm9TrC5PQEtBopv+eZawW9puy++HmNGLZ9Z0nd7D6hMNkCxmHym
 c3AkNAKnF0ampbkkEy2fvJRt3s8ZTMTbZxmYf4VewibJRUXOrBtfIxBUg48JPFuEai7p
 nphoaG6EOSBsO/7+Mk5ma/L5YYvchr4g46ZiYKi6NS08bMe/VKYC8EDdIuOSXIaJ3fms
 6E8LAjw6zUZRAvQhfPmjJ3kTp52WYXyIPvVkIAkYg0YPgxPlcNyxzXm6lCOsrN5pvhk2
 wC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747731721; x=1748336521;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ibPdc6miWvjbqV2jluxnQ0G071NxN5YpbFe3XRM5ETY=;
 b=sQ02YcgBsr/eHxNsjCtGCdwgrIIIXuXNYdoWygGYL9VxBmwarYLxxi63QELfBYdmaH
 bU2FyYs4EhwCM5/oXuNBG7nu6u0qdUfzSVrFJezAMDrVvVZvqIH9QjdmSlPEJvOfe8Yu
 NAab37GiQJRzjfS2c9ObuhQa85BtCLdgvKlldm+2+J68pQDuiYVUIXc+rNhRLWxOgf3a
 9M8Dr2d512JzOgURAZI/3BBDWZmhWY+r0fLc+KpbWRiOfVUtm8dGjt6MGZUhdIxks2Bn
 P4G5YDktgh/P4P7xFWODtneHNlF4CW8HUi3sjHj1NnE8OwsWdwI/YUiIIHSVo9edDAus
 qguA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh11k9Q00stjc4neNoxLtvmZbptm/sG9j5XX0+EbC/yRntH6V3eaJ7QFjLNX7WG2jRxG6KfClCPQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTpwYtsJoVQsx/FrU2lv5mYMWNgkZFRCu964ciLTw9PJstlY7R
 NH4NegtXXQy+rjTWB8ibpSKj6DHVVHPqxMD4Usujq96BHgBVPlDBjZx1IxorUW0dMwI=
X-Gm-Gg: ASbGncvPk9l81A3rcJnqxIkhIWAkGCVTmGwygVL4gv/oBaf272oLPthFOtEeUlXUGLY
 MN5FfwtwyykHz4mUbgmdYa967yzpkozzAEJ5cW/4gQc1lvVyc7lbjDs1TnQya24BEIdNMHmGsJh
 J0Qn3zfyquwxGEHpy8Oj43i1cDPIuri8kPwylQ98th0+0YcXWdc3HA/fg2t4Y1JcgsfgAtTHZuk
 mQ0NX/7LBIsnef+OBlJharzEILUr6r3T0W0zeTYUoCp1dYKCiOmnEogRxBvOEpXFaCQAqEdO0a1
 0WGHrY365AogfQmbPBgaUK5isnXH7JlcwSkaNhobVwD7ufpSPKoekhD/RUcuIY2VGA==
X-Google-Smtp-Source: AGHT+IEHjaiRp3ndY6J2Zo485LQ1nCD4qvsd7jNI55NYo78o/zDy469mYJyGj+X40kYq9ZoqFZ0x1A==
X-Received: by 2002:a05:6000:2484:b0:3a3:7115:5e7a with SMTP id
 ffacd0b85a97d-3a371155f61mr4747056f8f.42.1747731720784; 
 Tue, 20 May 2025 02:02:00 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f381465fsm22582395e9.29.2025.05.20.02.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 02:02:00 -0700 (PDT)
Message-ID: <b2c8b0c2-ba9b-4fb5-beef-6e405eaf9247@ursulin.net>
Date: Tue, 20 May 2025 10:01:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] drm/xe: Add WA BB to capture active context
 utilization
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 matthew.brost@intel.com, Matt Roper <matthew.d.roper@intel.com>
References: <20250509161159.2173069-5-umesh.nerlige.ramappa@intel.com>
 <20250509161159.2173069-8-umesh.nerlige.ramappa@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250509161159.2173069-8-umesh.nerlige.ramappa@intel.com>
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

One question below in the context of the missing workarounds series I am 
working on:

On 09/05/2025 17:12, Umesh Nerlige Ramappa wrote:

8><

> +#define CONTEXT_ACTIVE 1ULL
> +static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
> +{
> +	u32 *cmd;
> +
> +	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
> +
> +	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
> +	*cmd++ = ENGINE_ID(0).addr;
> +	*cmd++ = __xe_lrc_engine_id_ggtt_addr(lrc);
> +	*cmd++ = 0;
> +
> +	*cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
> +	*cmd++ = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> +	*cmd++ = 0;
> +	*cmd++ = lower_32_bits(CONTEXT_ACTIVE);
> +
> +	if (lrc_to_xe(lrc)->info.has_64bit_timestamp) {
> +		*cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
> +		*cmd++ = __xe_lrc_ctx_timestamp_udw_ggtt_addr(lrc);
> +		*cmd++ = 0;
> +		*cmd++ = upper_32_bits(CONTEXT_ACTIVE);
> +	}
> +
> +	*cmd++ = MI_BATCH_BUFFER_END;

Matt Roper raised the suggestion in another series that we should always 
use the iosys helpers for writing into mapped BOs. Later I realised this 
code uses the same shortcut as I did. I probably even lifted the concept 
since I placed my function right next to this one. :)

So question is what is the definitive recommended way to write into 
mapped BOs? Is the direct writes shortcut acceptable, or this also needs 
changing?

> +
> +	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
> +			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);

Btw here code uses the iosys helpers. It is a different BO but they are 
created/mapped the same AFAICT.

Regards,

Tvrtko

