Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A3FC678D4
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 13:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3046810E275;
	Thu,  2 Mar 2023 13:07:15 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4132310E275
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 13:07:13 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id j11so6328647lfg.13
 for <intel-xe@lists.freedesktop.org>; Thu, 02 Mar 2023 05:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XaE5iOG6ykW9bwkedBsCcgefqHq8HyvfgLmcTcuIlC8=;
 b=nXeDXUIBjSnfu5k/7l/uYQpJQzQmo8kWUawmwM+6HUwCYrbsEEkseILE8Xxdz0L0Bg
 eBYskG1hQ4dmTRacu8AW7mIb2FPkbrgj1j2+tSeVQdjzONaekKdzp+uQs8cSPUZ8A74C
 jHdeb5VLUzNkrTARdLevPvFhDh7WJ15edVHiOoXOFCakxr9NSnSZRuE6+IUAGes612sy
 KyhUl4DwOB5ADBs5/aUg+lR0jhsXYjX6KJPuEkBdVofXJ9+oSdY8crNeQiDQJBvGcAV+
 jdqZto7e/uV+5usGbEs/FXywAEybLZUEI6/BgOgZcLURLWrYEmKaI9bWBfO86OgZ5pjZ
 U+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XaE5iOG6ykW9bwkedBsCcgefqHq8HyvfgLmcTcuIlC8=;
 b=D4igi1EIVTPpGzM1DYiRQWfmsIpMByydqFIW1J+0UkPfhDKjgAdLNXMv7gRdqUvKLk
 Sd4ktG3nXOohIP1je6D/aTUjIjoyfmS/rGDLoWu1JForLwVilIR1+ulbDSzTzVuBOuI7
 LGNbuyIEaLIpJDxn/jv58Ay5ST+yZZMHCxUq8SvtE8wQTL7G3OrFCsZdER4OCUwwt2VZ
 1vCkgXGGWMZ9JfuZLBisgCeFzpQwn5yjt4Qo9bzdCCsfX0RlEkILlqk3dHbSkn/u43cp
 77EeqSQu0kxO3e/1uT+RqdU4XaFlewGgzvPUqc77lC7QQXBc1hP9pGKghii7C9t7oyFl
 a1rw==
X-Gm-Message-State: AO0yUKXOLQm0+N3ioOCLvBmDnLTz7OszEt5WzqzPfLmc51mNSDzlFNIE
 vKvWHIfnzZQ2ENg409bLed7zVfJ4M0CvI8Oy8/pmVCqkA3E=
X-Google-Smtp-Source: AK7set9+hNjBPZ97Wob1YqJ/RJZKOU/NFTwKKiNshrYPtmDATIbWLlV97QNFvEaFmnNMgiskUtqPDzRcjKWhEs5QCuM=
X-Received: by 2002:ac2:596b:0:b0:4db:2425:5d11 with SMTP id
 h11-20020ac2596b000000b004db24255d11mr3069666lfp.5.1677762431516; Thu, 02 Mar
 2023 05:07:11 -0800 (PST)
MIME-Version: 1.0
References: <20230302124258.91081-1-thomas.hellstrom@linux.intel.com>
 <20230302124258.91081-2-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230302124258.91081-2-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 2 Mar 2023 13:06:44 +0000
Message-ID: <CAM0jSHOBuStP=JZdFCGzJCDXcFmB5=THUXwnkGUo6-XtXEU+NA@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/tests: Remove CONFIG_FB dependency
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 2 Mar 2023 at 12:43, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> We currently don't have any tests that explicitly depends on this
> config option, so remove that build dependency.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
