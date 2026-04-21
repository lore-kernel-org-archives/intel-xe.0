Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09DCF8FA9E
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 17:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A2110E8E2;
	Tue, 21 Apr 2026 17:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="lc3R4oKp";
	dkim-atps=neutral
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DCB10E8C6
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 17:29:41 +0000 (UTC)
Received: by mail-dl1-f51.google.com with SMTP id
 a92af1059eb24-12c88e5f4aeso1271076c88.0
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 10:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776792580; cv=none;
 d=google.com; s=arc-20240605;
 b=XWltgf//QI5YHQkdPq3KD1DF683hMtLGLnNAaKz/8puRH98cmAoPj6b2zpnjFmTc8M
 vwcfUzNonSAMO9TH80zyEZd+4NXUMX2why2yw5sRwXpyxyruErD3lOcHgGzS9fR9A9L3
 4oDcs3cFdve/VoZVWJZziSXMxMKyDBrtxt5/hfF2sMY0GJY9h3/eoq35cW4IyyJ/MXKx
 OyGAKJ1m4odzrqK6lNO5S6plqhux9KSC5fIat0NVj4nxB5L1h5AIpmO77t6Qc0/YUMlm
 /jL5lEU3Un6/06b96n8Ipr2BRJ7SnFN9BD4zTD5UoX645XXsY66gFG0SpZAuotT9VPTW
 dgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=u4UIHqlsKIISI/2Sr907JUuCCB9VWG/Awe+QPWpe4tQ=;
 fh=9bgmRfagpSL8Vn/HYbPGu9Npkb+iEiwcTZVWzfBgnsM=;
 b=a2/gRyZlLIkIBOgY1Z4smLT7o2ax6APQG7I5lu4j82cwKLH23ecB/uIQf1EgxAXpzq
 rbM3UbEKiYHYaiqFwP/whdK1VMlHktX3IPFlhJAAnlO3H0SDqNf1Wew8D5fao8TA9bIA
 syGjYlV3gvE4qJHNDlaG9yKWPKZVdEPJraRGReGxUEp9dCgBxLQH9jgzMFPGgleV9OY6
 kzsbw6DewXdTimp961FyfOwrKPUwO0u7qnZc/1rlRPQ+PEGsOKP6JC8L6Qr32Hw3xdkC
 ketLgki35aaSRkRjHN1FNEcWJlOF3OHqp+CxGZeEO8BDmlOClN2Vuw3Auchve5aZBsOi
 DY4g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1776792580; x=1777397380;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u4UIHqlsKIISI/2Sr907JUuCCB9VWG/Awe+QPWpe4tQ=;
 b=lc3R4oKpTwvyuSAGjXzzhk2sNU9BIDHSu5mrhUfM5PW0gD+vfDMy89ep2A6KEYhhlj
 TILJOAvhRVgOoQtoVDNhl8HNhqQCB9laIDVmQuln2K4LDXsGtP4FPfYIWUF6xUpmTxqR
 8IYTcAmyBF0UD9hRP48cmfa3yHKsIfyXacZTxUvy/mi1B1Sz85k/o6VrEMV/TK5YBDlX
 Tr2Tm2H6CT5y3vbK4ZslKP26+au14j2h8VtIOqkDozYK5M/ec835AMmFizEPTYU3OK+E
 OmHnv5sJWCo4Hm3HK5t4Ie1i47OorJvo4iw5X+wN2WRwOhiaD7jY7Ff86ymR5/lKEbOW
 8sRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776792580; x=1777397380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u4UIHqlsKIISI/2Sr907JUuCCB9VWG/Awe+QPWpe4tQ=;
 b=UoqSEu1sF/VkJ4kKZnmny8ezpE7w5skHAltLW7jhH2/mNjXdEhYidawhGzQ+8fj2eN
 lepoGXs7kWXfxAQM7nYP5ZrUQJLZ/tiXmTMLHEm7GsSSdg0HmqeEn+cIwHBE9p3A+F7V
 8cNO4e/jfxOkXHMQgSZou2wXrfWqBaXDGHuh8XmoM95YcbldQdfeBhZKh2pKepXZQNqX
 dk3oBi4LK8MBhMNMhLNqrt6KT3X+wFNjs+p6VxWzw4IW3MP/1yxlcA07IDFD/vaJoDEA
 PNXq4x6Biekx2GW4+LqL6e5oXoNMuO7ITfK7r/6/CxSAg5bUhUO9HW5jITtKoFfgBEAL
 WBPA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8W1WQZ9IJLx3kvTeMsQDOqOudQ1pkJmv+08+1xFK+3L0ik+uIG1bDZhYSNPzDaWZJgHBJkDskeIg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxu/d19I5bNKON4W01gRbhR9E++tkzxUi6nZYzUVNnEQB4f39Sg
 whbScFxI4Kupf4sahd64PddyV2aTXVQNIWLyHZ4LtOsLSVHEK4dveSg5ZlPS1Pte6d4sXwG3Nqg
 lzNUWYPz93ljC5vgpJyFuYDwqfccdIapBG7heKaQ=
