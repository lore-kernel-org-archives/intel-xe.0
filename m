Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB00C61DA4
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 10:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C7410E1C1;
	Wed, 22 Feb 2023 10:07:47 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3EA10E1C1
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 10:07:45 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id z5so7215770ljc.8
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 02:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9V9zwk/+q6s3nqIeqLqxqulzJ9QI2BHF2vVydL8PVeE=;
 b=RmGk7z7P5ow+uClWLJv4NGKcdrC7n2TLssYeuDpslFNc6nUcay0B905yHjVTaRhzkr
 uv1t7VHA8YeRVCo1s9JW+kMAQ21Z6J/BCZxYUGKpFcCQSblZsc/FarSgQlQnLC0yGgK5
 B/xRBs/NN+H4zMAY/ZfBsB5n4QZFGBZ168/m/OmOPU4QGMnq1vsqKAx2ajVmQHxHsUnc
 39vsGYN44C++uKHlW1MRLDv2NrcCtwoESV9C2GE3Lh1TgYDScgmZ5qKuG9UggaEU9VDx
 SaqkxT1+KPk6Iyq9kr/aqCF3OgsYqodb29XtcuaYwFF/2LusllgzbkSfPnnPMXvbyk/w
 IOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9V9zwk/+q6s3nqIeqLqxqulzJ9QI2BHF2vVydL8PVeE=;
 b=VGol0T3eIvcTWBYvkNfoRFp942Oz0FvyepA+WxxlzVDwaPZG0QAbD5D1gu3EzJz8g/
 6s1ONpVVAaL106IH7cvJRJXRAZSx8mi4ckatyM1lRoPL9Lctax33/b24HCBbfXzIR0zF
 bQjCXujkdRI3ema1+ncbT/aqWq56VP38kSpmHvFY0ysRIytELXO+rYzDgh4nKqhno2vh
 sh13tSYpnnAmRKLGlm8vkmFspxoDpD24JeSZbmcSl8DhIVbgMzHNQBWAemnjp4s8aDwC
 /MfV6GFXbJA6+NM2HGvmv4JoSjPlx9+jqcKE3pAKuzzU+VjFVnul0vlbuxChc7IUoe6t
 NOgA==
X-Gm-Message-State: AO0yUKUutqD24o+PtxRGPwgKnA1/MJ9CSsFJT0RY050gsqB60xmdgr6t
 F9OYHUaCrs08iUZ6bg/YLUBlb5BBTMPgHJZBOtmVSEeuY5A=
X-Google-Smtp-Source: AK7set9qfssGFzdfTgXvp2VenfEGJ8m5JvbT7d/dNqk+LpltlX4zGhf40KuD/NkWb9Kp33IQlD4Atz5ZwUJaGg7uebA=
X-Received: by 2002:a05:651c:326:b0:28e:d4ae:90ab with SMTP id
 b6-20020a05651c032600b0028ed4ae90abmr2599792ljp.2.1677060463901; Wed, 22 Feb
 2023 02:07:43 -0800 (PST)
MIME-Version: 1.0
References: <20230221233348.883897-1-lucas.demarchi@intel.com>
 <20230221233348.883897-7-lucas.demarchi@intel.com>
In-Reply-To: <20230221233348.883897-7-lucas.demarchi@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 22 Feb 2023 10:07:16 +0000
Message-ID: <CAM0jSHO0FL11o_uTh8aTG-ERO=wN9OBxX98DE=V5n3YhUVQKXA@mail.gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe: Add missing include
 xe_wait_user_fence.h
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

On Tue, 21 Feb 2023 at 23:34, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
> Make xe_wait_user_fence.c include xe_wait_user_fence.h so it doesn't
> rely on indirect includes and also doesn't fail the build due to missing
> prototype for xe_wait_user_fence_ioctl().
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
