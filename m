Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2E6EB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 08:54:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2E010E2C2;
	Tue, 27 Jun 2023 08:54:52 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3850B10E2C2
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 08:54:50 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b69ff54321so31315931fa.2
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 01:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687856088; x=1690448088;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SKbgzPGaA45WKB/amV5mdaRiUfjufMu7O8WeeF41Z3E=;
 b=j/VK6eVDutsyeTFRkHOWV4zN1XOafyL2nBhvenD/kPmX51pCDTd37jdVUa/GL6A+fg
 7zSZjMS/tpiCTIwrV8q95S9obLtIBKxEGtwSAZ1RHzw/KGgZfjzz6d7n5CVacoRyT52C
 NiNT4Y/ra4eX0V8Wyi+/yLWhHu63C/B35/5rkDvHf/2aFlsSP1egRBwpmV/b/PNcY/5W
 lc3Uka8YdbpYeWhD44T3G5Z5SuMo68VHzCX8fzbBde4vWLwAumLIHIX90+MstGPte/Xa
 w0orDVosO9KUBOzi01z06Zdb810bMB0/o0Ql63Lj4z8fIL0YgRkpF50cIJ5Q9WJFh9b2
 kkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687856088; x=1690448088;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SKbgzPGaA45WKB/amV5mdaRiUfjufMu7O8WeeF41Z3E=;
 b=BCxm4xKhXELi2OR56vM8+39MKAdVR/m2hZJ5aycKX8wwPqPjPT/G2Vz4tMyJN9133V
 /tlGyvZPKJdAsTvGX/Lxgz3YSNiQKPQsjlFTnbxovJDDf1KzRDEqzPjxqzHnrm5FWA/5
 zLSvckj/6gShctL+Y3+TZujodp4/DudKgWHQnYBV9RzKuMyKRWYe8JaOcHZdYssr5FTI
 pNIJrZfYWu9IaQRFG18VVluHPgHR5W8a35E2Zqy7SnbDLCH07X2l8e7vNWP2Nf+lBgZP
 iPsyeG0J/yu+pr6+9nW93hiC7LkmKw5xAYX5jPBtgCgTO9e9SFYW/JPd3pEA40/Hf4kw
 mynQ==
X-Gm-Message-State: AC+VfDzqt9KxWtcQntgveQ6rQr4xR3ICB3InU9wc+v/q/rvRVxuxdn83
 k5eR0RpKB2FhOYzHUkuYdFO4AwDHMAj++qWiAXUJ5Z8hArw=
X-Google-Smtp-Source: ACHHUZ77LcPWWW+A1DwY7h5nF4A+VBS8Hp5wKfH/ZpybIY6t+cTYG78X4ZrNdxgZR4aUSX8Guge/5qPO1uHOtEEnTwA=
X-Received: by 2002:a2e:9e07:0:b0:2b4:5fdd:f583 with SMTP id
 e7-20020a2e9e07000000b002b45fddf583mr16926405ljk.51.1687856088074; Tue, 27
 Jun 2023 01:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230626181741.32820-1-thomas.hellstrom@linux.intel.com>
 <20230626181741.32820-3-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230626181741.32820-3-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 27 Jun 2023 09:54:21 +0100
Message-ID: <CAM0jSHPHL45dcsS3FkNsSKe3NijQTte7+wkD826FL4qRvBGETA@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v3 2/4] drm/xe/bo: Avoid creating a system
 resource when allocating a fresh VRAM bo
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
> When creating a new bo, on the first move the bo->resource is typically
> NULL. Our move callback rejected that instructing TTM to create a system
> resource. In addition a struct ttm_tt with a page-vector was created,
> although not populated with pages. Similarly when the clearing of VRAM
> was complete, the system resource was put on a ghost object and freed
> using the TTM delayed destroy mechanism.
>
> This is a lot of pointless work. So avoid creating the system resource an=
d
> instead change the code to cope with a NULL bo->resource.
>
> v2:
> - Add some code comments (Matthew Brost)
> v3:
> - Fix a dereference of old_mem which might be NULL.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
