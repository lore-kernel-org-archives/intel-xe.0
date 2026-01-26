Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4824DD3F074
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 14:38:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC71B10E70A;
	Wed, 28 Jan 2026 14:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WQGNVXp4";
	dkim-atps=neutral
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7FC10E497
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 20:49:24 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-81f39438187so2520652b3a.2
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jan 2026 12:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769460564; x=1770065364; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DgBDIJIrUHpJ6j6lR+sPmz5sI1yJjso51mAmb29uJAg=;
 b=WQGNVXp4pNUp0Zi61cSUHTymPZn5edAJK0q2CtWppbPL99TmmWOcj3+74weKjHn7PW
 xlkbZ3PViClUNTba7WRBr+Z+YabIaf+4E/4WN+DB2rk+93beZZH6cCLs0zzINCR0JW3Q
 8rqyTymDMzhCIdHbLeze4xftKDlHUzDxyoR9VoHBEBufGqQ48/5xjvdJgKq/WzCPI3fn
 +rmYTpI0EC8TotjprwYZaQJNWakmSkOSrWd4eLzmKGdux6YbviM+VwuWamU85IBEyTQx
 MxX9HlmUXkGQgpYi+Qr6ppXer3CpTcuH41er0374XfBE0LYAUhy9B1FLAMUSO4uVYNzL
 yQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769460564; x=1770065364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DgBDIJIrUHpJ6j6lR+sPmz5sI1yJjso51mAmb29uJAg=;
 b=YpI/9tsYVTBqy6iiXh97nKGVycNUjQ0ZL8ukDxjOeX0ZRlkUlisW2ztbS90C8p3TdA
 NZlD9lmXcoLElS/Gt8tg8j1W60Y55AKGVYayfc4XhbAaTfmTIdpi4IZGC8uKeWnT4Tho
 Q4zsmDRsBbhnmQoormEdsW6BmMXoenxHlDaODzsVDFVe93i/nUFuwdi7B2RWJOtHuvHV
 kgKbxKu2GUgzSJ8RfIT2t9sECm65RF/OmgXuE7Su0auWrg0x9INgBcelTdgK+xV7m9SI
 F9G+zpwWDpU8Few6XTb2Q6cEuephJkG2YNmr96hhJ/1HwRr6skK52YwwOY7wT4aFwtBj
 +SEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrRkAY5Eb6wyOgidMJN7hzmuSETuvqWSNfbsCIK7VWoSR3/KwOR9IujCJd19FsFtOY+y/F01bCeA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwabznBo7+8pBtliqqWmvEZHx88hwjdAkyiFvjCwSO3RTB4ZYOk
 tbNg6RwXNhSCJ+E0BDNv6bIwRB+nyQOD/xo0vSdEarr6ArVYXPI18EM=
X-Gm-Gg: AZuq6aLfRTvZG0cn4XEhECOyMxNy0n8gPsVp4p2hpl9FLaCylFN+4Hr8NUMe0G6baU7
 AKZ4KIoJbXH1/8texLynqGkwecSHDc6W7vg1e28FgM19AKM5bYG6tU9GxbCy9UWsIlZSel4Jila
 P9DGm/udJyM0UI4khJRxlJxziOoG4NUTdo+8yUQra5S328pGbtJkp5nJi5yuWc8/JcSEeRhJli8
 lM1pTkSXAOW5KAz0FoeKrbjaYx1BM+uRNWIlyjVS1ZOFLQkkyLb2RGvuYSMKFXImA9ktKdYdlWB
 mgzv43CDWIRv99zd1mzUO873JgfVDI4vVpnuV0jcDd1NBXhGeL4jo/ILKIMn65uOaqGVlqtKAvH
 VTpgBigV3gVkZbxswv3eRjnVeIs+q8mhNPBVEB5utohfMh6xzmxaO9thm4o0V5rY03PKzQKnxcT
 KCo5w9L0a/mgx//Rp8NpK0JrdBgg==
