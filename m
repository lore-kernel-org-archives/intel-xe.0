Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1987EF3D31A
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 15:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D189710EC49;
	Thu,  5 Mar 2026 15:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BDEiOmlc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD09710EC3F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 15:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772725789; x=1804261789;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wj7wiZUme1FJqFRm9+u/cm+2BRCY49xHqAMiN3WY6cI=;
 b=BDEiOmlcSP4yyqSUAXKO99vPHYBlt7kRR4UlhIM10OVM8GfQ3wet+tvB
 8t8vToVZP2u8o79+lJpCGmNRNIFAYTg/23V7oK6j2oz+rhLN0I08thr6o
 mZr3rAT1QskBB/8Q07PHa8NAHJQa/TpQl3aC1L8Ipb5SUTsGFaUpnM0Wa
 1rHUXnWmjEEPXzJDugw1YkO2H7UuTDBClxnQ7sqtfFT4uT5PjfFZCUqL0
 8a/m1ZIfhAAZtyJ8roc1R8Nm11pjU4+JQvtPCV0iSsmjYtcCkSUT8Z7H6
 v7jKTaB9lvrz3WEtxSF0aI6N4rT/jGcLB3YKXp3gxpojFhDWGDMWY8Yl3 g==;
X-CSE-ConnectionGUID: F6/180oqSsO+Bu2xiQKoYg==
X-CSE-MsgGUID: feVCDp25SsWtxvUpMHX/5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="61390172"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="61390172"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 07:49:49 -0800
X-CSE-ConnectionGUID: m5Zp9rMFTy6NYx34ommLhg==
X-CSE-MsgGUID: mpWAjQ0zQvOiHBGb4+jEsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="223406780"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.71])
 ([10.245.244.71])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 07:49:47 -0800
Message-ID: <79f4260f85a1f00a3996406b3314c2db5873322d.camel@linux.intel.com>
Subject: Re: [PATCH v6 12/12] drm/xe/bo: Skip zero-refcount BOs in shrinker
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com, 
 pallavi.mishra@intel.com
Date: Thu, 05 Mar 2026 16:49:44 +0100
In-Reply-To: <20260303152015.3499248-13-arvind.yadav@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
 <20260303152015.3499248-13-arvind.yadav@intel.com>
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

On Tue, 2026-03-03 at 20:50 +0530, Arvind Yadav wrote:
> Zero-refcount BOs are being destroyed. Skip them in the shrinker
> to avoid racing with cleanup by returning -EBUSY.
>=20
> Ghost BOs from ttm_bo_pipeline_gutting() still hold reclaimable
> pages, so continue processing them via xe_bo_shrink_purge().
>=20
> Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
>=20
> v6:
> =C2=A0 - Split from patch 0010 (Thomas)
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>

Hi, Arvind.

> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 6 +++++-
> =C2=A01 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 598d4463baf3..07acce383cb1 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1295,9 +1295,13 @@ long xe_bo_shrink(struct ttm_operation_ctx
> *ctx, struct ttm_buffer_object *bo,
> =C2=A0	if (!xe_bo_eviction_valuable(bo, &place))
> =C2=A0		return -EBUSY;
> =C2=A0
> -	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))

Looking a bit closer at this, I realized this is intentional. The bo
has two refcounts. One is the gem refcount (which we fail to grab here)
and one is the ttm refcount, which we have successfully grabbed,
otherwise this function wouldn't be called. So the bo is in a zombie
state (all xe-specific members are invalidd) but calling
xe_bo_shrink_purge is allowed. So this patch could actually be dropped.

Question is did you see any issues from xe_bo_shrink_purge() without
this patch?

Thanks,
Thomas
