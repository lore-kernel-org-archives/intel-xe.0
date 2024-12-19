Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18C9E77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 06:54:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6814F10E291;
	Thu, 19 Dec 2024 06:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Jxd2dosf";
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4153110E291
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 06:54:28 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-725ee6f56b4so382508b3a.3
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 22:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734591268; x=1735196068;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zEKcVdd4KbmwWmDsGjLP+aEpC5mLZQCnJF6Q1yfJv9A=;
 b=Jxd2dosfkTD/bbNiwL68BGRU+NcT3b8ByZRAJdnBMCjTcRAOh3PdcYj924uqsnXS86
 wy64iWaqwG2iiQEsZTgw176Zcep1wSTwQzprN+0Vq79nD15z7oZpIskbl3NZnUvFTHl4
 TwTJ7GLqRascL0KHHl55XmXtyUu5O5dDps8Z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734591268; x=1735196068;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zEKcVdd4KbmwWmDsGjLP+aEpC5mLZQCnJF6Q1yfJv9A=;
 b=E2SB4X2eix7YF8/wTJ+d+CQR2npEDIN1Aw4DDjrB93tE+0moMUT9F13SOYVf0xzFtm
 wgBfOI0RKMUJJUm5j6g62qClP6L8smKTj+vQ2jK7xE0V8pZdA9g6LnJC2g8bi705BZ9v
 gF5H7HPxDOWGy248jhTQYe3rfmYedMRtxT10aRDhb4KFxeP1YPoCbB6MWsqloM4i0z06
 9zO/LXQRdMXEXGtQdGHWHfvv8qdQ1qwC72pfaGi3JyA7pU3XNFsrbPalFZqKiOWBKNOC
 u/7iMeX8+2bx+nMLvMdsafYOp1aGwTCiX57nvx7K7tEGG9RXqLiEcDWHY2amoxllR5Ht
 vyWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLwTeYPOU/ybLehA3ODKXyO9eoLcrJX/xpw7PWNapCPg1fDXHSdYcNhsVaQ8vjcWaTH9MoHB0Scw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBpP3Tq56mgzRv1Lh5YRo0nkPsip8c8P+dQd4Q/8Q+zGylCMAF
 Nq7kmVhOrTwj9aIlOQVCp3wJlV2k7zCRMY4IkMilYdDuUTKjFm0uRAt0FRFplw==
X-Gm-Gg: ASbGncuXuWfdy0NfYEhrbb/9PdFNV9a9LALYuv28mSo/Zpeo8YHoDyAoAKdieZzaXmF
 SXWQQhMNXxPE7VJDA32RajWgvMZFNLN2UYodDmHgJkaS1Jj59zrZLjNqzIIUrQomsd3sCvVl0Zw
 E6AK8uAkiF1Uqh680/Q7qkmYxg7jPc93o7rNkT+LP3l3bF5faOTJ0YGvofZvD7jR9cxFsGZ54KU
 NuSQ54kH9iPY/4xhGYM7YKWUvH8XCHqQX82I6FaQ6raaD3RPcfhwGRJ7pLx
X-Google-Smtp-Source: AGHT+IGp1bgWDdBZyjPx9UP5f7CVAYTbFI9goJXjvIs5VAvx++xgTl9pFoxE4ySO3MZXIDIHNRrvhg==
X-Received: by 2002:a05:6a21:998c:b0:1e1:dd97:7881 with SMTP id
 adf61e73a8af0-1e5b482de76mr9093470637.23.1734591267781; 
 Wed, 18 Dec 2024 22:54:27 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:5479:11c3:e91d:de6b])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-842dc604e58sm499505a12.60.2024.12.18.22.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 22:54:27 -0800 (PST)
Date: Thu, 19 Dec 2024 15:54:23 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>, 
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH v3 0/6] drm/i915/display: handle hdmi connector init
 failures, and no HDMI/DP cases
Message-ID: <etoz2yofobgqkl4ke2mj4mclnhg3fhascav4zsyentjbvnehxp@ziuc65apm6ih>
References: <cover.1734099220.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1734099220.git.jani.nikula@intel.com>
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

On (24/12/13 16:15), Jani Nikula wrote:
> Another round of [1], adding patch 1 and slightly modifying patch 4.
> 
> There are cases where we want to gracefully handle but *not* propagate
> errors from HDMI connector init, because we don't want to fail the
> entire DDI init, as the DP could still be functional.

Tested-by: Sergey Senozhatsky <senozhatsky@chromium.org>
