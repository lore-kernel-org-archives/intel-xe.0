Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C417C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 07:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D189C10E7E8;
	Mon,  6 Jul 2026 07:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j1vqs1gI";
	dkim-atps=neutral
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885FB10E7E8
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 07:55:26 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-8111c0c7561so27252937b3.3
 for <intel-xe@lists.freedesktop.org>; Mon, 06 Jul 2026 00:55:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783324525; cv=none;
 d=google.com; s=arc-20260327;
 b=C0uENrsrLzswC1/eyV6d1N9wOZ9pnxOXVik+dvf80YKv1k0fpA6Ks03lhHnpp9Ji9H
 oWzNOTEDcwm0kEP73/s00rC73g8qZqoxeEK5Dpcb8JUoGgZUt7L7r1FW1W5e3F9D6CNk
 YFPxI8EmqbYIEgGGgHcTGvADasxFo8fng3823Wn+npZ0pMkZmAaLirouyTq5m4Ez+UYc
 ZQc7YMYBJulkCojXkK1KaQ1IzWFEhnrndQX49z8ueNhqHA75sloJjs7CXKcp2QLTKuId
 rU8+HRgomN05hggLoyCpmsV5CGyhbbnHyuYnj7qz05U0ZjIQlid001IwVXu3PyAehwuj
 zEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=/XEVNZfbYRL67+UpgbRqTZBqZTbyV1Rm07jDf3o30m0=;
 fh=GyAWLoxTT+T5AnCTNclZSeNv2dEJ6LJ/g17dTge+Io4=;
 b=ImCmjCvzn14eFVYW8BlnW+0u9JsAg3KP7Q4Qwxfa2FdY73ZFprasu6sWkHyJCxsgy4
 W8H3cMIxVvat66ZPzEuXBBOJmpnjbRdpStMII//hxDLk/jbkJ0+xgvjT2XET32QXKHRI
 sWVN2oaBIBAqoGruW0sV727DrxrVx+snrOgGWeQRnzAYZI902+ehfWeHlL8A1TR2tq0J
 7/tH+kcWTzRBeZC0pjYKHTu5FHSDHE6nXlfCCbT+3M5r5E4IyTYk/JbMUxXs1RXe9Qxs
 Ezw+T5sDQIcC+be+4udBK70/aB+p5GWyoUVBzctII8bGr0bfstBxp1Q94C14HAnXNZtU
 +Unw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783324525; x=1783929325; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/XEVNZfbYRL67+UpgbRqTZBqZTbyV1Rm07jDf3o30m0=;
 b=j1vqs1gIQYuThKtTB+LJ7ifzucJmCeKs36GgsCtJM+CtWTvrfbqMcDrGuA/chf4xH6
 QO96uRhX82kO4D8kYt/STsC7AIB2WEbpC0Ujme0GJPVjWfNqbaULYAqjnpQjEJciDEop
 BF17JuFzMwBzVogy0UbQtVJrUoqbJ9k2bWRFIlItU3lrWyI3T6WSvwmN4YhqTN7naGFv
 lFUammDlWOVPvyF7mxMQEsPSCNSbj3GhRqIxVK9lbmsuk+GZLpFG7O3ieXJ+dzHhZftI
 RJVKnXkTilZoKAgzHZQQUwErE/tA3giVMkFmUgMHduDIOY6isWqBbQ/bgygAp7PaXsUo
 T3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783324525; x=1783929325;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/XEVNZfbYRL67+UpgbRqTZBqZTbyV1Rm07jDf3o30m0=;
 b=DrD6yZharCXZMH7fMhdGwzNwA33+puSOIyFwdwzTOqbDnRXvCMcg98M/AzIDlU7/rC
 EP6qcYHjKBDfFIlLWVG3F6qcP4cnxQP9iQ63zMgck3+tqRAAv0s7uzeixePOZayjpEgS
 NdQ4sCIcZgyMLlqw079IMfPgzusVNErCM7SLQLIYdhMu5qtmCLgXVVUwGQi5JiYZO0v2
 qch8eBlT9sPQC4vLoCYYMXFCG4NXu20LsUedNcqfRN6H2up2pjnR4Ucv1yUq5dYlevZJ
 9TVKsIDp7D8D2EEcOBnv045nurDM9lMmcoJGABBOtC+XFF+42//J5yUdXULgk17ngBAV
 ptsQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrEcCy/eIQjgGnOYqOvQgKAz+bYsSEsr9wR3EMTtnCJCddBgCbTdmwiTwIedXnJoElYS28JoamgGA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO7lUNXbVMP7xkEjfVgW2ewnstexoLz/UjnxcJRlhMCkGZNqoS
 T7d/P/wgU0HMo8ox5FDZCtSdWv9vZ7sN0lwb1kaTwRnpOdemY8nACpg+t06PQhuXhK8jjFLkNZ8
 RIQpeleYhtWkDbo5xboPdtNBXo2BwgUY=
