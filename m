Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB32D6ED2B
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 13:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2CA10E947;
	Thu, 21 Nov 2024 13:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="eMpwM28P";
	dkim-atps=neutral
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9697710E947
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 13:40:28 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-460e6d331d6so5534631cf.2
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 05:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1732196427; x=1732801227;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Jg1k3RnWgrw8OV7UdpUx8duXHK6tLhyipHDUcTjkIYI=;
 b=eMpwM28Pg3O65vjRoGgTBxmMs5z5ugpAu5LVQXEOjMg2twcPvm6SnuHl57oKaNfRIp
 xHIiYQmO3zDcC3mAVz6pLEjBo54ADQvz15KZ7O90D6UGv859t69Tb6s93vL4gCVFTZOW
 Evzs2Kas4fll+n8DcpnTRtLy/TjZTZOMMd/Qd9FPBvhtzq9Mf6PSrfvJiK3eLqfhMS0H
 4CmhDw1nwxoNN41in4x9axJPyroiJFNOIi9Vc4iFa5niyoYRuPIB/FP7FRjpE9rcbRtH
 +Fii20F+izVtldHvXxm8gvi0fWV4kWFcvSg4ScPYNY0BoCmZQ4peLaKmPTho4wyWRrca
 tVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732196427; x=1732801227;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jg1k3RnWgrw8OV7UdpUx8duXHK6tLhyipHDUcTjkIYI=;
 b=sh33g0EPkU2lOsCd0xor0j0FIfqsQFxvHqzU1PrFxyVGV75h1/jo85GmAJKo9czb+p
 l4Bwlr81d8PntHG1EY1Y7+Bgixgxxa/9+p2by2x8MOkkZB3hnZZdZAHS7S05fMKh1hG6
 5dNXzlUXqES5HC7+i3M+yMUZIAfX/ARFRvGI1I1exYge9B/4gEPIxsCn6jFKxE0tOR6S
 JQIYtq1e+l0ok6j9E8oUPfxR+Y0N8I/YupOCXmlP3LETRO8XLo8+iQXgOZZmkS+I7SAA
 Cxiu9a25X3P9mMcUa4m2JE/I9NgoFg26njBo3TDqc++Fhg7QgVQo4oNPMW0lD2Eet7YK
 6Baw==
X-Gm-Message-State: AOJu0YwOPtjUmqpLREIyFgKFT0BwfJuVkHXggwZbV1Z1k/kdoJzswQJn
 w1ZDRkoK+Ar0OcZmF4oArXgo0uby/JbeGQ5Il72tyenULmKeejfom3RfhLXRGMQKpnBGbKjzwm9
 UtdLlYVaBZtPsSE+oyLbMQDEifcM1EITYl+9gaA==
X-Gm-Gg: ASbGncu54Vupz4CRZshQSREjVurMahWUoek81XHv4VfQLcHkk3pEx0bOvb39muNNN5U
 uQQsUGc60fs/Jj1I0f4Yb5yasikOr
X-Google-Smtp-Source: AGHT+IET7PCfqOeH44Y1fZdAWxFlm87yVkgpnEzFDVxcVa32Y1WtHe1a7eCSIr5Zn+Io8kH89HwTwQsFTAXOyPCCUi4=
X-Received: by 2002:a05:6214:2583:b0:6d4:2131:563c with SMTP id
 6a1803df08f44-6d43780ec69mr95845566d6.27.1732196427448; Thu, 21 Nov 2024
 05:40:27 -0800 (PST)
MIME-Version: 1.0
References: <20241121122603.736267-1-arun.r.murthy@intel.com>
In-Reply-To: <20241121122603.736267-1-arun.r.murthy@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 21 Nov 2024 13:40:16 +0000
Message-ID: <CAPj87rMKYLe+dvwsSYYFm8BZC2X+S8XBMv-VRt0djnj1GqRgnA@mail.gmail.com>
Subject: Re: [PATCH 0/8] Display Global Histogram
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

Hi Arun,

On Thu, 21 Nov 2024 at 12:35, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> The corresponding mutter changes to enable/disable histogram, read the
> histogram data, communicate with the library and write the enhanced data
> back to the KMD is also pushed for review at https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873

Again, the Mutter MR which is linked does _not_ write anything back to
the KMS driver. It would be much more clear to explain in your cover
letters that it currently reads the histogram values and does nothing
with them, and that an expected next step is to make it write the
processed values back to the KMS driver. Even though I'm sure your
intention is not to mislead anyone, what you are writing here is not
actually true.

Cheers,
Daniel
