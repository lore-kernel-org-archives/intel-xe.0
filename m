Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2747D3B7F8
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 16:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4558210E203;
	Tue,  9 Dec 2025 16:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="EW/Pgq6g";
	dkim-atps=neutral
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D99F10E1F3
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 16:19:57 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-640b06fa959so9430143a12.3
 for <intel-xe@lists.freedesktop.org>; Tue, 09 Dec 2025 08:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1765297195; x=1765901995; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xVyrlxodk/OOen9w71e8Zvycvs4Xi92LKzEoIfo8TUA=;
 b=EW/Pgq6gnlXMoWgGz/qYKMUoFi7dlMze1ZFZLAig0tRQHCn6FZ6P7uN8A3/Z9Kjwq3
 7HiyMkOd4ripd7iladRLDgU29SVzgyNqdGEQ66SsbEMjPWbLQOSKbRt3mhEowbasuJt/
 nQmp6UmxA5KrA2/+loNs9Bym/fmZ4Et5+SjxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765297195; x=1765901995;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xVyrlxodk/OOen9w71e8Zvycvs4Xi92LKzEoIfo8TUA=;
 b=N1QDNFr+BPASuIhJSuSuHrRgwJTkiVT8p8SPfhi58ELnlIrIXa7fd2hN79ppnex4V4
 xKM1mSXnwW+ocVrzhhxuWyGUXvfnXSW7K3iiLNvvHvTefb5xZAXiGD5mgHoKbBUHZWRU
 XqO1+0AgiudujcHjf/hYObzEcIKuqEFGy/Ev3MS8PiE5HTkBozcutHg71Mhx0ju2B+l0
 cB2fVEWLWLhuE09hmcGWc83OLKwJADvxHjjWMVdYwTcxgphwSN4lt+BuCS8Kot8kj8x/
 XpWCVeIfEW7XuNHd3/Ih4yy1XIAmHlbte6k2OgqlY/9/mQdwK0p0w2qkKUkQgmA2LH9a
 rt4A==
X-Gm-Message-State: AOJu0YygLdP0r6LhvlO0FyLLIAsv8DOnw/SrojAxgxJWOkjQIc0wi6BR
 CawilYdePAtCud1uKjpAqv1H15fJT7mj4iZowPgjPrx5veZcqpJbPst6U85SMziopOQ=
X-Gm-Gg: ASbGnctSfxxvOL57KqAL1albERUAvqCpCMEh7vq+nKQl7uQ4hRj0fb8J9bWgUyBLWkx
 9T/Pfot8/weUbpJwIOUQEdZcP14fymx+esp2Dp/8dYQd4ar6snDU38k9gTmuWWpzPR20Yh+yQzo
 xr5HNwwAfbbzRs/n6UOv3Hiy7DfSmJW9Pkvk6a9mvg9V8e/iWf9IsyQsm0hLZp7ZO8C2P+Uxku6
 dMfLccYBL46rq+ZRF1blb143o+EUPssZNUAT+xNP+7KGr6kcWt+UNVloKVwSRfuFK8A2q4ttThS
 qzLMjaCVg6Mruw07toyUKJdtdYlUTULGH7IBgGLVxYmHdKlDXAVq3BjbYEVMFY4KJmTOx2w+5jM
 2xeGrefHeROELcwbkb2SdLBtqcA0FET2CgZWuBqKkefQL6I+smOoWL2wdtsWidF4VGRnx50KmiU
 NtwTfaKXMje+TBJfspMBId3X0=
X-Google-Smtp-Source: AGHT+IH09cOD9g4Rb+TeLYvT5nWBfoENbBWFBWDsrHpNmD/+KuJFid0McTCz7eg3aDlZMqf2FMtGtg==
X-Received: by 2002:a05:6402:518c:b0:640:7529:b8c7 with SMTP id
 4fb4d7f45d1cf-6491a2d0516mr8830628a12.1.1765297195479; 
 Tue, 09 Dec 2025 08:19:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2ec319csm14440217a12.3.2025.12.09.08.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 08:19:54 -0800 (PST)
Date: Tue, 9 Dec 2025 17:19:52 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update Xe driver maintainers
Message-ID: <aThMKObVFAMWqkva@phenom.ffwll.local>
Mail-Followup-To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251204193403.930328-2-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251204193403.930328-2-rodrigo.vivi@intel.com>
X-Operating-System: Linux phenom 6.17.10+deb14-amd64 
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

On Thu, Dec 04, 2025 at 02:34:04PM -0500, Rodrigo Vivi wrote:
> Add Matt Brost, one of the Xe driver creators, as maintainer.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7774cacab5f6..254649de9c26 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12517,6 +12517,7 @@ F:	include/drm/intel/
>  F:	include/uapi/drm/i915_drm.h
>  
>  INTEL DRM XE DRIVER (Lunar Lake and newer)
> +M:	Matthew Brost <matthew.brost@intel.com>
>  M:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
>  M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
>  L:	intel-xe@lists.freedesktop.org
> -- 
> 2.51.1
> 

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
