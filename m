Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F3DC47422
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 22:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7DA10E754;
	Thu, 18 Jan 2024 22:24:47 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322F810E754
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 22:24:46 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-429bdb17616so94761cf.0
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 14:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1705616625; x=1706221425;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s/D9CFZxaxRdvm2BArETVuUm8vyoS7oXJdlz2nCdRv4=;
 b=Q+XTeSc60EPMmeYGSFinopYZCvlzd4+yjEn0HSppWQ5GtFeuu65nhiTe5tVT5BvlMK
 3/H4NmqUPaLudeaQ7PabInd+qYkM87F/SUMmauSJXNI6uG4poS3F6ESG5nulpz3JykpO
 bAA/HjnIUM4uD/Jb9Ndf7vvV6OlHYLYrk6cAr1GuvS87O/b8WOPXA79p8MqgX4JK1oS4
 pDKaylPM2qTXKYU5baMUUq43Da2HN2XyH6Z+gv2mIboBnPig8gDKZZW0BTDqda8+ESLU
 RyfVcKel8QBHkHkPmQhIF+BnZzaLINS2lIkxo+xMNsWHCmFfFbqKkLLfSfLlJh9myqda
 i7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705616625; x=1706221425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s/D9CFZxaxRdvm2BArETVuUm8vyoS7oXJdlz2nCdRv4=;
 b=vBmLUit1CpuGh6odl7Nss85cJZ+oylQLv8NbxMeht6+doZX5PUazvcEkVZzWg0k2C2
 uxOhvZ/zRC/fmTkUMsqXZVh1pMUIYmxDCG1goncW7XYxgK+CVStMxep4cqBKP24w3lAt
 b+ylHK7Z7utKIDzCD8wSjmvXxcFMhXu/tyggcSkWf/Q/XUUiGriRTb0OF7b323f32l2b
 ADKm+xGCGoLgjwOspcI4/YYfo207eUAEyz4oSb2mzBmZzobhDwtni+rtyQ85fhcNwJHu
 0y5zgKADTx383A7arHe2dkpcGoO2xOikTrYRUX6uazPFiY0rPUWl6dZgq+tJ9Vid9VpW
 PLSA==
X-Gm-Message-State: AOJu0Yy6X/m38tJZjt2wzRvX9JYBdincK2scYlkxOsUbdK7YnZ502UoN
 YKv1NYsFbS8OPJGa7Xa+t1eaPN2NwnPvgYYd/rH/jE+PCLWWsVoBGY3AwPBCSxRWv1giAgx62eF
 BwhSLV7UFYqYr5gOVNR7sRP/OmsNeZ9pfKDKj
X-Google-Smtp-Source: AGHT+IFiOtHU36EEJM9qMTHKHSIzUrPvwSNbh7ZwRD3ArjfPyZK+NArTYvfMNkK2EA2hPUVBRnxLVHTDVT4Z1PJa21M=
X-Received: by 2002:a05:622a:40ce:b0:429:c6bc:330c with SMTP id
 ch14-20020a05622a40ce00b00429c6bc330cmr83493qtb.14.1705616625277; Thu, 18 Jan
 2024 14:23:45 -0800 (PST)
MIME-Version: 1.0
References: <20240112001240.1710962-1-lucas.demarchi@intel.com>
In-Reply-To: <20240112001240.1710962-1-lucas.demarchi@intel.com>
From: Rae Moar <rmoar@google.com>
Date: Thu, 18 Jan 2024 17:23:33 -0500
Message-ID: <CA+GJov4-sWm=MHp6S+4+WsZJjeFjEdLTB462j0sOym8P_sjKLA@mail.gmail.com>
Subject: Re: [PATCH] kunit: Mark filter_glob param as rw
To: Lucas De Marchi <lucas.demarchi@intel.com>
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
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>,
 intel-xe@lists.freedesktop.org, kunit-dev@googlegroups.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 11, 2024 at 7:13=E2=80=AFPM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> By allowing the filter_glob parameter to be written to, it's possible to
> tweak the testsuites that will be executed on new module loads. This
> makes it easier to run specific tests without having to reload kunit and
> provides a way to filter tests on real HW even if kunit is builtin.
> Example for xe driver:
>
> 1) Run just 1 test
>         # echo -n xe_bo > /sys/module/kunit/parameters/filter_glob
>         # modprobe -r xe_live_test
>         # modprobe xe_live_test
>         # ls /sys/kernel/debug/kunit/
>         xe_bo
>
> 2) Run all tests
>         # echo \* > /sys/module/kunit/parameters/filter_glob
>         # modprobe -r xe_live_test
>         # modprobe xe_live_test
>         # ls /sys/kernel/debug/kunit/
>         xe_bo  xe_dma_buf  xe_migrate  xe_mocs
>
> References: https://lore.kernel.org/intel-xe/dzacvbdditbneiu3e3fmstjmttcb=
ne44yspumpkd6sjn56jqpk@vxu7sksbqrp6/
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Hello!

I have tested this and this looks good to me. I agree this is very
helpful and I wonder if we should do the same with the other module
parameters (filter, filter_action).

It did worry me to make filter_glob writable due to the recent patch
that requires the output of filtering to be a valid virtual address
but I think there is a sufficient amount of checking of filter_glob.

Thanks!
-Rae

Reviewed-by: Rae Moar <rmoar@google.com>




> ---
>  lib/kunit/executor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
> index 1236b3cd2fbb..30ed9d321c19 100644
> --- a/lib/kunit/executor.c
> +++ b/lib/kunit/executor.c
> @@ -31,7 +31,7 @@ static char *filter_glob_param;
>  static char *filter_param;
>  static char *filter_action_param;
>
> -module_param_named(filter_glob, filter_glob_param, charp, 0400);
> +module_param_named(filter_glob, filter_glob_param, charp, 0600);
>  MODULE_PARM_DESC(filter_glob,
>                 "Filter which KUnit test suites/tests run at boot-time, e=
.g. list* or list*.*del_test");
>  module_param_named(filter, filter_param, charp, 0400);
> --
> 2.40.1
>
> --
> You received this message because you are subscribed to the Google Groups=
 "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/kunit-dev/20240112001240.1710962-1-lucas.demarchi%40intel.com.
