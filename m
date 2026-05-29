Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA51ACD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 14:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2CF113428;
	Mon,  1 Jun 2026 14:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cFrVDbIH";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833D510F89B
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 04:56:25 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4891b0786beso89900515e9.1
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 21:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780030584; x=1780635384; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=adBf9RrkQBUo5197wDvh+qHOpIDrsOpmy75Eg7+7V4w=;
 b=cFrVDbIHKBImb6R2qwG58jqaEr72Zx1avUsdjUF+QAF/l0r3SJXpeiOcf6w4Bgl3Qz
 uX15N9pzwoXTiO3GDEcvMwIfgPAKoJLwyc04geodB5bJpX4r0UuW9ScRUUkOPX1hRfz5
 25iMjbUlc7zX1mCCp+dVOW1Ez0q9cNGB3zXnL3Xslql7UgKaqnIPkbm254oIHVDzqxMx
 EPNsBfbhX5hfgiOCPWQvMnuBBsM1l4+mNRixn00g/u7ETqRqJoFdJmV99QhFlEKQZJqB
 wNdvU4KPeYfmVMwa8SvJWM2cRUCAZ98fEr811qC5wNoetA0oputIB54+C0ZjdxPxX4JH
 XK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780030584; x=1780635384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=adBf9RrkQBUo5197wDvh+qHOpIDrsOpmy75Eg7+7V4w=;
 b=c+qg8/CEpRg4Tedy+NmGzKqdglzY1M84uarg/1VrM307jlZeQ7fr773jZ+0cn2wXOx
 +vttszc+7IwdORWefOztDLJ5IFvNsusXBLNkTGW6DEVb7qMcbRnZEe6TwZjaR/a+3m6X
 q0lgwy6dtDxV8X8XtowcuxueUahYGFFM1WNrQ+45m3lso1oewOjSIz1MZhx76++gmBZd
 EcWYZuJ1eAu7PxNrO0qQXZ2iPp28sqBQ6yprp+hK4XlieZgDR//YoDUyM+MyDIUHHKfy
 gbUYRkHsC58J8iro3oHp04esGwU8Cly4gJLWrOltJLscfkHy/IX/YeMKZlSCAyCB3LsB
 Q83Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+cRcYtJZjQ5FC4GTDs1Qm4k80meg8ceLYMj+LySZabsSc7aQEbf0PWtec6IkIFmqr1gnlRnzJpjA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwS5/8gXQMgAzzkKvYwkuVW7TfesIv2KeieunQKyEQ50vqdEeVe
 FUh4KnhPJwIKueHy8JvEAj+BsZazVEFz2+j27ArHOIDGgMvC263zZYpruTzrvUP7D4TC7w==
X-Gm-Gg: Acq92OG3MGX9fn+CGPGcXyfDSzVkriW0OudFUuFZoeGEZCKoWVSvIQVq1lIZTGCb5Pa
 xffxToNemJehN+omSTQJS3bq6SX9S0hMJgTe3P/vzf0BtcfwJ3/FwF9D0dG0aPzWCbFs1ug8C6x
 5BGuDZL3tJM4j545m5FZKz7bBtQZwa8MhiTAJgWd75gDud8gHmKXyPcGlGfsQEUDZwgT1LHCZc8
 blzc7EMtzbxJmjIgM8+d+wHmBsgi7cr3VP6nylEfBNzig74Hcv4PM2JjkmrCA9n1M3j+EtueK+1
 JOBnhd/g7T8ObJNcT+w5iyNMKmpQl/ed5+ZDhgCkoIoi46/+2Nj28soaDOru6kBBWMOTAztafNx
 rExF0WBPaKH/Hg5/Uyxik4RXjka0x0/pElMz4CaVUBndEOM5Uomr2YEPoresgBgIie0udIKHvO8
 NadqkPhJkevoY0UcMRMf+B8whSlrW3DwdlZyLdoDRt50l/4SgSIpqVGEezfDhJZM0NKCz2iGfsZ
 59V
X-Received: by 2002:a05:600c:5806:b0:48a:5501:7995 with SMTP id
 5b1f17b1804b1-4909c0b019amr12400255e9.18.1780030583775; 
 Thu, 28 May 2026 21:56:23 -0700 (PDT)
Received: from JTOLLET-M-FKW7 (232.64.3.89.rev.sfr.net. [89.3.64.232])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c07ee36sm7973715e9.0.2026.05.28.21.56.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 May 2026 21:56:23 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: ankit.k.nautiyal@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 arun.r.murthy@intel.com, ville.syrjala@linux.intel.com
Subject: Re: [RESEND] drm/i915/hdmi: Poll for 200 msec for
 TMDS_Scrambler_Status
Date: Fri, 29 May 2026 06:56:21 +0200
Message-ID: <20260529045621.82540-1-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520022544.3097252-1-ankit.k.nautiyal@intel.com>
References: <20260520022544.3097252-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Jun 2026 14:40:04 +0000
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

Hi Ankit, all,

Just checking whether anything else is needed from my side for this patch.

Patchwork shows rev5 with CI.BAT and CI.Full passing, and Arun's Reviewed-by is
present:
https://patchwork.freedesktop.org/patch/726364/

Thanks,
Jerome
