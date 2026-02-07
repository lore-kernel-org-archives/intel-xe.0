Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F8BE81BD7
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 15:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE2510E418;
	Mon,  9 Feb 2026 15:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gB4FYpta";
	dkim-atps=neutral
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3583A10E0EB
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Feb 2026 03:14:29 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-658f1fde4bfso6008390a12.1
 for <intel-xe@lists.freedesktop.org>; Fri, 06 Feb 2026 19:14:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770434067; cv=none;
 d=google.com; s=arc-20240605;
 b=e9PFvGiruF8znnA2cYIF005mKLPy6PVPPyJP27b+kSqYTb1AVAInKjNo4ByCJMLL6g
 ctIQ1j3tQBPLhtzKwPC5vVU47OW1B76hILXHoYQfpl5qyl7DjOpQl4FYsB8VApgLiMS9
 ZH1z6eNVh54BX2VcI27Vamh/JGrBJjdr48VShEYmTEilHE++HDOpl6yo37BquCb/hv9F
 oD45SiHaNokT0F5u9Eyv0ytsJBCAnWLCgEbWSC1/WGw4rUMZSMvDNJzVsyiMZ8TYc38W
 IYCS/X71Ub8n1lnm5M9+htbZqw2W0zPINhnC6JGwtSN0PkLtbV5pAu/bNnh8BNXZqGnL
 naXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=JwKIT6xwtwiVKcmFkakoNKJUwI1sPDl7YihmFR5USBM=;
 fh=Tu4SnUSyX4zr+qIlXwHtX0AwcRBIGVEoO6vFnqX8OVM=;
 b=NCYXKPT2FHntc6QKSH5frOMo1waQM+Vf+ol572HziEBfsn04Po2IXUK8PVN5AIhaxI
 qKY+oh5lfHkqtLs9JG3haZ9fkcMp+juOeirEUstbjbGgdf90h4powo+MjkG7peEaUr1b
 WK9rQRgNPn7fIOEBqDL3JOCowqmt1nvwhD4zprfvYyJha8BNKM0Jc2BV5S8aYa9e7/Rq
 EmXeWEOWPozONEo7XxS5Kd+1TwjwxP9BBdsjvHnkJIahifdabE2nFWFS5sEfssEAbN4i
 xIf56iOc7scS5FQIVNzKxTPEUDCqqIlR0GrLGtMVyqJMu7cLAIv9t0BJJMaHrJ6kFRTv
 tZzg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770434067; x=1771038867; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JwKIT6xwtwiVKcmFkakoNKJUwI1sPDl7YihmFR5USBM=;
 b=gB4FYptaOUOiDqXYB6F0nOGS/POsXDDfZBlPByuAP/B7AvDiJM4CnM14HD+AHMhhcc
 fqKAVtSWnaLJontm6IZp2ClD4Dew+IhZb+At/stuaeLdfDStNyGUBVjGkEJyPxu+HGo6
 HRMqkO0liP5XKX8u+8K4CPtk6VC3V4hpgNgZTbF94yrj95LPwx7LcXX9dJgK8+GC+U76
 5woipISwoIiezN9x4PIA5dccu9daWO1+TTET+gaSe8d+XSS5yLK5v+HsD8hyUGpRT3ha
 eD3xWD2JAB5b/T3mxBFXAmeKqufzmtqy9skRkUgYEnf/ceNzXftFQwj8CboRXI68fUqi
 4tVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770434067; x=1771038867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JwKIT6xwtwiVKcmFkakoNKJUwI1sPDl7YihmFR5USBM=;
 b=IF/Nhs8G4Iv2hC74w1I2AWb+9x/hLSPDi1UWGQmO5LSVGwzWAg8GRH64+4Lk01iZUI
 k3KSvjXDGYjgjejgT0Puh6MLIk0HDXMXUmYuvOkCliGIpo1gepkxAb5B4qECWKPzBp8p
 LDU3ovkljRPC4LC19YY5WCdZdjte5znT8EYdBnaoPGBftCjw1Bb8ihRnAC72ksvawnur
 2mYaIWLFcu/PkXqIK1iWlTnkacndmiE0iSZGvtFPuh0td+gHJ/0e4/q2fijS9NjBcbkZ
 Uf0HuBRMBpfPq6esCrCkyMRe/5/NhWuV2P4tCXrMK4j/DMyNN+cuEdNNszV3Em1uM76i
 AGBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6P9tQH31E1RakHt1vq7cFm0k2CpHPYqahyjWPEazAqCDJoZitq6WEBtNWS8ybjHZ7hXryBBxySQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmTJhVfV6OtuTWCqJZD2k7iv/jbmjWnGItyG23R1gkSBNbXjeO
 vdTSKQqaB9a1faEjcEXvesMZmG402qDVdG6VkOOcO7+9neHQt1Z77AT9Fti0expWtyWMPVkUKsB
 Cda7lIL7JcZpY+ApheQgpotydp180sBw=
