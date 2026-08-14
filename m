Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB8CC5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294DB10E589;
	Fri, 14 Aug 2026 17:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mOs8TaMt";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A9F10E589
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:34:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5582C42E88;
 Fri, 14 Aug 2026 17:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BC01F000E9;
 Fri, 14 Aug 2026 17:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786728894;
 bh=UMf0RQEIf1OaZz6IxkogDg83XVvfSXkqWAAwckUQ4vc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=mOs8TaMtEblU/IhvuDKuxFjdU2XqM/bUWQ3Pdz5U3LLYm8PIAy+X1HBzhdyy/Ro2A
 kMtWdfZhKm//aNHoiR9+185aq9BIZrj6ers3yuOk3B3P9PGO3ZS1b3cftvjJcOb/Vw
 4EWwHHBSeyRpjhIbDxhZJlrbxktjDuh2mV/GVeNcMjTtBPmrEuJ3n8UNnVyOn3oigr
 GkJEZGkY6v3DLHrx8CDDvHQJz9OrliiaSa7kCq58IcQyqdxtCiI/6SJk7Q34iBJL1g
 KgewLCWWQ5EisdAPtdOjgyZ6tVJhQnVb50ULDYatLACBx5lfaAXFEm2wcrWU8+UTFK
 18sKYRkFIlH0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 32/33] drm/xe/gt: Report 'Queue full' pagefault error
 using SIGID
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260814171801.13347-33-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
 <20260814171801.13347-33-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 17:34:53 +0000
Message-Id: <20260814173454.15BC01F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Log spam under an IRQ-disabled spinlock due to WARN_ON_ONCE semant=
ics
--

--- Patch [32]: [PATCH v5 32/33] drm/xe/gt: Report 'Queue full' pagefault e=
rror using SIGID ---
commit 3d4e7bc115e30aa20f0155c869055081a51002d3
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>

drm/xe/gt: Report 'Queue full' pagefault error using SIGID

This patch replaces a WARN_ON with WARN_ON_ONCE when handling a full page
fault queue, aiming to reduce extra noise. It also adds a call to
xe_log_err() to report the queue full error.

> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pa=
gefault.c
> index 8b1f6f5448baf..9e89d7b373953 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -328,8 +328,10 @@ xe_pagefault_queue_add(struct xe_pagefault_queue *pf=
_queue,
> =20
>  	do {
>  		/* Not possible, warn on and drop page fault */
> -		if (WARN_ON(xe_pagefault_queue_full(pf_queue)))
> +		if (WARN_ON_ONCE(xe_pagefault_queue_full(pf_queue))) {
> +			xe_log_err(xe, PAGEFAULT, -ENOSPC, "Queue full!\n");

[Severity: High]
Does this actually reduce the noise when the queue is full?

The WARN_ON_ONCE() macro prints the backtrace only the first time it is hit,
but it still evaluates to true every time the condition is met. Because
xe_log_err() is inside the if block, it will print a message every single
time the queue is full, defeating the intent of reducing extra noise.

Because this runs under a spinlock with IRQs disabled, could this lead to
severe log spam that might cause CPU soft lockups or system unresponsivenes=
s,
especially during a GPU page fault storm?

>  			return NULL;
> +		}
> =20
>  		lpf =3D (pf_queue->data + pf_queue->head);
>  		pf_queue->head =3D (pf_queue->head + xe_pagefault_entry_size()) %

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814171801.1334=
7-1-michal.wajdeczko@intel.com?part=3D32
