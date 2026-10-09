Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C108DCA9ED1
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 14:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7802E10EC46;
	Mon, 12 Oct 2026 14:36:25 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0411510EAAB
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 17:52:54 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-93e64d52949so412800085a.1
 for <intel-xe@lists.freedesktop.org>; Fri, 09 Oct 2026 10:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791568374;
 x=1792173174; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+4+0kNK2EftqWP44Afx2yrCAuhyfq98njB7n1Ib+EPk=;
 b=XnGexcee4CZqLETn9b5DMn6tbV09qm+SabySK8buJk9sMjAnwrTk25yIGsaagDQbcj
 J4Tg119s5SetrsbdY1ldQVeurGli3laQy3B+qjVE7aTw4SbfnNFU027M8aRAhZ0OVShB
 eswNe8zqRYxBBWOuAF4r6Qzafic+JMIkRiVgz97Jf+zN1OjfOcArDQra4L40Vlb4UsSQ
 U4YLXkGWQ1hxbR7SszLtUj9gp6FAoF4Z3MpFKh+8rwj0ks1htNeQoT8l7IsZ5R5P1eAz
 AO2riQOj6hCTNwqBEhPD8RKSUHYqcUWjy+FgoYzXckzy95JVzNiHNqwLIow92xCgiiAB
 E4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791568374; x=1792173174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+4+0kNK2EftqWP44Afx2yrCAuhyfq98njB7n1Ib+EPk=;
 b=PgBWNXVuZmzb9K/fy1kMy/41b3zYXhMA5PCl7Hqr5o0vGF5ehJBxzVcRcJDQgKcUua
 n74w0INOFzVUI8oLhGnzxpVeZTUKTCBDzw0M4x8uuCb1JWYKWSM96lm3vyOeY0snKm5U
 2uEUznuQHIwEzflIq1QtAVYEqGf5u09Gx+cBf/n9Kjx8N8mEZO4QhZk78UeqGfTxKcKX
 sWD/UNYoAPFbxkDxZ8FLkIAZMFEihxF/ytO5g4lkc4H8w5SGhDVfvCSmOgIlA7EIWS/q
 fkqAL0d/y7pUli55czTdJbbElA5b2NKGBDiSdHSwCxsMplQhNAFKQXWihcDelLGodqWJ
 +CxA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxoCfxAOVm5ILMyEnec4k68srekDcYj78eVGA0f6KHtWox262ZOzb0REtkxmU3ZCEQFtwXniyMPfg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++n1sPAaXYRuoD+lYcg+d2Em4CW1mzR6gQvSWQbaxjHYg6PwmFWb
 t2wIBneRLS4VBQCiEwRzv9dy9cJRR4onPzhxfqq1tmsO6IafDUmEGGAJDcB7+2GDxxg=
X-Gm-Gg: AYBFou3t2VWpaoku2J9Pie3Qdjc757XdjnmF3cJ2aSI2kSDIXgTXVitw1GuQLgQVv5m
 xo0vgR+JmxUTXqyxkk7hUoKRtTl/tNQOuOUS+ZLcI+hEU3+EHkQn2kqH4VqXqF3lowMZN+DV2VQ
 0rFMX14bU6JWq5Th5TfSk1hZ8RRe1Ki48911+dMaYaJaoV0G6ViTnUxHZJwK1hdsHaLl8bdjl9T
 Hsl7e3fe7i9VdG7UThLw2/95mEitOc/dxNEiCMX4IaIbQiP/3muLNK7yx+wEGXQjwANwLmUaJeB
 WEIOE2gX0fiDTnhDVznIO7tJnH3A/edqnl+iJrNAGpJtGCSIxL6Dgg4beZizGUbz5JVQNzRTP10
 Ji+WyZtH7XkJHpiaaHabABdeB39mDeopjQcIx0TEXaYmV4ESaCL94995CoZTJ0VGpSuCIBXBfZA
 vW4BOPAr6NqsFKuLpbaf9RF8ocG3a6IRGfmZSihOYGN0VkdbG5QXl83luxn7w3O08KUalrc22KU
 H+BlE61R55RGpcCeDV3WI1rjYanQWrUIrmEfOmNYBwpIuKt8iNTsKs3Ghc2u8OxeyUS/Ad0ZoiT
 0aXl7o4xnw1PdJ1NMc0M62e0R1lZdAmo+87/8WWWwx4MlZaBH1J06Xq3eHB0j4mZlS+s
X-Received: by 2002:a05:620a:44d0:b0:939:f978:c1aa with SMTP id
 af79cd13be357-93ebd0d1425mr411442085a.11.1791568373705; 
 Fri, 09 Oct 2026 10:52:53 -0700 (PDT)
Received: from jake-laptop ([153.67.39.44]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93eb9846a5fsm241008085a.15.2026.10.09.10.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2026 10:52:53 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not
 valid for eDP
Date: Fri,  9 Oct 2026 13:52:51 -0400
Message-ID: <20261009175251.2097777-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <d592bde4b15a1c283f04e9412f46069f8a4926d5.camel@intel.com>
References: <d592bde4b15a1c283f04e9412f46069f8a4926d5.camel@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 12 Oct 2026 14:36:24 +0000
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

Hi Jouni,

> I wasn't sure if this patch is closing any gitlab ticket.

It is the stutter in
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9119
but Panel Replay is still quirked off for the DA16260, so a Link: is
probably more accurate than Closes: until the quirk goes.

> I don't really see why we should bind it to vblank.

With the AS SDP off for all of PR Active this panel is fine for a few
minutes, then drifts and starts to judder. It also judders after the
screen has been off or the machine has slept. So it needs the AS SDP
back now and then to resync.

I see two ways to do that: resync on a timer (say once a minute), or
tie it to a signal the driver already has. A timer leaves the panel
out of sync until the next tick, which is most visible right after
wake. Keeping the AS SDP on while vblank is enabled avoids that, and
PR already holds DC_OFF there so it costs no DC5. If there is a
better signal for "resync now", I am happy to use that instead.

> DPCD 00107h[6] shall remain set

Thanks, that settles my 0x107 patch: please drop it. It also means my
testing of the RFC was with bit 6 clear. I will rerun it with bit 6
set and report.

Thanks,
Jake
