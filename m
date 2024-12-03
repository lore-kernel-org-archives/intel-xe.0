Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B5EE64A87
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 12:31:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB9410E449;
	Tue,  3 Dec 2024 12:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jZlZroRW";
	dkim-atps=neutral
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD51C10E449
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Dec 2024 12:31:31 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-211fb27cc6bso43622525ad.0
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Dec 2024 04:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733229091; x=1733833891;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rmCmdPZyqHTJueyoNUxdAbvih3/opUK1QlKGl2LuDMo=;
 b=jZlZroRWmj9xAFX5Pe1gaB07XhbwXZphJ1mb0gi6Fwlbmg4m+EW4tKgSOCWYOhsGgF
 mwn6cOE7e00VQOTfwx+2ahI6MTkwS4RD74smUf4cA+YOytA8Dt5Eu8XKkui2kS7DLEtY
 Q6V+KpNztoAu4Jh224M8zKSv/F6izMOMuEqjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733229091; x=1733833891;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rmCmdPZyqHTJueyoNUxdAbvih3/opUK1QlKGl2LuDMo=;
 b=t63Vu4KDi9Sr1/6dBGeefey0/DyR0Nai/ERFELzea0VpCg1B8ynpvrz+79kx+Wkc1r
 vKz1UzGR+6s8cjAk1tLdD0B6YS96O5ywM2o6e5XoO9kNU2KT28pt6NrMfeSejYcyc6W4
 BlZDZ6eabk01fDbECQ1UjTTRL0ZhmF1syabx7WwiClOeACujBLSFxczlkihgC8+OXNZ4
 dWZ2NiCJdYtpBLW+VVvTqB1YmGIsSfhdPko3yIYQA1QnsEfoI1MVseJhjnSycMsxsjsI
 Z4YiB9wj8hnA0fpz4XEtEmwuI4YbXnH5Ed4vl3EAFCPC3dZP6l3S9VY9wuI+gzY6tLAx
 0Bbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVgbvDCbT6Z6xuVFlh3ydq9O7oImsxqgKVRXjhCvHvSwrjMPV4tN09J/8ZFq+mpL05FpM6lBgu4Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpsxSYw0FnxoyA1EyYYy33KxKBU5gvoYqEgppQJU7hwDIJdFLa
 MJSzqoZd6raJB3OM0brHM5oQb68I5beFI8sGoUpCr1QG+0P1PzLDbgWT4uXYkw==
X-Gm-Gg: ASbGncttqf0YPnUWISFfzyyMwFFAAa1wIJU3FcaoIbbbC+Xb5gGPMyvFR8HT9xt637B
 4vbWxHCT4HrmRrvysjM9EDZbF8wlY+DwZnkafgw0fFN7S7FLL/WaqCyiXWPqgopbjDu1WuzIc2N
 LQJ5sfB/qs7t0W6Rytf/ie6/vrQdfKIKlgwiKm+lQA2nwB0PKaEx7bi4+CKRQfsZHjt9BxLHoHY
 eKvcarbiHTyG/Xop3ctNbP87wBUXYlEENrWMGLu1lkeJocNCA==
X-Google-Smtp-Source: AGHT+IEeV3az9GRG8rHDkVnd0yV9DLHvIcl9SNi2dwy+VteYziFOzLepiDVQvG1ilEE6bLVtEotHyQ==
X-Received: by 2002:a17:902:cf0c:b0:215:b6f1:78df with SMTP id
 d9443c01a7336-215bceb3813mr43179615ad.19.1733229091247; 
 Tue, 03 Dec 2024 04:31:31 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:f520:3e:d9a1:1de])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215218f452csm93787225ad.48.2024.12.03.04.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 04:31:30 -0800 (PST)
Date: Tue, 3 Dec 2024 21:31:26 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH 0/3] drm/i915/display: handle hdmi connector init failures
Message-ID: <20241203123126.GE886051@google.com>
References: <cover.1731599468.git.jani.nikula@intel.com>
 <20241115050045.GM1458936@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115050045.GM1458936@google.com>
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

On (24/11/15 14:00), Sergey Senozhatsky wrote:
> On (24/11/14 17:52), Jani Nikula wrote:
> > This is an attempt to resolve [1].
> > 
> > [1] https://lore.kernel.org/r/20241031105145.2140590-1-senozhatsky@chromium.org
> > 
> > Jani Nikula (3):
> >   drm/i915/hdmi: propagate errors from intel_hdmi_init_connector()
> >   drm/i915/hdmi: add error handling in g4x_hdmi_init()
> >   drm/i915/ddi: propagate errors from intel_ddi_init_hdmi_connector()
> 
> So these look reasonable and good to me, and I think landing them
> makes a lot of sense.  For that part feel free to add:
> 
> Reported-and-tested-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> and FWIW
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> 
> 
> 
> Now, regarding the issue in question - we are getting there, but not
> quite there yet.
> 
> I'm still seeing multiple NULL-ptr derefs, namely on
> 
>  DDI A/PHY A
>  DDI TC1/PHY TC1
>  DDI TC2/PHY TC2
>  DDI TC3/PHY TC3
>  DDI TC4/PHY TC4
> 
> The thing is, all of them are DP connectors, we only ever call
> intel_ddi_init_dp_connector() on them, so dig_port->hdmi
> is not init-ed, wheres intel_hdmi_encoder_shutdown() doesn't
> distinguish and treats everyone as HDMI connector, dereferencing
> ->hdmi.
> 
> With the small addition I don't see null-ptr derefs anymore:

Gentle ping on this.
