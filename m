Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67744E7716C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 03:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1858510E37C;
	Thu,  5 Dec 2024 03:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YyIzfUsV";
	dkim-atps=neutral
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAE610E37D
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 03:53:30 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-724e5fb3f9dso403180b3a.3
 for <intel-xe@lists.freedesktop.org>; Wed, 04 Dec 2024 19:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733370810; x=1733975610;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZZSHV0LKLhgrBuMbp+ZWR29V4e1LVWQGoaBkExJal3k=;
 b=YyIzfUsVPm1cRrEru/U/XAp5iaW6nlwZML35pqCEmv+TkYfQCQ4+Q/Zxf5vI1+ij5Q
 CfNbFS6VIgJENhqn2hGFGnClukhuWb72qgH8is45N9oBmJ3EpmDkvIKEHPTk2hXeFeFr
 ryazggUav39780M9bzpGxnXW34afwe9FZU38U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733370810; x=1733975610;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZZSHV0LKLhgrBuMbp+ZWR29V4e1LVWQGoaBkExJal3k=;
 b=ts4d/tfR9F1gwbXZMj5Z/zUzByOv9LkPXma4Ev9ZhOU+6lhtFUAyw5LP/CIUF+GZdk
 4VtRRUL/tCFba8QJnw4MIFYB6Z5vsZWUVa5NEFPN30XJG9a56yVSfNngZuz/ErDndjuH
 HJVNtsiuEbAhQYV9MoYCYewj56DkKaGSZG+V+Qfw2oTQgWOndZuo1iBpaXelEGyKprtr
 A9CMGdbrKi6j5bPZogOczMvrGM3mirDYB8HwgmkICiqfp//sW70sylkJlXHF+rsiY3zI
 sjs3ELD8iGJzVWncNRtlobK28F6XGse2cLou8QJcI5HkKJaISCyDPg3BM74cpGO2e4cf
 HA3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXszXcsUj+bEP8QqESEyh1vAW+tHZ39gnsah8Cqfwhp1lbwfyK20T6iLDWI3PvJ5YgT8NTgCMa2Yw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUBXh03DMPMU3sVYN19wCpbR+hv3PQUAAZ2ON0donQIzrvMPDj
 ufGzGzKAa5U5eixq3po5lNK5jU2xngH3/BKWMcD+p9OUHcNaJeotuEFlZw/2xQ==
X-Gm-Gg: ASbGncuQDWk/hm8WXhW1RHh8tiAc4sESXOjJMoeZ/7s0ysQ1nwvE5Z0XHaHtpzB0eUv
 o8HlXoVh3RZUcj6CZ2uXM+dW6D6KB1LgxD2HgIUrjKzNC7lAgiSQ14grlogZPMVxo0kU5ZQVXWX
 MS5XbIJNgBLoxuGGic42LocH6QgiIqBOGd0FvEkleYrYNNUAFzwXNVCxSVJW1mtJLQExpEb6S9h
 OD0b98L+3WKMcK7p9RTQPMqGcC4+VEm3VXl0BMp1JgTU+IN7ibL
X-Google-Smtp-Source: AGHT+IEpqntxhBxjXGPvDXVCuneN7k7K0pj00Sr3u1kw039fQL0FpKMhBXxl/Rcb3K7xZhQPSVrq2A==
X-Received: by 2002:a05:6a00:9289:b0:720:9a03:b6dc with SMTP id
 d2e1a72fcca58-7257fcb8d0emr12161298b3a.18.1733370810174; 
 Wed, 04 Dec 2024 19:53:30 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:84f:5a2a:8b5d:f44f])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725a2cb5588sm267630b3a.170.2024.12.04.19.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 19:53:29 -0800 (PST)
Date: Thu, 5 Dec 2024 12:53:26 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 0/5] drm/i915/display: handle hdmi connector init
 failures, and no HDMI/DP cases
Message-ID: <20241205035326.GD16709@google.com>
References: <cover.1733324735.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1733324735.git.jani.nikula@intel.com>
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

On (24/12/04 17:07), Jani Nikula wrote:
> 
> v2 of [1] attempting to resolve [2].

Works like a charm!

Tested-by: Sergey Senozhatsky <senozhatsky@chromium.org>
