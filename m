Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5432EC54FD2
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 13:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB0F710E774;
	Fri, 20 Feb 2026 13:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XV+i1bJ1";
	dkim-atps=neutral
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948BF10E05E
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Feb 2026 16:17:18 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-659428faa2bso3234858a12.0
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Feb 2026 08:17:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771085837; cv=none;
 d=google.com; s=arc-20240605;
 b=MjK4AGRkNalfByHGTtSCGsEYm4LG32KH/yU8iXXXPBqXiBzwFU2M1ob/OVbQji4bkd
 5uJALrhl5pXBkLb+JAKlFqJkV/E8CWKnrRINkoNXLeJOrJs9wayWeRm1y+fVxBUzadpy
 WsapwYLZWS8YA6UzhbuNbJ7+JMePLDdVOKaGzjDpo3FPovC0FWZOQ0eEcW9mK1QhXfZH
 3mRmB9chhECez2RbYZ0xi8Qgcz7FPPT4OL2vkx89R5Y/kmiI1kKzQHehTNvhfY6S1bFm
 ecZZlerI5j5ixZpimuvFL7GwcF0eKPxVJlSE2v8SVFwb06qBkp1I38S/MavWWsRi8R62
 117g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=3jNf5hA3G7dX7rUPtYDRMnLMnt9ZofhzHc3WPWH09/U=;
 fh=txufk7/kBXai5Ma6H0TirJW7i7QoiwdEUY9Wba9dMrY=;
 b=J/xQqB+/DWaueJY+TaFugQsNnLp3IxWalRlYKa5IZv4Y2Gpx28Q8OH6D28MyQJx5No
 e7x1S/ayI7xPXGNV1HKYeU4UlaBt79fFfxunPKlAuqNHCVTtUJNo6hF0pseyjQVLepF8
 gzKO8utu+A+XVJHlKSWb55X59cvnFmZEs98MlwgDNRHI8mgSgnBv/v+M7ZudaIGTjBWA
 xH5FGRjNF0Zjm5DpbMrjcPkpuwGFp/9PFsidSaN89dlmZ6VACFk+WHjCmY0jJCFmllQG
 mVMD04NBNA8m12KbTRlmmeePe6QOuMHo8iyiJzXxF5ZhZCwMQCQqHEUZnM1veFYdZA14
 Gpsg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771085837; x=1771690637; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3jNf5hA3G7dX7rUPtYDRMnLMnt9ZofhzHc3WPWH09/U=;
 b=XV+i1bJ11oZShNmJpWD7tflHrrOhkEWmm6OgfqYjdD6fJO736pr3W0j9Zsjq5ivgPO
 S8axtg5r0MDaSu6KunHUEYeVEjPWwL0tVcp8tiAkhm7yFzZm7JKpd1POqx8HnSlh1dnG
 s/xum4mw4FIGcMbwK7UGHIk9Fi0E8AWVnyZMZ5CHaUxJVfiitrYIoeMqdHbVSPdwci3r
 H9GnywvF1p0zp2UBw2rmZCmftNcwjKPCztNiF0djzH22zqkjnYdfa+Dmh9bWcduhbcUZ
 XIn7s79sR8FkXTdUv33aPEH9JfooQXlSKTt49842qliA3Bu9tCF+4PCDfE7TaICnKTYR
 sU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771085837; x=1771690637;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3jNf5hA3G7dX7rUPtYDRMnLMnt9ZofhzHc3WPWH09/U=;
 b=JVMYqx4pzByVaQpp6Kj2JVHxPrD0dvqna5qFFZPPBO3TSitjRBHJSm6cQEU1NCilVb
 2jKhGHyOXqvc2+i5XXIQVEFYQwHn5eR0hyp1ntYYWod4PIQSLxIuw4zZ3NN3TPMT4z6G
 mNSKXGfbUxi5SZNCpCpVJ+kYVa0todqm+5Q5AmZmvuCGoxDTW3x5OUIUqujbh9tSv8E0
 2NYqecsHpEzifnSkOZSSiovRR6UdgU+eRoQi7eD4pFyb+GW0Rld8NCyITcHA1p9x0cFR
 NspRMesLjAFaJxT3S+eVP7KQNa94m6QitBqjrZkAjehySI90nG0qJp4c+Jp7m0tVXcaN
 tAAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5FO/QHFKLrBr+V7Ge2wn6IwtMNapYSMLCzM5y1XgoOd5dNCCh8OVBDgUQSqeFlpfmnOAA0Jl7rg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yye8SwsWmY40oGq6ZFVl/oTOgCQutYn8p2MNomflYvrpCt0wq6i
 RzJmSS7bEnyOZVqfrmode0/y7HVrXv0lJZudiAutXhQmGJM3jOFuMtoVVwn8uBpmD5XIa5SrfOy
 Q2kYYDFiyvY0vcJbJthiTND8Q7qge5vg=
