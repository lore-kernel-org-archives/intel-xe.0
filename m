Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AF6C48BEB
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 10:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA0610E8F4;
	Thu, 22 Feb 2024 10:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dsl+0PXl";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BC110E8F4
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 10:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708598536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IVi5xtqagqhQr4yQkZ21VVqriPXn5rhJhhfioOmJJms=;
 b=dsl+0PXl7xUQ+poY/ZuamV1NQgy3wUnIGhUtwp2xHAfyeLLR2OMkOoRU83G67kHo8BAQ3r
 CdXjMkgiFRKG/+a1D2ISYVCQhmWR1nhDs9Ye+Pbzxi1/TaIA2SOrTtT4bgET0nJMEVcIkr
 VU0tpT1U2eunmrso3SOIgXQZVYiYgzE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-Grl59SeHO4SRxniR_odjgQ-1; Thu, 22 Feb 2024 05:42:14 -0500
X-MC-Unique: Grl59SeHO4SRxniR_odjgQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-33d10bd57d7so2597147f8f.3
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 02:42:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708598533; x=1709203333;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IVi5xtqagqhQr4yQkZ21VVqriPXn5rhJhhfioOmJJms=;
 b=XoB9ABXZkTuSggpPWMRUKoizfgi2/8CfHPObyrdpu1D4e06NDo0QPWfLjaal9xBfMf
 6pcfPYAVWjMRC2eUxfOMyl1P1JG+qZUGsxog5hcoqIVBEbOlfj3vniGD7JRrOPYEoxyB
 F9SVzcTvVlzq3oPzFHU4zwrO6nwcIMDVl0C5dIUyZXqzY1qRsqqsaDLprrSt8eDM81K/
 8i6Nt9PwaAecsayQUWV7vln0QcE8p81UWq0HhKZYbuSMnV4bshePeazjybiRdgJ1PNWS
 D14vYgtoWKwY+54/sgbm+scu2u38c0v8NTVlkJvaPsX9WdGvahHWWohpBfdU3p4E9/CX
 P7yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi2b9xfMaxHcg5wleUDmzmtRTb0S5m7U7a2bLITPVBg728IwC1bGed7d1C+R5+BjTod0L2BzUWZwa18KWDx4GIG+2AshceHDKSH4FIgFw=
X-Gm-Message-State: AOJu0YzBY3VKfOj2WfUAbPGdsUOLu0Vcyn5kN8B8Gy5p9drqpzxBk07o
 QeWmB3Ltc+wfYivu8yQpIphwrPwn8JmdxOFYjfXPb6WKs/0qdeDEXJtpCabtGB39Fx31IyHa6Sx
 ffaOaMSBtI9B5jtdhKmv0i9jBoeDRiyYn7idcC01jSWtsdnBUjMzh6d/NgsEvNmvdaXyk9yppo0
 hTaLlBIsNFQ+p40n6rVGgA7eKV0jj0TE9DakrXFL4=
X-Received: by 2002:a5d:4850:0:b0:33d:391b:8db2 with SMTP id
 n16-20020a5d4850000000b0033d391b8db2mr9472706wrs.61.1708598533682; 
 Thu, 22 Feb 2024 02:42:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFt816+aUtSBUADBI4CYXrHxRHYjhYyzfPh3WwqLeFMhlmXg2tNA3B2shw4FqT67BiVbto4PUojvsiihkGZ5Sc=
X-Received: by 2002:a5d:4850:0:b0:33d:391b:8db2 with SMTP id
 n16-20020a5d4850000000b0033d391b8db2mr9472691wrs.61.1708598533378; Thu, 22
 Feb 2024 02:42:13 -0800 (PST)
MIME-Version: 1.0
References: <20240222145842.1714b195@canb.auug.org.au>
In-Reply-To: <20240222145842.1714b195@canb.auug.org.au>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 22 Feb 2024 11:42:01 +0100
Message-ID: <CABgObfaDQMxj9CZBzea+=1fcFQXEemAJoH5Jvc9+tfiC7NAvrQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kvm tree with the drm-xe tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 DRM XE List <intel-xe@lists.freedesktop.org>, KVM <kvm@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Yury Norov <yury.norov@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Thu, Feb 22, 2024 at 4:58=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the kvm tree got a conflict in:
>
>   include/linux/bits.h
>
> between commits:
>
>   b77cb9640f1f ("bits: introduce fixed-type genmasks")
>   34b80df456ca ("bits: Introduce fixed-type BIT")
>
> from the drm-xe tree and commit:
>
>   3c7a8e190bc5 ("uapi: introduce uapi-friendly macros for GENMASK")
>
> from the kvm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Lucas, Oded, Thomas,

do you have a topic branch that I can merge?

Paolo

