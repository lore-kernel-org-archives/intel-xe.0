Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0B5C7EE2C
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 10:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E411B10E8C4;
	Thu, 25 May 2023 10:03:59 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4524210E8BD
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 10:03:58 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f4bdcde899so2173564e87.0
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 03:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685009036; x=1687601036;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cnRkESdpuIJnyO+eGPLXn7pYK8xp/JfauKsL2emPbMg=;
 b=Gu7a3ptZa7zH5oQvVZC1zRDOOpwBTodOcTfMZ/fidirCRHz0GUx96A5QC0kj5aGg57
 7Am2uQtXmJquF8R80bWeqcJcYmzwhio0I+Jwe2sbHIJ7DhXfN/iekhY55MwWipCR+PUF
 ccMCnv2X45wmV3oISDZvmXt7t7zWfYrj0nnALausnGD8Kw2j4rBfz23QuJl9+KWRncXQ
 UDeC1Nm1y5pO6medj8V4vF/uX39tfoNQswgQQ2bnAtfIusZaUTbtfuzHBjVD452aR6Qy
 o/JQeN/4v45r5DGaNsSPe2pR/c+VeZodIvyhaCpV9gWaKGBu1itJfKySjpvCY8LCqRvK
 jWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685009036; x=1687601036;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cnRkESdpuIJnyO+eGPLXn7pYK8xp/JfauKsL2emPbMg=;
 b=diWE5SIJqh0UG4Zu6LuQNIm8jSvUcunhCGs3LwWG+WX8l0+bkgYVhSJDCVH63Vvj/n
 H5b5/MbwhxtHpM8qmQMYoWuFe0nNVNeCVh6DU5FlV71oWWp38F2HViAxqMSCeuPtfQUD
 U9vT7Pj1MKGP+bn+ssbjWx2UxknIPwHriJul0/wzB/wB1PkErK4rK4hc5viDEoJecDkq
 AIN3ZxPcsZa6qSkudyuEFtlMrL8/VJNoRNPkPHXX0sa6NqRnYDxwNDoqKmRkAr+ttFW1
 VKfo1NGYwKPPhmd+8UckUTma6Tu6eOu1gcmU6k0IOiFZ9Hq2FGZ7sJflrRO0lhVDxnEr
 hWug==
X-Gm-Message-State: AC+VfDyfWdzK6+k9Mnw8cM+/WQ2E6KejMhIsE+PcbFJlGgWztGjfDY8q
 3z4CGcgu45Wilh8707QBVZctvEmMhgqUb2GFBlt+cl5c42Y=
X-Google-Smtp-Source: ACHHUZ5Th1tCxmROf/t/SrxKS8QOVz0vUPSixI4rTXRJ4/G+7rQo30hVkNXam6Umfmg6EC/QtNRH8vb8tPaWQJOBs5k=
X-Received: by 2002:ac2:491a:0:b0:4ef:ec33:9155 with SMTP id
 n26-20020ac2491a000000b004efec339155mr6029592lfi.28.1685009035500; Thu, 25
 May 2023 03:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230525062724.176084-1-thomas.hellstrom@linux.intel.com>
 <20230525062724.176084-2-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230525062724.176084-2-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 25 May 2023 11:03:28 +0100
Message-ID: <CAM0jSHNkTmHK8=wEfzFyfKDGeJ1XaroKZAwzFVSdLc+zj6drYw@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Fix the migrate selftest for
 integrated GPUs
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

On Thu, 25 May 2023 at 07:27, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> The TTM resource cursor was set up incorrectly.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
