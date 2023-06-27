Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615DFEB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 08:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399EF10E1C0;
	Tue, 27 Jun 2023 08:56:08 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F80E10E1C0
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 08:56:06 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b6a1245542so31017651fa.1
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 01:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687856164; x=1690448164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O+F5Cj41kq+8iDYrLGUMDM1oOqhkNtkm6yvERsTETbY=;
 b=RFB8JtL8TIjOqc1ZV4V4UaNgsFjQUzzCpAu8ThiEmhmBir3H7BL1PG84ERxAxtSLnX
 E4i4/QWxiDfveNbWA70KjVLjXeDCSj2E5pXKpEODMheRz8Fjw4nV/MSNoBFoG4Tw+KQi
 aSXVzGbncUnlj64gn9PqF/+F44JICsIkZHt+9s3KUy6ZcRrZ/rYmDH3L9WFPq4GAJUy0
 bG7rCKBPRGhIUnmla+JHM7iN09yaxu/81xiTaxbEnlNmUBIZl2Il78N1ZtcTJGODrxbo
 C0ccjMDvsur2EfYEy21F+Lhf2UATAhqLsP199fbU9iwWoXg27ekh25dPH9Z/GWPb7ygP
 bT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687856164; x=1690448164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O+F5Cj41kq+8iDYrLGUMDM1oOqhkNtkm6yvERsTETbY=;
 b=HKOtKex8FyyKfNpGiY9hC8Hz9T7b5C4RSBvCTtka414HbgkfN6fY5eBulr/smKk8ru
 6abkYHvdZm5Iat0TKR2v2Ci/sI8Uxv4X6p3iEvrJsT+rSbRYMDhBY6NMeBgeuYg0dyBA
 4WFM7B5VQl/5papfCftv7qMdNVJyWbLEjOOuHNvQc5OnABJNOf1aICqiqUnRjYzhYnSh
 peNUXbm9QGfhWvts/UkFK28T3F4aRRgqFSNTwj/tdiPe6SZsFxC5o/b5X54ulZQcONjO
 VM0li9Ew8MYTY0ATVr4ljMZQyKG0VulBCvTYXlVL0YlBLMKs+SinAiHgvGuuT6KuRI5f
 Mx6Q==
X-Gm-Message-State: AC+VfDy3WQnN/3cNx0Pqkqkujm066tL8LB3ntZ0LfBWc9MvOS/X+Oj05
 5S9VgSPTHgPDqf/s/okTitqbx0DQzdQt31l4g195A6MX1Go=
X-Google-Smtp-Source: ACHHUZ6/D2E2w1oxnPmrAMxkEjjdsaHBwaEQERpguCaoUEkeKsKRUgPaQKwhSgTLzSZ6lt5SLpgO5mXcQ8Y9+GUZ3iY=
X-Received: by 2002:a2e:8856:0:b0:2b5:a76e:d3e with SMTP id
 z22-20020a2e8856000000b002b5a76e0d3emr5694830ljj.20.1687856164066; Tue, 27
 Jun 2023 01:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230626181741.32820-1-thomas.hellstrom@linux.intel.com>
 <20230626181741.32820-4-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230626181741.32820-4-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 27 Jun 2023 09:55:36 +0100
Message-ID: <CAM0jSHPmo3C+swpLFV_wO8z9ajDj+GUBWgyGZJ-bJaQf7LMBqA@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v3 3/4] drm/xe/bo: Gracefully handle errors
 from ttm_bo_move_accel_cleanup().
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

On Mon, 26 Jun 2023 at 19:18, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> The function ttm_bo_move_accel_cleanup() attempts to help pipeline a
> move, and in doing so, needs memory allocations which may fail.
>
> Rather than failing in a state where the new resource may freed while
> accessed by the copy engine, sync uninterruptible and do a failsafe
> cleanup.
>
> v2:
> - Don't try to attach the signaled fence on ttm_bo_move_accel_cleanup()
>   error.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
