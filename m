Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8198CA0EEB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 20:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4CB10E298;
	Thu, 21 Aug 2025 20:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ytwqWc9r";
	dkim-atps=neutral
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69B110E298
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 20:16:30 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-70d93f5799bso5567236d6.1
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 13:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755807390; x=1756412190;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VoMACWbm6WXIWD5RwEuc0Yk/NrCPIoJJa0nlqcxzHco=;
 b=ytwqWc9r4toECn6yzk5OyS8MTpEgO6PBwcf/HBpFILUIjmaFVBFx+6Rq6E8BgB2iTV
 r1hb0ufGq9A346sTt1b6SQ6jrLtcIa4fQy5ABGgEYYZvxc8Jg1X25z/N9IWr/kv6/ixA
 vcmag/T5pghCsdpP6k3/J42DM2TWGEyeUWxKn9H1/JhNDOWarFzm/7Pp7mjZliHq4yyr
 /CJM7iLIon5/U3RsKTV563BDD650xuotkY2V6RBYbvvBPA7cGlHaehLZ4XrzpJkiIOPu
 5aJJ8zYt7ikCsaSjowfqRYEPgm3oP6MoOFXmD5wsdp07ltijR/Nh7cczTlnWfp6MF1NF
 Hucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755807390; x=1756412190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VoMACWbm6WXIWD5RwEuc0Yk/NrCPIoJJa0nlqcxzHco=;
 b=e06acHp2DCvv4JvZ5g5CM46jA8LX51hNrkvcJBHcIJtliCOcR0tkeTylxtkkhDjfQS
 sT1uRkHc7QiSfA8cTiIYkzLu3JhUQa2GEvjTHXX0F5PJiEv6W1ivm0xvofOtXSIyP0pl
 CmmGQINIV/QnbGAZMazYbS0qca+B2NLRVsVpmTMlC5YgRPKutcBguh2Xhwx3JqaNd7CJ
 Zo4lftHKgG0mKamiVMmElm7t0BXIX934zLr7JEr/9dyGgAYmIQMWKHiD9ifod+uasgbJ
 qbaVmtMf7VLACevD5+sxY9imsYTyuy/MyXs8r6C0Axoa22EEF+GKCK1GAhCD6643pipn
 xcMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3PGq59rQUs8cJ0lB8GIKxlK+nQyJYpNQEskdnfup2tRb/YZ/fcQPzG7HKhR6Cft2KyLZCCmFfFA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBowT+AYRAg0wDHiH5+p5RgW8L2Xj0WgBQGmkHJW89b9SmJpKw
 1mh6lMPFXo0xJP+BoRzq2TkAMDr96wki4cSuAOdzMTuHQY6OuD5CLoEDU2n91uxys2eQdahjE7E
 lKot0z7L1OuIK4x5BdLhW6KrWenM4liJ43RlaS7ypm90fUvP3yU46llCj
X-Gm-Gg: ASbGncs6PD+Glqb5QJuWI/fBXsnvwLQHulbImB2rG37AcL1pgtvz2I7WYZoZ3Uw8AY5
 YBoABWOkX5K7qkCk+BYaczwR8WGhGTm3g41Fc3R417+2RnTRWubIUVwT8+mV0jUKAG/0SsC4xRb
 PvQiDKWUO2Qtat0qzstFnIvff6aBLfvDnWVo3gh+iygSOBUUsEZhblBB/HGKrJRMUOBqbgrpvlx
 K6mRVs0l7I=
X-Google-Smtp-Source: AGHT+IFPvW5VGS5Pdq/t1Dq8/2FXw+EPJboiflOqeuNZwXL76s53ZkPMkBshyZ8dQC8VObHNnRC8wee0tzHwxyfcQv4=
X-Received: by 2002:a05:6214:29c9:b0:706:de4c:fddf with SMTP id
 6a1803df08f44-70d970b2b8emr9982006d6.9.1755807389454; Thu, 21 Aug 2025
 13:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250821135447.1618942-1-davidgow@google.com>
In-Reply-To: <20250821135447.1618942-1-davidgow@google.com>
From: Rae Moar <rmoar@google.com>
Date: Thu, 21 Aug 2025 15:16:18 -0500
X-Gm-Features: Ac12FXy1vcheJ7TDTrz-6MLLUWsqJPUTbd8XnGF9dgHRXhhIGEMrrGoiOssdCO8
Message-ID: <CA+GJov6UarLu3pEULCVqDLg1aatduASBsdR6d=wApfqdHJ-bCw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/xe/tests: Fix some additional gen_params
 signatures
