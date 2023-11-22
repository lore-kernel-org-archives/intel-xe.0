Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32454C61D9B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 12:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEED710E021;
	Wed, 22 Nov 2023 12:22:38 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2544110E609
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 12:22:37 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-507f1c29f25so9197605e87.1
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 04:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700655755; x=1701260555; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yda+Scxlli2F0lPt01rnnubRuYT8sAIsSHmK/O3zXbM=;
 b=iVcsV6k5dBsFtAR9n93OhB+qq6ZDb/qPLeKVxZaWugqcI7Yys8ob3TzeZukHZNZaQi
 Lw+0KjmnBs/a08TPz8gE3W2mPC/pFAtNMpcCEfkZmSrHyppleApZICc2+RX8P3U9cdL+
 3CZoVLhEjHU6u80zggOTkOrdVVSEQe7KhWVxMLBin+AGtkmhJN5udfU0msTVYRG2qgoV
 yg255EgrGk39LGT6bg6xICNtsMQgOX4pGhvkyphz4Ehlhq5vmoXF0Uk+fIFMwqRoFueO
 TSk51cTKsSsR1+1V3qFNPhNFb/gmtj9WuHa3lh+oCC3OBrTbpo0Slndba1DDfejAfHzS
 YytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700655755; x=1701260555;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yda+Scxlli2F0lPt01rnnubRuYT8sAIsSHmK/O3zXbM=;
 b=nJ+M8S3wxkO4pOxbIMQ1x/h1ZVd9hNGGvktD/LMGxUhvIEkptTUiQXIfcwT3lcRIYm
 2jPFEsqQqu05oVlVwVqukbJ3Db2YIH9lWTM+BibfWsdshEYI5fH/4htLJlyWwCzd+w5Q
 mLywdbgwy/hKfZDJpCPGfBaoxYhiJFaLlLQZaM7tnBxhxFH90IiTs9RwTgHfWBMMtI0F
 +hkrSHnvXf9qk+8wMjwkW5119mg/VsMy92wrEA8RQWbkaNz67jZWl/Kx5cEHwDFip8ul
 MLatP+d9GwO5A4lBGdHzPwXB19v3ork/TyOpkNvDDruNcv3wdBHpy3xGOhvHxNGZm8pf
 r29w==
X-Gm-Message-State: AOJu0YzSqiJhiZXx/Q/GipP/ofT3jNfRarRILw9qJkdxl9ZoprNgHSK2
 AlGHHxka/umCh6n1Wgpx934E/5RrGrkB6Idjo2w=
X-Google-Smtp-Source: AGHT+IGGSSkH+ER0I5NMIh1Ysy8RHdVZ3Mek1zv9zD4yBB4uMBAEV/TNLesLqNoIgXSOUakLJ0xXt9L9/XxDbayzj20=
X-Received: by 2002:ac2:5975:0:b0:50a:71e1:e1ce with SMTP id
 h21-20020ac25975000000b0050a71e1e1cemr1421962lfp.51.1700655755094; Wed, 22
 Nov 2023 04:22:35 -0800 (PST)
MIME-Version: 1.0
References: <20231122110359.4087-1-thomas.hellstrom@linux.intel.com>
 <20231122110359.4087-4-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231122110359.4087-4-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 22 Nov 2023 12:22:08 +0000
Message-ID: <CAM0jSHOPh+KjsLoEtZ-iqVy9AaRpkfBmO+439=1fhxdOibcEPg@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/bo: Remove leftover trace_printk()
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
> trace_printk() is not intended for production code. Remove it.
>
> Suggested-by: Ohad Sharabi <osharabi@habana.ai>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/946
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
