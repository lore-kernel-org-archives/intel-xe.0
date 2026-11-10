Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10D7606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 00:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0VM77Cy1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774AA10F5DA;
	Tue, 10 Nov 2026 00:40:32 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25FB10E8F5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 00:40:25 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-67c0ffaae1dso1673546d50.1
 for <intel-xe@lists.freedesktop.org>; Mon, 09 Nov 2026 16:40:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794271225; cv=none;
 d=google.com; s=arc-20260327;
 b=b7YfVbi2BpWmCj6c5QJ/s3foboS01Rzfy7d/4bMEkHrgmMif+iKSeAnVJKH9EJBSOY
 /mK15GWIXhuasSsZj/NUYuiep4aFDhGyAwvO8TQ1Vs8tfMV+I2VMy4kuwW8Dqoj0VXah
 X10X1nN9ZC4c+VAD7s4632lGoFmiBWlzD5JgfEzq/sSl08Dl7DpXADC3FQCBztOheK+G
 IDxq1Pv2rfmrQ1dkWth6PDIo8ZgdpdG4QWcCVuaGNoDLo7erMHfTsLo2NV57ATKFtA/2
 55Xjec5m/nDVUlQB1WTyY+c27dmPUVwhiSF2G0pEY/q/8Eh16V+1PmcGsy5aWv7q+E1g
 N1Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=jIHm29cyLSNyacJjUA9APKy30FWwePpOgwq8IJn4zQs=;
 fh=yIlhhzcualFNr7jvLJX1ymIK9EOU/CnQk6V1iuXyNBg=;
 b=W+53Igi1h/n1L6DmIQFm8faMq+RuI5owh6OHjDm2YFRHANSZ88FsQSgBisEIauk+GO
 NsHdb+wG92Wmi7sC+2zvFVQp/Pat+ifVnWqLGj49bray3luGG4l+9IfRRKqYAQtbW1vw
 bTsw1rcPrtoUbWsHQarQ4l0S+45SpgnRzJ9IRGh88DTKseomRmq0YKAzfhfSgZKOJppy
 naigSSAYik059KM9gJtgVR+UHvPJ0tyD0fA5YmG/A9iqwFOTa9C5IE9YwRN0XtwVKuhG
 hQ41fztlw8CMB1VGNSJeYFx32uiEMZUv3pBuSHHaoKb02Ah8srNXpLKDgaAC3p/w5gBS
 IdYA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794271225; x=1794876025; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=jIHm29cyLSNyacJjUA9APKy30FWwePpOgwq8IJn4zQs=;
 b=0VM77Cy11us2lZ/Xo9d+8TYj4+Bv04hML+0UzekqVjPAcG5MYuIkn66ISW4/PkgbAT
 /1fbR7MmdVMDyLk6mwm+pmN6AnphDu16LJGJURdbWxM+ttOYOEl1DMHaldXaK+GRxWWg
 DYjSAsikNJ8Jeyxt7ob/ge9BM0G1+nWUS5qYYrhyhxWEzjAXzs5O4M/OcuykdJIebsR0
 WK4S7C1WrpprnuxBEOSPPD2ks8KoFku/DNJNMFs+jVvBvATay80X1J0q9xFvVclsNLNT
 nIIUt9iQA90ikbzcYnJMY0R5FuHl3/aCykkUqLd8b2REAiSU7BeBAQ/crezZtTn/UXZD
 qUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794271225; x=1794876025;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jIHm29cyLSNyacJjUA9APKy30FWwePpOgwq8IJn4zQs=;
 b=xQ5BY2Lh2uMa4yDIbTdPSGRhetQnPS9J+BCW+58AHaIX7LV9+vtQJ1AqxFc+QV1NdG
 iQvCpvvWj9pKYzSvlqhr5konK7Rd3aEaVUT76BRcy/vSNSo30SkUZG1lDJmY2ytmMp82
 b7Ptp/ntJf84vGDK4ySAEu6etTxBaHcImKHqfQazx56Ep4fku5LTBqbqXnDMYzPAPmyc
 7BWYfCvGPsEFq3iJbeb881jjxWGP2lbb7faig1LDRglJrnqMvbFLWQDFmvMoeVeUm0vl
 1b+ykZ9YsBx//Q+efJzy4OopkoSlicroucGiRBk/G8USwNO/4Hgth38NaIhES9eTLW+x
 5tCw==
