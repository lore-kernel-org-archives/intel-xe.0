Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448ACCD8CAA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 13:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0310F10E254;
	Tue,  9 Jun 2026 13:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N4UIH4te";
	dkim-atps=neutral
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8610010E1D2
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 09:32:01 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-befd83e0521so1133489266b.1
 for <intel-xe@lists.freedesktop.org>; Tue, 09 Jun 2026 02:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780997520; x=1781602320; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LWQ2fsM6Lbb4TBMtDn9FvYlyKisjzRyBmoFcUvRD0XE=;
 b=N4UIH4textgHlMBwUepUMU7K51La9r1t2qQA1NmFChkJjhYybqY795BWkqEpu0Nwd7
 TTG3+ceCRiZJnhmI+IrJkl0Mpt9Q1nb/QTpP9yb9bqqjxJpn6pCj31svF3pA+W1jjN+Y
 16kdNS83miU7esRvyIQ14Jb1ZPRTOzZq5n/Iv9Z0GzIMKpOrI0dAF3WM19X9rX+SeXJp
 9HHXhEA1n1TpxMLOaMH5fZAUuK/xYkkoklELqoN+kOWN4ORXvb5YZq7vKbeKM8iEq6rH
 U7w3RKamlysjzV4+HVIYK47y6iw71NjNvL+9pno/eKCNLBph7qp8/dIEondusXB0T47C
 fiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780997520; x=1781602320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LWQ2fsM6Lbb4TBMtDn9FvYlyKisjzRyBmoFcUvRD0XE=;
 b=d4htE2n0G8f6/jpT7O7R3xX1RrjjEKt4wdhFQQKUKsI1RGIMf3R26+SOamHw+0ip3C
 FIjVsNmHYER0Y5f7powujl0JvObkLuD6U1OuCQI8yAZCI57UbnbRDr/2UIKrHKjDMr/v
 Pco3bYzN0WY8lUSdK1W1/l5/MdiPAW0RzyIRniPA3SMjo7V4qDmGxj2Laqu72osGtL3K
 uFGXr6tDc6JtpJnbfVoccPW3mIkTZmW9nqKOVSr6MYHsTodzcM59wry0DVbYvBeiuNAb
 06mQojeyuYPakwsJ/HG0GtszCnezS03BGGeVWYvn43uRB+y+745aQWXQQWqNKRIjYhnP
 XNVA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8v7gPuRvC+lkkShRwjsCPpY4VRa4kTPitr6HO0cHKsbWPucaEN0Joe6SyNudeKUA11mt5K9v3BwQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2hkBob68A19sfahTX41d3qGEOwBacxe7fN248bi+SVCMQv6ye
 +6bjwLCP/myE5ZP1XV3hzpJENlVKhDOsHaWcF2C2Om5MClmurrTm7fVp
X-Gm-Gg: Acq92OHXUX5FjkN9M4NYQPYmBwdIK0sZX+ULBTjnV6fM+6R+PPRxdhyOWoXZR16CmJN
 Ic+OU8rwMwL01SliDGmsbKZFPvhA0dvIZUQq6AS0s4zaTeT340E3R/ffaJ8quj9llKCn/HmPxI2
 QxqSy+isoBAmNNuhejp7fJaFYHFneoEiFmJ2sZsbN+cgEiSBstoYgv/IczzpuL8qC1t6KWFfmm8
 5VEpPZE4L/IGsJqYGDt+QnIqy06dm4S+AExLbZb1TMIbp+5vW7pPkcb+vJZkC2c1UosXEG1K0Rp
 iDaqCCtZ3+iO17L9i7Xp7Xlv7fe0P8kh1H99xsOoU0YQncCDO0u2uwCmbXaR/4WaRZLF4u8eFBf
 OrDDo95TI/YdIOK0Ey19tSGfgxkW3EA4+hM2glHDGkZ98o6icftmXdc1vhqawLCbHbG7QcEnhah
 xYVMgbUYVvCux2k3qYEvLAvfn/And+3KtCZ3HK7W9+htPozUFUzKv1jjqq7e+WsmlAo3vuiX9+v
 7K9tYNIZw==
X-Received: by 2002:a17:906:318e:b0:bd3:7514:14f3 with SMTP id
 a640c23a62f3a-bf3a6b0f103mr559535366b.11.1780997519627; 
 Tue, 09 Jun 2026 02:31:59 -0700 (PDT)
Received: from JTOLLET-M-FKW7.cisco.com
 ([2603:5004:20a0:100c:4e0a:b38b:df87:2d8a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf0559f1f62sm1027272266b.57.2026.06.09.02.31.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Jun 2026 02:31:59 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: ankit.k.nautiyal@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 arun.r.murthy@intel.com
Subject: Re: [RESEND] drm/i915/hdmi: Poll for 200 msec for
 TMDS_Scrambler_Status
Date: Tue,  9 Jun 2026 11:31:56 +0200
Message-ID: <20260609093156.86410-1-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529045621.82540-1-jerome.tollet@gmail.com>
References: <20260520022544.3097252-1-ankit.k.nautiyal@intel.com>
 <20260529045621.82540-1-jerome.tollet@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Jun 2026 13:54:25 +0000
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

Hi Ankit, Ville,

Just following up now that my previous ping appears to have been approved by
the lists only on June 1.

Patchwork still shows rev5 as New, with CI passing and Arun's Reviewed-by
present:
https://patchwork.freedesktop.org/patch/726364/

Is there anything still blocking this from being picked up?

Thanks,
Jerome
