Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A01DC48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 00:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26BF10E5BF;
	Wed, 21 Feb 2024 00:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oEXXghtg";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC39210E5BE
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 00:31:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B689E61348
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 00:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570DEC43399
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 00:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708475507;
 bh=kshd/MxU77lubM0fz/S3RnwJf41DI5hUnQCToXlq2zU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oEXXghtgjgmc6g6c35ZE5LuFJEaO5jov3OH9d5wVAh+GmWR2wiXXP1N2WwjISDyCB
 DyRZ35mHtR4egcgbCcX5U3uwX1zgORHtpmf5Gxu5Fioay5FI8onjG05jiwOkb+JYIU
 2RjvX22/Bygov//dPztNGR5HgQ8NXr/+QNliyqNi6+Anjc7zmPwWlCGJFDlV5HGQSt
 m/qCl5XJaHZ2RNsx1nfWQ0RhMX8I1v9VYLH6tUNkLXZ0ffl6rZ+IZYcRE5uMTX/Nt+
 xk2PqalYgQrrMRa2+DVAHvlGpuNvcSDe14zHCI2oWakMy3uliDRo+k4PjnJ86zxBtb
 ji6REgboVkQdA==
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-512c4442095so1884180e87.2
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Feb 2024 16:31:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWZG/C2HbhWYtNRrun51XiivcnpcaPGP5/80EqOxudCefCuu4RDEX9QrO+CA4YbdM6FBa9QPqXfrMOp/MIUzW/eXMcNO1XfTazbS8qdqDw=
X-Gm-Message-State: AOJu0Yxba+agApUJ2mq1oXhNrNmQft3n1rgD0d6CiV+MdQf+tiEydAWH
 2QD6DFNjid7WRJ+QFKO/1VSTGX1a6sq6SbDZJ1opIiQQC4vu+Wg15h3chcBu4F6c9TlPuaNKur7
 vT2G+NYHEfs0Z2EPPFAQtSlQTGYM=
X-Google-Smtp-Source: AGHT+IFkvFurxxi1bLlNHTTKKpQnyxz8BDEDwuZuMOxBDWQ6QqZCqJ3XEn63Faf3mmLhHgSDhbQz7DsTNmstG5PBebA=
X-Received: by 2002:a19:c511:0:b0:512:9e57:375a with SMTP id
 w17-20020a19c511000000b005129e57375amr7431047lfe.53.1708475505723; Tue, 20
 Feb 2024 16:31:45 -0800 (PST)
MIME-Version: 1.0
References: <20240219135845.1463992-1-dhirschfeld@habana.ai>
 <ubtbma6zlqdhh5ovx3437q7oyxgn4n2ct3drc7ovvaaong2awq@n6r56aduj36l>
 <shiourokdrk7rzpof75s3bul443x2xc5sezm6sfal26icjraio@5sk4ouwsvmh2>
 <3ziuczyga7xqn774z6bfvftnp7ybompmiel2a3tqttgjv2ualb@q5s7uh4ywuk2>
In-Reply-To: <3ziuczyga7xqn774z6bfvftnp7ybompmiel2a3tqttgjv2ualb@q5s7uh4ywuk2>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 21 Feb 2024 09:31:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS6jP4pz5D=EQQpykL9P6djBwFgywovW7=PBHLxg5UJHA@mail.gmail.com>
Message-ID: <CAK7LNAS6jP4pz5D=EQQpykL9P6djBwFgywovW7=PBHLxg5UJHA@mail.gmail.com>
Subject: Re: Re: [PATCH] drm/xe: avoid using 'grouped targets' in Makefile
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>, intel-xe@lists.freedesktop.org, 
 ogabbay@kernel.org, obitton@habana.ai
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

On Tue, Feb 20, 2024 at 11:50=E2=80=AFPM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> On Tue, Feb 20, 2024 at 11:08:58AM +0200, Dafna Hirschfeld wrote:
> >On 19.02.2024 23:44, Lucas De Marchi wrote:
> >>On Mon, Feb 19, 2024 at 03:58:45PM +0200, Dafna Hirschfeld wrote:
> >>>The feature 'grouped target' ('&:') in makefiles is only added in 'mak=
e'
> >>>version 4.3. This cause problems in older version of 'make'.
> >>>(Specifically $(@D) is wrongly interpreted - it creates 'generated' di=
r
> >>>in the source path instead of the build path).
> >>>Avoid this feature.
> >>
> >>but it was used for a reason since a single invocation is supposed to
> >>generate both the .c and .h from a single invocation. AFAIR when
> >>implementing this, not using grouped target would be a mix and match on
> >>having a succesfull build. Does removing it really work with incrementa=
l
> >>and parallel build?
> >
> >Hi, we had a compilation issue, where the wrong version of the generated=
 header
> >(xe_wa_oob.h) is included from the source directory instead of the build
> >directory. I thought the problem is due to the feature '&:' which is not
> >there for our 'make' (v4.2). But this didn't fix the issue. I was able t=
o fix
> >the issue with that patch:
> >https://lore.kernel.org/intel-xe/20240220090003.1523866-1-dhirschfeld@ha=
bana.ai/T/#u
>
>
> humn... probably because somehow the .h was left behind but with a more
> recent timestamp? If grouped target can't be used according to commits
> 9390dff66a52 ("kbuild: invoke syncconfig if include/config/auto.conf.cmd =
is missing")
> and f463c3510d44 ("kbuild: add comment about grouped target") then I
> think both fixes are valid, i.e. the other patch you sent and this one:
> https://lore.kernel.org/intel-xe/ngvfmndraoxpdiv4ty5ux7ocjfalsfvejnkxiqbb=
d4joylhend@q7nai4sxgkmf/
>
>
> Documentation/process/changes.rst still lists GNU Make 3.82.  +Masahiro
> to know if there's any plan to raise the min version requirement.
>


The next bump is planned when CentOS 7
(which uses GNU Make 3.82) retires in June 2024.




GNU Make 4.3 it too new. You cannot rely on it.


--=20
Best Regards
Masahiro Yamada
