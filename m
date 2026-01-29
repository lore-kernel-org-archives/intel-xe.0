Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5723ED73E89
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 20:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180F410E8D0;
	Thu, 29 Jan 2026 20:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="USNDVzpi";
	dkim-atps=neutral
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB7710E7C3
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 04:38:09 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-82361bcbd8fso310903b3a.0
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 20:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769661488; x=1770266288; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NtQGOuC29uzt/6xaJHUti83+eOwCdLjkcvzsqNsGu6w=;
 b=USNDVzpi/NMuc4WTVKvX34yX6KxaKMPv456dt/vyTHVVT6nxo2XrrHGxCWLNjxAbRi
 lYqExVzkvjtk74tLsUMlF8c7Mi1vpuMHsTQ9I08zXjvkLol+2bLL0fUtbEVPNqTvXadF
 Hg2Hw8suq+WKq9UtgbJi1O1YYXR2iayZ6xxrQ5SeFso7bsoOcJ3b1o/j3Xj8iXDBj+mB
 uUXX0FK1vC8WAT3xtorZoJ9skrv66i4Fua0AiWZQFYxLC7gCNLTeDQjp2UKnN2HEo47v
 U3maa+ySJV5yNzK93F4pDjilJi2csYHEFBlKWzyXP/TD90nDyQdF7Mn+3L0/MtAJANfu
 fJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769661488; x=1770266288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NtQGOuC29uzt/6xaJHUti83+eOwCdLjkcvzsqNsGu6w=;
 b=LPPl38hy31WKhDNDyyWbRo8nWZu52MC+oscUE6Gm+d1FLh7VbJimHbVF7LSJ6rG5YC
 RiWB4x/dv0J7DwyfWDgk80BHmT2OTf0IX/73lKyha2D9Vwd/dULZLFXdBuLIwZwki2SK
 ndAZFlF+llJg55hHg5dJquciPIDqnOAbuKRbMlz5kSZMOrsujAlJ8Lwm+vFHU5TmbLXQ
 5BmxzaBZqA/IEEb1f9FNvCZ/YDlrcYcxNIGW8g/YAsB5LLsEAXkYy3fnK70jaUaqTtki
 diwTwi72VbKyd6+kdsTg4P2KxS0pkYu01yKeJxkVbNedztQf7j7c2t6JotZs3qazJQfr
 mPZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSoCafItSmGsbx9ie3CwdX1In4TFHfkaSVY5IE+Hhd3wrZO/uQAgiUMRFSzF3xZhufaxOnZVh3hQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3JBUXSd1hervJJRcNIlYWR1xSKoaLlXzRATfsrASyqlF9Tkh0
 SP5+BxZ+87EeL7QWd/N/zxcQ3mpXd3kpXHRhamdhlNDmKBU5mQ2pdrs=
X-Gm-Gg: AZuq6aK/eE5Fi6DlwbsLsFW5zIxtrWrP6d9y3hEKK+e41PLCNw8gKGdDHJv+xXJMzjE
 pwdbTPLJ65Q2FaT5JVFNlU7vxZG1IwTVYHGnmv6A4Q6SAm0iXOE4pn5rE+zCIKupeoaL/0tFr+L
 X9Z4K4eNFVUKciE4ewTxW7CRK/lNW3FAvNH0wjRUnYmGyfg9HdnwGhEPOIOnwUCaz4a0lSnmtS1
 XgZQLxAkmNDlaNfkdZEOtTRaNV1ep9CsbiRnRV6bacr0Y72sn+T2rMfkTURI2H7LlmLBbwZdO3R
 F5J9vUpOxFU//EX846QmQlid3zKQIVeYoacfSzOmmc/3wpZH35tdAhIYfHAP86qb3r6QsJNOjqq
 z1ELeF6GF2Bjrytv2mUutRH9W6JetpxFd3ztFqkLuX28SqbA7/g/UiaQBCOhKXvgcHPD+UWx7g+
 M9/tOIT1+lPsup
X-Received: by 2002:a05:6a20:2d26:b0:38b:e430:156f with SMTP id
 adf61e73a8af0-38ec62c6411mr6930473637.20.1769661488418; 
 Wed, 28 Jan 2026 20:38:08 -0800 (PST)
Received: from at.. ([171.61.161.8]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c6427e9ce21sm3595710a12.10.2026.01.28.20.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 20:38:08 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: lukas@wunner.de
Cc: airlied@gmail.com, ardb@kernel.org, atharvatiwarilinuxdev@gmail.com,
 bp@alien8.de, dri-devel@lists.freedesktop.org, francescopompo2@gmail.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@linux.intel.com, javierm@redhat.com,
 joonas.lahtinen@linux.intel.com, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, lszubowi@redhat.com, rodrigo.vivi@intel.com,
 simona@ffwll.ch, tursulin@ursulin.net, tzimmermann@suse.de
Subject: Re: [PATCH v2 1/2] efi/libstub: enable apple-set-os for all apple
 devices
Date: Thu, 29 Jan 2026 04:37:59 +0000
Message-ID: <20260129043759.1220-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aXovFQsk-w90wZi1@wunner.de>
References: <aXovFQsk-w90wZi1@wunner.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Jan 2026 20:47:57 +0000
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

> As discussed previously, your patch will regress older MacBook Airs
> which use SPI to access keyboard + trackpad if the set_os protocol
> is invoked:
> 
> https://lore.kernel.org/all/ZoJPgSlZJ3ZlU2zL@wunner.de/
> 
> The last time this topic came up, I suggested counting the number of
> GPUs instead of using the DMI quirk.  I even provided a patch but
> nobody with an eGPU bothered to test it, so the thread fizzled out:
> 
> https://lore.kernel.org/all/Z6paeFrjdv7L3mtv@wunner.de/
> 
> Maybe you could give it a spin and verify if it fixes the issue for you?

I tested your patch, and well it works (you still need the 2nd patch to 
avoid a blank screen), but i can see how this will fail
like for example, with the iMacPro (only has dGPU) you would need 2 eGPUs
to turn on apple-set-os.

My opinion is, we disable apple-set-os using a dmi check on the 2013/2014
MacbookAir models.
