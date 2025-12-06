Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7496D3B7D2
	for <intel-xe@archiver.kernel.org>; Sat,  6 Dec 2025 13:41:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685D210E2E9;
	Sat,  6 Dec 2025 13:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dvi5/QyT";
	dkim-atps=neutral
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6159910E2EA
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Dec 2025 13:41:36 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-34381ec9197so2675294a91.1
 for <intel-xe@lists.freedesktop.org>; Sat, 06 Dec 2025 05:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765028496; x=1765633296; darn=lists.freedesktop.org;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=TBWAxs4hzXpjItbB1la4XtkYffK5EZFUezT5SwEA1u4=;
 b=Dvi5/QyThM9ciz980vR67ZsxFA57wdSiw2sdYahMB3W0bNLCrNHPZhTjhjkUWoxA1g
 DxunPxCMrUdRzDZGYtOdV4MSvlXZSRo8jPJnPJwTadeAhYEXsIT244xRzrWw87NEiAol
 0stBrDnq6/S5w7rXmbdd8xAZZwm1UZURS9WYan+DlZIoktKYpn0UxmHkdHsJeV8x7Al1
 1Gvvsd4d6k2XDLIrZeG1ochKToDvdqpSi7C8L5UxU9Ig26yP5gWGjvcd6pjZHE+auRRG
 yJUAgnZgipui7EyxSS9Cz5CGSzjbRgxUr93BuBSX4sPgFnLjSJNzwSVAfQZ7vDdL8JYW
 v5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765028496; x=1765633296;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TBWAxs4hzXpjItbB1la4XtkYffK5EZFUezT5SwEA1u4=;
 b=P5aHimA6zbZSAV9gNaUQu/0MzaZ95GmKXOrA4LTg7ayGXM0BobQkH95KIQMRhVd2S3
 M3BuOLh7g+tgVaqv1xF8y8qtsKu5g6kyOLKsAfSJSHrW9/R9EkYPsmC+jyhDs/AZCzRw
 lVX/fB3HnlVoTaI37/yZWOsu9Lt9TNruao/ZTOsKRZV31lrNyUykb9RHfqy36AZXWGLj
 XNXRunPbFCFfwDL/Am75D8+jGFqOAeblVy7UE+9fXJd+gvByJlto6ohQlmDhIxn6gOVU
 tN3P9IXJ3kwkEwJvlNmEW639uNGsBis+Dc8VVAzwgN7Sd1Qqsgc8KUFpVnD4eyqLgWvC
 W1wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH9/qM7VCW49U4IevxV/+5e4OP5Lb0MAGyvk7Uo3r0Q/OsDQPfNojWhwYPeQSbuK2FJRLb5tR+uw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwltQjotPPtahXO4tLu94OvR7mrUWCuY+3Mfce2fqBR7OP+kCmP
 mox6rc+SV3eGiKMdNxSEgwuEElbTSB5TPystEAT6GZ68F4jK03S/If2Z
X-Gm-Gg: ASbGncsWLI1CQxLEOlWd/hRwKyG1pPvCXjvrMVAyfd08T7vxnbdXYGAkmuG714SdQFE
 7ONHQzoYzmFvjlqn1MUFOSle9veVht+2cK54Sdi9QMH9yZpVtfgFdveshU8cJLJ5rhPC+VkLN1V
 YTu587pTzeykegyhsOVjwRl+5C8/ZjZVDTbcoNU3wOSaHl3aq0zf6WWyicGppkDLBYg0shP5Rh7
 YvgARcUZpfLOoz8A/NBZmUvgKp9E28fLXs7gXOPvY5qzMoRxSB7+CAOAaZUjy0+wA+qzjgLlzIf
 ke8enmKOBN02wPhyLB841oyhPAc2Ol4swArGaw6YzCosYwTZZkgSIAdGbu/L7RSMras/QJcOH6o
 oCd2n38noF/nQLKtdZ+LKzomhT0/ytJiVvZOFqzzKc9WBuXBVA4Aksa08TKazV7DdTJJ9hK/hPS
 9OEpARViFMAAJinpBf
X-Google-Smtp-Source: AGHT+IH4n/ip3SEhWyBW2BYwU6MgshsOQpBGQGdoULfIKl0gC6Q6dJhtMtW9mPo1IySW/qns8ah87g==
X-Received: by 2002:a17:90b:1c86:b0:33b:b020:5968 with SMTP id
 98e67ed59e1d1-349a25fb832mr2039751a91.21.1765028495754; 
 Sat, 06 Dec 2025 05:41:35 -0800 (PST)
Received: from localhost ([2400:2650:24e0:bf00:6647:e402:ac7:7283])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3494ea63e87sm7331327a91.12.2025.12.06.05.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Dec 2025 05:41:35 -0800 (PST)
From: Zhenyu Wang <zhenyuw.linux@gmail.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: Re: [PATCH 2/2] drm/i915: Add intel_gvt_driver_remove() onto error
 cleanup path
In-Reply-To: <20251201161013.735943-3-juhapekka.heikkila@gmail.com>
References: <20251201161013.735943-1-juhapekka.heikkila@gmail.com>
 <20251201161013.735943-3-juhapekka.heikkila@gmail.com>
Date: Sat, 06 Dec 2025 22:41:33 +0900
Message-ID: <87y0nfiv76.fsf@dell-wzy>
MIME-Version: 1.0
Content-Type: text/plain
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

Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> writes:

> Add intel_gvt_driver_remove() onto error cleanup path.
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  drivers/gpu/drm/i915/i915_driver.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 0128faf2e483..f8c01d52aba8 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -908,6 +908,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	i915_gem_drain_freed_objects(i915);
>  	i915_ggtt_driver_late_release(i915);
>  out_cleanup_mmio:
> +	intel_gvt_driver_remove(i915);
>  	i915_driver_mmio_release(i915);
>  out_runtime_pm_put:
>  	enable_rpm_wakeref_asserts(&i915->runtime_pm);
> -- 

It might be the simplest way to fix, or even better to clean up it by
moving intel_gvt_driver_remove() into i915_driver_hw_remove(), so
they're more paired with i915_driver_hw_probe() and move this fix into
hw_probe() as well, anyway...

Reviewed-by: Zhenyu Wang <zhenyuw.linux@gmail.com>

