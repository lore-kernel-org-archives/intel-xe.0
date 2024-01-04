Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F07AC47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 14:45:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DF610E49C;
	Thu,  4 Jan 2024 14:45:05 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B1710E3E8
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 10:41:35 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a277339dcf4so38547466b.2
 for <intel-xe@lists.freedesktop.org>; Thu, 04 Jan 2024 02:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704364894; x=1704969694; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AvkxvNYRN0ZQmExWKCsl/JqtEr8oFbTjh04dpezCVK4=;
 b=JYkVB+b5pD4jmwdibEHaC17H90EmD5afrdxMWDa4dJ1D5Vw2xtyV6bR4Z9uO1drysb
 RW3FuT3Fkbr/yH2goGberNAQu/RmCMd0Nqfka5tZawrh83crfQELLgvxiuR2jp7Hw6rX
 LWeeuTul++dJGs23YYx1kyYm4IUrpaLMBklYZSVqjtjT1nx6LyBeQ4upMeLTEyEl3uYC
 n447+5ud0qs4zU/qbyP81j5ERZvGc6Evwc9bN5UCy/NpXcZByCd1gWyB8WFg75yK6M38
 s5jAhGcSDN6p7h9q6aAiUlt0VpUUGC01fuDU+tfgT/XDn11uHKoL83VZSU906GPWDpSB
 /6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704364894; x=1704969694;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AvkxvNYRN0ZQmExWKCsl/JqtEr8oFbTjh04dpezCVK4=;
 b=PCTfLIRYACROK0wTRacpQRh21x5fVOQZmn9vLcHRK67HoyjmaLe6rNjAUR8oJfuAFo
 d34UkejIqdR+T1FKd/eTs+M+FfFelz4xryUyqkKYriqgpmvqUjh8l1gjStVYwykKhuWU
 UBIeAqSwydxYlwM3neobk3AV/3A3T+ZURiqLhghjFvg3JZC2IDZwhvo9yrhqD/Qd4CHe
 7Dzxp4zxb/zJDzOiKmazO+fuMQ9Gu7CvokFNufGdKPXbDNfK6TUTd4ZufgtJZi4rvS5O
 beyY/jzGbSorsTu3gQc6Hxb7lWJ0IqMT/DFcLsDYYB0a8PuMfakIR0/m6+doXuHjWxJg
 BiOw==
X-Gm-Message-State: AOJu0YxoTBvR/HaHNo6ZjEDpH9oyPNEdKYI7rpQwHyNN0aUHgwkijl2G
 FrxnbwTBAwpzzOx8Em7eiBgtiuVeNZBRVA==
X-Google-Smtp-Source: AGHT+IHxEn3+F0nPe5X2rb/SYkHNQT3flgBa6t4xwBy3Yq1KTKD1kyVaWiT4bgAJCGdj9LVcaeMJTg==
X-Received: by 2002:a17:906:fc26:b0:a23:5814:4b76 with SMTP id
 ov38-20020a170906fc2600b00a2358144b76mr216745ejb.35.1704364894160; 
 Thu, 04 Jan 2024 02:41:34 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 lz2-20020a170906fb0200b00a26aa845084sm13238517ejb.17.2024.01.04.02.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 02:41:33 -0800 (PST)
Date: Thu, 4 Jan 2024 13:41:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: matthew.brost@intel.com
Subject: [bug report] drm/xe: Introduce a new DRM driver for Intel GPUs
Message-ID: <eb17321a-5db8-4828-b5ea-0b90d968e1cb@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 04 Jan 2024 14:45:04 +0000
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hello Matthew Brost,

The patch dd08ebf6c352: "drm/xe: Introduce a new DRM driver for Intel
GPUs" from Mar 30, 2023 (linux-next), leads to the following Smatch
static checker warning:

	drivers/gpu/drm/xe/tests/xe_bo.c:298 evict_test_run_tile()
	error: double unlocked 'external->ttm.base.resv' (orig line 220)

drivers/gpu/drm/xe/tests/xe_bo.c
    294 
    295                 xe_bo_lock(external, false);
    296                 xe_bo_unpin_external(external);
    297                 xe_bo_unlock(external);

This is a false positive, but the API is ugly...  xe_bo_lock() is an
interruptible lock if the second argument is true.  Why not just
create a xe_bo_lock_interruptible()?  This has several advantages:

1) More readable and you could delete the comments explaining how to
   use it because it's so obvious.
2) Less typing because you wouldn't have to write ", false" so much.
3) You could mark the _interruptible version as must check and the other
   version could be a void function.
4) Smatch could parse it automatically.  I can write some custom code
   to parse the existing function but it's a small hassle for me.

regards,
dan carpenter
