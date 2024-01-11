Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C534C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 23:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FCF10E9CA;
	Thu, 11 Jan 2024 23:53:18 +0000 (UTC)
X-Greylist: delayed 37191 seconds by postgrey-1.36 at gabe;
 Thu, 11 Jan 2024 23:53:17 UTC
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2897E10E9D9
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 23:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1705017193; x=1705276393;
 bh=43y7COKNIWEdaRyALGind6HYTvUcKQ10LffdmsP/seQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=LS9F/WTKqZX6p0RVQ/l0y5bBF3VNImN4X/rSkKaotokUSgqdM3S0pB8y/SFfp91lM
 PHTMFPDoBXjNmZp6VLc56TGWmbHXgnvqUCSX3KdvtdQ5pE2mI6yILG0eR6UZc52vC/
 qt173pGF8bv/UvJeMPuf4WpvKk8/7x/RStlAfJAI68WtDK8DXIRiVEcP7ZvNggdvGJ
 O+4y+xXPiXKxkE0Q9TzWr6R9R5I0YRtv1YEH7ZrOktCCGK+jqx7E7v3tlohDrxcZvC
 ruPYoYltGGNcG2F4tW0CncvevRaYz2h9+zKUFxJkYJKVhGmnhB2EnR+uKvIG5gsRpZ
 YcZsvgWKXoKEA==
Date: Thu, 11 Jan 2024 23:52:53 +0000
To: Jani Nikula <jani.nikula@linux.intel.com>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Subject: Re: Question on Intel Iris Xe Graphics on Laptops
Message-ID: <CN-LPFUswcaTlcPbeS_jdHq9vm1s9uf2gG22EIUsojfyf2L6bVQ8xCWX0PopjUqwiC0ZHjij-SSt2ySZ-hs7F6Q0QFAJS17aJIaLr4LPGKE=@protonmail.com>
In-Reply-To: <87il3zu3od.fsf@intel.com>
References: <aRnjmXLlTs07MdYbmlK1XqpR8wTCugB4w9v8VmEo7Cn5_QH6mCeAbRspsTYAhTQnx7nwXMVbERu0Qq2yWxZQPYZy0u1f2UhlXL0aB9T4fKQ=@protonmail.com>
 <87il3zu3od.fsf@intel.com>
Feedback-ID: 39510961:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Friday, January 12th, 2024 at 2:26 AM, Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:


> On Thu, 11 Jan 2024, Turritopsis Dohrnii Teo En Ming teo.en.ming@protonma=
il.com wrote:
>=20
> > How is Intel Iris Xe Graphics compared to the NVIDIA GeForce GTX 1050
> > TI GPU on my Aftershock gaming laptop, in terms of 4K video rendering
> > performance? Is it significantly faster than my NVIDIA GeForce GTX
> > 1050 TI GPU when rendering 4K videos? Does it take much much shorter
> > times to render 4K videos compared to my NVIDIA GeForce GTX 1050 TI
> > GPU? I render 4K videos and upload them to YouTube on a regular basis.
>=20
>=20
> This list is for the xe driver development only. Please refer to
> independent sites for performance comparisons.
>=20
> BR,
> Jani.
>=20
> --
> Jani Nikula, Intel

Dear Jani,

Noted with thanks.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individual in Singapore
