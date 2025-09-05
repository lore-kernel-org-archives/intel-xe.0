Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AC6CAC583
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 13:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DFB10E72F;
	Tue,  9 Sep 2025 13:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jxZb3aPz";
	dkim-atps=neutral
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E48910EB4D
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 09:32:42 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-3cca50781ddso849831f8f.2
 for <intel-xe@lists.freedesktop.org>; Fri, 05 Sep 2025 02:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757064761; x=1757669561;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WUQQxacMUqRahxycdA3h1y3Z0OF1IgYvOPyUtwNUMm8=;
 b=jxZb3aPzz7zncvaJhdbXuB+lCt+I6STZcdZjYuNN+/oCMsRdH50Yvjzg0qujMM3Qsz
 d4jIgeb+zaj9t8GtbxGqjvnVkydXdFNe6mBZOm7GwTVzjsWEB3t/RAZeLwcHE68HpsrK
 wfkpHm2O2ed1jFdtDdeGPgZZQD4Q63W3HFBNspChcdglprD2in1UAe4heZisa8/Nhn9/
 TRRbIQMCrjaIsBpK9xm98Y9PE4vKrpv/fRToVHS67FIIJJTu8h0YnTy+oFNyCQhGbmSu
 ZcmKYMhFxny1P/pJk3c+JBss9E3p3c4sBIOyZbB1CTmo9MgAknbjUVT7MFBe6OdRW4Pa
 shaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757064761; x=1757669561;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WUQQxacMUqRahxycdA3h1y3Z0OF1IgYvOPyUtwNUMm8=;
 b=RtgXWIziyFdraUwHcoTXN8VBodxh/INTLmVpkmCZ/ZMKpo8zW1HFdMAV0L9b+Chfsg
 LQhb41y9wyZDWGL0ZMGUuOhgIXHSYu5ELBW6E9c37Bh4SCzI/p2aIHcwsD3dwvl3u1em
 Zg1L5Nmurzn+oeWmvrUwQiEE8njsdewC0KCnxSXOcM/37rIvA9A4QNvZNXZ78zQUnCMX
 888DvYu/927xvBALewfA6mvFia47eepEc931HIryfWYFIGQfA7gEJ826k0S+H4vwCg0P
 NKAcEaEQoDTp14lB0dG5nWiqVUNj0vhc9iAukrJjTTDtlhLUljPv3NzTdhIqp80s9VlR
 zE5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSy/RIxAgS9LCz3eAZxWA/UlSnDhVECzYot+lKBZCRUgwR/bYNt9Db/7OFgk0XWIrJabfCajFgvw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzX+T1yhYNOt1Ty1QctuGRDj16S0dgDce9UV1faM1PDBXvaxkIs
 5UKlUkYqFVCOvEybsdRVI0qtTtsvzmPZKnAaOHjoC2bqeJIxiqOnb7odPcX3OxxfzpNPwbNBbTC
 yVYhbNOS+kIuK4IiuZQ==
X-Google-Smtp-Source: AGHT+IHZDkHcj/6VcYiM7mL8WwChssJZFLeAxiSE8KdBYC7hKhBpbzlSoeURD7a3i2UI42tf17qNH1ABChvUeQQ=
X-Received: from wrbm16.prod.google.com ([2002:adf:a3d0:0:b0:3db:bfe0:7582])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40d9:b0:3e0:43f0:b7ad with SMTP id
 ffacd0b85a97d-3e043f0bd75mr4771289f8f.18.1757064761059; 
 Fri, 05 Sep 2025 02:32:41 -0700 (PDT)
Date: Fri, 5 Sep 2025 09:32:39 +0000
Mime-Version: 1.0
Message-ID: <aLquN1YvdyI_6PJS@google.com>
Subject: [PULL] drm-rust-fixes 2025-09-05
From: Alice Ryhl <aliceryhl@google.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dim-tools@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
X-Mailman-Approved-At: Tue, 09 Sep 2025 13:23:04 +0000
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

Hi Dave and Sima,

Here's the first PR for the drm-rust-fixes branch. It includes the
commit to add the drm-rust repository to MAINTAINERS.

The following changes since commit b320789d6883cc00ac78ce83bccbfe7ed58afcf0:

  Linux 6.17-rc4 (2025-08-31 15:33:07 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/rust/kernel.git tags/drm-rust-fixes-2025-09-05

for you to fetch changes up to 349510052f765b6eb9c2a21d0ffe08ba61fa683c:

  MAINTAINERS: Add drm-rust tree for Rust DRM drivers and infrastructure (2025-09-05 07:07:08 +0000)

----------------------------------------------------------------
- Add drm-rust tree to MAINTAINERS
- Require CONFIG_64BIT for Nova

----------------------------------------------------------------
Danilo Krummrich (2):
      gpu: nova-core: depend on CONFIG_64BIT
      MAINTAINERS: Add drm-rust tree for Rust DRM drivers and infrastructure

 MAINTAINERS                   | 11 ++++++++++-
 drivers/gpu/nova-core/Kconfig |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
Alice
