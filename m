Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAEAC46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 07:49:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2E2112E0E;
	Tue, 30 Jan 2024 07:49:59 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B9B112E0E
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 07:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1706600974; x=1707205774; i=deller@gmx.de;
 bh=Vd4mg1lN4RdayhNVRP4yTRZdkhZMqCIs82EhJIUiRCs=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=WHgJuTwuMe0lcAnaaUKXKkTUADxwNouk5/+zO5KRsXYrZaSdaxWllh5jbcNtxJD6
 ZgqvwCxNtL1q1bY+T6FemBuLt/LJBv8gJDODjrjDyeqBkagPqFifb5Vg6dNTnOVDO
 vRZmBd6tqU+3dTXEGztccCL5cgZ9mIzGogsru9MxHA3N+p3J4wDS81gvn+l1rt76K
 hVrAjUWxQvfRHuyoU0amjaTOK7C2UCxj4tAwgL7XJAg/wYbSJuAzgLhXoOcSH91nZ
 SFYszQVe7W9fc7rP3vt+MwxOzlXKEsPCY89JmwkBXH18Vqfvq/gL+1f/fAKxJJaY0
 5UuxaCB9/PwLycp3Zg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.154.236]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQvD5-1rjw6r00QB-00NzUF; Tue, 30
 Jan 2024 08:49:34 +0100
Message-ID: <90cd0f1a-29c0-4c6f-9efd-92b69da194c0@gmx.de>
Date: Tue, 30 Jan 2024 08:49:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Build regressions/improvements in v6.8-rc2
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org
References: <CAHk-=wgxzm+Oc1ywuNGxb1R1=ZEC85LJi776R2QEpk6=_2Qfdw@mail.gmail.com>
 <20240129104954.1778339-1-geert@linux-m68k.org>
 <8ea40b3-adde-acb5-5e46-fe1fd395daf@linux-m68k.org>
 <56b9c222-4e97-4eda-89af-3e0d0c39acb2@roeck-us.net>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <56b9c222-4e97-4eda-89af-3e0d0c39acb2@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AqA82jXkHCsmc5MtDkJ1eTjYy5SiywwJBhM+J9cbQ44sBANzi6O
 ZTYDbosnCyJv9w/UFn+xQLdFDC8txwihAHo1KVQHw/KlMCJpxb9LAJE9aDGqiMX6+9T9kzR
 /Vav7f2CaDCIHq9ygHNjk8JvObh+sZu11YLbTmdfv1m35WtgZwiVHQ07cXPHxapZpOvUuOV
 LCJoMKoT/DTSkbYrZanOw==
UI-OutboundReport: notjunk:1;M01:P0:u8DYBQ3KSfM=;uc3ACzysU1ccETxkeaT7X8nb/Va
 AEzYMHjEDZeE9wXhTKevnHjWpG51cK0RJWVE28VCFUZ6CJYi93jZXu5fjRJWRRFkqGjAAt1b6
 PDrp1mScZjcEHhw2jucor2JwcyqvdZOfMxyQPoWHZwpzGZ1Zv7Y4YN3tXpEsNb2AqXesoGDU7
 mwjWkvb8H0AuDSeCLSrZt/EW+Y7OtShaDjPCYUSZps+1LlwjuOKZFdJ/dNVU3RAZdouGkIJsS
 gv9QRLx8DvIqEHTMKhRQvS1cqZobMnGZuLMn++rwK3A8w77TGYKq2hPS+qVdC6zEWgRpFAZJD
 j45ORhbM90aiIPk4DDCLJk7JEP/t248lmdhaC1XXueEAIG/vxI2OnoNMovBY3X/BSn63gOsUP
 g5F9HcLfKhYdIxFVGIXLazcyp6M4OOuUpIiwL4Gx7eTaWmLjF8i+dbi0QTeFjww5xhAtqU5+V
 3XvUnV2uuwjtn001WUMFU2XNS5vEVwcc1xOxQ6j0hYoMusOrbeSa0o1Fe3O0I+0WbL6nd1Dcq
 h5L0GbyLDFUtbwViqpeqWQe24mfm5U5ITUxQT7m2MNbFD4YL1JhPc3OVvEk/UzkJVqRvPEVM8
 6/Wsg8CpSlN6bjDQw+Q+NTXIDCGvXSPdPR3oi+PT7V9Vk6n8yb57xqyxMe+M4me79qOEG+CLk
 AMNEQI75p1CymJ0ASZZhbA+IMDFm4LSC+F6W/CCu05uukJzTGzsBTo4iyv7FUAzvQ8TzKklll
 Xzh+q2b9dFc/s77sgjRgr4agG1oTuaBBmwrUblL/7O1JNopJ1jXzQKMMahOreXmNuqfspZ9va
 7Xfm18hR8Ry1wfw1llAkJIBqPaYcSRv8obSTjb28+0SE2jNvjAusvWe+vocwkqILy7XQT43EE
 9G6MYqiVymwXAaDw/Sq76iUB0fvoSw76bHLEvIJQrPYtKrZbWr2qJIRGC+JM7uLB/NhlM4iQp
 oZdqxA==
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
Cc: sparclinux@vger.kernel.org, linux-hwmon@vger.kernel.org,
 intel-xe@lists.freedesktop.org, linux-parisc@vger.kernel.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 1/29/24 15:58, Guenter Roeck wrote:
> On 1/29/24 03:06, Geert Uytterhoeven wrote:
> [ ... ]
>> parisc-gcc1[23]/parisc-{allmod,def}config
>>
>> =C2=A0=C2=A0 + /kisskb/src/drivers/hwmon/pc87360.c: error: writing 1 by=
te into a region of size 0 [-Werror=3Dstringop-overflow=3D]:=C2=A0 =3D> 38=
3:51
>>
>
> The "fix" for this problem would be similar to commit 4265eb062a73 ("hwm=
on: (pc87360)
> Bounds check data->innr usage"). The change would be something like
>
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 for (i =3D 0; i < data->tempnr; i++) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 for (i =3D 0; i < min(data->tempnr, ARRAY_SIZE(data->temp_=
max)); i++) {
>
> but that would be purely random because the loop accesses several arrays
> indexed with i, and tempnr is never >=3D ARRAY_SIZE(data->temp_max).
> I kind of resist making such changes to the code just because the compil=
er
> is clueless.

I agree with your analysis.
But I'm wondering why this warning just seem to appear on parisc.
I would expect gcc on other platforms to complain as well ?!?

Helge

> Are we sprinkling the kernel code with code like this to make the compil=
er happy ?
>
> Guenter
>
>

