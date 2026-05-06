Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81140CD342C
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 16:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EA010EE1A;
	Wed,  6 May 2026 16:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fdJMF1YB";
	dkim-atps=neutral
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD4210EE17
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 16:44:53 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-82f8b60e485so3209751b3a.0
 for <intel-xe@lists.freedesktop.org>; Wed, 06 May 2026 09:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778085893; x=1778690693; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N4Q6MSodkGOeqtC71K6cHMIejF8w6gSkWWa1tMdwofY=;
 b=fdJMF1YBPBnF+ZUpi4xSon3+GYKG57ElPLSefcrbX0CEH8P5/bkJDfMQDM+VwRi7uX
 VoXhPATWoGMwFBEl+CJZbfyrBZOqUH2GKklVESL8/MvtpxjzhA0w3UaUDXH4Tvd+AOQh
 VvxW9Mi8jjCkn4mbYiBP3EORhINQDv3PddlbAjlKxjNlLfv1YF7biQdsBRRFH//1hBAe
 j6CT9linQxhUtpkfqMW5b98X0xPBWNoFmy56EhwlDts1yR5j9NE6pT/+65hIToRst3Qz
 dhm6pnCtY/0NHqc5DWHZhXFm79gLWGxTXc8uSFfbTOtx4ToD7aHLE71r7fqyNbQUnEva
 4GFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778085893; x=1778690693;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N4Q6MSodkGOeqtC71K6cHMIejF8w6gSkWWa1tMdwofY=;
 b=p5pILiygtg/00ShA1HgYcDBLi9WZKrgnatYVbVKAczQBw6HRfDeBXHyf9rbZRp++JS
 C6aFoEY7eRB1RUO3jNJycAxmX7leNx/t2+lTgny1CK6Di1GWdeYzLI9NmssNu9KKk7l/
 hPMla7QDkXHrpJ/OhZgFvfN/aQXCTuN5AfjWE84tqFfyfDUY1i2LqIMhX8GDpe5cB5q7
 umWR7gC04KGXcpFbdD3Ml7VDOC47dbMjy+SAbwoovX1Az14EVsh/3MIax1Fd7d68aEsf
 q0Vk+UspQYXwrhyzh1tPsSTxYsRQLbNayr5UdXhdd8W/VU+OkR/JBWRP6vIaKQrBUb/R
 XPxg==
X-Gm-Message-State: AOJu0Yzv4GdoHrlkyj5CaJ+jeCS334YnA+rJXJ5ONyMz2KjoMk/WiI7B
 ch5gfbC3T/ZYPqawFZpgpHXujjCHSgOSFXGOJicxvxcNyXu44zpPqBA8luDdK9od
X-Gm-Gg: AeBDietzot0BE5qCwGosX7U17A5L0kupKnhxw5WFmT7VfUKax/Ya25mhygknXQOwuis
 j1+wodmk2pOzl+KoFooKvG5whyzzdpdVhUQHymH+QbEVwM2HezIp3AcKN1ZViBX8trygPsEghF3
 /B6fialAmimN8aBzf1zxsm+bRb0Hq+eS6H+1QSK74LshDa3zOANohRC+l6Zos1zSpxQUwSuSrYI
 QRgpt+mqoYD7ck14haH07leyWYXoUFhkBxmFp3vKMgSulJS1PSLjn+AyjWhSyE5R89qoUtoPz5L
 3esui3qBPxsJS1EdcVCSwV7e/Qtx5r25lJ9JikrpNYTDMSgOFKRc8Vecrmz8LbIBV8PtJIOWcL3
 kXiX94GjrmK8VlnuXA2uE/lfNp1zkdrgCRyPqL1MTjae1MmAM6vGxZL4Naa6EPpcinBPe18eNKB
 8JYC0Jpd6UWQZMcUdxr8+n8wPwNiAo0io5m00QO83Lm+AtLLnPlsN/XPJxre8AqXe5j0sKNO4a7
 K12n6nlew==
X-Received: by 2002:a05:6a00:3c8a:b0:838:af72:fb37 with SMTP id
 d2e1a72fcca58-83a5b0dc944mr4032546b3a.7.1778085892643; 
 Wed, 06 May 2026 09:44:52 -0700 (PDT)
Received: from [134.134.139.77] ([134.134.139.77])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83967dbcfc0sm7222443b3a.42.2026.05.06.09.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 09:44:52 -0700 (PDT)
Message-ID: <c509d626-563b-4335-8466-337d1217fd48@gmail.com>
Date: Wed, 6 May 2026 19:44:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Use fb cached min alignment
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
References: <20260430154602.11393-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260430154602.11393-1-ville.syrjala@linux.intel.com>
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

look all ok.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 30/04/2026 18.46, Ville Syrjala wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> Instead of just looking at the first plane use the fb cached overall
> minimum alignment.
> 
> This aligns with how the i915 version of intel_plane_pin_fb works.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> [vsyrjala: Rebase due to pin_params]
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 948446346c53..3e8114fbfbaa 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -459,6 +459,14 @@ static bool reuse_vma(struct intel_plane_state *new_plane_state,
>   	return true;
>   }
>   
> +static unsigned int
> +intel_plane_fb_min_alignment(const struct intel_plane_state *plane_state)
> +{
> +	const struct intel_framebuffer *fb = to_intel_framebuffer(plane_state->hw.fb);
> +
> +	return fb->min_alignment;
> +}
> +
>   int intel_plane_pin_fb(struct intel_plane_state *new_plane_state,
>   		       const struct intel_plane_state *old_plane_state)
>   {
> @@ -469,7 +477,7 @@ int intel_plane_pin_fb(struct intel_plane_state *new_plane_state,
>   	struct intel_plane *plane = to_intel_plane(new_plane_state->uapi.plane);
>   	struct intel_fb_pin_params pin_params = {
>   		.view = &new_plane_state->view.gtt,
> -		.alignment = plane->min_alignment(plane, fb, 0),
> +		.alignment = intel_plane_fb_min_alignment(new_plane_state),
>   		.needs_cpu_lmem_access = intel_fb_needs_cpu_access(fb),
>   	};
>   

