Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1D3CA601D
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 15:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEE810E16B;
	Fri,  9 Oct 2026 15:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="pd2yIqvp";
	dkim-atps=neutral
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5C910FE4C
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 03:47:19 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-917a707f37eso40831866d6.0
 for <intel-xe@lists.freedesktop.org>; Thu, 08 Oct 2026 20:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791517638;
 x=1792122438; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=w8+DFfkUUomz+a1TzB5f0ADCXUizRfgZPO9NzdXJlRI=;
 b=pd2yIqvprHVC3YRztd3UvuB8i/EUsLxUNpYYYFo6Zr5sljubPkO3Efxk2DHjkIKCOm
 rz4HcRyScxaMXMP7M5V0S23Wpz+uaDkdnTZFWVmTaYJLtntDgVpsmVHabWbpEOx0ZnRt
 V7yx/4p1IeO5oNJWZ4appxM+MOAcpl/QJqzxfoiDpm5JKyY7xayoM0otUW1Z0l3FcscP
 ZO+SHTocRlytYZR/w7vPQtLpFeKWOvHspD3FiPSnwD/EthMYlLbLVJYHt9/nShZib7LN
 7yd443GnFCNJaVruzTd2Ajr1G0AsZr4iq+iUvOILoO62B9ObklgkA0Htp/0xgVR9zsOm
 xMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791517638; x=1792122438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=w8+DFfkUUomz+a1TzB5f0ADCXUizRfgZPO9NzdXJlRI=;
 b=a+7ozc7/j+Ux5rGBzTwmKXQlWz0KuykgYCNSQdhSBCy1ezoWhebSqBXGRoX4L0RrRF
 yZb1TaBBunQb3B1aawAkhzAoqef9lgxTBjYrhOkwUm0118TY7NosRbF/MbfgAyiW/72E
 7q4UoJIYKPj39dV6PZABn2XZo3dp+jK/aBRZgvrtBSpfS0WWOlNTaJCLqyzotxFB8TcY
 4/Dpxs4PJMbExAhhtBctoHX8rUq4hnBodn1ETPSx1CY2XkQKQtA4e1paAl6fGRNeGOvc
 LxpWJpM9kInHL1oIRCYbU85qyGspSslQsKhZeBt5w+idMhF93c2T+orzEQdXRaHVNKNj
 umMA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxJ+tBKwTjWE1yg/pNOqicqPxYRi2951zEUGH2DJW25YsXLfnMWhxTZqp9Bu/O/3enybYZsQC6UTw==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJLUAqctpS2iaSXiUsZ60qIV8juERjiWsMbegyl2lSN+biGjm3o
 UKizEqfQQi1fa4nFbf7zQ/xHUyAbkxMU8LeO7DJaFxyejqrsGtlztOTtuuEZnUsrBm0=
X-Gm-Gg: AYBFou275y5fGzi4bGrr9GOLoX0dx5VBhPfbn+GixXGqoA03YAurm1RamdM+U6HOukS
 SwC69esLQmjpwQYSbogmZkEvNtiNQHQ2C0FjXGhbsWDrtIYpv9UDnyV4WwpSTHoFgtRDM4fOSgm
 kDoJXnBeygPjJQDTM04S/j4R98N/iz0u4NCdj1WurOVb1gYOka+6YUwCcH1eEoUUaMnWYoSMTk9
 hB+w56b4f4+U/KBXhACiwk9UA3HkbjoJD/b0iUYfw1efOoJeG4yZuv0ZpVMI/Z+BKPUe95p1C4i
 SeSu98LI/A/lGIJJ8dkHzybFpefq9vaUJJB1KqUz0p7/TOlqEbT3UAjvmFnOpcAOXkpck4MXJZB
 FeDt4dm1ZuOBfG1xRrK+UhJ5CvK3WpKuIBJiAxw8F3BdkbmvwgjBmGxr08AL2BNMX+eSXbIhIpP
 c8F4NYRa1bkzk2XSKm6SomsB3ql905UWeDnKuhMlWdPGrVrN8FjN8vDKlR0aSTJHN2tKHr9U0oR
 57iAPjtCnW0Ygj0I7ro04uZF9Z2bz1vAUdx/xyQllJJ9Enn77LuzH0PlL+uM064Z3CxdgRzkKqB
 nurIXs47W10CoUbM0A4a1t0d8xC9Vx/r+Rc0fcqzkwskARaZyRJFQINu4Tfy3p9iGOGh8w==
X-Received: by 2002:ad4:5c69:0:b0:917:9905:cd03 with SMTP id
 6a1803df08f44-91b554f036fmr11991716d6.20.1791517638110; 
 Thu, 08 Oct 2026 20:47:18 -0700 (PDT)
Received: from jake-laptop ([74.244.125.93]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91b54e80344sm7934976d6.7.2026.10.08.20.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 20:47:17 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not
 valid for eDP
Date: Thu,  8 Oct 2026 23:47:15 -0400
Message-ID: <20261009034715.10894-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007083443.647649-1-jouni.hogander@intel.com>
References: <20261007083443.647649-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 09 Oct 2026 15:32:01 +0000
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

Tested on the XPS 16 DA16260 (PTL, xe, 7.3-rc5, DA16260 PR quirk
removed, no other changes): Panel Replay SU is smooth with this patch.

Tested-by: Jake Steinman <j@metarealtyinc.ca>

Two things it leaves:

- The panel still judders for a few seconds after panel power-on
  (DPMS on). Holding PR inactive after power-on fixes that here; 8 s
  is clean, 3 s is not quite enough.

- No DC5 on a static screen while PR is active: 0 entries against 550
  on a static VT with the AS SDP suspended.

Since this panel needs a specific change for the first one anyway,
could the AS SDP also be suspended while vblank is disabled on panels
that handle it, as in the RFC? That keeps DC5/DC6 on a static screen.
https://lore.kernel.org/r/20261006220500.3417572-1-j@metarealtyinc.ca

If you respin, a Reported-by would be appreciated.

Thanks,
Jake
