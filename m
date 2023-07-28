Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF47C0015E
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 08:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48D710E694;
	Fri, 28 Jul 2023 08:21:15 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD4510E694
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 08:21:14 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fb7dc16ff0so3219482e87.2
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 01:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690532473; x=1691137273;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D3jGdvUzHdZLkZ1JP/1MbUOzdp9fuSLYHpF/HQA5vjI=;
 b=aiUZ3mGKqFB8Jsq0m+fpBzhnd0U/W5lLtnP9MbjGYHqvPWPVi1isJ0twowlDxF4AIF
 TiZWcmkQRLmYLokJHKjdttaxg/8lVfOFjXBk7cp27fsPal9edkKcTy9KMC/dkXZDbFBh
 9piad/1lsoxmHo0+gwbhrxfwIf7EtU5x51+mzeRSFe2RgWhd150zHK/Gu18EvMbvf3KJ
 05C+vL7NbVoj1fIimfXtT41IUXEP+u8wRCn0Y+BMCm9WMqYzqaWhn+MpsnSbzF5YT/gV
 Yz1ENF/WM7HEb/D9uRWARxQ9fWRddhstF2xZnT2N24xjJ3pRjrk09kIjawVMKKXXTSt/
 B8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690532473; x=1691137273;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D3jGdvUzHdZLkZ1JP/1MbUOzdp9fuSLYHpF/HQA5vjI=;
 b=G7e5zdGaNXxd4xfwqtJLOz+YzcNns1JC7/7K7aL71nkfTqUEqer6yQLMbSm776T/Ze
 9M5kZjgKmG6Lo1wuVWMfftM4lfZZ8Pd3o289imGyUC+WB7xG52FQ7LnaRYSUiVxA/9df
 +ZrQufQA3qYogFQVf4STXNVbpa1omffpRecUokfrYhZUdQvVaQ+qXcXdcUoi9LFT0G4V
 tHPpvcKqu9xdaeULDu9BQsrMOKN0HbydpwQGMc89qo4nywKnXX1rP6m8o+6L0jsEiqGr
 eGSIgLvANgANjSHK/XA9CkhEN66YDedMy8r0J+4G2o0nVER9vRo5keIXTSI35zPtN+ct
 nOCw==
X-Gm-Message-State: ABy/qLYui69faBPdSAfdm5eCH9Ef/o64/o8exZ7PeNcXlsNi6/BPhUv2
 vu8Z03JqVzXFa5YXt1qeFX9P3wppQyvAdZzGmHg=
X-Google-Smtp-Source: APBJJlH4K8HV6z8jA/9zL3eo3+UH2lHvmlaS96QL93pkTT/a+830rCpsMGod6caI7lho+xSeK/bB8hwNsk8QQ9IxcjI=
X-Received: by 2002:a2e:8557:0:b0:2b9:3cb3:2592 with SMTP id
 u23-20020a2e8557000000b002b93cb32592mr1227121ljj.10.1690532472490; Fri, 28
 Jul 2023 01:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230728021238.17414-1-matthew.brost@intel.com>
In-Reply-To: <20230728021238.17414-1-matthew.brost@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 28 Jul 2023 09:20:45 +0100
Message-ID: <CAM0jSHO2vqZ9Y7Nm9FeeAX46beaC8z6ZbF=dNkVVY6a93rcHsw@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH] drm/xe: Remove ct->fence_context
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

On Fri, 28 Jul 2023 at 03:12, Matthew Brost <matthew.brost@intel.com> wrote:
>
> This is unused, remove it.
>
> Suggested-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
