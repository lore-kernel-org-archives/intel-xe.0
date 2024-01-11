Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D65C47258
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 13:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E45310E6C8;
	Thu, 11 Jan 2024 13:33:29 +0000 (UTC)
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789BA10E6C8
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 13:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1704980001; x=1705239201;
 bh=qCiE6NCLBL9oyEP0ms+vZJ6APtUG0RID05GoKagRQXA=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=r9cZDVKZUsy7JM2Ly/hxZX9jSZK/xfve/6SWb3qsexae1szQ79yn/sO4GvuOoty9V
 4eC0JRx1r5otNfU+Awm0bVCtQFnZD9pv5WFhtocgqydCbSil0LTJJ1kOZp9wZImahI
 6Nr/qhElKSdv+VkzV3c5dmbr9Xx9Ve2YvIY4e6tyD40Cubb/mZah27H0aUu5NZpKMW
 akXFvmXFHW5HUgXrmWL0pQaeFiXwREUxpghZI31SCGxRQDVOjmscaty5afEdFsOHPV
 iel3Q/MLyp7adCwSpeoEkZGVB1N+dNzsd0gKXalB1O+OTyxZsdG+/mYzuH9rZW9qE5
 eA9P04E6d3EPw==
Date: Thu, 11 Jan 2024 13:33:07 +0000
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Subject: Question on Intel Iris Xe Graphics on Laptops
Message-ID: <aRnjmXLlTs07MdYbmlK1XqpR8wTCugB4w9v8VmEo7Cn5_QH6mCeAbRspsTYAhTQnx7nwXMVbERu0Qq2yWxZQPYZy0u1f2UhlXL0aB9T4fKQ=@protonmail.com>
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
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Subject: Question on Intel Iris Xe Graphics on Laptops

Good day from Singapore,

How is Intel Iris Xe Graphics compared to the NVIDIA GeForce GTX 1050 TI GP=
U on my Aftershock gaming laptop, in terms of 4K video rendering performanc=
e? Is it significantly faster than my NVIDIA GeForce GTX 1050 TI GPU when r=
endering 4K videos? Does it take much much shorter times to render 4K video=
s compared to my NVIDIA GeForce GTX 1050 TI GPU? I render 4K videos and upl=
oad them to YouTube on a regular basis.

I am asking this question because I am thinking of buying a refurbished/2nd=
 hand performance laptop with Intel Iris Xe Graphics. Just that I have no i=
dea whether it makes the cut or not.

Looking forward to your reply.

Thank you.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individual in Singapore
Blogs:
https://tdtemcerts.blogspot.com
https://tdtemcerts.wordpress.com
GIMP also stands for Government-Induced Medical Problems.
11 Jan 2024 Thursday 9.32 PM




Sent with Proton Mail secure email.
