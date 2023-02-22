Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13524C6379F
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 10:06:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8E510E92E;
	Wed, 22 Feb 2023 10:06:36 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422DA10E1C1
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 10:06:35 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id k14so8310268lfj.7
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 02:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t5slONCpxaXByDD57GpdPQ/f7JHi6aGUqBp/p4q9PKE=;
 b=DUz462SEALKbmN26mMsDWSgYyr/MI/XPMfN9ftZBZ1ce3yeJ91k33kKYsqvlZUPZWW
 P0dNmp/beO2tRJ6UJ4EG1F7ATjStobaqUKQtNDPSrLrrGxn2ms7RUe1p+ul6aMy+PISn
 hTdBgEYZpmtv5yYCR6+DxPxgXpKv1IG68A9OZGbeXcBvBOIdpdze+kpf+C09Qp/O4gdE
 /IzDA7lyxW13AQznJAoVfKSXYGWU6/Da+/VvD1oe67cxdlHNd8QDRLJtSd+shcFObNem
 51+3o973mTJTlK16gGmss0oyINw1gnMzwhvotu1z2bHYvTZSy31lKI8VBsnXA26OkcjF
 BdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t5slONCpxaXByDD57GpdPQ/f7JHi6aGUqBp/p4q9PKE=;
 b=TrADV8U1sgCrjPrJg3B4g6kGIzSvJYTTmU9RvLH4I1l7PJ/3jeWtIPiAZLsd7TrIxf
 SXV20yMZrGe/EvE8wsKNg901fbcvfmMnVo4BfOAlpN6kBXtmosP8gJ4VyuoFd2R5pgB5
 fIf4DcHAeLsihqQkwq9BkhS65Xh6C/2CRRa6p8WGoL4YwBtYa7ceu/nfQhUU5HAKcIjR
 mp1KzK3wiVRjGz2IX9ZDINjYigrC5MFaNBOfmhM2UzFrHJK/TIq31NansmpuLpj3Ak0Q
 spTlZLU17jkz5FzQ3fnHi6lUN14y+WfiGKBqF9Zg42BliScmVjunaEb7+YpEH4wUZqZi
 uoWw==
X-Gm-Message-State: AO0yUKUfznyKS9dAVHlyYkRF2Krd3OAE8qvMx2YbsvfIFrTdQq0qtZow
 15xIvqq0rgjhTanzc6vCJzd58LDajbdPwCpg1Yg=
X-Google-Smtp-Source: AK7set8rOZDlAph3EQxPoJ0biH+aLcMqBFNzSBxXDztn1Rq0NjtIX4K8p2XIsRbWxUgkEt50vQIqFr4oR/X/+dHsMiA=
X-Received: by 2002:ac2:560e:0:b0:4db:1999:67a4 with SMTP id
 v14-20020ac2560e000000b004db199967a4mr2557204lfd.5.1677060393567; Wed, 22 Feb
 2023 02:06:33 -0800 (PST)
MIME-Version: 1.0
References: <20230221233348.883897-1-lucas.demarchi@intel.com>
 <20230221233348.883897-6-lucas.demarchi@intel.com>
In-Reply-To: <20230221233348.883897-6-lucas.demarchi@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 22 Feb 2023 10:06:06 +0000
Message-ID: <CAM0jSHNR1iosDbuAmuttRSZOioJgBdOZ2w3=4kHjbNX00ik2uQ@mail.gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH 5/6] drm/xe: Add missing doc for xe parameter
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
> Fix the following warning:
>
>         ../drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c:55: warning: Function
>         parameter or member 'xe' not described in
>         'xe_ttm_stolen_cpu_inaccessible'
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