X-Gm-Gg: AZuq6aLVxwUB3PxA2mxDplHidaIvg91W3izuuMIroKMG+y8tDdv2nl7RK8nJuy4txcs
 39R8CjGm4MsCF9Zeu9SzUMiMAgmCGQI9FWBhho+5nVWxegZLSysYNtUzrzcsrGw0PyU+f+ps1w/
 M5bs3Ll+Xm7KfAk0FfU8kpG+GkNm37uc/4RttlR/VNa7q82vv1Qu55qLGzDXgY2GY59tYh1+5S4
 CoHRrdw0mMr8PQiZHD+LLSpp8trOGZjyXLmEwhyPKgQ1Yg0h3us+v3vEpJ7pa2O+YNOYZXrR6jG
 9Z/5
X-Received: by 2002:a17:907:961f:b0:b87:1e94:ef6a with SMTP id
 a640c23a62f3a-b8fc3cb95b1mr139267166b.47.1771085836705; Sat, 14 Feb 2026
 08:17:16 -0800 (PST)
MIME-Version: 1.0
References: <CADN_a6Ne4Vr6knCXdKtCnB8=et6OK7PEZ8F5bpyGamwyv1K9GA@mail.gmail.com>
 <CADN_a6O6-iL+BS+0gy_AisiJTYQ6NGqSKXv608MxxETCawD0jg@mail.gmail.com>
In-Reply-To: <CADN_a6O6-iL+BS+0gy_AisiJTYQ6NGqSKXv608MxxETCawD0jg@mail.gmail.com>
From: =?UTF-8?B?SsOpcsO0bWUgVG9sbGV0?= <jerome.tollet@gmail.com>
Date: Sat, 14 Feb 2026 17:17:05 +0100
X-Gm-Features: AZwV_QgoPtJoqfTQwqXeF7vwHMzD8Jj5TCuQtbCQbOhcp5vKNM8SP_YYAiwmjg8
Message-ID: <CADN_a6NjO=x=bn=yTMJcgbb41_HUAHMS3G5U3jD20TyLvmGHRw@mail.gmail.com>
Subject: Re: [RESEND] drm/i915/hdmi: Poll for 200 msec for
 TMDS_Scrambler_Status
To: intel-gfx@lists.freedesktop.org, ville.syrjala@linux.intel.com
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>, intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 20 Feb 2026 13:43:49 +0000
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

Update on testing (Feb 14):
After isolated testing of each patch on kernel 6.18.7, I can now
definitively confirm:

- SCDC polling patch ALONE: Works perfectly =E2=9C=93
- delay patch (150ms) ALONE: Screen remains black =E2=9C=97
- Both patches together: Works (but delay is unnecessary)

This definitively answers the question: approach #1 (Generic SCDC
polling after port enable) is the correct solution. The v2 delay patch
is NOT needed and should be disregarded.

The SCDC polling aligns with HDMI 2.0 spec requirements and Windows
behavior, making it the proper generic solution.

Sorry for any confusion from my earlier messages.

Thanks,
Jerome

Le sam. 7 f=C3=A9vr. 2026 =C3=A0 04:14, J=C3=A9r=C3=B4me Tollet <jerome.tol=
let@gmail.com> a =C3=A9crit :
>
> Hi Ville, Ankit,
>
> Gentle ping on this thread - it's been about 10 days since my last
> message in the thread (Jan 28).
>
> To recap, we have three potential approaches for this fix:
> 1. Generic SCDC polling after port enable (current patch) - aligns
> with Windows behavior
> 2. Panel-specific quirk for affected displays (Cisco Desk Pro in my case)
> 3. Fixed delay after SCDC config (my v2 patch from Jan 14)
>
> Testing showed the delay works at any placement in the modeset
> sequence, suggesting this is a timing issue rather than
> operation-specific.
> I'm happy to implement whichever approach you prefer. Please let me
> know which direction you'd like me to take this.
>
> Thanks,
> Jerome
>
>
> Le mer. 28 janv. 2026 =C3=A0 15:42, J=C3=A9r=C3=B4me Tollet <jerome.tolle=
t@gmail.com> a =C3=A9crit :
> >
> > Hi Ville,
> > Following Ankit's response on January 21st where he suggested
> > considering a panel-specific quirk instead of a generic solution, I
> > wanted to get your input on the preferred approach.
> > As a reminder, testing showed the delay works at any placement in the
> > modeset sequence (all 4 test positions succeeded), suggesting this is
> > a timing issue rather than being tied to a specific operation.
> >
> > Three approaches are available:
> > 1. Generic SCDC polling after port enable - aligns with Windows
> > behavior which also performs ~200ms SCDC poll post-enable
> > 2. Panel-specific quirk for affected displays (Cisco Desk Pro in my cas=
e)
> > 3. Fixed delay after SCDC config (my v2 patch from Jan 14)
> >
> > I'm happy with any approach that gets merged.
> >
> > Thanks
> > Jerome
