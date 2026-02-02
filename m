Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E15E7DEF7
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 16:22:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B415910E529;
	Mon,  2 Feb 2026 16:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="gPHjHiIM";
	dkim-atps=neutral
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC3E10E2CE
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 16:22:21 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-59de8860b94so5474101e87.0
 for <intel-xe@lists.freedesktop.org>; Mon, 02 Feb 2026 08:22:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770049339; cv=none;
 d=google.com; s=arc-20240605;
 b=TVtFNA3zXt1mX+lhwnU4rkQ9BA2ZedbmOvmkT1WTQWmQn+KFkqYOBIJq3Oyr7d/nqW
 47Zr+DZy9ttsCEONtEfDvZPz9imkn1u6KVoH9QYJNrEIZOAPqWUvCfliaSJhnXmnRZk0
 L3/0KpJlkuW8Y2dBRnH/EWDZ6eixBhGHrW6ClybqEcKV0R2Aso1uZLyslvUauYHQQ2Il
 /vv8VK7lSASNzyQCYWKmurxXiLMWC6UQWa/lDCvbt7z/Op+HVhJag3evgnM/R5azGMfI
 VV/nqtBVxKMcGJCr6Y/dzNgB7D2PSyrgPCahpU9zXdhu25Cwzth42PYVLEdyncAj4tFh
 KNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=EvKMZQSzANH9VG7Ox9sMro+/aB3jrJdWyZcwwgIdCBE=;
 fh=e7qaoDncq5U+shVPSmJU6t+tAVtwVGuNXnMYWnJD4Bw=;
 b=TyVupJ8nT0Mkpt0a4L3rpD4w9uRXiV+Zqanky+idNexFee/Go+5EIpkFm+QVwJWWdf
 ROOZwj14UFm37RCyTgfK75z3RBQgGc7sq8oTLvjfcmDERZ+fW74SuMhAcDN7Pz9/fe9l
 kFxHGQk0/91c0sRFMUZwcmsLnzW3Lt31RoqfRPlYybGvORjHyZRFL6IMxBvt5rmSFCwD
 +LuU0iANgxr5lkZeWiNMGo1x8eod+t9lvcroCG3SROlGEMVJZkbt+SibiUVuhD/CF7n4
 1vhdp1hi/1uZtADktjjV1iTzJOHvO7JZGHY3tIrfFCeZ1zAKZJ40N9fe9MojMdNpQU9c
 /rVA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1770049339; x=1770654139; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EvKMZQSzANH9VG7Ox9sMro+/aB3jrJdWyZcwwgIdCBE=;
 b=gPHjHiIMvnxyOEp24MefS/j3xgdZ4DlY9l5e3rjoPPyoXTqxY5vHcUqC2XImv1xWCM
 cKoJPhGC1FrQF5ipgbQf4P4IvFETHQCYJjLr2dSS1JJnDvm0wYyBwplr41et4lPUF4iq
 XvRCdedFQcRP3z8JI9g42Sk83nNs1pVBTwEJjNuK1vWLJHndJfJ1bU7MZdzZnQ+2BfBL
 PEHDziqUuGOqE0yeydGH+ekz7Qi8xVd4Y8EwJLpGqmBPAdr7qLQoJ0CAWvjbo5uujINR
 q4mQrXOF7vV15JDnQAisK1e/xERAQO8yP4rPSDvYjHmk5OJQtfJl2gcoNxOoFi28sekY
 yLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770049339; x=1770654139;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EvKMZQSzANH9VG7Ox9sMro+/aB3jrJdWyZcwwgIdCBE=;
 b=DxdRBu0oSn/JcwQ0wTWFi8bHrZmhLaL51VzVrVXsiX9DY104gjLrui23y9D3O07HEr
 7jrH/KnL7CGBwJofsuwEp0BNZchOHXcDiRO1BxqmN1oe+R1I88FLmKKlwoKOlHfDi5GY
 846kjFqjZ79pD3fgBrLL2RKtmw07a2fNivMWFEniKDR5EcwZ9psTTRHyysI8w6n5s6sY
 oqe0yMRXsgfQXrs49FpgVbGabskxJd38HkM1viYeiKosA35v+VgaZm/PKzzgf16IVqRB
 E1ZksBKE9egKtEc5oJFhFXsjsBAi1yxm6MxqP2qjZWfK+4qiXUM3/bK7UmihmQr0oUbl
 TsYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvCiSgRZY8JGUbOLNGYALzw7PCkkD76fORfsoo7TlV3S42TLhiXB2llz2eYUfXC4ISSTY445lbIg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIbcafBgu6uV4yrkDmxAB55qYUXHv9nwkRBxaB0N3jYHqfu5it
 X6RJGIpkceWh8C5pNmu02fZMJ7htEKWOsWPA4QBH179/HuLZJmPih1fXRX8sQq4Y8YRBNxFlVEr
 M2ldHlLHcbPzL0QmIblOgG0cAjB43joow7b2yIq4nTQ==
X-Gm-Gg: AZuq6aJCk/zRYD1XduT9g+l0zMnw8lE7bI3WZAFxlmWQ5K9R+odIIj7rVeZQv0YvKe6
 NfeaOSeFkCh72i3oCvHJuG/239iK0z/8TY9pKnu03XIk224IeUNQdRBC4A07KC1BrUY1g0WOJxE
 LeBk84iLN5u7iSk+JbzA1E9Cfwi6J5dq1DbSkFalWJEWVFaqx7tTWJVDhTWu4RbwuAPdIQVjUjz
 I8yGRkZyWBrLXDTtIymqZoxehac7dtg6TicX3IxPP6feNntlJcXWMYw8Zea19ZtUW/SGKhMUVK3
 E+Mj+G88go9fot4KXhAQ0MzNzKmQ
X-Received: by 2002:a05:6512:239a:b0:59d:eb47:1b2e with SMTP id
 2adb3069b0e04-59e1641c39fmr4424338e87.24.1770049339183; Mon, 02 Feb 2026
 08:22:19 -0800 (PST)
MIME-Version: 1.0
References: <20260202103756.62138-1-marco.crivellari@suse.com>
 <aYDO53pNfjvVhoT6@intel.com>
In-Reply-To: <aYDO53pNfjvVhoT6@intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 2 Feb 2026 17:22:05 +0100
X-Gm-Features: AZwV_Qjz2bQSXfX3oBsAjRMbKj_GDFnkkW4GMzaILKlqnWOozFR4ghSl_lmHt2E
Message-ID: <CAAofZF4oC+9ohHupkvmkR-967QEpSVdQoD5yHfLPcKzF4TnnXw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] replace system_unbound_wq,
 add WQ_PERCPU to alloc_workqueue
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

On Mon, Feb 2, 2026 at 5:21=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@intel.com=
> wrote:
> [...]
> series is
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> I just resent it for CI and will push to drm-xe-next as soon as I get
> the greenlight from CI.
>

Many thanks Rodrigo!

--=20

Marco Crivellari

L3 Support Engineer
