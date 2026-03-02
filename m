Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D13E9B340
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 09:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15D910E209;
	Mon,  2 Mar 2026 09:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jX8pTZ5c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E25E10E209;
 Mon,  2 Mar 2026 09:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772444355; x=1803980355;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=C/IKmReL6/AWqKgeho2zj5OurIYqVbDfsm4wmDu7IxE=;
 b=jX8pTZ5ceNTfDCs2HqLsq27hUAsLzo18KSaQGQliN5YGckhGqocVZ6eI
 YwtXT8m6EOS3+nHGJadJH86gdz6+g/Ga8Ji5BmcYdCS0tnJg/5zQ1efQ5
 gpc/ms93NYsmgGzO18FT6DfHt7hgwAfXEgNMA1lkihuYOAl55mPR2YQ5k
 NC4mnBeyCjx8DcRGxEOaF6vKfmcysZGk0U4Tu7EupQCcwu80T7BtxI6Ce
 eve5s0hSjvZ8TeT5WT9w+Fc2Y3pVK8EkLVa+/sJszaLLl+S4Pp8x1ykcD
 3dfowYmKh7MCqmnvZFh+mn3bc2KFwgipWFmWVDTeQYz4Ho7M3xo2RUGpS w==;
X-CSE-ConnectionGUID: 6iGO/YCpSX6ZpFuEYk6xog==
X-CSE-MsgGUID: al8o2ZuKRwu47QzRVxhKYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73355650"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="73355650"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:39:15 -0800
X-CSE-ConnectionGUID: +WNCp4nyQ6iKBAsZT99AJA==
X-CSE-MsgGUID: IEt66UKmR5WT9RZSU4uD/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="221752346"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.244.81])
 ([10.245.244.81])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:39:12 -0800
Message-ID: <4e9ac4fe88f4b8aec161d4edb4b4f66e70554ec8.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/ttm: Don't spam the log on buffer object
 backing store allocation failure
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Date: Mon, 02 Mar 2026 10:39:10 +0100
In-Reply-To: <fe4d93d8-5c9c-460b-93e1-5d0d49a316ab@amd.com>
References: <20260227160012.82309-1-thomas.hellstrom@linux.intel.com>
 <20260227160012.82309-2-thomas.hellstrom@linux.intel.com>
 <fe4d93d8-5c9c-460b-93e1-5d0d49a316ab@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
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

On Mon, 2026-03-02 at 10:02 +0100, Christian K=C3=B6nig wrote:
> On 2/27/26 17:00, Thomas Hellstr=C3=B6m wrote:
> > If the struct ttm_operation_ctx::gfp_retry_mayfail is true,
> > buffer object backing store allocation failures are expected to
> > silently fail with an error code to the caller. But currently an
> > elaborate warning is printed to the system log.
> >=20
> > Don't spam the log in this way.
>=20
> That was intentionally removed or never added because Simona
> absolutely didn't liked the gfp_retry_mayfail flag at that time.
>=20
> In general I'm fine with this change since I think we have proved by
> now that the flag is useful, but that probably need more wider
> discussion.

Well for system memory it is a bit questionable to be honest, I think
mostly because even if we return an error, the OOM killer might be
invoked on an unrelated allocation immediately afterwards.

Still, even if the use of gfp_retry_mayfail can be discussed, I'm not
sure why an error here needs to be printed when there are a number of
other errors that are not printed or printed only on debug.

Thanks,
Thomas


>=20
> Regards,
> Christian.
>=20
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/ttm/ttm_pool.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
> > b/drivers/gpu/drm/ttm/ttm_pool.c
> > index c0d95559197c..8fa9e09f6ee5 100644
> > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > @@ -726,7 +726,7 @@ static int __ttm_pool_alloc(struct ttm_pool
> > *pool, struct ttm_tt *tt,
> > =C2=A0		gfp_flags |=3D __GFP_ZERO;
> > =C2=A0
> > =C2=A0	if (ctx->gfp_retry_mayfail)
> > -		gfp_flags |=3D __GFP_RETRY_MAYFAIL;
> > +		gfp_flags |=3D __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
> > =C2=A0
> > =C2=A0	if (ttm_pool_uses_dma32(pool))
> > =C2=A0		gfp_flags |=3D GFP_DMA32;
