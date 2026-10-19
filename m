Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB35606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 12:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=kr+5vIa9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB06E10F088;
	Tue, 20 Oct 2026 12:53:17 +0000 (UTC)
Received: from mail-qv2-f3.google.com (mail-qv2-f3.google.com [74.125.230.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24A110EA66
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 16:06:54 +0000 (UTC)
Received: by mail-qv2-f3.google.com with SMTP id
 6a1803df08f44-91b9c85fd12so4005856d6.1
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 09:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1792426014;
 x=1793030814; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=r7SqUP92dR9LlFw5I9AVb2JK82RW6iK4WkK2hKZlbeI=;
 b=kr+5vIa9P4MAXiFYXRivzXhJnme3snmJQ+H5HrKpJixXGETMPAcMg3E/+X1zR+zMTV
 v0MJvAcNmIEbnD4waRV9MaA/dMETpuizfxF7sQY9slhc5W8p96DJM4MRA206eXYdT0Ss
 kXcYzocuBckyx5NZvDSX9SdNubcKeJVpyWLBd6rgYc1ot0Dy4QFFTtyBLPMg+4Joh/I9
 V3fE/hjkNkhpIRCT0pnNrJTIDnTukhZMBAoo+vjyZJPJ+zuS5qjHUQ2Kvhk7oCfFyP/c
 NEghnAnrGTwSFo2OVtgyfzMrukZle7aHJxK42MOyE2AKDIFmTs9WyXhD7DZlSCflaVrC
 wiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792426014; x=1793030814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=r7SqUP92dR9LlFw5I9AVb2JK82RW6iK4WkK2hKZlbeI=;
 b=s0U4UyJ6h2egwHbE29ZqXNshxiC5W2S8ka0YWca0ziKhMP16mkNKGPZKO3Zty6Nzqt
 CCAzONdo/+ku4WyE2yhoFUmMPTLbfCokwMD+GTL4DZCRUk6WCh0LhExzkjmiGnBz1FsR
 2Xczl4XNNZA1+mjvCqCiZ1xV9vsBK2d9x0wwlVQCJPxLLUiqemOH1LT1G7M9SfsEc+NP
 mcyWAzcezJ+7bmrX+jksie4DXzsywxcVHk0nqEi/B5PZDi5OwLRvtGcjZD0wez3g0+I2
 ICUMasVlWgYIimz5WbKAq4QZw2uDCvzcUB9P2S1CXgwfLsrKbfYqs7QWz1IsbQzI8bjP
 LLqA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwNNk7xE3zZctHmHofqmYQhUROWXXkMoQxIbhYLnJbTVyKvz0nCl0iSbYE2EaZQqzrTKI/zwhu6yQ==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIFbNYcMS3+0TxwmbfIgRdrJcg2cLrDOcV8Ueklm74mF1N5AG7q
 Y6Lbz+8qTolOQoxNOzSJ+yz/RZUsaHgGD+uODEvfZUzYftbVHPzPCi5XCUIrn6+lPts=
X-Gm-Gg: AYBFou3GC8o5YtoO0VxKv+cNXpmzcXL5IZFxoA1jmdRyIz8vc/K0VNcb5+mypCwpIrL
 qkL7HsH29RrL39/Z0giwERT0pVbFJhdQiuZWMsWHpfJ101P6cUF/OXQHCfmR5JuUijYBCTfPpxG
 J7DeB6dgMEK+1W+Ei8eikZKrPmmLe5Yu90LBo0UTbvER8gkffiTdbA1a+/9rALH/RlqVzpR2B3L
 YMy+5+0b4UJG56Hs3pymkQHeomJ+eZd3GVeVm/pGP6q2ZuqkUux70Pn31UZvV9X3X7J7FiyE0mk
 DzQFnJSYwT+Sm3hIWaZbNj+nmqMblM7NACanz+kEZ3JrN0uUA4kx9bQ6Y157AH1hh4sFKp9qEBA
 ERpr17k4N6PZiuXj2tNvRtQOA1tDJkxTV1nCloio4G/osT22Gc8TAesbJm8tpE+Zl0WFxv6hURH
 0TKYD46gWBTR5n8hmrB22r1AACvZU2lN1fpkETi9UKHo5Keze5fskx+DJpKf4bBkbG8PCre0X7c
 szOkg2Lry3CrivrkbS1Vnl55phCq3anepNuHX4iiSRDABwuApmsC/ZpMatmWRU+tNJqS4OKQCzJ
 IbEMhYhM/5iioHRALzbsYUnl7lw5dcAHG+ytlkrVx5QCqeXZPucyWttbW/ABEMbv889fSBWz9Fv
 M0CFARY4sBaSjMDziOfBZ1FcIN2Y0G/y4
X-Received: by 2002:a05:620a:2a16:b0:93f:eed:ea4f with SMTP id
 af79cd13be357-93f29dc672cmr1243203985a.41.1792426013612; 
 Mon, 19 Oct 2026 09:06:53 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::662b])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93f1a0cf9a0sm990303385a.2.2026.10.19.09.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 09:06:53 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not
 valid for eDP
Date: Mon, 19 Oct 2026 12:06:51 -0400
Message-ID: <20261019160651.584009-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007083443.647649-1-jouni.hogander@intel.com>
References: <20261007083443.647649-1-jouni.hogander@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Oct 2026 12:53:16 +0000
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
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jouni,

Gentle ping on my last mail. With 0x107 bit 6 set, this panel still needs
the AS SDP in PR Active while frames update, and the vblank-gated RFC is
the only change it needs:
https://lore.kernel.org/r/20261006220500.3417572-1-j@metarealtyinc.ca

Still running it here on 7.3-rc5 with no issues. Should I send it as a
patch on top of yours?

Jake
