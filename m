Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E2DC9830E
	for <intel-xe@archiver.kernel.org>; Sun, 27 Sep 2026 14:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59ACF10E60A;
	Sun, 27 Sep 2026 14:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VbUw6HzE";
	dkim-atps=neutral
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com
 [74.125.225.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5BE891D9
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Sep 2026 16:56:30 +0000 (UTC)
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49ccead2aecso8440045e9.0
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Sep 2026 09:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790441788; x=1791046588; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:reply-to
 :references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=Y7CWRD33ZNAjzZhcxyPSUQrShcHcMLlYdnMLZIjlEa0=;
 b=VbUw6HzEh5MVH88H+4/tsUKMnA814f0iPQyLF4gUP0L1AjqrkI4L5uPMee/DnPABsH
 3RdRagwEEoZhDDV0k89Q6FKaoneb1cg7VgbEuBq4hMsvCiBYZx9j5giqFl5j/g/WHoBV
 Tdz74WFN9gWepEK86H5rMeVqGM0cTlnndgSWJIq5hxqcXGcPZ9zZG1/ewXsUEL7+n2Kg
 de6nfJ5v6H3jDMSQ3MsUxM3B3DuVJxEbvpA50izRpwU5a1MhzFywTNCBfM502E8CUfdk
 LAH0T6r/cyeZNTrgC7nWvJqEdCRQBRQAAF95h511wt1NMXhuveDWA+kQM4q+OV1WljXL
 zEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790441788; x=1791046588;
 h=content-transfer-encoding:content-type:mime-version:reply-to
 :references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Y7CWRD33ZNAjzZhcxyPSUQrShcHcMLlYdnMLZIjlEa0=;
 b=jeY/rrftP4SECI/kJib7jgUkm3jx4NfzLm/y3c7vKCefGN6eX5xiWaH9sqAkVlxQdD
 Ics5Ba1SZka0uHbDdRg8PD8kXqwun2ZuSgGJqcC7PfUwhp80oVmPhdT5iModyFvs5iR9
 3r/YGjqrYFabV4xTj71hW4G2ixn+HLmgm09xaQ2zOe7HuTqicJPRvOqHsKixY2lXoVuw
 DDMU6N15mxxQ0dyToGPk5cEonJ+xIEvCirwpH6xt+k8we1CaFmmzvQ7nv2yq4dTvHGay
 IGezCWk+Ru1gznCpQ/29zuqN0PENmKvheaIALAgKth8pPUv3v68Lu2pbtnhlQs9Ie21G
 j8Gg==
X-Forwarded-Encrypted: i=1;
 AKwUvByxstGh827VCpX13/wqdTtflkj5LbrDSqi47rNpCU31Acbb/ejg3i07+sZztM+SBn2BMPskE8CRew==@lists.freedesktop.org
X-Gm-Message-State: AFuF++k++DXN1QUjJjG3HLg3WwAQ5IKLrX5a026oZ3An2I5JGpO4HXmR
 /BjaFBO26+kq9NC0ol1o9uQbP2T5iHiRuJB8zU3IC9Fko2oDmOoA29Xl
X-Gm-Gg: AYBFou09BkrQ3XD5Z4af+455IYxXkIabsZMSiXpxbcrU514qbmfvVRhcYm0IoaAom+q
 9yiaesBb80rc8OfMWiHsDWUf6edtV4vzDwNnnUdS+pOm/Nf4JbFRZ+EepTmVA5jVmctl+Dzq/Fs
 SHiyf0osNzY7EBCc6rkSbcd/GY2jVROmP5b9Waz3PMm59tH1Bq/+gJq+/UkyrqPY4Du0n67YDMc
 ZfzR4Bz3lORDMH8k6zVTiPPvdDYmxU6WAOS/4RBPn/SxRGQhQQ4UYWFVx3EnGWzexRV8Am4/Ej8
 EWOORg6J46lRPGpkkkzWzM81AzhfjaSqXXw0SJQGpXOo9kmj2zaCMwyqLR1VS5zaZd+81LLFLt9
 bTq+n3J9cD6SRy2DDg+Lfm6SzfISvmNwr22Xbog4wx4YQmm+ZJF3wTceL0qCXoR5vsMiVOUB4rm
 ooCDP4E2UvD11/oPTmY6R37kfzYECaVKOlPRK0qI12Zd+5qV9HD0CK1aiwk6ozS80Gzale41xQi
 gKqD6CdJNNyySkBfUO/u8XJPQt5ueVTU6jMykwhS6OG/2GGvPmoeQ5dhllhlpWjKclEdS8YmjBO
 6GoAGMJi/I9KL/5nzn/gaDuM8oNt5efBluFhTKHHmaNEX1r5jmAF4kW2Rwho06y4ocnIld+3vof
 Q0zgLpj0=
X-Received: by 2002:a05:600c:3ba9:b0:49f:fe48:d177 with SMTP id
 5b1f17b1804b1-49ffe48d294mr30353145e9.32.1790441788421; 
 Sat, 26 Sep 2026 09:56:28 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a02-3100-b162-c701-4960-a998-3de8-2fce.310.pool.telefonica.de.
 [2a02:3100:b162:c701:4960:a998:3de8:2fce])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ffe91075bsm44556595e9.6.2026.09.26.09.56.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 26 Sep 2026 09:56:28 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/shrinker: hold a stable RPM ref across scan
Date: Sat, 26 Sep 2026 18:56:21 +0200
Message-Id: <20260926165621.31254-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260925115521.1018940-4-matthew.auld@intel.com>
References: <20260925115521.1018940-3-matthew.auld@intel.com>
 <20260925115521.1018940-4-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 27 Sep 2026 14:45:54 +0000
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
Reply-To: Karl Mehltretter <kmehltretter@gmail.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 25, 2026 at 11:55:23AM +0000, Matthew Auld wrote:
> @@ -102,7 +84,7 @@ static int __xe_shrinker_walk(struct xe_shrinker *shrinker,
>  
>  		if (mem_type != XE_PL_SYSTEM && !rpm &&
>  		    xe_device_is_l2_flush_optimized(xe)) {
> -			if (!__xe_shrinker_runtime_pm_get(shrinker))
> +			if (!xe_pm_runtime_get_if_active(xe))
>  				break;
>  			rpm = true;
>  		}

Could this skip TT reclaim with CONFIG_PM=n on integrated graphics
version 35 or newer?

The !CONFIG_PM stub of pm_runtime_get_if_active() returns -EINVAL, so
xe_pm_runtime_get_if_active() always returns false here. Taking the
outer synchronous reference cannot change that stub's result.

Previously, kswapd could take the synchronous fallback in
__xe_shrinker_runtime_pm_get() when D3cold was unavailable and continue
into the TT manager (e.g. with CONFIG_ACPI=n).

Sashiko dismissed the skipped-TT concern assuming the outer resume
makes the active check succeed. Might that dismissal have overlooked
CONFIG_PM=n?
https://sashiko.dev/#/patchset/80538

Thanks,
Karl
