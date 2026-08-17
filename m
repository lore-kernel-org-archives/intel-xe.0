Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB65C5DF74
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 13:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3AB10E053;
	Tue, 18 Aug 2026 13:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FeagN1DO";
	dkim-atps=neutral
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF7110E47F
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 21:59:10 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2d032846c95so56872495ad.1
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 14:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787003950; x=1787608750; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=x0L46KhTa9nPWpZYUh2/R/sI5c8j4po8w6gNyYy0NNU=;
 b=FeagN1DO7FcF+xhC+pXGHajDFNUCNHttNrv6si4WTSJgU5B4FbI12SSqohOyiqSXpe
 Wo9Q4R0e0hycGUrHEJ5G34YnphVwVCQVaEDx5ZZItj6uuYerJKHN864Pa/HPEjmHsPwE
 u2o9Vno51gP5AcVMtTdWCLnR6mPU6ZxgJ67YTKSlNWZGdbUlEHW/pYqPy5pV+r6j5QHt
 B3XS8RvN+5IJns4xWZdcpwYhuIU42LlZ28yAXBr0rUxpi9aDLax/4ckbLd4N5ZoTqKIb
 i9pksSF2e+gIG02MQ3VR1VrqoXpZeiMM2yrT/HX9om4zEDNFR/N7/9H2hH4Uv2+MGXSz
 0i5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787003950; x=1787608750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=x0L46KhTa9nPWpZYUh2/R/sI5c8j4po8w6gNyYy0NNU=;
 b=ErlwX+bU1s+5mBsB3cV9xXpYTjOCivlMSNhZv37ei3iD/H2ONHWOi9XjbXDtPdxFVg
 RemXoG6hBjCPts7HJiY4TQC9hCNFhLKgwxQDeFcwO9R81llGMieKRhS70U3ShkyYaczc
 V9izli9fHRmy79O4Bmim98hQ6fkgqwLCr7G74ovSov4IMs+yRexdiMOLbDTZAslgiYQl
 ToMLnkc1IwT7pvo2uhs8+GXEYmLlXohh0IWq7lHnwwrIxMiir1+ruxOT37+LciXBZQl4
 lUwsJk5lOKoh3ZPofDvNh/zuD6cEzmS6wMck1lAqywMsGQqRLQuL/n14mqsc99mMOqwJ
 wOZg==
X-Gm-Message-State: AOJu0Yz+pauf8Llq01L8ktXp7Mu7FpVE9HPsLJ6Pd33W5iipwDUOSb9E
 xaTcx5xbA5Pmt8ydVFuw67Y9jrt8ApcMVd46J+ROfNutRoe3Sv6CIrfR
X-Gm-Gg: AR+sD12BVqS7lZZEfEqwp1pKcTKE4KrwKorjXYX7z9QvhCIyFxcAzBu3EjeBocC/TrR
 yvzwdbuv+gZaO3cLxPCOex7jMHnDGYoBysTOC9bcZjCjf6fxthDrIis3XDpOq/c9gPVjjm3IxoJ
 mB/MOus95fv8/+w4Z05xSIt9nNNDRB93HNvYA6VV2cf6oYqh3zD5uMh9hxuYe8p5R9e/j5JxO9y
 Z21Oo+Bgd4GiipjVfnvPFY8WLQN4LMIPFez0s0UCBU2mKRRZ3eE5UyVQzae5HYSL3X84AV8LkqF
 iPS1FZ4lHIICgnublrXoA35ag6yqcXwqa0iPSJTWSleu02mbVjmhnMlfsSVGEbCe9Mtnlv4m+uZ
 g6Se/QhQgTqDJLIRZVP6hDeBJoS6Y8G+jrCZGC4OXROT5d1GV9n6UygGFmQupcxMsr50eK/CWuS
 T97ydgO4wCiykrtiFX+c9X4uoZotdhF68Dfgeyv3sTfxafroR/AM2qYxC5k/qAFSUfkvwooaxvN
 rtt
X-Received: by 2002:a05:6a20:6a21:b0:3b4:61f:1fec with SMTP id
 adf61e73a8af0-3ccda6f2f05mr2853996637.2.1787003950290; 
 Mon, 17 Aug 2026 14:59:10 -0700 (PDT)
Received: from LAPTOP-TD60H193.localdomain ([149.19.17.31])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3267c897e37sm10657970eec.28.2026.08.17.14.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 14:59:09 -0700 (PDT)
From: Zhefu Zhang <a723356@gmail.com>
To: Chang Jiong <xspeed1989@gmail.com>,
	intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/i915/cdclk: Don't force cd2x pipe select on Xe3 in
 bxt_sanitize_cdclk()
Date: Tue, 18 Aug 2026 09:59:00 +1200
Message-ID: <20260817215901.459-1-a723356@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260816062344.796615-1-xspeed1989@gmail.com>
References: <20260816062344.796615-1-xspeed1989@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Aug 2026 13:46:09 +0000
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

I hit the same bug independently on a Panther Lake laptop
(Xiaomi Book Pro 14 2026, 8086:b080, Xe3_LPD display 30 stepping B0).

Arch linux 7.1.8 stock reproduces the corruption with two
"CPU pipe A FIFO underrun" errors. With the same change applied on 7.1.8,
the panel is clean and the boot log has no FIFO underrun. Also verified
the same change on current drm-tip (b801f94c49ffdb0f65e37baf31d68570356d4983):
normal panel, no FIFO underrun.

Tested-by: Zhefu Zhang <a723356@gmail.com>
