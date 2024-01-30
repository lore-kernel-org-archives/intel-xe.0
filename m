Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202DCC48291
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 14:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96EB10F273;
	Thu,  1 Feb 2024 14:29:47 +0000 (UTC)
X-Greylist: delayed 608 seconds by postgrey-1.36 at gabe;
 Tue, 30 Jan 2024 08:15:33 UTC
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF70112099
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 08:15:33 +0000 (UTC)
References: <CAHk-=wgxzm+Oc1ywuNGxb1R1=ZEC85LJi776R2QEpk6=_2Qfdw@mail.gmail.com>
 <20240129104954.1778339-1-geert@linux-m68k.org>
 <8ea40b3-adde-acb5-5e46-fe1fd395daf@linux-m68k.org>
 <56b9c222-4e97-4eda-89af-3e0d0c39acb2@roeck-us.net>
 <90cd0f1a-29c0-4c6f-9efd-92b69da194c0@gmx.de>
User-agent: mu4e 1.10.8; emacs 30.0.50
From: Sam James <sam@gentoo.org>
To: Helge Deller <deller@gmx.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, intel-xe@lists.freedesktop.org,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: Re: Build regressions/improvements in v6.8-rc2
Date: Tue, 30 Jan 2024 08:02:45 +0000
Organization: Gentoo
In-reply-to: <90cd0f1a-29c0-4c6f-9efd-92b69da194c0@gmx.de>
Message-ID: <87plxj8cwb.fsf@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 01 Feb 2024 14:29:46 +0000
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


Helge Deller <deller@gmx.de> writes:

> On 1/29/24 15:58, Guenter Roeck wrote:
>> On 1/29/24 03:06, Geert Uytterhoeven wrote:
>> [ ... ]
>>> parisc-gcc1[23]/parisc-{allmod,def}config
>>>
>>> =C2=A0=C2=A0 + /kisskb/src/drivers/hwmon/pc87360.c: error: writing 1 by=
te into a region of size 0 [-Werror=3Dstringop-overflow=3D]:=C2=A0 =3D> 383=
:51
>>>
>>
>> The "fix" for this problem would be similar to commit 4265eb062a73 ("hwm=
on: (pc87360)
>> Bounds check data->innr usage"). The change would be something like
>>
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 for (i =3D 0; i < data->tempnr; i++) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 for (i =3D 0; i < min(data->tempnr, ARRAY_SIZE(data->temp_m=
ax)); i++) {
>>
>> but that would be purely random because the loop accesses several arrays
>> indexed with i, and tempnr is never >=3D ARRAY_SIZE(data->temp_max).
>> I kind of resist making such changes to the code just because the compil=
er
>> is clueless.
>
> I agree with your analysis.
> But I'm wondering why this warning just seem to appear on parisc.
> I would expect gcc on other platforms to complain as well ?!?

-Wstringop-overflow and -Wstringop-truncation are known noisy warnings
because they're implemented in GCC's "middle-end". Whether or not they
fire depends on other optimisations.

See also https://lore.kernel.org/linux-hardening/CAHk-=3DwjG4jdE19-vWWhAX3B=
yfbNr4DJS-pwiN9oY38WkhMZ57g@mail.gmail.com/.

>
> Helge
>
>> Are we sprinkling the kernel code with code like this to make the compil=
er happy ?
>>
>> Guenter
>>
>>

thanks,
sam