To: David Gow <davidgow@google.com>
Cc: Marie Zhussupova <marievic@google.com>, marievictoria875@gmail.com, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Shuah Khan <skhan@linuxfoundation.org>, 
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, 
 intel-xe@lists.freedesktop.org, kunit-dev@googlegroups.com, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, Aug 21, 2025 at 8:54=E2=80=AFAM David Gow <davidgow@google.com> wro=
te:
>
> In 444be9072fca ("kunit: Pass parameterized test context to generate_para=
ms()")
> prototype used for gen_params functions was changed to add a struct
> kunit parameter. However, a few of these used in xe were not updated.
>
> Update these so that the xe_pci tests build and run again.
>
> Fixes: 444be9072fca ("kunit: Pass parameterized test context to generate_=
params()")
> Signed-off-by: David Gow <davidgow@google.com>
> ---
>
> Sorry, the last fix here caused a warning (thanks to the test robot for
> finding it).
>
> I'm still happy to sqash and re-send the whole original series if that's
> preferred.
>
> Changes since v1:
> https://lore.kernel.org/linux-kselftest/20250819073434.1411114-1-davidgow=
@google.com/
> - Add the missing <kunit/test.h> include for struct kunit
>

Hello!

Thanks for this change! It looks good to me!

Reviewed-by: Rae Moar <rmoar@google.com>

Thanks!
-Rae

> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c      | 12 ++++++------
>  drivers/gpu/drm/xe/tests/xe_pci_test.h |  9 +++++----
>  2 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests=
/xe_pci.c
> index a65705814b9a..f707e0a54295 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -44,9 +44,9 @@ KUNIT_ARRAY_PARAM(pci_id, pciidlist, xe_pci_id_kunit_de=
sc);
>   *
>   * Return: pointer to the next parameter or NULL if no more parameters
>   */
> -const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc)
> +const void *xe_pci_graphics_ip_gen_param(struct kunit *test, const void =
*prev, char *desc)
>  {
> -       return graphics_ip_gen_params(prev, desc);
> +       return graphics_ip_gen_params(test, prev, desc);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
>
> @@ -61,9 +61,9 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
>   *
>   * Return: pointer to the next parameter or NULL if no more parameters
>   */
> -const void *xe_pci_media_ip_gen_param(const void *prev, char *desc)
> +const void *xe_pci_media_ip_gen_param(struct kunit *test, const void *pr=
ev, char *desc)
>  {
> -       return media_ip_gen_params(prev, desc);
> +       return media_ip_gen_params(test, prev, desc);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
>
> @@ -78,9 +78,9 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
>   *
>   * Return: pointer to the next parameter or NULL if no more parameters
>   */
> -const void *xe_pci_id_gen_param(const void *prev, char *desc)
> +const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, ch=
ar *desc)
>  {
> -       const struct pci_device_id *pci =3D pci_id_gen_params(prev, desc)=
;
> +       const struct pci_device_id *pci =3D pci_id_gen_params(test, prev,=
 desc);
>
>         return pci->driver_data ? pci : NULL;
>  }
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/=
tests/xe_pci_test.h
> index ce4d2b86b778..6d8bc56f7bde 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> @@ -7,6 +7,7 @@
>  #define _XE_PCI_TEST_H_
>
>  #include <linux/types.h>
> +#include <kunit/test.h>
>
>  #include "xe_platform_types.h"
>  #include "xe_sriov_types.h"
> @@ -25,9 +26,9 @@ struct xe_pci_fake_data {
>
>  int xe_pci_fake_device_init(struct xe_device *xe);
>
> -const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc);
> -const void *xe_pci_media_ip_gen_param(const void *prev, char *desc);
> -const void *xe_pci_id_gen_param(const void *prev, char *desc);
> -const void *xe_pci_live_device_gen_param(const void *prev, char *desc);
> +const void *xe_pci_graphics_ip_gen_param(struct kunit *test, const void =
*prev, char *desc);
> +const void *xe_pci_media_ip_gen_param(struct kunit *test, const void *pr=
ev, char *desc);
> +const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, ch=
ar *desc);
> +const void *xe_pci_live_device_gen_param(struct kunit *test, const void =
*prev, char *desc);
>
>  #endif
> --
> 2.51.0.rc2.233.g662b1ed5c5-goog
>
