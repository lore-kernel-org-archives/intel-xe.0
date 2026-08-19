Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CF3C5DF81
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 17:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2644710E177;
	Wed, 19 Aug 2026 17:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DeC7/bw8";
	dkim-atps=neutral
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7F910E729
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 17:25:36 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-c15cf78d1a2so146778766b.1
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 10:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1787160335; x=1787765135;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=brwuP3//9zJM0qC+/e2rlMQZs7hrreJP5tVopawxJ0Q=;
 b=DeC7/bw80AoecBdxkPUKMuVP9Q0Shj6idISl1OyP3sZ6CKC8qhYexFlTNQ/QBQ6zG4
 7O5758+GfPZOuLskPn+O5c7dD0EZpzT/dZVMrIhtOMIdBgHneWeMAUjG+EeSl8CY364g
 nyemFBs2Lv+n6OBpaH/Tdwu5jJOSWX3Kqo994=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787160335; x=1787765135;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=brwuP3//9zJM0qC+/e2rlMQZs7hrreJP5tVopawxJ0Q=;
 b=fOGTDWBhQ6YKMht6j5m7LOxdsm3ZtpOCyqOAUc3BVOGd+3YcK3OeZw0uwDEhpjBEl7
 mGF/zKqgI5sLmnWkA21xnEH1NzL798PoKuPKahI6JFA/hxfCSuBAF603kInWIL+9A5/Y
 K8ZBO53ctnoYhT4lHNIv2p3sVXNVgurCY2pxs4RHekTQeV/jrVY9u9C9jdOqMSOCFtqP
 IIYRUweA9RJ1dB1wq+ZzhBESYppMOUdK7ZEKjuf1QCRu9LevD/cUYgRCdZ3YzgLAtBv+
 B4IlaHAxr+mHneRuZ1a99NF9La0gCD8cwCSzyCPFpKgPvAULKcjXWGKS30ccO0OS/1HB
 Sg0Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq7ygCflQ/N6FiTRRCm0ouhVZy2PiExlpr6vGq2VGixEM7ES/C9Em8vzWmb93XN+VBmGcnwFJcVuQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzSyKG0pVXd9sLR0jqzme2buTUjHhwkuYefzsinyhINe4yoEmx
 9JtwBq+HwXOWQpR11Wqp5breHMRR/CjgCk6jhCptTXQr+uErTU64RtfLqIvyeYcabba+q1BaCfy
 pSn9UQl4=
X-Gm-Gg: AR+sD12C1Mu1Qk74h0jIT1fe2SVcoc5CxV6FomjHhBo7aqGinuqdh/IBBclu1p78NMw
 XuBFmfCYKvThxtmEzRdwQ819g5CEu1v9y00K27A9/+dQtzd6bwTTcm0L0oL8Guhu9UXkJdCL4Uj
 jGUjSHhvRAwJqsFmn9ESszlskhtSd6/f6RuorQF2Kawppo6i8VYAZNbeHjvJI3NWaGI7AFOWY3K
 DQMRt7ZieBIUErqyPegHLkcOohHEIAP5WXpQ/JsgBCKHXHJD9FmopK/3Pqh+Cdex/OANbuwtMZV
 hQyHPcXDP9fH/wrjhv7s2TH0qjzKn8SONEFpXt6MZqy+9Jy0nZNfKVpzv1sdBLjlEflZaDrOpT4
 69HOnAUsoOQ8PL2gTyh1QI1NAp5hwA1BbIQpeuUvwi2iOSwv/iURmLcRZ5IfxqrXBKonwMPjk8h
 4ZthmA/L9ppisqvERVjIDs2cGDgRPXsQW3jUMYpCuY0Z+6WTFCkD2QW71jxxVpPSoHoXLy3iFEe
 g+I8bs+568nzzt4lXo0Fi7X4UNlSrCUE6x1Lw==
X-Received: by 2002:a17:907:3e18:b0:c20:33db:41d3 with SMTP id
 a640c23a62f3a-c242e1e6a65mr462516166b.11.1787160335180; 
 Wed, 19 Aug 2026 10:25:35 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com.
 [209.85.218.43]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c243c8ddf0bsm104874466b.4.2026.08.19.10.25.34
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 10:25:34 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-c15cf78d1a2so146775666b.1
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 10:25:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RrdjXiQiHWqKAu7dmsJAd8kJSEz7G3Zn/aNCIUWJu1lu8FywXmtUtTzn/ms85VULTKkHMRLhKSOlw==@lists.freedesktop.org
X-Received: by 2002:a17:907:7251:b0:c15:f26a:342f with SMTP id
 a640c23a62f3a-c242e6f411bmr456227366b.23.1787160333984; Wed, 19 Aug 2026
 10:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=whiv=b+dAvjaZDsZkfUEzjZMSSLExDOWVcbJ0exsCj6_Q@mail.gmail.com>
 <6874536d-ab1a-4dd7-a23f-2a071bda145e@lankhorst.se>
 <CAHk-=wj5aE1yVMb8RM2AuNUHSMnQDaGT+Vy+At5ds1vxBA+Kng@mail.gmail.com>
 <ahDAErDSE-SFA0oM@intel.com>
 <CAHk-=whX59mtUnU2ayMWoDQX6Ee2NXLK2NxQ+dZnb-Qc_mF1hw@mail.gmail.com>
 <af9278d3-4002-4e09-9bcf-bc75d1cf8145@lankhorst.se>
 <CAADWXX-pfvA3mKWSjdahnihAXHQB2VP9BOJDCXonG3Q_nxurLg@mail.gmail.com>
 <anYZ8nUFP5dnRy/h@gsse-cloud1.jf.intel.com>
 <CAHk-=whyk2-u_1bTh5ZTeX6jW3HgAtjJh0mV_oWtgsqCe=3w7g@mail.gmail.com>
 <aoWHKmz17HQo2uy5@gsse-cloud1.jf.intel.com>
 <CAHk-=wjv7SCjtg6JGDabGMXdqobx+WHogHfQeMPF2g_HmAU5qg@mail.gmail.com>
 <CAHk-=whskfzdWdUs3NwYm+e9py91xdiG5mLfYf=g_6QLpdaP4g@mail.gmail.com>
In-Reply-To: <CAHk-=whskfzdWdUs3NwYm+e9py91xdiG5mLfYf=g_6QLpdaP4g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 19 Aug 2026 10:25:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjr-6qT89G6TLAPPYpzPbq-JYS0C5e4i_KAUXwNzeStzQ@mail.gmail.com>
X-Gm-Features: AcwNN1V27_argTDU-WRPdnuNp-fNznKgO8BRQ6CghDUjKQEHO79DJMiFwqlxOGs
Message-ID: <CAHk-=wjr-6qT89G6TLAPPYpzPbq-JYS0C5e4i_KAUXwNzeStzQ@mail.gmail.com>
Subject: Re: drm: xe: Kernel-submitted job timed out
To: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Wed, 19 Aug 2026 at 08:23, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I take that back. It hangs at the same point.

Update: with a single 6k monitor and no rotation, it works.

In fact, it seems to work ok with a single 6k monitor and rotation
(orientation: "Portrait left").

So the problem is triggered by my insane setup.

But I'd really like it back, because I'm a little spoiled princess.

               Linus