X-Received: by 2002:a17:90b:350e:b0:341:2b78:61b8 with SMTP id
 98e67ed59e1d1-353c416b90cmr5425981a91.20.1769460563371; 
 Mon, 26 Jan 2026 12:49:23 -0800 (PST)
Received: from at.. ([171.61.166.126]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82339095c85sm5470337b3a.67.2026.01.26.12.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 12:49:22 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: jani.nikula@linux.intel.com
Cc: airlied@gmail.com, atharvatiwarilinuxdev@gmail.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 linux-kernel@vger.kernel.org, rodrigo.vivi@intel.com, simona@ffwll.ch,
 tursulin@ursulin.net, ville.syrjala@linux.intel.com
Subject: Re: [PATCH 2/2] drm/i915/display: Disable display for iMac's
Date: Mon, 26 Jan 2026 20:49:15 +0000
Message-ID: <20260126204915.1324-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <c3fc271e9cd1eec5ab96c70c9dc3c971d5ed73d6@intel.com>
References: <c3fc271e9cd1eec5ab96c70c9dc3c971d5ed73d6@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 28 Jan 2026 14:38:43 +0000
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

> Rendering and display are quite separate in the hardware and in the
> driver. Perhaps you do not mean "rendering" here? Perhaps it can be used
> for rendering but not display?

Yeah, it can be used for rendering but not display, sorry for the wording.

> Okay, so perhaps there's no eDP connected. But what about the other
> connectors on the iGPU? What about everything else in the display
> hardware?

You cant use the iGPU to drive the display on any hardware (including external displays).

> If you can figure out that it's specifically link training that fails (a
> dmesg would be useful to show this) there clearly is display hardware,
> right?

As said the iGPU cant drive the display on all monitors (even on macOS), but still heres the dmesg before this patch:

[    5.095489] i915 0000:00:02.0: [drm] Found cometlake (device ID 9bc8) integrated display version 9.00 stepping N/A
[    5.096061] i915 0000:00:02.0: [drm] VT-d active for gfx access
[    5.096102] i915 0000:00:02.0: [drm] Using Transparent Hugepages
[    5.099214] i915 0000:00:02.0: Invalid PCI ROM header signature: expecting 0xaa55, got 0xffff
[    5.099217] i915 0000:00:02.0: [drm] Failed to find VBIOS tables (VBT)
[    5.099324] i915 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=io+mem,decodes=none:owns=io+mem
[    5.100960] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin (v1.4)
[    5.832214] i915 0000:00:02.0: [drm] [ENCODER:105:DDI A/PHY A] failed to retrieve link info, disabling eDP
[    5.835756] i915 0000:00:02.0: [drm] Registered 3 planes with drm panic
[    6.428455] i915 0000:00:02.0: [drm] Cannot find any crtc or sizes
[    6.722404] i915 0000:00:02.0: [drm] Cannot find any crtc or sizes

> There's at least three levels where this could be handled, depending on
> details:
> 
> - Display probe (the patch at hand). Assumes there's no display
>   hardware, at all. The driver doesn't touch the hardware, which
>   continues to consume power, it's not put in low power states. Not
>   optimal if there actually is display hardware.
> 
> - Display disable. See intel_display_device_enabled(). The driver takes
>   over the hardware, puts it to sleep, but prevents all connectors from
>   being connected.
> 
> - eDP disable. Add a quirk somewhere to enforce eDP is disconnected, but
>   other connectors can be used.

The main reason I sent this patch is that after i915 trys to probe the display,
the dGPU (amdgpu) is no longer able to detect the internal display,
resulting in a black screen.

> It would be quite useful to indicate the PCI ID of the device in
> question.

00:02.0 VGA compatible controller [0300]: Intel Corporation CometLake-S GT2 [UHD Graphics 630] [8086:9bc8] (rev 03) (prog-if 00 [VGA controller])
	Subsystem: Apple Inc. CometLake-S GT2 [UHD Graphics 630] [106b:ffff]
