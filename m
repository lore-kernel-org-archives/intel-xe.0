Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EF1D73E83
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 20:48:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C55010E8CF;
	Thu, 29 Jan 2026 20:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W/bzLYNk";
	dkim-atps=neutral
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA44E10E742
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 17:13:08 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-29f2676bb21so178925ad.0
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 09:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769620388; x=1770225188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v536dPL3xbsn4C25/q600c85aXwSnqGccGF9Ndz/vck=;
 b=W/bzLYNkZaGXe2fQOalrGHWUZ5pXMK3sQUHLvNWiRTKmP0E7dJAPhyfZHLsJ+2mujJ
 oJYoDp8a610x5ZVT8u+0FCLhrL2gikFeQ9Dn1M2kDx539nCpijstJWgRLNKd/fV8MAX3
 vRxkjACd+V35Al3xOQCcwwgQJZot/IfWSdUUpqqJFAIK7F7SxuxHWWTn0+xIWp0KBE0a
 JyY+CKXCnAezAu218Z1JQEVu7RssjDEvBgRBS7mjdhbkiZgCcRCld/Zhrp+MrlJt1eGA
 hCECrGxL4D59P7kZsSkkYQT/QMJD/U3tgnvlpLuEdMQ24pWO83caJGIsIuMB66UTuPuM
 LpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769620388; x=1770225188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=v536dPL3xbsn4C25/q600c85aXwSnqGccGF9Ndz/vck=;
 b=YEZFcfyKGe6OqI62THuMe30YJOqGDp49YoK8Mgkls6cXmPmBJxsjK+fqd5w2odvJ0T
 cMsHyxNDGVove4dQxgbzToG27zFHrRa9jqoiCJLGM0oXUs9TQaajubl67yyc5xY50cXE
 awgVhXerzei9kONXsKgXAAp/MM5fLtmGyii0tHWD5rRKvfIxoLLihRERIEeYnJv8zwZ5
 4cy5t9zmIEZHakq9MErJgemSdyWprotO5JFukzXfh8dzrssR81k6axhOrpdDMARh0Edj
 1v1wM93KcmIgYqawWAn/nhhZN+5XeFfoOzqu5wIQdE9H7JrCnNtLh6r6/JuEdadMNPkM
 ULSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMwwcTQFRqT8uO5uSAjQ5Krq3lOdeFn08L8egKp+bJ/4JZNPbgZ4uN6MMCvz6WBKQdsUO8jDApIA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3hF5wg0uu+TH48NtwL1X6z4bJ2tnFmpbhh3uUaX6O4v6PyXaQ
 KCMgk5HJg31l8X6707u/t4bxag7h4A1T9kNeIcrjZAohQywKAFAbq0E=
X-Gm-Gg: AZuq6aJLh2HyJBjiFzGG1Qk0e8kR/CpzkaxCE88AvuswEYgpbJQgYpoeWcwOYyNJvuQ
 z7TSUxoJWz57s7nTJ99DuCRzuRk/YDyzJcdqrESXp7DQj51egKOd3j70yjCthWcmXz2u0xqHHhA
 +zJMjLYCx8u6UZWahMgBwkKx2uxO9JPHZkLNykZfg8E9I1DfUDPRNUVUmX5CQIvSr8S7VwxZcN1
 ReetbKoO1X20n74N+fIFQuIc9E/NwbPaDbtaCC/A7VzvabJdk8T2xOGLvcml985fVdNeGIb32WF
 xqYOFLrAHicyYuZYoLwUznmX0Sm6NXXzscwHMbXLcekmxnTsFH8sL92hKb3166gnqCogwTAGV5V
 vdkjpSSIhXpipE96Es76vZ9840286vEBw6ZFON7TkT7L2ISLSqdh5H8QOrB05xk+n5DW1T1o8YK
 PLLG/k3hoh+GBd
X-Received: by 2002:a17:903:1a88:b0:2a7:afb2:ce1c with SMTP id
 d9443c01a7336-2a870e18dfdmr60392705ad.61.1769620388192; 
 Wed, 28 Jan 2026 09:13:08 -0800 (PST)
Received: from at.. ([171.61.161.8]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a8bd74e9bbsm85105ad.95.2026.01.28.09.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 09:13:07 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: lukas@wunner.de
Cc: airlied@gmail.com, ardb@kernel.org, atharvatiwarilinuxdev@gmail.com,
 dri-devel@lists.freedesktop.org, francescopompo2@gmail.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@linux.intel.com, javierm@redhat.com,
 joonas.lahtinen@linux.intel.com, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, lszubowi@redhat.com, mingo@kernel.org,
 rodrigo.vivi@intel.com, simona@ffwll.ch, tursulin@ursulin.net,
 tzimmermann@suse.de
Subject: Re: [PATCH v2 0/2] Add support for eGPUs on Apple Products
Date: Wed, 28 Jan 2026 17:12:58 +0000
Message-ID: <20260128171258.1081-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aXoxpWFE0rByjS-y@wunner.de>
References: <aXoxpWFE0rByjS-y@wunner.de>
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

> It's possible that the iMac has a multiplexer built-in which can
> switch between the iGPU and dGPU at runtime.  Please ensure that
> you have set CONFIG_APPLE_GMUX=y in your .config, the gmux driver
> should bind to the multiplexer if there is one.
> 
> If there is a multiplexer built-in, then disabling the iGPU is the
> wrong approach.

I was using apple-gmux even before this patch, and runtime GPU switching
does not work on either macOS or Linux.
On macOS, the iGPU does not even appear in System Information.
However, the iGPU is present in IORegistry, and Apple appears to use it
only for acceleration, not for display output. This can be seen from
the following IORegistry entry:

    | |   | +-o AppleIntelFramebufferController  <class AppleIntelFramebufferController, id 0x100000556, registered, matched, active, busy 0 (230 ms), retain 8>
    | |   | | |   "IOClass" = "AppleIntelFramebufferController"
    | |   | | |   "IOPersonalityPublisher" = "com.apple.driver.AppleIntelCFLGraphicsFramebuffer"
    | |   | | |   "CFBundleIdentifierKernel" = "com.apple.driver.AppleIntelCFLGraphicsFramebuffer"
    | |   | | |   "CFBundleIdentifier" = "com.apple.driver.AppleIntelCFLGraphicsFramebuffer"
    | |   | | |   "IOMatchCategory" = "IOFramebuffer"
    | |   | | |   "NumFrameBuffer" = <00>

NumFrameBuffer=0 says that iGPU isint handling any dispaly atm.