X-Gm-Gg: AZuq6aKuWPxQvuXTa5e9aa1SIfU05L+nlFNvjktD0A4NycYMngcbONtwwgIBtgsB2X4
 o3u+Z3F4yFGECxDMQjP4RHIt4AhFb4NZeGoXo3ItTd8C/hAzs0zsQJBbApi48PxaPYrkjJllkLS
 ODsQLXIG4varmOwuHT9Kl5dvwIaYo2jdqg8RojvW5VJxz/ag2WdYq6kRRLlNhyNq4FTUrKLigei
 7lQCvvXKlNR47T28TzTnhSv6pHf2Z8L2ddpHX3MPAsW8NjhatLZpuTgF/vAjQMNKh8VtQ==
X-Received: by 2002:a17:907:3c8c:b0:b79:ea1b:f13d with SMTP id
 a640c23a62f3a-b8edb7e3f69mr340931466b.2.1770434067254; Fri, 06 Feb 2026
 19:14:27 -0800 (PST)
MIME-Version: 1.0
References: <CADN_a6Ne4Vr6knCXdKtCnB8=et6OK7PEZ8F5bpyGamwyv1K9GA@mail.gmail.com>
In-Reply-To: <CADN_a6Ne4Vr6knCXdKtCnB8=et6OK7PEZ8F5bpyGamwyv1K9GA@mail.gmail.com>
From: =?UTF-8?B?SsOpcsO0bWUgVG9sbGV0?= <jerome.tollet@gmail.com>
Date: Sat, 7 Feb 2026 08:44:16 +0530
X-Gm-Features: AZwV_Qjx90jdmwsUl0cBJilDjFdhaDlBlzQmRDYcYkkgyhese-R3MirbvB3lwLQ
Message-ID: <CADN_a6O6-iL+BS+0gy_AisiJTYQ6NGqSKXv608MxxETCawD0jg@mail.gmail.com>
Subject: Re: [RESEND] drm/i915/hdmi: Poll for 200 msec for
 TMDS_Scrambler_Status
To: intel-gfx@lists.freedesktop.org, ville.syrjala@linux.intel.com
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>, intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 09 Feb 2026 15:22:59 +0000
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

Hi Ville, Ankit,

Gentle ping on this thread - it's been about 10 days since my last
message in the thread (Jan 28).

To recap, we have three potential approaches for this fix:
1. Generic SCDC polling after port enable (current patch) - aligns
with Windows behavior
2. Panel-specific quirk for affected displays (Cisco Desk Pro in my case)
3. Fixed delay after SCDC config (my v2 patch from Jan 14)

Testing showed the delay works at any placement in the modeset
sequence, suggesting this is a timing issue rather than
operation-specific.
I'm happy to implement whichever approach you prefer. Please let me
know which direction you'd like me to take this.

Thanks,
Jerome


Le mer. 28 janv. 2026 =C3=A0 15:42, J=C3=A9r=C3=B4me Tollet <jerome.tollet@=
gmail.com> a =C3=A9crit :
>
> Hi Ville,
> Following Ankit's response on January 21st where he suggested
> considering a panel-specific quirk instead of a generic solution, I
> wanted to get your input on the preferred approach.
> As a reminder, testing showed the delay works at any placement in the
> modeset sequence (all 4 test positions succeeded), suggesting this is
> a timing issue rather than being tied to a specific operation.
>
> Three approaches are available:
> 1. Generic SCDC polling after port enable - aligns with Windows
> behavior which also performs ~200ms SCDC poll post-enable
> 2. Panel-specific quirk for affected displays (Cisco Desk Pro in my case)
> 3. Fixed delay after SCDC config (my v2 patch from Jan 14)
>
> I'm happy with any approach that gets merged.
>
> Thanks
> Jerome
