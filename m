Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E79E77361
	for <intel-xe@archiver.kernel.org>; Wed, 24 Dec 2025 14:51:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E01010F99A;
	Wed, 24 Dec 2025 14:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Nz7gFCXf";
	dkim-atps=neutral
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D0110F994
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Dec 2025 14:51:26 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5958187fa55so4634107e87.3
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Dec 2025 06:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766587885; x=1767192685; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kxr2cZdW7U6KS8mkdkGaBkN400rH3Ne5CoZQlpRK7uU=;
 b=Nz7gFCXfBIYXBx1+AStvAtxSPQ6UlZbD8JgexbW9kzpxvSl3HphVKYqf5zcroTSmNP
 kVpS/zCzZH+1gydqVp8eNpxltwjdhDl3LOgpuJObXlGqQrPX6zl+NAp7OirpnrR6MBzG
 T0jQyehDqw/7wmfPrdPvqeiqsmGP48ALzgRI14SIrW7HuSRWO+O6ByD0rRwpxEtQwSDH
 61QVYGJkt6ZoxHelaDhQwWk/XPddZh7yKdix5HLkVxmx3kE1TKBCH9wz+5DLhk/QIWvU
 6vzZGIuMLl2vO1VDQIrYucdp1tt+jQyFs72VT6dMoOtx9qwXEa5CzujJ/mFzv6VYFQDc
 G3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766587885; x=1767192685;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kxr2cZdW7U6KS8mkdkGaBkN400rH3Ne5CoZQlpRK7uU=;
 b=LrZ4MkTlmWxrq1PcVUCDqBzqlnXymv5RT2OFE1D62Imaqx4OgmAh5E/cNbb5/jdgcr
 mXJB5OO2gfmG6vCQfj4TrDZyllRhTJ/BKhN7kxunSPtgY9Nu8Ri6yxsb2XR/JZp06NNQ
 Lv5Lr25tO5ITKpS4fYpVXqkVR3n+UcnCnBQzGmA28Y2mDgmegOTNmNqsIH/8nAV1flRx
 RAXPQaNAbHsK4OY6rI1njbEPkQMlv3K0e9yyTMqmRC85KQdR5Pa9ZKld7L9SWPoOc+G1
 ZwuLj+b1EyMBEPnmmhoRbr3cY1XXplfOe4FzUnRX8gm4oqdfiVXU9we3KVEbCl4b34RU
 zwAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO3icPR1D5DQxKqGjbO7WVgkahMNy8SItX157nrr4hyDm/Vvk/NUCeKpRVcfUyqAEgNHSxqP0aBQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXxoadIPXlz+aZ7V6aINQEcaj5dyjray91mfG1GOr/F0wzHPx+
 nom8Ry02raB764eJkPgxjip9Us2r4rVxPr0ZLWJRrTatKUsAh7dIFq2urVzXjV/KwwxYxyqNa8E
 2JVbGYz7uJHp+R7CGNER0vtYyjSmpoaCfOYtHoEEErg==
X-Gm-Gg: AY/fxX7VanC2fUHGeWgl88Vtw/IYw19zQK0t4p3kC6z+AavVQtesYX1iIJ6eWDCPGi7
 tBdQ0w70vwf8RbBYGoDOGapP3xlU4vGd5OZihMGnTTvT5rW5voWzM3YBRvovr+i0strY81VvVxd
 +oRujtC65p0MLtKf2FTrp7xp6mdDgxpIMENyCG8w+xPCaKgXmkmb6qWLxMAu3bSAqmxN/SxJ259
 ehk1qS77WB+XELy/xSvaiAH1VlRQMaplSbAHMOAJsts8xCSfmART6FpntZOd1vkyTJ7oewjTdyx
 4gEJIiIfXaB5aTuAONNmZtoOEDxA
X-Google-Smtp-Source: AGHT+IEl/QNlZZaMQEAf3YxHXh3Y+CyJmitXojmaV+VL+Ta+NTbUIhDyFmwEx5+MdpJRq6BFVQ+NW1T93QqqIhCPZw8=
X-Received: by 2002:a05:6512:3ba2:b0:598:f262:165e with SMTP id
 2adb3069b0e04-59a17d5d8d3mr5174044e87.36.1766587884814; Wed, 24 Dec 2025
 06:51:24 -0800 (PST)
MIME-Version: 1.0
References: <20251103170604.310895-1-marco.crivellari@suse.com>
In-Reply-To: <20251103170604.310895-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 24 Dec 2025 15:51:13 +0100
X-Gm-Features: AQt7F2pVF-NnAJRiRtNG-cXmNGhirOhYoFnruFanKmretqN0UW3n8ltwjDlGj7A
Message-ID: <CAAofZF7nsTNxHcCxRTkEBQh5FChmpA05720DuNpuhdfM_ENYpQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] replace system_unbound_wq,
 add WQ_PERCPU to alloc_workqueue
To: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Nov 3, 2025 at 6:06=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> Marco Crivellari (2):
>   drm/xe: replace use of system_unbound_wq with system_dfl_wq
>   drm/xe: add WQ_PERCPU to alloc_workqueue users
>
>  drivers/gpu/drm/xe/xe_devcoredump.c     | 2 +-
>  drivers/gpu/drm/xe/xe_device.c          | 4 ++--
>  drivers/gpu/drm/xe/xe_execlist.c        | 2 +-
>  drivers/gpu/drm/xe/xe_ggtt.c            | 2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c          | 4 ++--
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 3 ++-
>  drivers/gpu/drm/xe/xe_oa.c              | 2 +-
>  drivers/gpu/drm/xe/xe_sriov.c           | 2 +-
>  drivers/gpu/drm/xe/xe_vm.c              | 4 ++--
>  9 files changed, 13 insertions(+), 12 deletions(-)
>

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
