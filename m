Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CF4D6A225
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 01:55:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A0B10E121;
	Fri, 15 Nov 2024 01:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Pc1wZfBz";
	dkim-atps=neutral
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C910F10E11B
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 01:55:01 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-720c2db824eso1183493b3a.0
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 17:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1731635701; x=1732240501;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ax2nCJw28+cGdzTpn+eQtOhpC15VKouPR6tFXcvFPcg=;
 b=Pc1wZfBzsRfoTezctaL9AtXbORGWGhoFhLWB1AmRCTohbnm7iFXFngauJm+JDbaKwa
 ZLXBGiQepnLjgijuxTaZ2KxWHrtVPf4bMzn1wgA1fxFyB5M3Ys0RTUKlHzQUtFKBZAf6
 6L2+fXHF0W/2qj+14fD81NYG7NEBFCjVBEgvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731635701; x=1732240501;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ax2nCJw28+cGdzTpn+eQtOhpC15VKouPR6tFXcvFPcg=;
 b=oGjA6XkjzqYmbgg3EYqUvWSJv2T7cBS+Ie1BdKEmqrVNRYiNuXdXKmiqBMi5aANib9
 m3WT1NMAn4SY8vc5HQ4nNrsWo+4S957dAa4e5+fhTtUslvyeoH13cwMFfYer1pPPiW2J
 cjEMMvSgBrvOoGjSNc6TZlwpHLYySMVKFK3xcYpYznwuBFkeYhB6Bz0RUQ52TFdEjyBj
 W3ueBMn/agJX+X4Ssot+3wO4dwdtH3897yLG3yFjHlg61juete18aY2wQ9oARxbZDXdF
 Is5Qo8RwybqN6JqgzfbTNKaTMXX3sVJQxCM0XNtJcQneI5wMB10smUzYwFDIH2XGW3mw
 0+qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ+MrYlYcA2O+3kFEtBuKwR9fhwBf+/L6t3Pxnm6ewvrJKNM0AjceEkXEhBdDWDLOWodqtpiOVEw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8Gz5bSnCfiNhCFQK40cwahlItwwbNfqyfBm4B8LvqC6uNMLif
 JZQuHnWULKxsi/zim/0EQ6tZxJSKLrgNqZb4NRGmEctfSgyf1N1W3eA4PKT3HA==
X-Google-Smtp-Source: AGHT+IH9aUdvAddesq/jNiojGAkb+nP6hjJUYZ/lJO+dyebRL5FJ6mciWhnqi85JGGRzIRwzHv/k8w==
X-Received: by 2002:a05:6a00:1413:b0:71e:1722:d02c with SMTP id
 d2e1a72fcca58-72476b726bamr1503003b3a.3.1731635701196; 
 Thu, 14 Nov 2024 17:55:01 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:f2ec:a79f:1362:3ac3])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7247711ce3esm318534b3a.48.2024.11.14.17.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 17:55:00 -0800 (PST)
Date: Fri, 15 Nov 2024 10:54:56 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ville.syrjala@linux.intel.com
Subject: Re: [RFC][PATCH] drm: i915: do not NULL deref hdmi attached_connector
Message-ID: <20241115015456.GL1458936@google.com>
References: <20241031105145.2140590-1-senozhatsky@chromium.org>
 <20241113083920.GH1458936@google.com> <87msi3bidr.fsf@intel.com>
 <87cyix6cc5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cyix6cc5.fsf@intel.com>
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

On (24/11/14 17:53), Jani Nikula wrote:
> > Ville, we handle intel_ddi_init_dp_connector() failures but not
> > intel_ddi_init_hdmi_connector() failures. Do you recall if there's a
> > reason for that? Something like a dual-mode port where DP works but HDMI
> > gets rejected because of bogus VBT info?
> >
> > My gut feeling is to propagate errors from intel_hdmi_init_connector()
> > and handle them properly in g4x_hdmi_init() and
> > intel_ddi_init_hdmi_connector().
> >
> > Of course, we have cases where hdmi is just not initialized on DDI, and
> > those should be handled. But I don't think hdmi->attached_connector !=
> > NULL is really the right check for that.
> 
> I'm hoping [1] would solve the issue.

Hi Jani, I'll reply in that new thread.
