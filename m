Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD75C6FA8E
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 13:06:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEA510E275;
	Thu,  2 Mar 2023 13:06:36 +0000 (UTC)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9E810E275
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 13:06:35 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id by8so17506104ljb.7
 for <intel-xe@lists.freedesktop.org>; Thu, 02 Mar 2023 05:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jWd0wn9P5vEMxAjgNgmvqg47DPzgv2ubB9TTf01xVJk=;
 b=KF2Rveq3TVTNBDnUrulkaTVW4b+5b+erdBz7hZ2O/FRWUeY8mK14G5mD5v4lnl94DP
 /LEIHpnS5Fv9AOh1z0O/ehMAUyNzgz7KOzX43M74hiMpuYoSQVww86X4mHliQf11Kt5c
 EZXwTbLrLi8sB1z8vQxGsQhtxJCbCvHF/TjYW+U3f/OlIFSBvLAHBxQxffO3P1T9zldL
 YziAkAfTkXKsLU8jrsf1EOUayUCUOfe43O3I3joBJJ93+N61VOP7gKqdCXLW1vYwzre0
 dTZo9TkaI1oLHkxTU2hdsaKVkWm9hOB4ef1z82K1pWewOBHEYRdagblwjHppeZue5ewY
 Tz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jWd0wn9P5vEMxAjgNgmvqg47DPzgv2ubB9TTf01xVJk=;
 b=zhZuvbThqYZc/UF4LYt5GVdUxqil3HADL7ygbBvuDiK1HztnZgNYj1sIU8bMfIfwGZ
 DSXfIKCatxrBDkSy0ixmM48MrO6gTXB7fVIIYdlhU64YO7By9pI+NEVn8wCL2FZjwtj7
 5NSD877Jlkj9/fPRVMpV5WuWTXPRFV31A6n/N0WtlBXd+ceVtv4GHvzt6BsjaJtHs3iG
 P6goGbKLU3K901ugTatK0xoDcNPyq/+ag6H/smIBZzhTIXuFCRoOc8C8u+Xayr6Co9zV
 NPr2+sefN4WP9uerXW3CTwRSgClE5bU9YidVH9xQTowH0FQ/YbHJv9D/pXNz1wc1muXS
 axTA==
X-Gm-Message-State: AO0yUKWQqa7Fo01q9vW0YPzKeJvAzm7D4nPMAvx9O8E+2svA2FZk7w/T
 nin817NH7bfoGrnmZ7fnks1DU3xKkPikiavu1g2+IiDaS+M=
X-Google-Smtp-Source: AK7set+jMKd53GTrImxUN/Dd6Jf4k2eM+PYjxy6DUB7J05jEmwIYaBvtD0BFuXeY+6J465xSrps0DgaSDh5BeMF3FMo=
X-Received: by 2002:a2e:a4d0:0:b0:28e:d4ae:90ab with SMTP id
 p16-20020a2ea4d0000000b0028ed4ae90abmr3202587ljm.2.1677762393600; Thu, 02 Mar
 2023 05:06:33 -0800 (PST)
MIME-Version: 1.0
References: <20230302124258.91081-1-thomas.hellstrom@linux.intel.com>
 <20230302124258.91081-3-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230302124258.91081-3-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 2 Mar 2023 13:06:05 +0000
Message-ID: <CAM0jSHOZwpvUdqYmEqqOVD4wKqBMLFFQiQcXAe7tLTxYvvifsg@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/tests: Grab a memory access
 reference around the migrate sanity test
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

On Thu, 2 Mar 2023 at 12:43, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> It appears we don't hold a memory access reference for the accesses in
> this test, which may results in printed warnings and possibly the GT
> not woken up for the memory accesses.
>
> Add a memory access reference around the test.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Fixes those warnings for me,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


> ---
>  drivers/gpu/drm/xe/tests/xe_migrate.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/t=
ests/xe_migrate.c
> index 0de17e90aba9..b7e4a126e8b7 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -366,7 +366,9 @@ static int migrate_test_run_device(struct xe_device *=
xe)
>
>                 kunit_info(test, "Testing gt id %d.\n", id);
>                 xe_vm_lock(m->eng->vm, &ww, 0, true);
> +               xe_device_mem_access_get(xe);
>                 xe_migrate_sanity_test(m, test);
> +               xe_device_mem_access_put(xe);
>                 xe_vm_unlock(m->eng->vm, &ww);
>         }
>
> --
> 2.39.2
>
