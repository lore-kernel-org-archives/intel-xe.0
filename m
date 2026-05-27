Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A8DCD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 09:13:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BB310E21C;
	Wed, 27 May 2026 09:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="XPY+IUJX";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94A610E21C
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 09:13:12 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so83350475e9.0
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 02:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1779873191; x=1780477991; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GiwSnMH0uD4dcvsaFEOR1H76SV4MyXpNl2wdQbok5/A=;
 b=XPY+IUJXlQlubPbGhbETLmv0ctlzwxGd+FAleOrFBEjvJFwKhYPsxP/SOYCy3WLrn5
 mqBSw/AvyfFe7pi6MCJkeQmXZcUGvZgjqc/ABO06TFponXKWt8WB55UzhjfvdrdyVq5K
 qPeUhP/oI1sWiYFy/FHdeaOPaxzXSNtiNh40jqc/vwAdbH1hOUiWXqG5jDplXq+q9mZ8
 b4GEaeoIdq9HXwjkXYGDvXa/vvbuRUx4dlLfMry6tHQNHgJ9QfVyIxx5tf+JO/ZyUIeH
 2Qgmj8G8bRXYNjb41/2rB3g+P4f7V9KijOiOMF9baAB0u/hXJTe3J/w58U/yGVe/qnXt
 Lj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779873191; x=1780477991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GiwSnMH0uD4dcvsaFEOR1H76SV4MyXpNl2wdQbok5/A=;
 b=rKtSkeX1nR997jHko3Rtkd5i8DKIsZcIx2SR7YejDa9AkwksY4mLW5eSR7tu0aM6Tw
 g0iR/sPbLK0c6rTeUz5vB4suXEI61cZiLyRsxSiXc9Gi2Ohsr06XTUJ+05160PtbmDtR
 FD9ABwOgZVRiOTjIuhICzt1tnjKOa2cy00yHCR8Yik/T/CVC+IrPcUsg46kTV+hOrYiB
 bP9gpLm1FMxu7xI3WtZ2gknp+OlJ+CKid4McHE3Qu6W9gjABW08340EtWsvnfSci/REJ
 nTG6Z2xrp4GGXW4B6lVGssDJTU8VczZo1l9L8p3oEW6BCcuhHAgWaEVWYqIcGQyiuwxw
 HCDw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/XnegUfy9wYP08o8wvvVlYofomoZfw8lXdSHXMU2z7kWRCFhfke+/N80lQJSLbBLPP+ii/5ofZ2A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEDJuEM+jsGzSINSyXpCx3B5k03IX3BOmZ52ICBjXr3USImn7B
 wGn7q/vJ9xRio4LnHfbmXAPX2lhz/6Ws0U6g5mfy9chZuhMzpFkLZDNRoqX55TOErcw=
X-Gm-Gg: Acq92OG/g9dMZlBfzbGT8RaNumIfOcqcQkKxMt43HSxduCjJIlmaXVHmcn5PAxvbezZ
 aNvWD9oD5KmEAtHtZb5eggYg5RRb+XOc7w2MgkdCTEqnsDFY1wQzSCQOKp4XU12ccd2DVUFScXu
 Ul03/AQ/0/SSWwL4vpSL8U2xykvGCvqLGI7Nk6EZprf8JQYbZ0OC2uMUir0tf3TEB+qQ/sjMLqU
 i8h/BF6/PKw7OGeudc6WIQc77Bgy1KXc/qPsUpFw8DG7vgqgqcAwZuPQj/CV5XwwoGoao9C930j
 FivpaJh4PjlhAWTEJWKCBGYgCMoRatUbTjAAi+1J7Ezgq5x6IuQGPFQuXWJhPB/m8FcSFd25rjj
 tMSnau/qXYXzKEhJx8rJBRah9+bqKCsGtmIKGoDYE05Ha8usrHOuZrYO5/TiFfXVVms+xEpxGGL
 VFum0taSBGZ85cXPAbwXUVc5id8g==
X-Received: by 2002:a05:600c:45ce:b0:490:59cc:999f with SMTP id
 5b1f17b1804b1-49059cc9aa2mr231653355e9.4.1779873191383; 
 Wed, 27 May 2026 02:13:11 -0700 (PDT)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454db285sm356216775e9.5.2026.05.27.02.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 02:13:10 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: john.harrison@igalia.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Marco Crivellari <marco.crivellari@suse.com>
Subject: Re: [PATCH 2/9] drm/i915/display: Use an unbound workqueue for atomic
 clean up
Date: Wed, 27 May 2026 11:12:47 +0200
Message-ID: <20260527091247.133439-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520235820.2313192-3-John.Harrison@Igalia.com>
References: <20260520235820.2313192-3-John.Harrison@Igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hello,

> Prevents this kind of message being seen:
> <4> [71024.774936] workqueue: intel_atomic_cleanup_work [xe] hogged CPU for >10000us 35 times, consider switching to WQ_UNBOUND

> -	display->wq.cleanup = alloc_workqueue("i915_cleanup", WQ_HIGHPRI | WQ_PERCPU, 0);
> +	display->wq.cleanup = alloc_workqueue("i915_cleanup", WQ_HIGHPRI | WQ_PERCPU | WQ_UNBOUND, 0);

To be unbound you must remove WQ_PERCPU and keep only WQ_UNBOUND.

Thanks!

