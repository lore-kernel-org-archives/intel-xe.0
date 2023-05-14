Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9F0C77B7D
	for <intel-xe@archiver.kernel.org>; Sun, 14 May 2023 22:14:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A8210E0F8;
	Sun, 14 May 2023 22:14:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32BC10E0F8
 for <intel-xe@lists.freedesktop.org>; Sun, 14 May 2023 22:14:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1D6F61209
 for <intel-xe@lists.freedesktop.org>; Sun, 14 May 2023 22:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D0BC433D2
 for <intel-xe@lists.freedesktop.org>; Sun, 14 May 2023 22:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684102465;
 bh=PQNhGzBD6qk/Bk7aHzVsoW9L/JuNQJ9aH+G7yEZAU6s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QlYzXjiLSGpzBr4TEZr2fXwACM5ijY4Zsn7z6dACegqrxBNYqLycyv6g5uPdJKJIl
 Oiaj7mBfLNHKwtRCUqyW7tblMB9MK6jEZOJb7clShABp8RWXPewRCf8sPZc3F5Ak3a
 Ofe73zoI11wGfBgPNFhwODRz1slFEQCHQb+L+XXy7bkQQKpZqS+uEJsgR1UwAGWyKi
 uUWNu7qB4NNjw2newa1uCFUNEFBnAQfwATbV8+nTB4UNKBsEGOdrstLbAoWrAsKSuD
 mfvMaRM7DrbRRHDwsJfrQb5QLww/WXWnVJq0MEiIZ37PwLUF4lhglHKJ8254LUDsFb
 IMSuA2hRD+y0g==
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-ba7a7423cc9so1004125276.1
 for <intel-xe@lists.freedesktop.org>; Sun, 14 May 2023 15:14:24 -0700 (PDT)
X-Gm-Message-State: AC+VfDxA0e0T9+uS9o+Elkjyt9WSorr1/y6P/8DbgLssRJekfmhyeLFZ
 Z6OZzVlX+7QPlPM48fg9O/MnAnBhFH9DeiGpxP4=
X-Google-Smtp-Source: ACHHUZ4OMXbQiV6ogSIv+5CtQ6xl9ZzUjQRyWSf2aWQxCrdhSc38QrS4WVP2yvQO/1TnpKp54CoNowjnVlG+ReLwd8U=
X-Received: by 2002:a25:ab0c:0:b0:ba7:4c6b:672d with SMTP id
 u12-20020a25ab0c000000b00ba74c6b672dmr5538599ybi.51.1684102463988; Sun, 14
 May 2023 15:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <b7c7cdf6-fadf-9e3a-0e55-2be2c4987738@linux.intel.com>
In-Reply-To: <b7c7cdf6-fadf-9e3a-0e55-2be2c4987738@linux.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 15 May 2023 01:13:57 +0300
X-Gmail-Original-Message-ID: <CAFCwf10HincWtN4ArCtrW4c-iPn4iV6kDEZY-tNOmidgsVyQ8Q@mail.gmail.com>
Message-ID: <CAFCwf10HincWtN4ArCtrW4c-iPn4iV6kDEZY-tNOmidgsVyQ8Q@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] Small fixup for the initial review
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 4:33=E2=80=AFPM Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Hi, Oded,
>
> I found and fixed two locking issues in the initial commit you are
> reviewing.
>
> Are you ok with me pushing those as fixup commits?
>
> https://patchwork.freedesktop.org/series/117668/
>
> Thanks,
>
> Thomas
>
>
Yes, no problem.
Thanks,
Oded