X-Gm-Gg: AeBDievBxhFxc4stugC/4mf8HN1y5t6V/ECr1CKuMgENb/+DGOlSu+R3qM5eJRfe5Fk
 rzSJtqhXvi027N/4TO5X1Mnzw6SISd6v+rA0b4dHEx2HHzeZMhkJQRTg2c7uZRyhsSD03ISRgmn
 yX9luRefWaVnUWtP5Ai1YcsBmM2AOHIvOY8h3ELnd2NfRCVrPj/h51rfNxgkm0CVuG0WKWb+r+o
 BbmDZCO3ajVDhFwa3UcqFrx5qqNFaLrHGWtvbsN13y87Lb0IJQjwExlk30eCMkNN83ljb9VR6YT
 i9YgLouNnpdlIVakB69zetWZIBzBg+V1yl77JkRwLPgi/pYmz5n+7jSG5Rexv9ESLApR0443ijM
 4HazVf9R2VnjFX3tBkKsRcjQ/SZBcVIevxlw0wmgoNxRNLcUZpmv6VUnn
X-Received: by 2002:a05:7022:622:b0:119:e569:f873 with SMTP id
 a92af1059eb24-12c73b467abmr6841787c88.16.1776792579788; Tue, 21 Apr 2026
 10:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <af005996-05e9-4336-8450-d14ca652ba5d@intel.com>
 <20260327163100.GL3738010@noisy.programming.kicks-ass.net>
 <20260327164353.GM3739106@noisy.programming.kicks-ass.net>
 <df391df3-3a3b-4a65-b3c7-ffe3ab50ee83@intel.com>
 <20260330195037.GW2872@noisy.programming.kicks-ass.net>
 <20260420130318.GD3102924@noisy.programming.kicks-ass.net>
 <CANDhNCq=oizzud3hH3oqGzTrcjB8OwGeineJ3mwZuGdDWG8fRQ@mail.gmail.com>
 <20260421101521.GO3102624@noisy.programming.kicks-ass.net>
 <95651a71-1adf-45ba-83eb-5744bc6d4a52@amd.com>
 <20260421143752.GD1064669@noisy.programming.kicks-ass.net>
 <bc5e8c5c-fc9c-4efc-b1a9-98c43c6a8762@amd.com>
In-Reply-To: <bc5e8c5c-fc9c-4efc-b1a9-98c43c6a8762@amd.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 21 Apr 2026 10:29:28 -0700
X-Gm-Features: AQROBzCAYmmbnxRUS746VNsMzaWktlGpl4hEP9WvBOtUviyQ1j0PFBQSA2g3iik
Message-ID: <CANDhNCr-+x8pTLhXZW=ATHaKTYEmXMPukz4+t8P-FeJ11Jrz9Q@mail.gmail.com>
Subject: Re: Regression on linux-next (next-20260324 )
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Peter Zijlstra <peterz@infradead.org>, 
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, willy@infradead.org,
 linux-kernel@vger.kernel.org, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>, "Saarinen,
 Jani" <jani.saarinen@intel.com>, ravitejax.veesam@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Apr 21, 2026 at 8:48=E2=80=AFAM K Prateek Nayak <kprateek.nayak@amd=
.com> wrote:
> On 4/21/2026 8:07 PM, Peter Zijlstra wrote:
> >> First hunk orders the first_waiter if we are attaching to the
> >> tail of current first_waiter which would have previously ended
> >> up next to list_head.
> >
> > This is the case in __ww_mutex_add_waiter() where pos =3D=3D first, rig=
ht?
> >
> > Argh, I see... yes. Perhaps something like the below though?
>
> Neat! Thank you for cleaning it up. Those, along with the changes in
> ww_mutex.h fix the issue of ww-mutex_test hanging in my case. Feel free
> to include:
>
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

Same. With Peter's change and K Prateek's ww_mutex.h change it looks
like it's working for me.

Thank you both!
Tested-by: John Stultz <jstultz@google.com>

thanks
-john
