Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6F7C5B572
	for <intel-xe@archiver.kernel.org>; Sat, 15 Aug 2026 02:33:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A605510E011;
	Sat, 15 Aug 2026 02:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cijBRYoH";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7584E10E011;
 Sat, 15 Aug 2026 02:33:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2618043B40;
 Sat, 15 Aug 2026 02:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A7F1F00A3A;
 Sat, 15 Aug 2026 02:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786761220;
 bh=2FmaatKkMyzUBE64aHQdNqraDzLaDpP/Nw9aqEgQk3k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=cijBRYoHJPCkz+58rURhfjOb+osKKC3AC0bG2fqH1rdUz1pQvyHmvhV2/rdVG4cxa
 Q062AJVr8X+LZDJwaB5oPG94UKs7a/yEKWQflLKdTNlP2Ojezv43UbEg7lR8I/VlmM
 SA8ZbgxQwcg+AId3c5FWIVDFNbQxBirsAdLeHIM/ir4AyLsN5oLgCEUwG4pNGINima
 4TeQS10wXnh/sHkRlf+9dqReXw4ifZNoTJWFRzgoLaVmnCcyX1Q8wzbjU9k9oYrUTV
 PnQF/WHzvXzXwEueYOizstf5uh0BBwZAjc46wN0IgzRaOmYMGp0rjDOtf/scB6zdlU
 flfBUTf0Kiipg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, regressions@lists.linux.dev,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 =?utf-8?b?5ZC05rab?= <rpwtsama@gmail.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [REGRESSION] Panther Lake 8086:b082 internal eDP black after xe
 takeover since 7.1.6, still present in 7.1.8
Date: Fri, 14 Aug 2026 22:33:13 -0400
Message-ID: <20260814193000.13@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAF38RzLOUW1ZB1f+Q2f9mhnYs+t4R2+UQA1PCihz_FKEu-nSew@mail.gmail.com>
References: <CAF38RzLOUW1ZB1f+Q2f9mhnYs+t4R2+UQA1PCihz_FKEu-nSew@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> Known good: 7.1.5-arch1-2
> First known bad: 7.1.6-arch1-1
> Latest tested bad: 7.1.8
>
> When the xe driver takes over from the firmware framebuffer, the
> internal panel becomes completely black.
> Close and reopen the laptop lid.
> The internal panel starts working normally.

Thanks for the report. I believe the culprit is 2ee8dbd880b1 ("drm/i915/cdclk:
Fix up CDCLK_FREQ_DECIMAL without a full PLL re-enable"), which is in 7.1.6.

Mainline is affected in exactly the same way and there is no fix upstream yet,
so there is nothing for me to pick up.

-- 
Thanks,
Sasha