X-Forwarded-Encrypted: i=1;
 AL+hErEk5+dTvuPQkGV9R740AKJ22ge9Ax/YvL8PNaJbHjCRWl/FVgYy6XLK1Jberk5wmqiDVszdPSqpDA==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+10xuI/gZYs8DYYo+Q2peW89tYEHfuroZ5l5OEYjnxYBGjMSwh
 ytcaD11wHDeNoiP8n0BL/koX2Jlh9DSMSCOmvvJA7crkoubef2gGCsarjoD2SKKr/drEqIDDlbM
 671TxHZWs22IAdER9w91UntvfZWjQzWM=
X-Gm-Gg: AYBFou3/aT2cnv+tW3aCINui3kMdPnh1llYdJuMz4R9tD6uvrKvfuwRdX8tyyY4Dmeu
 HIMUA4mXIAQkZg6NLq8eAUpy2H/J6YTFFt0/QZWg7MpVFLiCTsXWe95gpk444qSOkSr1SXxpX5F
 ODQpvbHuSjNMMSatUw7rl1JtkcJ0CThl4XeLNrhA41DwVt0/KBwgAmJXjIMknhZhrFVhcQQm+qx
 Qh3fj7i8nJZuPAtheVd0hP03jd1ZuhlrMyZ+EBoYVG/F8KqjBzvP449kfjHe+amxkavF1IHSM3s
 pZ/ZtedgFAURzXR+/LIUswn2vQ/BcBERy8zzPDkI6N/i5WOctcqfngz1qrXGBtz1TSdr/KnWM3D
 LjShnK3prdmvFkSV5n3pelunUop4no0LTOyiVbitYV7VKCnuJGDUiIo/E05/OqCJ8aUrAqTPv1c
 h1MWOe4kkJoHQ09aifAqUyvihj
X-Received: by 2002:a05:690e:1689:b0:67b:f2b4:5598 with SMTP id
 956f58d0204a3-67c5721ba80mr634363d50.47.1794271224699; Mon, 09 Nov 2026
 16:40:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261107134939.482764241@linuxfoundation.org>
 <20261108040721.203040-1-navonjohnlukose@gmail.com>
In-Reply-To: <20261108040721.203040-1-navonjohnlukose@gmail.com>
From: =?UTF-8?B?VGFsZXMgQS4gTWVuZG9uw6dh?= <talesam@gmail.com>
Date: Mon, 9 Nov 2026 21:40:12 -0300
X-Gm-Features: AclHuK9SHgHcicUs2AUaH2zErP3Dq7iLJexRZNx6FYTyrctQbb6uYGleUviNq6g
Message-ID: <CAHBRX4FXKxphkMUzBsV0Scqo5ZbFryUa7MfYa+6_wD5f_vDh-w@mail.gmail.com>
Subject: Re: [PATCH 7.3 0001/1257] drm/xe: Implement Wa_22016122933
To: Navon John Lukose <navonjohnlukose@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
 patches@lists.linux.dev, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Sasha Levin <sashal@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Greg, Navon,

From my side I'd prefer this goes in now: it fixes real platform
freezes on MTL/ARL (TLB invalidation stalls on the media GT), and the
probe/resume cost Navon measured is the price of the stricter UC
mapping, not a functional regression.

Navon's follow-up keeps the fix with a WC CPU mapping and removes that
cost. I've reviewed and tested it, and it carries a Fixes: tag for this
commit, so it should reach stable on its own once it lands.

Thomas, Rodrigo: could you take a look at the follow-up when you have a cha=
nce?

https://lore.kernel.org/intel-xe/20261003222145.67240-1-navonjohnlukose@gma=
il.com/

Thanks,
Tales

Em dom., 8 de nov. de 2026 =C3=A0s 01:07, Navon John Lukose
<navonjohnlukose@gmail.com> escreveu:
>
> On ARL-H at least, this commit adds about 3 s to xe probe and 2.5 s to
> every s2idle resume, because the GuC buffers are now mapped UC on the CPU
> side. A follow-up maps them WC and keeps the TLB fix. It has Tales's
> Reviewed-by and Tested-by and a Fixes: tag for this commit, but is not
> merged yet:
>
> https://lore.kernel.org/intel-xe/20261003222145.67240-1-navonjohnlukose@g=
mail.com/
>
> Whether to take this now or wait for the follow-up is up to you and the
> xe maintainers (added to Cc).
>
> Thanks,
> Navon



--=20
Tales A. Mendon=C3=A7a
talesam.org | communitybig.org
