Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6067EEB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 14:49:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2DC10E132;
	Mon, 10 Jul 2023 14:49:23 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EAE10E29F
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 14:49:21 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b6b98ac328so68368261fa.0
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689000559; x=1691592559;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gV/1kfYqbK7+viXFsmlHbtj8HE5ShZxUuzbj1K+Hc5w=;
 b=QM/Bp+k56Wt+NI7QfVkENvvfG0N9OK24Cj87XYcfkE63SpWCSSTuiUt08KRv/XGVYn
 A23AE6lfy8tFGwBp2bQoDMp2PPEwPt1XLbm0eZ0aJBR014Aom51biF4Aa42JfQ7Hx05A
 21hphYDz0f1kE+PC1myAMOpc1vpQJJiVW/TKxJDHdh5gU5q4bZXfUUsF+p+yO28k6FQN
 j737D5bl+WtEOkpcwolk7XHpE3SwmCwTilYFwtlqaAhGIHGVWNUrjRDt+uDIE2dXv27S
 PAPqmb8kRu8ACe3QExmgs1OoJfxTWD/TwdaRHASqcF4StQnLKfPox+QQorLfbI5kvX3o
 GQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689000559; x=1691592559;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gV/1kfYqbK7+viXFsmlHbtj8HE5ShZxUuzbj1K+Hc5w=;
 b=GODx5lLFVNYRmEtz10gpvSfWS1toUosl9843rGrJb6BPsvB8nwEHdJc2TXkFLMmvXP
 H40V317CCpyXz14MTANnb+b5AXCAjWKtuiSclfmrsxyEwxdMjcmLZ5bhgp1D6dkwxmpz
 WGTzhYrY6qvOuxIIejnis84nSIoZHLoVVMyK8aygJdF9VVPvJWMI8h4nYylVBljJ+l6y
 XUMEjCwNDHbqX4YRm2/H37nWaUT5JK2AuwQyH/QuTr1caL2qgWNHeV3X2ZIuced5iuun
 SG+nRYq1q5/UM3yHhXmAMjSVldxMjSa8fwzIzqGVhxYC0IPeiZt6TaLfe49JFxDyWiJT
 797w==
X-Gm-Message-State: ABy/qLa3VcF2FanIBzhOs7xJK9qmqRnOsh5HxqOphtmBabZcr6HR2IRG
 y4bGIoYZZKHSvMTWD/h+MfgDKmI30tD39xaSHGM=
X-Google-Smtp-Source: APBJJlEbO/7i8RB0Zzb7AnfUIPnRxxXKoSLPYy9thb0V6k4suc4guAJMrdwvxhlzj+kFrm45CcWGwWMYsiGWmo5hFI0=
X-Received: by 2002:a2e:9cc2:0:b0:2b6:d7d1:95bf with SMTP id
 g2-20020a2e9cc2000000b002b6d7d195bfmr10511424ljj.9.1689000559076; Mon, 10 Jul
 2023 07:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230710144405.1863923-1-matthew.brost@intel.com>
In-Reply-To: <20230710144405.1863923-1-matthew.brost@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 10 Jul 2023 15:48:51 +0100
Message-ID: <CAM0jSHOs=NAjFTnDaBwDYZKq3bkECx7j3QdFdBQh_OeveMthFQ@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use internal VM flags in xe_vm_create
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

On Mon, 10 Jul 2023 at 15:43, Matthew Brost <matthew.brost@intel.com> wrote:
>
> xe_vm_create used the IOCTL create flags in a few places rather than the
> internal VM flags and this just happened to work as these values
> matched. This is risky (and incorrect) as the internal flag values are
> free to change. Fix this and use the internal VM flag values.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
