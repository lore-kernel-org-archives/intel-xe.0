Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BF2606A31F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 15:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=EVzo/JPM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA6910EEF7;
	Mon, 23 Nov 2026 15:18:10 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118E210E7DA
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 13:32:11 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-8b4dd5cb4f6so20337057b3.2
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 05:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795440731; x=1796045531;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jrHVV4UUE9RlUYbRvvlNd2Xj4jhLRNu8V0y6gzAkPhg=;
 b=EVzo/JPMzo/vv9oQKdVFrUyhn9y6chlJrbKzDPy9hGz6Pxi1fdqDsczR3DjyQX+ymi
 6FVgVhuVWgEP+uUwNWoZTIGunPJSsvrQXr6iud7r2JO8bUzZ81NUMVKNs5DgxdqskbH6
 3OKFBxasQ+PKWCxJEXAHqJ8itMckc9LI0507+M1LrIYfM+anW0+1uXjp6IOA0ixUm6L8
 wfBAQs9HWz+gwOmPtoI7nuMl1wWPuUf3pXaJwEAtxWbw6aDaIhYBlwiq7TOmVgsm1eg2
 cUqa8N5DhqqY1RYTDJww4EevDRPrJOMAraAiOQgeEmFi6mDQ8ofgm0hdUUv2wnY7w4kE
 k5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795440731; x=1796045531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jrHVV4UUE9RlUYbRvvlNd2Xj4jhLRNu8V0y6gzAkPhg=;
 b=M6Y7GYCEcX0PPx8rgDqqR/s3lsYZFpsvQX10Jjdo3Rk+p0IFwzI8cy/N9QFSpJuVJa
 wA6plaw/EtU1LOWT0iWEw+mCv3aNDXW0WTcVLpvFkF3RFYyywusyuVqCWatWwis5Xyas
 JLZb0MUCQDBrFzPaBMU5Iaff77rNTWF0iYe4HnwbRwyt3H+Ne/cNt0VuHbPaAjA1CnXy
 /o1AlcSrMTHdJiG0nW0VMxDouM3yv5bfLDyzCzslZtZDyMIVgMhHUi7Jz2NqJTnRFfV3
 DAc2jX4QUImLtydw08Sj1tdvj/vusTKnepjOQ3VBpSK6A50PwxzpCLg7N8Ckd4G7wlXO
 /zMg==
X-Gm-Message-State: APuU4Z9hkfKPXSoLEakKIIKt6Oof3Y1sUdisFseOctoUyA2p2WBqlVEB
 SWs+wWZANwoKQgDbhPMd5BiUu2sr7g74/r35jHnP/RaBx2/dl1ddw6PTLJvpnKk5ukk=
X-Gm-Gg: AZFdTZczeTI1XpN+v0ubcyCt/kdEHroS39A7rJ7GAvg8Cr54OvGztGsi21MnrdQVtv8
 MAw7w2GQX3oqOxRVBLIR2go6WOLpZ/BrweWopGnDUwHzwGNgMct/z3adAgsfmdDWpv112JFy9lo
 O75D08UUZjikAyUFpIIhjL6UFsua14XujO452iUW+iDU/bDb2iO/aw3PH/M6jUPaJme5HuJFYof
 NmN3EML5pCmcfRp+EjSaaUaBm73vbbfQHPl7MwUA6N/rQw/r/Mzg/9jIx8jRctoQcRIUN3sdJyz
 FEJELeurTZ5ReXRl/aUUqu/I/ewhJqH2ErQYsEsTIFPto8TjEhQ5mRX21c5aO5QyS1jm8C/1pZO
 pZkB+Rpl+zP/gT8NvFm7fz/WggRKwYgARLpAfRc62DzPprnFEXXot1vq+lRz2NwpE91/U7Cp24v
 pFA6X6hoQkJ5i4JUbajXwHGPGf0SPPtMrjUQSrGqWSm5cQ/GuE5oYuVhMcmGP+9tNGhyIcMzSV6
 MD7lrPWlVtlEebifvtsSHk3gPun3GkwiNODUYWzQuX5OqeYshTdjhXzVOooC59Bn6k1cklcfMt9
 l+pULpTq/I70Vvv/3zowLA9qkqrinoWkSOjJGOGpGKZamM5Q9WOj1zK5MgtEqduf4ZmAHfP86U+
 d9obVQpEp6h0xJz1bHb7b5BDaqCDgBOjLQ9WY4gfR3g5zIe/Q+4odv6C7wYfICB1BjJ7NixRRZL
 3yKaRbk0yXGVaHrDEL6j6pxtbMYGuhBoYSI9oycEICIadeWhKvr2mFoaV2RKXeCPRISQ==
X-Received: by 2002:a05:690c:6d87:b0:88f:ccf7:25d9 with SMTP id
 00721157ae682-8b520504b49mr56847237b3.60.1795440730656; 
 Mon, 23 Nov 2026 05:32:10 -0800 (PST)
Received: from jake-laptop ([2607:fea8:c6:a700::ec62])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb4004e8sm800179385a.33.2026.11.23.05.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 05:32:10 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 ankit.k.nautiyal@intel.com, rodrigo.vivi@intel.com,
 animesh.manna@intel.com, uma.shankar@intel.com, jani.nikula@linux.intel.com
Subject: Re: [RFC PATCH] drm/i915/psr: Send the AS SDP in PR Active while
 vblank is enabled
Date: Mon, 23 Nov 2026 08:32:08 -0500
Message-ID: <20261123133208.1416623-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <ba1ee8b0cd9bde1c1b93048a5d3a29a867dac8e1.camel@intel.com>
References: <20260923041342.2146450-1-j@metarealtyinc.ca>
 <20261006220500.3417572-1-j@metarealtyinc.ca>
 <76935065478d9f4ab9ee42e36b541101bad34423.camel@intel.com>
 <awBhLKnEiGt69Vr7@intel.com> <20261120163416.66175-1-j@metarealtyinc.ca>
 <awCCGeCxHToY8tsI@intel.com>
 <ba1ee8b0cd9bde1c1b93048a5d3a29a867dac8e1.camel@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Nov 2026 15:17:28 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jouni,

On Mon, 2026-11-23 at 09:29 +0000, Hogander, Jouni wrote:
> Now when vblank interrupt is enabled it is triggering Panel Replay exit
> and entry to live frame mode. If
> PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE is set AS SDP sending
> is not continued.

Thanks, that explains it. The bit suppresses the AS SDP in live frame
mode, and live frame mode is entered when frames are updated. v2 [1]
clears the bit on every PSR flush (flip, cursor, frontbuffer) and sets
it again after 6 idle frames, so it follows the updates directly rather
than vblank, which was only a proxy. Vblank enable with no update
leaves it set, since nothing on screen changes there.

Two days on v2 here: one brief possible judder that did not recur and
may have been load, otherwise smooth.

[1] https://lore.kernel.org/all/cover.1795263689.git.j@metarealtyinc.ca/

Thanks,
Jake
