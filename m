Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93287C79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 18:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5038B10ED15;
	Tue,  8 Sep 2026 18:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="azDF9LPj";
	dkim-atps=neutral
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF7F10E0A5
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 20:23:41 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-52f9fc510e1so51686621cf.0
 for <intel-xe@lists.freedesktop.org>; Mon, 07 Sep 2026 13:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788812621;
 x=1789417421; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=d7pr2QtNO9k1/kHTmwk/u2/a5M36L/fPmEgvHLhiO+o=;
 b=azDF9LPjdJ8IpYd5i4uzjRY02Uke6KA1gf1QKpjJVLLhuwaRIF3voNi5Or4HQCuy2k
 4kFVJsnvo5Ij6d4IswlrOAWkBxR1wIsq62QM991b3u44Ph7l4oY7vI3AE1FtjNKZRSPE
 mUjHOHA3rJ2WJk2W+R40Fkuel4iO/pNSWK+FNkJ6IFcSGhps672v++wFg7eyDaG4THHa
 ObMwc36otUWkyp2zRrZV29tQ4tf+4ow+UoHHPUp5OBHa+sa/Rcx5euJqAgFFmHdsSIh4
 wcWRHRgsEnHjbNM5VblV7r86+ov5Q67T03egU26EQeuX0o3v9zrIPOMuZSL6StJR5h1W
 2tyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788812621; x=1789417421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=d7pr2QtNO9k1/kHTmwk/u2/a5M36L/fPmEgvHLhiO+o=;
 b=f2B7Ar7F0vJDOFHegPZ7C0CAWygewgkHeQ5Ok953PXbMy49I+CdoXlUHqzYh/mzXzO
 WPwO4jOOp61MXqbDMQ6sDobHzmRJ9sL2Yhqbly22tAMArn89wEfdxbtF2KQEK2RwIimN
 z/86PVaovM4b4WJB+Nn6vuQXpxQNz6RIbRgkwj0nV/vaqenTBFvVkPlZMdiBUh+ABTdY
 gSMCBBQQZ5zaOjSw5m+ZHkiVjHqz+RdQ8ZYWG8GSAC5RInJ3u1lx0av4rVcwRZRHTA8h
 BkWmNOCeBmWfBPsN1MFZOt4UPV3zNQ5QEfcw06PJeVXPF0HMZqq1kRXGJrjCkXbE9glS
 RFqQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx/hao29pdREAXqAkVPNfr2WYwsPpGLlAojQsTJxqUaY2e9lqv/qXK1VF7/s8vCCMUko6EptWiDgQ==@lists.freedesktop.org
X-Gm-Message-State: AFuF++mJx1CLXg+jwv9fJpzOZHbTpL2LJri0n1kXFp3LD9jJpeWYhhZd
 QdQbjjh/LHkpW0xHC34uSJ/GC3DkAX6vzl6bEldUsEyO7LpStvgKbOaiSLsKhMdIdmQ=
X-Gm-Gg: AYBFou1pPkbyushDUU3YSqFKXn38NfpwuMt1MzbD11CHhg+eUbdwb2xCx+sGd6GCuU/
 0iT8DdO7j9SFjqY/yQjyyyJ7Y0BhChygDXZxX/UbnV1c17AqGYqPXsAIPiofQYucmqclwlZwV4j
 ABJUUEB43czfOsuGqQ/Y1iyqz0xvsOC7Sg58F5Oqpu2tzaVXH8WvJSJxrV6O/2mVGP54Nee3ce1
 g0i5Yy5na6kCDV1htNVUT6nFNkkFJJBe3M78b0XmPJVs47DTql0/U+pVk+e84JpHfFefXzQvspl
 0Zd+uTuv8K+nDpyVTG+b6npvuaVdaRb9ezZKysZn/zQ8mzRs1K/+2vFQUG4nC5tHuns9nt5Xl0Z
 tS251+ziSRwC292c+5q9qUOIi+5Ta8+pzC6OtFZTWQzkaojUD6DZ5G21t+UYrYpZPZmoF4ufwAH
 KgZywO+cJJk0HV6N+tildHJZEF0lMi9kI8fzXalkv+ZiM7B3Cmzvpbh8CbSsGHdBjOnugmB/2jl
 RCxfNOsYeTwnYpu5iVq0fGpneaEPzRnm4IEOOqxgwqaRJpgjb2xZM6obWu9q8YyIvN2vw+9Lpym
 xyL1N3B27wiSDtWPBakvIwTLFuFGBc2yebrg7gsOJ1+ai2fiFdF2jM6fzgvf
X-Received: by 2002:a05:620a:3185:b0:939:72cb:baf5 with SMTP id
 af79cd13be357-93972cbbce3mr2392073585a.44.1788812620426; 
 Mon, 07 Sep 2026 13:23:40 -0700 (PDT)
Received: from jake-laptop ([74.244.125.129]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9398c498610sm788695085a.43.2026.09.07.13.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 13:23:39 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, animesh.manna@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 rodrigo.vivi@intel.com
Subject: Re: [BUG] PTL eDP PSR2 SU / Panel Replay: engine parks in SU_STANDBY,
 panel never refreshed (Dell XPS 16 DA16260)
Date: Mon,  7 Sep 2026 16:23:36 -0400
Message-ID: <20260907202337.152269-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903135227.105232-1-j@metarealtyinc.ca>
References: <20260903135227.105232-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Sep 2026 18:37:11 +0000
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

Update, details and files on the gitlab issue:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9119

Jouni posted an xe_reg_rw trace from a PTL system where Panel Replay
works (1920x1200 panel, no DSC). I captured the same trace here and
diffed the two. The PR enable sequence and every PSR, ALPM, VRR and
push register match, apart from fields derived from the panel timing
and link rate. What is left: this panel needs DSC (2 VDSC engines,
10 bpc input), his does not; DC6 is allowed on his system and blocked
here by the compositor keeping vblank enabled; PSR_IMR.

Second finding: in Panel Replay, which uses the aux-less ALPM wake
here, the sink latches the Link CRC error in
DP_PANEL_REPLAY_ERROR_STATUS on every compositor commit (about 40 of
86 polls over 20 s, tracking a blinking cursor). It does not depend on
the aux-less wake lines, the PORT_ALPM_CTL silence period, the LFPS
half cycle or cycle count, PHY swing hold, sleep hold, or the sink's
CRC verification bits. PSR1 polled the same way stays clean. So PR
here is the same failed-wake resync loop PSR2 had before the fast wake
patch, and PSR2 with that patch is the other half: clean link, no
SU_VALID ever, engine parked in SU_STANDBY, frozen panel.

One driver observation: enabling PR through the i915_edp_psr_debug
fastset does not program PORT_ALPM_CTL / PORT_ALPM_LFPS_CTL, since
intel_alpm_port_configure() only runs from the DDI enable path.

Open question: is there a PTL system with a DSC eDP panel where PR or
PSR2 selective update is confirmed working? The other two PTL reports
(#8924, #8930) are 2880x1800 and 2560x1600 at 120 Hz panels.

Jake
