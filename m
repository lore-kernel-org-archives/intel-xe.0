Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3191606A331
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 14:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gguEGFo4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F0D10F23E;
	Mon, 16 Nov 2026 14:38:09 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D9F10E6CD
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Nov 2026 02:51:51 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-c4d2b741ed9so309370366b.2
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 18:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794624710; x=1795229510; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MhJIErRaTVfRxe+/WdgTiC6buoyYG4cHph19YbmHDSc=;
 b=gguEGFo4Bf67glihAZVbNVEZ6M/Yhig3Fk1RiIIC+BWln/cLe181im+hestGCMHkko
 s7q2RxTPMysd5n04U5E+H8wAQ1uqOT3JDUog6yzExhyiqK7DIWQLgTZ/dLHkxhFq3IiL
 j7avTIwljGYiknjcpnGg+baG4PHHahbtg984M6jWXgnilHZ9SWCHPvCi1i69RclRd/CI
 eyM0Q5QvWzB+JTRRcZzVXJhOeSY2m8zw52eDRzPb/YY58ibmfqCFTZv9KROGV0uQt5oI
 d6NbfROIsKez592nsTeC0KguPNUyIKh4nQ1Mb1qEQdMBWkpYnbBPmnNiODKYDU3/GYJd
 DNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794624710; x=1795229510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MhJIErRaTVfRxe+/WdgTiC6buoyYG4cHph19YbmHDSc=;
 b=PsaKsa6zB6U6yY9L6CfvfbaHpHbkmKb4Hnimvz2P0mRP3shNqiAzw4IK19QEetbb1E
 AbdstOt46+u5Bool13UhBowm5xn82SzB9woMeBscMWDEiUX3A/AxiLJQ+NfT30NOxCtg
 mub2GgZPZOR29Ny3gRPUN+SSsihxU7a+WBMLPLbxsElqjgFb9xXc8D5PYLhaylYb5jNk
 K2OPI49Zq6QWGN6lkjVvGtmLYflDmkdwuRS1zMqLMjXw8jrcJp8NC+JJQ+tpDbQMj0iO
 SIQYwz9OocLl25w7pkoQKDR9K2JaOvm34K3H0R1OoKgZWED/WBtlrNLPYgvmHKh7uPML
 +BQg==
X-Forwarded-Encrypted: i=1;
 AL+hErFLBGGe0diIwpV8K5E7P75OwzHkvviQwxHX8SOmJbsQePVMiFIPl+8qeLhyMKvF9vfxc0KC/3qU6g==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+Lf0vyu4xMxziw6H4BxQdpsMvYVjabMimc4zzmTzvAadWG96ND
 IsHfOWv/HfxTGwJzat2nBdTMcu1g2SxjL6mzRDPAvD5KV86MeX//3gJR
X-Gm-Gg: AYBFou0dVrR1K1B64wg8XHfrAbJZLNEXCf8hnctLi7b7pn7z3n6/OrfgF/h0vwlbTVa
 QhaBcIfHXAOuSooRHPigLafpzEPO6bFN25WYzLUqy2TFfyNTeUXntAMuB0D1RFslpvrp2nmZHYi
 V/rY8XE29G57C1uglppGMMGzLwwacCYznKDZq+LkbzoXLBd4c6Et+pg4W0PrAj7qQveWO6bTOui
 MwMqOZni1kfihD6qduxIIZnV+2cusSfNRZFH89DRgvyqa3HORu7ezVl4jFqxneGf8W5wETO0IAy
 jCHNmOg68ST0BjGX62spWisFSwD1sQOZsdx5WfGeHFWdVc8Kgj+5acJeqhPpZewjuUsKd3zQbBf
 DzELYhUuwXPdQ+YPG31XZrS7zpAVHrHm/bbiz+Yu/kazhiAjtBfYpXtz109NKfPDr53hx1JXc1K
 fqcwNC3OvFbao7OOyw2MAoKpc93W+VQacFKLo34mgmbFvfQzV2VdXuLQO8h1xZo9lG0T100xIuW
 bhJdMy5EvZKiqiimSsINe3F2SutEoZoi6yWPbSR5Qx0Uwoq7CpWY5fWKb1Guc3ItcWlXH3GjHWC
 Wj8jp++6WNgTU+EuQkBp9zCdc/CeHke60vlXHsawEJfzKPGNqltDjjBeGAGkGHj3zUqLEDDxmoI
 I1dUEUvtggqds0CwopYOGX8m2hdMDTBJXVWV9P6TezphW
X-Received: by 2002:a17:907:3e10:b0:c40:231:6eab with SMTP id
 a640c23a62f3a-c5096370c31mr367846866b.16.1794624709830; 
 Fri, 13 Nov 2026 18:51:49 -0800 (PST)
Received: from SMOK.angora-ide.ts.net
 (mm-156-219-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.219.156])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095b58981sm166556766b.45.2026.11.13.18.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 18:51:49 -0800 (PST)
From: ElXreno <elxreno@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: ElXreno <elxreno@gmail.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, ankit.k.nautiyal@intel.com
Subject: Re: [PATCH 7/7] drm/i915/vrr: Allow VRR with the pipe joiner
Date: Sat, 14 Nov 2026 05:51:12 +0300
Message-ID: <20261114025115.2419087-1-elxreno@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-214052@kernel.org>
References: <20261114014335.2132756-1-elxreno@gmail.com>
 <20261114014335.2132756-8-elxreno@gmail.com>
 <sashiko-outbox-214052@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 Nov 2026 14:37:53 +0000
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 14, 2026 at 02:24:32AM +0000, sashiko-bot@kernel.org wrote:
> Can allowing vrr.enable on joined pipes trigger a NULL pointer dereference
> in intel_crtc_needs_joined_update() [...]

Yes. I can't reproduce it, no third pipe can be lit on the i915 side of
my machine. v2 will have

+		/* A DDB change can pull in one joined pipe on its own */
+		if (!new_pipe_crtc_state)
+			return false;

> When a joined pipe's DDB allocation changes while VRR is enabled, does
> falling back to per-pipe updates in skl_commit_modeset_enables() break VRR
> push sequencing?

It delays, it does not break: without a push the secondary latches at
the vmax vblank, one frame of up to 1/min refresh later. The cover
letter lists DDB changes among the commits that keep the per pipe
sequence.
