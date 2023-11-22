Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2AFC61D97
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 12:36:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE9510E610;
	Wed, 22 Nov 2023 12:36:22 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB94910E610
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 12:36:19 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50aa8c0af41so841370e87.1
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 04:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700656578; x=1701261378; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bzgkdLyHs3r9uuY4fL6NY/Elu9vWOiVgEdZe9U7LSno=;
 b=mSYWfnTChzvAb84iLkZWLfGADYgAAs8nBokEDDzUlGicxOG6EL5hEvqadisIV6p8zE
 EMiNHPn3gwxNzlZoxuNtVtOUHPOk3bmIDJwRe9Ys1w7eyieUA+XSAmjLuz7MxLc4jdVO
 64vbBx44OMnj6l+UbUD8n//weaD0MCEuCY9dDM12Y/41IgNLyWQpZqgXnmVLnP7Jko2+
 d0+FxYIVxNCUWNgX0bk8CG4WRqMqQgTcPbx2XM+UHx0n9qKYwRUIwIZlrdHsKor7HZhk
 u20NZOe+qbkYmwHgJYG6IOFjvco7ibMT+Sb1fUyMx89TPfG7I9RHnFKq9YBNc06rVtgZ
 hOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700656578; x=1701261378;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bzgkdLyHs3r9uuY4fL6NY/Elu9vWOiVgEdZe9U7LSno=;
 b=wL8V08yROLCIH5oW84+Eeq2bU56gjBO5zPK1ZdCBu/zcONUTCcXP8s2AqQltez9Xvm
 k2qCg2aicxHGlss2TbfcXDg3azjc66xAsYBSmJ4W8HSst0hZeZnmhCD3vQBZfC7ZL10n
 x825r7fnLqR48x99lwDGbz06R+YZlWGXa3J64p1C3JCcFlVeefBbbIaSCgPOuJvHUDg6
 MbzYDG5e3NrPcApZDERsxbiumRSK5A9mKwJLJa5b3YKi/qEc4hQ+WPnuHNzCSvZ+8Pxw
 NHKppvuWELT99TApRTMP5PaZaL94Or9AUNsh/sv5du78vvqd5kxIwqZUR/+bwMflfsUM
 9ouw==
X-Gm-Message-State: AOJu0YwIDH86n8g5QWCxOqc4lPF4aFK6aNxb6RmXeTOS2bNCellfvcg5
 RCEH7Ag4uHDX1wGeOEN+8NmbwawKUgfzq/wbyiTBeiLDyOE=
X-Google-Smtp-Source: AGHT+IHFEEPVWnSCJ9ZWgHu8QNd+9cH+qsK5ihF7FZeWGZ3M5wDmVcyK2Y3u4x2hmco4WdrZtgHaVYAR/jDG8O3IBWk=
X-Received: by 2002:ac2:46c7:0:b0:50a:a62c:8857 with SMTP id
 p7-20020ac246c7000000b0050aa62c8857mr1573068lfo.31.1700656577477; Wed, 22 Nov
 2023 04:36:17 -0800 (PST)
MIME-Version: 1.0
References: <20231122110359.4087-1-thomas.hellstrom@linux.intel.com>
 <20231122110359.4087-5-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231122110359.4087-5-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 22 Nov 2023 12:35:50 +0000
Message-ID: <CAM0jSHMxamtCDtbP035n2qrQYkrgGYTf0_U-qRueJbLeXXrLVg@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe/vm: Fix ASID XA usage
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

On Wed, 22 Nov 2023 at 11:04, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> xa_alloc_cyclic() returns 1 on successful allocation, if wrapping occurs,
> but the code incorrectly treats that as an error. Fix that.
> Also, xa_alloc_cyclic() requires xa_init_flags(..., XA_FLAGS_ALLOC), so
> fix that, and assuming we don't want a zero ASID, instead of using
> XA_FLAGS_ALLOC1, adjust the xa limits at alloc_cyclic time.
>
> Suggested-by: Ohad Sharabi <osharabi@habana.ai>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/946
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
