Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97CCC44512
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 05:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF9010E40F;
	Wed, 22 Jul 2026 05:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NQPPKkaE";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BFB10E400
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 05:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784697728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zUwBUqB0UJ0jFJVhl6+u41ye61PbDg1BSsWyW+JC2Xs=;
 b=NQPPKkaEFt7Y+HhhkyDqTzdUR5VZTbZEE6moBP/osTa0eDooqTnWAtBCQmklnbJDY3Z2d2
 X6BXQpbk8E0+5E51XliLPPrsACj14uBdZmlfpWF43Pqd2QVKW30+oQ9cr5pSdsVWuXctio
 rT9biG451A4D7cZGKJY5usQGoupc7pc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-H4ynp7OsNq-ijgKrA2VvxQ-1; Wed, 22 Jul 2026 01:22:06 -0400
X-MC-Unique: H4ynp7OsNq-ijgKrA2VvxQ-1
X-Mimecast-MFC-AGG-ID: H4ynp7OsNq-ijgKrA2VvxQ_1784697725
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4926fa2cb17so40551925e9.1
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 22:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784697725; x=1785302525;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zUwBUqB0UJ0jFJVhl6+u41ye61PbDg1BSsWyW+JC2Xs=;
 b=Ne9Kp6MWD9a2UBqIwo0hamUUKDFPD99bO30qkM6RCIhuZNr5fZS2xFWSDYFwVm7OZF
 I+JmOeMJOfa1sfbG8w1HJtSHvtLXN8mJQopi0oSzGVJxYR/DqwesBvt+gAC/7IJp8BJr
 2oOw40rOK2pphikdXX8enDVNtqYQ0qyG1QLF8WGUvjfsPrvHX78dQtSt7fS3rmQqqYGc
 74RLVbHwTpQOgXhlLq5fPJpSvR9DqXUR7BOPMmwh388+UXASSAM4FGGucTawooOnToQV
 4LLDgq+te4lBiwTUQUA7qGm39Qr9DTyk3sM2/FHRykxkgODaXbtIZhYkeY8cJXRQ6wbZ
 LyfA==
X-Gm-Message-State: AOJu0YyDlXRei/42hi2Df9nN4EdujKx8Kzzx0grqAPwVUgdZCiTTGXfL
 pdBUaFioSJYo234R6uJeADyttTEsxzdOmKAXPhq5CxEtFrwdAeLJfHKRAEqlpubawU+39zY41Tq
 42RGP7qeGfdrHaKDXJ5hwHrNrLUpseY4IW7Ht/RulMPZWIzf45voga5c4yyvDovj2cCF/q3dn+7
 UmhlnSE545xW4mEW4xy4Vq8ItYrwfTvM7hnu37TvfmzbY=
X-Gm-Gg: AR+sD11lCDo8DqjZzOdmYv2x0TPuX2Z9fF44XZJZxHPPU/uakASKGcKEvLuGHHnOIbc
 BwTDAVexV5jJy80N8JFqC3oAGVzKAAhKMJEwgv9v0WthlSZU5IQqedmj2fH8yc9W8WKL+mcP9cE
 +wITV0hL9JWmTrLiOOkWEI0cp/hod6U1E99CNT4tokMa7vfQLsP7yBm48p
X-Received: by 2002:a05:600c:548a:b0:493:f783:c46a with SMTP id
 5b1f17b1804b1-4956a4ef5d1mr23399515e9.6.1784697724940; 
 Tue, 21 Jul 2026 22:22:04 -0700 (PDT)
X-Received: by 2002:a05:600c:548a:b0:493:f783:c46a with SMTP id
 5b1f17b1804b1-4956a4ef5d1mr23399355e9.6.1784697724521; Tue, 21 Jul 2026
 22:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260721223244.1102276-1-matthew.brost@intel.com>
In-Reply-To: <20260721223244.1102276-1-matthew.brost@intel.com>
From: Jan Stancek <jstancek@redhat.com>
Date: Wed, 22 Jul 2026 07:21:47 +0200
X-Gm-Features: AUfX_mwOdL_gU0Ukhn_BHxlTdYAhKkWBviF2rnNH5uTdN37yiHN3GNzhNE9VnzQ
Message-ID: <CAASaF6yWnMeEa6ZiKNGjh5bMAUy+1D2JdQoDhj-UEaMm_ygG8w@mail.gmail.com>
Subject: Re: [PATCH] drm/pagemap: Guard HPAGE_PMD_ORDER use with
 CONFIG_ARCH_ENABLE_THP_MIGRATION
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel test robot <lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WOUxd5BrZ1Lik1e1G7qe9SvOe026IuwXpl6nuSHMlxo_1784697725
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

On Wed, Jul 22, 2026 at 12:32=E2=80=AFAM Matthew Brost <matthew.brost@intel=
.com> wrote:
>
> HPAGE_PMD_SHIFT expands to BUILD_BUG() when CONFIG_PGTABLE_HAS_HUGE_LEAVE=
S
> is not set, causing a compile error when both CONFIG_TRANSPARENT_HUGEPAGE
> and CONFIG_HUGETLB_PAGE are disabled:
>
>  drivers/gpu/drm/drm_pagemap.c:480:12: error: call to '__compiletime_asse=
rt_458'
>  declared with 'error' attribute: BUILD_BUG failed
>    480 |                         order =3D HPAGE_PMD_ORDER;
>        |                                 ^
>  include/linux/huge_mm.h:117:26: note: expanded from macro 'HPAGE_PMD_ORD=
ER'
>    117 | #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
>        |                          ^
>  include/linux/huge_mm.h:113:28: note: expanded from macro 'HPAGE_PMD_SHI=
FT'
>    113 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
>
> Define DRM_PAGEMAP_PMD_ORDER, which maps to HPAGE_PMD_ORDER when
> CONFIG_ARCH_ENABLE_THP_MIGRATION is enabled and to -1 otherwise.
>
> This is safe because all code paths that use DRM_PAGEMAP_PMD_ORDER are
> reachable only when CONFIG_ARCH_ENABLE_THP_MIGRATION is enabled.
>
> Fixes: 139ab31aea8a ("drm/pagemap: Correct cpages calculation for migrate=
_vma_setup")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202607201914.LpAGsbXs-lkp@intel.com/
> Cc: Jan Stancek <jstancek@redhat.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Thanks for fix, this resolves (same) build failure I was seeing as well.

Tested-by: Jan Stancek <jstancek@redhat.com>

