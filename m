Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BA0C0015E
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 08:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E0910E694;
	Fri, 28 Jul 2023 08:19:13 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB3F10E694
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 08:19:11 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fe0e34f498so3044432e87.2
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 01:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690532350; x=1691137150;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F6zLgVeOIEcOl78XkYd5Iw4d7nDglM4f1BKgStOX6tw=;
 b=K1F6ex42//2CxqRQZwHRLgaOETSuNVoHefBy/AR8DHDyYKL+gwnYxbeLA/Fjellg3F
 x9LmJEk2i9sbLpETDWSraRxVhzMGFsjSibzxcsZ5iHBnV+PLL0hYnkiUzjSPK8WGlg/o
 AdEqaQpWT4TaN7aeTmLfcff3AaFoiq8p0OiHjb268aeWo7dq0qz3wbFur8TkBOVKHO41
 rMkEFinF0P8XE+qX5D59Bhnk++p/pjDc5PimvYgaRqjH1Jy06NlHI/wtjaYkQ6m50zHN
 3whRYjImiYTv3aSIeiyxTX7aXDh6PaVsxJWRNd5P0MCpNnQzIfmoLA39QwUSnUmm8YSF
 l7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690532350; x=1691137150;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F6zLgVeOIEcOl78XkYd5Iw4d7nDglM4f1BKgStOX6tw=;
 b=WXoPy5H3TowUcofQtCEjpNtCyNB4S25aFCYBl5LkjGTPdWIMpphxop8sbssfEFxHS+
 UPRutJWcmPeLz9F39lhWdRMlJWw5s/xCRZkaHaCca2RETyU8PD1ikktKoxC07TcRtN9K
 NYMirdnsAhTp3HhOzgVRnjv6tXdznRyCiA2cRwiVm8B16UUqp71d7YIrlgFxRCQtfhKc
 MmPZO1NrgD/zPunF7fJQbFgETA8DIWkl9eQL7/IfK3pXPPeJrc3gesL3QjgjJqr01WjU
 UlzR6URLsgo9+fyCrqf+D2m9PcVnqH+DPvQ2RH/aIpjM8sO/Id1qSfzsIGFcP//KEO74
 ToLw==
X-Gm-Message-State: ABy/qLY4nLrqq0/9kn6uTLvZZZaxhn9N73EfoXHZxMjzV6Q5FiZSbtj1
 4jxtTCglmSQOKRR/TT0oZshyk+mp5K/BYr6sZ2YTFvxuEic=
X-Google-Smtp-Source: APBJJlGzWPYuTOQqreICvVPCg+Hf7Gw9cvFeuXAZ0y8eM8YyaIeil3c+mBMqbT3vSwQNJCywbxiGmIpDmRkLelTDo8k=
X-Received: by 2002:a05:6512:3d88:b0:4fe:18be:ef37 with SMTP id
 k8-20020a0565123d8800b004fe18beef37mr1261735lfv.61.1690532349516; Fri, 28 Jul
 2023 01:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230728020503.7320-1-matthew.brost@intel.com>
In-Reply-To: <20230728020503.7320-1-matthew.brost@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 28 Jul 2023 09:18:42 +0100
Message-ID: <CAM0jSHMK0zCurTLTchE1Rok7bFY3mcmVHG8BzdVLjaVHYDEp_w@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH] drm/xe: Remove XE_GUC_CT_SELFTEST
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

On Fri, 28 Jul 2023 at 03:05, Matthew Brost <matthew.brost@intel.com> wrote:
>
> XE_GUC_CT_SELFTEST enabled a debugfs entry to which ran a very simple
> selftest ensuring the GuC CT code worked. This was added before the
> kunit framework was available and before submissions were working too.
> This test isn't worth porting over to the kunit frame as if the GuC CT
> didn't work, literally almost nothing would work so just remove this.
>
> Suggested-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
