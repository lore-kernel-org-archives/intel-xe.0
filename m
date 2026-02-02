Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD67E7315D
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 12:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5FE10E4C0;
	Mon,  2 Feb 2026 12:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qhb1TKEy";
	dkim-atps=neutral
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C1B10E287
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 08:01:17 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-34c718c5481so2583485a91.3
 for <intel-xe@lists.freedesktop.org>; Mon, 02 Feb 2026 00:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770019277; x=1770624077; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gpa7TO42qLDaaK7rvjxkwHnmN2Z6us+3ErmDg7wFIC0=;
 b=Qhb1TKEyd0C9yjBTj1EEYKYh3xRTSx6YeQJYBX0l2LJkXOIh+iUOo8cwzIi/qCbR18
 k1HgFP8odZzyYCR80T6oNNT2+9GuKdJP2Qm8hF+tWKWCzWcw3jkpmw/Tdy1hVR2QLe2L
 wm12/Sjr4Xwn+6Ox/iDDMu98dqRndwaIR2d+kVjAPU5uDh4SpR8mxm3Arfjg8FwMB13+
 qRsa3AySl7yMah6mLz0wTuwtWeOxRJPFCHM5gSYGY92MXTwJN8ELIKEvkfLnSy5V0r9d
 ZMSaMgrQexhU3rhD2nuOqzhFpyWbcoCLsUcsv4V+j5Ln0HUMAXIIRw3hiUTGLE5SapLH
 AzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770019277; x=1770624077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Gpa7TO42qLDaaK7rvjxkwHnmN2Z6us+3ErmDg7wFIC0=;
 b=SV+i54mBPD+WV0BzrCmmVREjUAqPO3dt0mj08L8VWMtuFOIJ3F3JDqXsPxgpptYKx6
 uyFNa9HdbYX7qxrH6Y2mXz4hO919QyTgid8Nt1aBJUv07JZV0Je10+QXtulqRtbErtNZ
 XiPwja5zCWlF31f8kaeZ5L4tYPEIXnKN9U5BvKHmdD0c8J1nnNXhEW6LHJiN/ah6oNHU
 LXea5dGgmk5Sd0qMM4KD7sCjjZoAFkqEJF9KuMqb7FF6xql6X8dxW3zpBEt/+S2W6JFS
 LmLT9yiJBfPBOxFslflsME/Zzc6OX+TBHk5UDkWJbC9j0psGkpyWN2vR5VeK4dvO17+G
 gSww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZCaUjCeEzeDm2B/xoTNVvUry2bi+pzf3EbolDyrNy2mkJJN6iqtCkoST+w9iX7L45Caipvwvi9w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxqu13Qu9IU/QE1HcOMoPuqndrjTF/HjZM2+jpExv9Dd9t5noHF
 zs9IMSzVJjSrPkfWSFUNwqboAlDkamOBFi8ED2SVHa7yuuz7ZVsn490=
X-Gm-Gg: AZuq6aLkruNSgkvxmnXT0paAC2nvqdV/fzo8R0TOsM5cMewYjCQnX5QP6QeyVEUFbsN
 J2taGWV5SxVlg6Sm01+iyAu3WiL8A40+p6EfPdJq0WcXhUB+CD1cTg7scyCR2HAhvErdn/WKcjO
 DE3hWfxF8Ne2hAIcRkwSv/pV1dKmjwsRyKrMD/G3rwAqkC/hiPIGfwrLxw9dIwuEgULsb+xqDRh
 S62JhZSK1xbQX2Gx5X5npZZ74kj3XBJi9ng3mAyle4NTG5dj0d8XMrvAEnCp4ZL6g6ZOeRrqHv0
 YXApZIWTLBgwy7Z6En+Hc/H2ywGkjSbuB/gGpAnDGaLxbmPpz2rsKGp7mmmJQAycuwSWM5hIEOo
 EJV+4jkRqWKgDqZ/qCqbajXktRWoPsPmxIKA4vlwjCtQ6CbqcsfoX3K1y40gL9ryxuibAfpDL6F
 0M3dwg1Rjqm/Mh3ZA=
X-Received: by 2002:a17:90b:3dcb:b0:340:b912:536 with SMTP id
 98e67ed59e1d1-3543b3ad361mr9815251a91.31.1770019275904; 
 Mon, 02 Feb 2026 00:01:15 -0800 (PST)
Received: from at.. ([171.61.160.203]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3540f2f02aasm14655168a91.7.2026.02.02.00.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 00:01:15 -0800 (PST)
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
Date: Mon,  2 Feb 2026 08:01:06 +0000
Message-ID: <20260202080106.1093-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aXovFQsk-w90wZi1@wunner.de>
References: <aXovFQsk-w90wZi1@wunner.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 Feb 2026 12:55:53 +0000
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

> Maybe you could give it a spin and verify if it fixes the issue for you?

I tested it, and only tested to see if it booted.
now again i tested, and it seems my iGPU and eGPU wasnt detected?
and after futher debuging i found that setup_efi_pci only detected
dGPU, so using update_nr_gpus was useless.

and about the macbookair situation, i say we just exclude macbook from
enabling apple-set-os via a smbios quirk.
