Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF30C6379F
	for <intel-xe@archiver.kernel.org>; Wed, 22 Feb 2023 09:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486B410E1B8;
	Wed, 22 Feb 2023 09:48:58 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC50110E1B8
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 09:48:56 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id j17so7320375ljq.11
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Feb 2023 01:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J5d+KtSBw4NNTp/Mz3uUenXyvxtqCwaFM5dDj2RITSw=;
 b=NajH0ZIJxY8wJjpUZdCVAe0b+PMoMAVuHlaBF5huQ0Pf0xpR60ZFfWjjQZGZYUwlNV
 I7T1cVLQ06rJ+16Gvbd/4dspNQ1A9CuTmiTjg5+pFaNlBKZjytj8xaJJGYCXjc6/3fVn
 LibQHIF2cI1vQTm3g319ikYLFjtqrg5iqTYkh8eprB+SqLS2woDTS2g6dPHdrjgqZ0rv
 4S6tFGThR/juFMTp0u4mz8zlvMQZ99MqEk3pkHGHtBT9K8IHnPDklCNOSHmzDxnvNY7G
 /YroWc7oK9CVhRpqYgb0UcJZRj5jgQ101hdjVqrkYD+wYg9XL5MeiUMk8YXHX4S7/6cw
 xhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J5d+KtSBw4NNTp/Mz3uUenXyvxtqCwaFM5dDj2RITSw=;
 b=BBGVJEwk2lu4UVV0AwTFfdmWVOfDvxZl5HKMZQ7EGFM4XDxzRT+G1s20joza8TTC5e
 f+9Q6ZSdXQVK5KuQAaf0YaLsiavxLGBn1+Y544JSeHdNyDFj6rFheXfxmqXAnb76xIUR
 yZiFSe5HAea7YiTf3d3S3gdOnXgHz+eQ4C1l2PB2jifu6BzbqUSfBJ8XKxtRXWSUlYtK
 a53SVtrLqdVhCO1qEED9o40STfZtQ0dv97LK1PKgpyDg3FZ0TvH+elyd0ViAsp5/laGC
 w3YpvKUUhmU033WY1300TZ+pS1a7XVNnC3tI0e9Bjy6UsyS6xSgEeOVlm0okEMVjcyTo
 BEkw==
X-Gm-Message-State: AO0yUKWH/KwBLZa6/MgC3WSZooNWgfWFypsYFCrjG9nPtMDw4P5WwI2M
 VpVrjPVfCtbfpD/bROjFVjCQhvixZADsdK9ydnk=
X-Google-Smtp-Source: AK7set/Qwcuduxpjp+BQ7gRFPejaX7UbrGJnGOuCFpi5KihAVB0bY0eFzHL4i848ek6Zjb2VD9npD+S5Up+opdfPdnM=
X-Received: by 2002:a2e:a237:0:b0:295:8918:9d77 with SMTP id
 i23-20020a2ea237000000b0029589189d77mr1686383ljm.2.1677059335045; Wed, 22 Feb
 2023 01:48:55 -0800 (PST)
MIME-Version: 1.0
References: <20230221233348.883897-1-lucas.demarchi@intel.com>
 <20230221233348.883897-2-lucas.demarchi@intel.com>
In-Reply-To: <20230221233348.883897-2-lucas.demarchi@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 22 Feb 2023 09:48:27 +0000
Message-ID: <CAM0jSHN1TZ4nzs+NOxAywkBq1J+aXhBTuw65Tf-p8qRzWceghA@mail.gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 1/6] drm/xe: Make local functions static
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

On Tue, 21 Feb 2023 at 23:34, Lucas De Marchi <lucas.demarchi@intel.com> wr=
ote:
>
> A few static functions not being declared like that break the build with
> W=3D1, like e.g.
>
>         cc1: all warnings being treated as errors
>         make[2]: *** [../scripts/Makefile.build:250: drivers/gpu/drm/xe/x=
e_gt.o] Error 1
>         ../drivers/gpu/drm/xe/xe_guc.c:240:6: error: no previous prototyp=
e for =E2=80=98guc_write_params=E2=80=99 [-Werror=3Dmissing-prototypes]
>           240 | void guc_write_params(struct xe_guc *guc)
>               |      ^~~~~~~~~~~~~~~~
>
> Make them static.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
