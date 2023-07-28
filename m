Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCE2C001E0
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 08:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2151D10E1F5;
	Fri, 28 Jul 2023 08:36:14 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6506510E1F5
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 08:36:12 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fe1489ced6so3214559e87.0
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 01:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690533370; x=1691138170;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=516OQsvIzXZ4PKU+H26m3pGUvOY4LbWK+UpjHRs9lBg=;
 b=qsPpBcPwpcSes0/zDyVT+0vcv3Dd9cVuZecmdSGYE5ZRrReflLK7Kb1IEYwtAOEg23
 n7TAEoVBRE3IT2abll5Ag+gEXLLWrqBmxAYkXoSJs+wAt6YIsEyUcAmR9UG92xj4sn2J
 kW0R+zcsMUFYeZ78G8+1ac8PUHxB7D/LiSqD6bmETrgW6d427VRhj1i+OXNQAGFxMWEy
 ngsTOs7nL5SGbv36fT1ecCOCFhrUbqJdHxi8xPFsNWjGPgzF2CR57bcuFJiVt7THsHZ9
 A3Ao6GLPuvuIp/2xnVpdLecLuEQmIvsXtnqC+aQpZRTU1TzQqGE0JPluzSuGTb8pkXhh
 MJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690533370; x=1691138170;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=516OQsvIzXZ4PKU+H26m3pGUvOY4LbWK+UpjHRs9lBg=;
 b=gbiUhpp6i2LPLhAA410P16retjQuHPgO8DXLlY91W0ZtC/16ZTdk2hEK90M8ZjRZoU
 QkJRLwDZKEnp/SW7AVEjVivYcrqXTeYLAqGAB49/wYpFoVw9jWGF5+1/2PBUbAWz7+X/
 jFQ7BS0HP4yJ1Fgq7BcSzNBKnrsyh5JdCjN0m4gNkTeva8UbvVYyeIOvFQxr2ZKChscd
 ni/ZnXckVYDgJ5qfF7uS41bxU8bly8cZyXY1GK6e+VrUalV3bGm0ebjGXPm8uzFbn8Pe
 w9kBW5la51wGTmgIWEhcsm6dZeGerFzbzCAq2mvy0EXJMTaYrs5cooSqd8nA9BOz3XIo
 fUPg==
X-Gm-Message-State: ABy/qLZvTiBWfNeaiFwEuzfvhWLdaUXlxBHvS7bS29CNHBku/BITl29m
 UULAnfYRWwb8FBety7ih4CBzXcmgduLNu1g8eFxB8OHjeG9tOQ==
X-Google-Smtp-Source: APBJJlFwrSqu/hnMEfSN4cxZ0V/E2R5xyQpkP7dJ9XN3OlXj9d2zEszV/mWFODmPA3gQl6WqSC+FbvGlHDBnzk1HZK4=
X-Received: by 2002:ac2:4f0c:0:b0:4f8:6a29:b59b with SMTP id
 k12-20020ac24f0c000000b004f86a29b59bmr1479467lfr.64.1690533370368; Fri, 28
 Jul 2023 01:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230728023742.22220-1-matthew.brost@intel.com>
In-Reply-To: <20230728023742.22220-1-matthew.brost@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 28 Jul 2023 09:35:43 +0100
Message-ID: <CAM0jSHOibjJW1PyqcNF9XSjFG-Y64niLQihX-Y71Vh0EUv=wpw@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add define WQ_HEADER_SIZE
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

On Fri, 28 Jul 2023 at 03:37, Matthew Brost <matthew.brost@intel.com> wrote:
>
> Previously used a a magic '+ 3', use define instead.
>
> Suggested-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