X-Gm-Gg: AfdE7ckhcF22WZFGxJ9j867tzVYvpYq5wz53Nl0bRwdw7PuGGJHgBwggvKJr0WjKHJp
 c6iQDFU84mEToTL/iIGGmxpvvD3YcgFUJrCrBPX6dAQek3QQnMP9l+vV9R1/rZR9YsDZsuSvNcM
 Azf9rKlt9fXpJK9t9nX1kG/F3Oj1hcZf3ezT/A7zNCZEqVrJwaCvRFhEpippG7YU+3lk/Kjyj1I
 v9Rp+1ROnxpKO0dtXLXed+7cn9mRuI9dBZjV7iju/YFzH6JUgBOkOrNdEU9uMuCpGoKRgeEYfTo
 C2qDxtWHm1TMbi6fSOuoUCWPrrqsDg+xIwaxXB0LsRtKFFgaAxk7x79W7g==
X-Received: by 2002:a05:690c:b19:b0:80c:85b6:7654 with SMTP id
 00721157ae682-817398ee8acmr90492207b3.57.1783324525215; Mon, 06 Jul 2026
 00:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260706052330.1110909-1-airlied@gmail.com>
In-Reply-To: <20260706052330.1110909-1-airlied@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 6 Jul 2026 17:55:04 +1000
X-Gm-Features: AVVi8Cfx-dDIbhjl6PnXaEFhBzsvAKm5asFdkh4qpLxeTgixFJOzjr0UZq9aong
Message-ID: <CAPM=9txKzx6qji23YpY=d6Wrd-se-abZoOmDUW32HCx5YsL0tA@mail.gmail.com>
Subject: Re: drm/ttm/memcg/lru: enable memcg tracking for ttm, xe and amdgpu
 driver (part 2) (v2).
To: dri-devel@lists.freedesktop.org, tj@kernel.org, christian.koenig@amd.com, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, 
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch, 
 intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 6 Jul 2026 at 15:23, Dave Airlie <airlied@gmail.com> wrote:
>
> This is just a repost with a number of sashiko identified problems that I fixed.
>
> I committed the vmstat counters and list lru changes, and they are now in tree.
>
> This is the remainder of this series. Intel have expressed interest in getting
> this landed for xe, we can drop the amdgpu changes for now if they can't get
> across the line.

I've put the latest code at
https://github.com/airlied/linux/tree/ttm-memcg-objcg

I've been fixing more sashiko found issues in there before I repost in
a few days.

I've reordered things a little in the branch but mostly the same code.

Dave.

>
> I've dropped all previous acks/reviews.
>
> This series adds the memcg counters for GPU active and GPU reclaim to align
> with the two global vmstats. It adds an accounting flag to TTM alloc/populate,
> and enables memcg tracking and shrinker support in TTM.
>
> Then it adds amdgpu and xe support.
>
> I think for this to land, Christian holds the main objection which I still fail
> to fully understand beyond it doesn't solve all the problems we ever have had
> with cgroups and drm, so we shouldn't even bother, and maybe we could do it at
> the object level, and integrated with dmem, and android cross process accounting,
> but I still feel this is a good baseline.
>
> I think this is the right layer to hook this into TTM, where we allocate memory
> and I think accounting for this memory in a proper way should be done.
>
> Intel folks (Thomas/Maarten) please review and express concerns as well.
>
> Regards,
> Dave.
>
