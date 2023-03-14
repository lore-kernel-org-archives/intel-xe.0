Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8188EC6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 09:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5EB10E73F;
	Tue, 14 Mar 2023 09:22:56 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2621F10E73F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 09:22:54 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id g17so19113432lfv.4
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 02:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678785772;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y5PFBGyt5J29Dwqsj9rSTqn+KXiwBsmRDthZ7fHPklE=;
 b=KGcfVSnWSVKjb7d/4szMYxZ0OoyzhENIoFhcW6hTOTAvm3CvsxgU3zI57Um8ApnXjx
 hsucEWrOczKwhNu2j6Iobr7lN7ub5912Oy252CVJhG+cuOL8iNHj+94lZd3L/uWUgobl
 ObKNdhQObN+PCN4iFYIp+gbFgELKzkwxn6YzCByRU3z88i2iAfGJBJ+DOQeORUoZfn1g
 ugjh9zhiR0BXUidRqUg7B1V7f83XHYtmybeWynDg0P/x9BuVk5xuR7xdsnfmo32H/byj
 GklHCvKO9quF9X8h3s8S+Pgzem3dTgOuhIY2oLjXwfnjBw/zm7T6gOSJfSp0xLBXMpEQ
 Aj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678785772;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y5PFBGyt5J29Dwqsj9rSTqn+KXiwBsmRDthZ7fHPklE=;
 b=dv2SYnMdIT24/zQwByU9xkvCIA6SUdQg105G9Yw6ryWnUBVNQhy0qFUjo2ErSrMqHy
 3FKKSjAqvbyIChb74c/45TS5EzerkH578A1DvR8EM5tFUTysq67vFJ71C1vdgmGs2+G5
 moF0jjXGRHX9XUOq4IuBo4adfWFEkHxBvav2DrQpFmfgX7Yyp9UOwU+6CW3MMrzQB9EX
 jZP/2PNjFiqK/dnp/m14Ad7/ZF5Gh5kaFl5tXDRie5M1iVK5uf1TlQ5vPmNg34YZvYyX
 bg0v40vWALJ3TKqJAktNmRRgM1j2haCxgTriDti+5USsN2p8igNqR//Rp2KRA3wi/gK5
 YY1w==
X-Gm-Message-State: AO0yUKXmJvGrZCzMLZHpQdxPzlmrOR6Bf31bmyFfijvvqAtVcqPjWUVy
 RXPxQV8JiGFco70EvagxP0c4C5ec6b+XVK606MThR3HHGYo=
X-Google-Smtp-Source: AK7set+aW1rvN/nwfhlC4lxDVr4pU/lIfFlvKr8CenfoHTJyQoWxzOAnIFaftvnGDtkRMkvVusHurrwAI/95tyOiUkA=
X-Received: by 2002:ac2:4a9b:0:b0:4dc:807a:d140 with SMTP id
 l27-20020ac24a9b000000b004dc807ad140mr495283lfp.10.1678785772302; Tue, 14 Mar
 2023 02:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230313211628.2492587-1-lucas.demarchi@intel.com>
In-Reply-To: <20230313211628.2492587-1-lucas.demarchi@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 14 Mar 2023 09:22:25 +0000
Message-ID: <CAM0jSHPHBEByP8ipt6z0pRTvH7J=rvmwB41X234sAjow-VARqA@mail.gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH] drm/xe: Replace i915 with xe in uapi
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 13 Mar 2023 at 21:16, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
> All structs and defines had already been renamed to "xe", but some
> comments with "i915" were left over. Rename them.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
