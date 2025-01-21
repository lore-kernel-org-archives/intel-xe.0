Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AF6C02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 07:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D466A10E19F;
	Tue, 21 Jan 2025 07:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ElH3I6d4";
	dkim-atps=neutral
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9E710E19F
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 07:22:44 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3862f32a33eso2356133f8f.3
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jan 2025 23:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737444103; x=1738048903; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k9o2bny3An2I7FHCwmergs+pzKOHp0yXlWOl5Bf6fhY=;
 b=ElH3I6d4xy6NzBCfFfiBMYwPNOWd1dycrwTNyjZR4sUHOThUs3XbuTXcu0RS3hCQvD
 TtV9JXU6VEZumGLaHYjta6c+bf2gK3/BG7MbAlQpj8K5tFW4n1ws9eOxTK7hcYkuNB/2
 9jLssMLH9xXqZawPFDaveoMeYsP3fhfaM5d2DOi/ExIB1c90zs4dxBYxFF9RndR5LYGV
 AaBj5ngkteoqfYUvaefVuPdJv+yfPeOZYGqwqPFzd8LnRW+MfEgc+N1uV7g6gHDjR48u
 xO470mpzLhqEncRh+HcUZwoQK3xWSA6tmufWhX6bOXvYl3SCGp+ysLki98KHniqybGuv
 Pz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737444103; x=1738048903;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k9o2bny3An2I7FHCwmergs+pzKOHp0yXlWOl5Bf6fhY=;
 b=g+EQh5GZkBzLbCv7Hc9waSHcZ9abUyUkSIAvd80LqYLWWYEZgo1SsTeyjh98l0eQJY
 sIFbFLjPbjvZBoNmW3DAZGwJx0Ek2AOvvGed+rP8PL/qAIfAAmBYUkRVypMZ+iYg8TB+
 9uzt/tllbKbbtgO6odJmOmI7zirvkzc6+UHzPbn0vLK5Tr9DdAkhmZt0aucHxYpVR7Kg
 hnH9yVe9n14RzgUWRhUmhcaw0dzrLJ9+xCgTsI8e3VEoEgbviuTlaQmFejROXgiuP1nU
 sz1DepYqPdh4VwI0K0BRSCh3IIAHdN1MDmnXwa9LmR7QvR6Pf8xpOpLxtsKbqB7tZIQE
 8FWA==
X-Gm-Message-State: AOJu0YwQyGhT5gd+wAeA/4Z7EUpbOIdQdR1ofFgkY3yiumstiMCukdGY
 RTYbvh1Jv0Ta8vJvuNm5z8r/yMYaJ2aFq25RARBFZtIKeHPtRjvktULvfTiiSy8=
X-Gm-Gg: ASbGnctzlIwVv6hB+23/5o74Vm1MaJfe/1/IwBA6qPAHjbNfYe11+zJ9LK8eXvHAo1O
 ZZjhsKn8yyVvB83K4KLLlVMZX9XhulPaB6IfoYoXDcLUomjxzL8ssIIMc9qOufKiK50SMnQziuo
 QN43S/ur1Ithg/WYJI0jA+kZH4nvLiomUHUYq2Arrir+gziEidb8KtAwr6gUTzYlXBc5KAUQQ46
 TVw1C2xDahUEyzWJtDcPSZ/wH/AZV5JipB8dMwwkB76vcqRMHFdjvnQDWrNQdAaM5uTGygvChQ=
X-Google-Smtp-Source: AGHT+IFExZA2QOTYAM59/HGjLELAp1CS6ZlNxfdl/N5jvjgQCeVOUyHbBOsY5Ot8MiCrBn8B4uTb2g==
X-Received: by 2002:adf:f682:0:b0:38b:e26d:ea0b with SMTP id
 ffacd0b85a97d-38bf566c314mr12227038f8f.25.1737444103123; 
 Mon, 20 Jan 2025 23:21:43 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438a1ec39a3sm116651555e9.16.2025.01.20.23.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 23:21:42 -0800 (PST)
Date: Tue, 21 Jan 2025 10:21:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe/guc: Introduce the GuC Buffer Cache
Message-ID: <0d5bcbf1-79f9-4a10-a221-ddbaec9f6122@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Michal Wajdeczko,

Commit 696bfdf273ea ("drm/xe/guc: Introduce the GuC Buffer Cache")
from Dec 20, 2024 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpu/drm/xe/xe_guc_buf.c:81 xe_guc_buf_reserve()
	warn: sizeof(NUMBER)?

drivers/gpu/drm/xe/xe_guc_buf.c
    76 struct xe_guc_buf xe_guc_buf_reserve(struct xe_guc_buf_cache *cache, u32 dwords)
    77 {
    78         struct drm_suballoc *sa;
    79 
    80         if (cache->sam)
--> 81                 sa = __xe_sa_bo_new(cache->sam, dwords * sizeof(32), GFP_ATOMIC);
                                                              ^^^^^^^^^^^^
Probably you meant sizeof u32?  It's the same either way, of course...

    82         else
    83                 sa = ERR_PTR(-EOPNOTSUPP);
    84 
    85         return (struct xe_guc_buf){ .sa = sa };
    86 }

regards,
dan carpenter
