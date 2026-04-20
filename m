Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C498CF588C3
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 13:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EBB10E604;
	Mon, 20 Apr 2026 13:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="lsGEbO+r";
	dkim-atps=neutral
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA3D10E604
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 13:24:08 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so39528885e9.0
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 06:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1776691446; x=1777296246; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tWgOpHK1V0mcahhXRBLeTBDr92JJ8SRycnjCV/1/+JU=;
 b=lsGEbO+r8d0nljtGh75VUNcrhUFrhJvdyjv8KYa6KqZWqHPatxKveV8kmqDUioHDV3
 qfcHw88sbQa8/4LNSpvMbu2uhNFxzP7XabMLXUJ+la5f3FoWjywK+cYVixaGK9UFXfTg
 EEWrPB/FpVQwVtQty+8AdrYyEgB4/cC6B5vlukF8lef/x3C+ulL695iyi3vatEXb/RW5
 Jh/nmOHOIr2KS/GLi0lT4NpO2XRgQcQT5JkE22ac9qS25hoD9sR+01DIhdGdbVcmEdSV
 sxoSJeXG/VdaS6scBgJJ7zHGRrWpuY+aMNy3E3OV0AkvQyJa8E6Zoh2T+Bzi4j0Qv2A8
 YDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776691446; x=1777296246;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tWgOpHK1V0mcahhXRBLeTBDr92JJ8SRycnjCV/1/+JU=;
 b=Gs4e1VwM1GH9QZDVsXMg3CHKTR5Hl/GHZ2NtDLfnuINIXY8RFsEJ8XJbuteHKUZ7JD
 6mQuRocPeJV5vwEXVhmFhoCH40XNPOOvBb0pWZ0vDhE2A43Up48yDZPbcL8sRFdZjRvx
 jvJ9sP3qGPEd8y76cMBH3ZR85Wtc8uVIyQQncaKgAN4wjasdVM92+iZguXmD2nuoTyg9
 FlaiW5oeepftg3T/sYVSkvrRyIMcWqMgoxWq3UY6QKmB5PnXgfi5bGnF1sVCZxh6B+6+
 y2SbTDdFc6NRlNOWqw7BRSzq6rKM3h7kHO0FzVxd2JUl4Hpo9yW7sjnm40Mi6TOjaiFq
 tmpA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9RXOVjfx1lXMcOqQPl7NUfPPJNpaPkLPkh4RTR/zZ9lI7IZ7iP/cpjgQGTdf+L/1R5pfq6jmz4KA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHOnynfzlkkLBe8YYej1Psl1hiA6xY0+ZwpkadMFUBR8NCZW1n
 wGZOjFcAso+LDNL8iLKYKseCBFUZfYDBVjLmtVWUeuAaCgthwf+9hDzQEsYIHLfetCI=
X-Gm-Gg: AeBDiev0rHMzF/uRVbEwoXdyA9/GnKYwncHsgG7YI6bNigKe5HGXqVsyDDwoj+yfROe
 SqwW1+SX6rrs8rsLh4wrjQ3eWFzCTp2xvr2VRxKUGuT+qkXMoqtyJDOpoPtebzcTzSWNPsL85mF
 VL4uuuZyi3H1hJ9fZ2NCA1b3h4rmH/LyD84XyTtNywEnoFVN36cB+k0YJ8bRzlSt7L4QATnjVVx
 fir/qeGYD4XltvUo6xJnkwsfPGbu4/S4ET02yhSJxA/PSYZbpktM7W9QKGv/85tTto//GSwiBZX
 +NYEAphWkUVD8L0WJal/Lo2QADdheHnizytbAkz5qVbuIKYjIsTelsiPDs43sjvlyUTz2vfwE5b
 mMx00Dy6Ousz3QX+1pulg3JhrDvXR48HK6B4Z4GxlODk1/9cJbFdOJoomNdijhGpBeJLWIUPRXw
 jJcRomvqqk+mEjOiW0GN/v5g+4LlzuyLs4VJqTZLFhkA2cX4AlBRiqbBs=
X-Received: by 2002:a05:600c:1549:b0:48a:761:5808 with SMTP id
 5b1f17b1804b1-48a07615c09mr25066825e9.0.1776691446240; 
 Mon, 20 Apr 2026 06:24:06 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f8188sm305785195e9.2.2026.04.20.06.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 06:24:05 -0700 (PDT)
Message-ID: <384adac7-2aa4-4568-b7a5-987e914fbaf2@ursulin.net>
Date: Mon, 20 Apr 2026 14:24:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xelp: Fix Wa_18022495364
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org
References: <20260420131603.70357-1-tvrtko.ursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260420131603.70357-1-tvrtko.ursulin@igalia.com>
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


On 20/04/2026 14:16, Tvrtko Ursulin wrote:
> Command parser relative MMIO addressing needs to be enabled when writing
> to the register.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: ca33cd271ef9 ("drm/xe/xelp: Add Wa_18022495364")
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: <stable@vger.kernel.org> # v6.18+
> ---
>   drivers/gpu/drm/xe/xe_lrc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 9d12a0d2f0b5..c725cde4508d 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1214,7 +1214,7 @@ static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
>   	if (xe_gt_WARN_ON(lrc->gt, max_len < 3))
>   		return -ENOSPC;
>   
> -	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
> +	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_LRM_CS_MMIO | MI_LRI_NUM_REGS(1);

Or if this register exists only for RCS would it be better to define 
CS_DEBUG_MODE2 as the absolute 0x20d8 (as in i915)? Unfortunately the 
public TGL PRM does not list neither the register or the workaround so I 
am not sure.

Regards,

Tvrtko

>   	*cmd++ = CS_DEBUG_MODE2(0).addr;
>   	*cmd++ = REG_MASKED_FIELD_ENABLE(INSTRUCTION_STATE_CACHE_INVALIDATE);
>   

