Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31222606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 15:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BKXLSwQi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA33510E257;
	Fri, 30 Oct 2026 15:33:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EFB10E264
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 15:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793374411; x=1824910411;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UT59xLyAjWCEbRq29g5aANnCqutnmEALGjwXPzYozBw=;
 b=BKXLSwQi2+z4hz4oTiZJNunDeC7SubkbEekGENWlW8TN7u+EdhzCR4cM
 3FifK1EFaqfBAzZ4zPVUyg6464iuBjVTyb+F9yobI9vbTXUXtsctfXWoT
 zs/S6GJP5wkMbDsAo/gW69pslWYeXuHPYf+P+FveM00sl4aaSaAgqttUY
 jonCNwI++86l5laCL7H3SUcE7RnobXQQVKuwtFrKQMuWfYt6QaAekSD0m
 qA0JZC4Gn1Ic1aubSMl7040Xcfgx2Y+toiLvJ8m82pURQPQ60L3UmfiUb
 gO5qls8kGsaClPyI94NOcN9lspU8PQjXr4Z3ih2jARUyqggcD88D6U6Xc w==;
X-CSE-ConnectionGUID: xlRGYizqS1qqtKsw8tD4GA==
X-CSE-MsgGUID: CsxRYq+gSWK7JNsurvq9Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2156506"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2156506"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 08:32:21 -0700
X-CSE-ConnectionGUID: mKhRnid/SjqKdAVQ7gCYtg==
X-CSE-MsgGUID: rY4V4QwQSYG+GYNUdLIYPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5430252"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.72])
 ([10.245.244.72])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 08:32:20 -0700
Message-ID: <085292ee0ed5e59b00396777ee27143b0bf0c89f.camel@linux.intel.com>
Subject: Re: [PATCH 6/6] drm/xe/migrate: avoid interruptible waits once
 passes are in flight
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Date: Fri, 30 Oct 2026 16:32:18 +0100
In-Reply-To: <20261030-migrate-bb-optimise-v1-6-b8d01649cfe9@intel.com>
References: <20261030-migrate-bb-optimise-v1-0-b8d01649cfe9@intel.com>
 <20261030-migrate-bb-optimise-v1-6-b8d01649cfe9@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 2026-10-30 at 11:49 +0000, Matthew Auld wrote:
> Once at least one pass has been submitted in xe_migrate_clear() or
> __xe_migrate_copy() (fence !=3D NULL), aborting a later pass with
> -ERESTARTSYS when the bb pool is full still has to wait
> uninterruptibly
> in err_sync for all in-flight passes to complete, only to discard
> that
> work and restart the entire transfer from scratch.
>=20
> Only wait interruptibly on the first pass (!fence && intr).
>=20
> Assisted-by: LLM
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index dd326bcd12b1..881ff933c736 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1316,7 +1316,7 @@ static struct dma_fence
> *__xe_migrate_copy(struct xe_migrate *m,
> =C2=A0		batch_size +=3D ((copy_only_ccs) ? 0 :
> emit_copy_cmd_len(xe)) +
> =C2=A0			((needs_ccs_emit ? EMIT_COPY_CCS_DW : 0));
> =C2=A0
> -		bb =3D __xe_bb_new(gt, batch_size, usm, intr);
> +		bb =3D __xe_bb_new(gt, batch_size, usm, !fence &&
> intr);
> =C2=A0		if (IS_ERR(bb)) {
> =C2=A0			err =3D PTR_ERR(bb);
> =C2=A0			goto err_sync;
> @@ -1992,7 +1992,7 @@ struct dma_fence *xe_migrate_clear(struct
> xe_migrate *m,
> =C2=A0		if (WARN_ON_ONCE(!clear_L0))
> =C2=A0			break;
> =C2=A0
> -		bb =3D __xe_bb_new(gt, batch_size, usm, intr);
> +		bb =3D __xe_bb_new(gt, batch_size, usm, !fence &&
> intr);
> =C2=A0		if (IS_ERR(bb)) {
> =C2=A0			err =3D PTR_ERR(bb);
> =C2=A0			goto err_sync;
