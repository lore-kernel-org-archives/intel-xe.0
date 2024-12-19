Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670E0E7718A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 07:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3469B10E294;
	Thu, 19 Dec 2024 07:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="f+6vdB7i";
	dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0797F10E294
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 07:14:35 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-7ea8de14848so206495a12.2
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 23:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734592474; x=1735197274;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v4lPK9bkv3J04cn4MggXL3Z3QK+CpXI39O0WQTMymiE=;
 b=f+6vdB7i/CioYl7OoMFTMzJHQl5/8VZM3gFeIMRO6FoKeuED4W5wSoTrCZORnbuKlJ
 meYhm97MuNHbe6e7rsTG4+G7YcpLg9RMXjy8XAEAxH9l1EQ+nLg0d41ceYDr0b+PXbc9
 XdD39i1tXk5cVBLCuRdPFbpYj9vId/1GPD/QU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734592474; x=1735197274;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v4lPK9bkv3J04cn4MggXL3Z3QK+CpXI39O0WQTMymiE=;
 b=IKs5/U6xroiVdpui2dkpdlc2q+LaLSag+FBHrA6glYoITLzrRl/RJ07iR5u4kCMhZ+
 FlI+T1Jf+4y6z2JrLXGdV+ebIadD3WEXMI7XHHaAutF+SKB8yeNZ12lOm1+9khym71Z7
 COk4Ew4M8Gvvr0YPXJaFdNOe5S6WlpenvzBLi95wo5ascAf5j4uileEwCDHmy2/9Drs0
 8NWglrY6NhPY4PK00thkiCnKXjetn0wClGlCGO6tMhLTg9EUCuDbUSP58SBxUcQESi+F
 MGt2mHLnW/gL5wB3/Dvw3ZJKAyjWj/mIM2/ecNWT7eWFscJ9i6djtrYzrc2+5FQEnsAO
 5umg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnB2xRHK0X/TKyIwQ5rOqheyN5XDM8kkG9bVMwPF7J+KXcHV767h2MzmODBYbGPy69kin7/3ggeg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmYJPYjSD0994UEdOSjIqpV4Kilblx4T4BmJ4K1Nm608QBi+Qs
 Ktop6fGxoHlZaB1cZY2BLP9uuh6rqwZoN3c7WplMFe5L+LTudAuLgLlQOJfcqg==
X-Gm-Gg: ASbGncvvramYgTZNf5czx8qngKKGEf1YRqacGXC2vBl11fdBVl6hfuX61R/9v1w6M3W
 o8J76maO+3o748fXlZ2gXCyM7OjkQL5XiUhtsseIFmkWUC4HhVmrEXBkzjELq43uwE+PqrJcOFx
 V86Z/VSgLhFaKILid2hT1JadRcIBWRHJYnGQ0rDMfoZXj2q+Wv7dHVjULR1nWra1wAQJcigs+RT
 m/Ib/iSFFZRmKETgiXta+v3hm9iTW9mzLwvjWlyGllO21qT2OmcUPHPu18N
X-Google-Smtp-Source: AGHT+IHDIMb+Np34DSWneQrxUgEvqb+pJ10f4Lc4n+fS0VeX9d+U7qhRBlVsF5/9BAB0KhF6U7pxVA==
X-Received: by 2002:a17:90b:540f:b0:2ee:c9b6:4c42 with SMTP id
 98e67ed59e1d1-2f2e91d9395mr9815404a91.16.1734592474560; 
 Wed, 18 Dec 2024 23:14:34 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:5479:11c3:e91d:de6b])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ee06dd77sm2824442a91.33.2024.12.18.23.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 23:14:34 -0800 (PST)
Date: Thu, 19 Dec 2024 16:14:29 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>, 
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH v3 0/6] drm/i915/display: handle hdmi connector init
 failures, and no HDMI/DP cases
Message-ID: <gmdwfv3u7aq4ndsggj6pakptcjfhzu6hddt6yyf3tpyy6c44ok@rvhexe2wfqhf>
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
> Jani Nikula (6):
>   drm/i915/ddi: change intel_ddi_init_{dp,hdmi}_connector() return type
>   drm/i915/hdmi: propagate errors from intel_hdmi_init_connector()
>   drm/i915/hdmi: add error handling in g4x_hdmi_init()
>   drm/i915/ddi: gracefully handle errors from
>     intel_ddi_init_hdmi_connector()
>   drm/i915/display: add intel_encoder_is_hdmi()
>   drm/i915/ddi: only call shutdown hooks for valid encoders

Would it make sense to Cc stable on these?
