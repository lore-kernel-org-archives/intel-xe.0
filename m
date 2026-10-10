Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D5ECA9EDD
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 14:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9451B10F16D;
	Mon, 12 Oct 2026 14:36:31 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9487D10E9CF
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Oct 2026 05:18:47 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-534e6545939so2796671cf.3
 for <intel-xe@lists.freedesktop.org>; Fri, 09 Oct 2026 22:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791609526;
 x=1792214326; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O16bXHFucTMEeNKlXKDYTMjJw1owaYurkTBLl5Gsiz8=;
 b=HTyFnXXhuwU/Ny8a9iH+Ss58aTjKAaaodRZCHquY/P2Hs/tXWvLQfP/ha81VT5zyYi
 XsQ9QW1iDu7oVcM89vZHqV2mP6+v4A7oPKsWf3tFggqmxUnLILrss2bMKqQ801nWhoJA
 BblMfM/5HsmkymDz0ZwqDIoilpUk0mAJsKSUoKgOoFfeOtS/NIHh2Meqa3HVx12m9WGG
 owll0T4rRjuTP0LOJsYBcw7SDnqoiXlA9Q6dN0A1i62Fa/FWJA4mV5o9ob3fQ/zbqPEF
 /D3FaQq9qLqDCfiM6vnaFgyTezRlmmE5RgNBwLYwUlS1v8WkdKDjaQCHClhHQ3coxodz
 IRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791609526; x=1792214326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=O16bXHFucTMEeNKlXKDYTMjJw1owaYurkTBLl5Gsiz8=;
 b=ZjaOYa7BewDsFPBPtKWBiZ3tTIDmbO5suJ7ez0oHAnBywIjSq+vK7LVJOULEnnMZPY
 m3FrNYsAjdU1vcY4H7tSu9ccS6stC3qLx9ujBbS7FEqc7/MqQ1tE9st/KIeJgV3RFTDK
 krsnfllvZ6m5k4v/PLsG9H1RT7AImfgrM+qNVvbRwSaRbk8XoJqgsTD+gnwm+Cmf23HW
 IBWr+UOf08PN9Exhn5bsYN2gTopWIMCgAkmt2uElWMZMaqHzlPCr+u0iVSoFmmr3T8H3
 WHk+gbsKO2LHM1qP1P5/M3LWKa0JCC+qHw46ky1o4yXK+3svChexM87R/tgIEFJ/Ve0f
 pDIA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwTPuJQYcTbddShegBCQft4yI32GuvPq+jRyyz84EgnkigrnnLP2oJ72daBJl7ymIGHMKHptIP0KQ==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJSMwPDFSVxckT/pVW9HcelIgyKP2GkpfwdydHaRpLJptbT2dwr
 B9uzhCjBYtZFj4d/OoHuIU/wbQu4EDnhD60tfaMg7zxcLGdrQV9M/ThE3iyrKV665bE=
X-Gm-Gg: AYBFou3oYOEq3oZQNlreXaZ4JOdR/gmjlmi+ka3fdjNzZbFAPs+WdwZtkqv8+Qw+SDy
 ieOA3XkHbWZVL71UhMPPM3k6OjzToj97vxt0jDZQZv6UfBpQ9PU45Kt61uPdW3ZzFlPuTSdXcSK
 D4s6PknOcmGRS//K+UajprUGBaOLr1fj1QrpfLNkG6ynzzJixl/iM2WcI5NhI9Tfys3Rh7u0tmA
 TBrwO4XUCafy3H0VxX864wEnHKtYG+sJzm/rYcX65yf73sX1m/fggBhOYraZcNqhIaAta0mkw/b
 cftSAE3agHGrQppEbGeHI5UyK/b6dvspQUPdSCdzpBYZ56vL8aI4yophOlWJXNrkybDXV2ecanu
 F0q+tc27PhiA8AQe7YVFiLfuMb/3FPuJGAVHlL+KRoSsKpZ7yurvRR0zuQ6NE2UKz4LPJOGmRjp
 TsIU5AoZfmD7j2ilOHGGk/dhgrEoZpTuQeGiHXAjJqAz8MRYNXcrwrs5w5VlCmlpKeplxKIOi/t
 qKXd34EhVyoq7YXIV8iGVxA0MIOtxu/i0yvYwMkun5EgWpiCwS4POP6S4ANfXuJkk+resQppies
 RCvDp7JQ7T7+ZML28QkcVNl0ijAOQG8VpZ//NOQGvl3e4BIUUipfCehSfQDKFxLRCuMg
X-Received: by 2002:a05:622a:1f91:b0:532:d202:328e with SMTP id
 d75a77b69052e-5359fb85a92mr68279931cf.55.1791609526381; 
 Fri, 09 Oct 2026 22:18:46 -0700 (PDT)
Received: from jake-laptop ([153.67.39.44]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91b5501859fsm36031116d6.16.2026.10.09.22.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 22:18:45 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not
 valid for eDP
Date: Sat, 10 Oct 2026 01:18:44 -0400
Message-ID: <20261010051844.11094-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261009175251.2097777-1-j@metarealtyinc.ca>
References: <20261009175251.2097777-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 12 Oct 2026 14:36:24 +0000
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

Hi Jouni,

Retested with 0x107 bit 6 set (my 0x107 patch dropped, 0x107 reads
0xc0), 7.3-rc5, XPS 16 DA16260:

- With the RFC (AS SDP on in PR Active while vblank is enabled):
  smooth, including after screen off/on.

- Same build with the RFC behaviour switched off at runtime, so the
  AS SDP stays off for all of PR Active (PR_ALPM_CTL 0x11): judder
  immediately after one lid close/open, and it does not recover.
  Switching the AS SDP back on clears it at once.

So bit 6 set is fine here, but this panel still needs the AS SDP
while frames are updating.

The judder after panel power-on that I reported earlier came from my
0x107 patch. With bit 6 set and the RFC, five screen off/on cycles in
a row were clean from the first frame, with no hold of PR after
power-on.

That leaves the RFC as the only change this panel needs, and it keeps
DC5/DC6 on a static screen. Unless you have a better signal than
vblank, I would like to go with it. I can send it as a proper patch
on top of yours, or you can fold it into yours, whichever you prefer.

Happy Thanksgiving,
Jake
