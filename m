Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B1AD74964
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 08:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C250B10E1E0;
	Fri, 19 Dec 2025 08:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5CVysqP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2867510E1E0
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 08:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766133424; x=1797669424;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=RRdENiYzcsmcWiCNwhvuMDLS9N4q3HnCJw63afAACiA=;
 b=d5CVysqP4xFjO7/+/AJNTRno1tc/A2LatdnmYi8a6DtL/2QMAmixL1sH
 hLiEfKbEE0VQlA0iwPOkIs4rIrAg+ozS+dYB34gRdWVvLBVOX7c7qyDHc
 wSrT/w8zLnzNEJvHZBnPj8pc0wJ2d03rvmAsqzBskj/uU4UicigJDZT31
 qCpCImB7h2T8wmOZAmsY4z35CsXDxAiHRfga6vwX7N5K5flVB5G3NL1ab
 gQA5zp6uLKMNPTzkaAGCllXbguNL08uTP2Q5d6cZkzhFycMVSxp/7Psx6
 uazzzhFWK9T73LoZEtGYbuydEVdeU5Mpe7QthPh55bZS/dSXd0hOMYNao g==;
X-CSE-ConnectionGUID: ArgZya5JReWg+K/xZvP/VQ==
X-CSE-MsgGUID: rHOhpFtuQDKqaRnkfPDiVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68068023"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="68068023"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 00:37:04 -0800
X-CSE-ConnectionGUID: NbfQ9RYxRM2XtHehxkp2xA==
X-CSE-MsgGUID: pwBWkRxaRlyp9QtKNSfEeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="197960132"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.251])
 ([10.245.244.251])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 00:37:03 -0800
Message-ID: <4bc79b304b121ed676b3c9e5743481a846c9286d.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Remove incorrect code introduced during merge
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>
Date: Fri, 19 Dec 2025 09:37:00 +0100
In-Reply-To: <20251219075520.3992811-1-jia.yao@intel.com>
References: <20251219075520.3992811-1-jia.yao@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

Hi,

On Fri, 2025-12-19 at 07:55 +0000, Jia Yao wrote:
> Remove redundant code introduced by merge in xe_exec_queue.c
>=20
> Fixes: ce0478b02ed2 ("Merge tag 'v6.18-rc6' into drm-next")
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> Cc: Xin Wang <x.wang@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>

A fix for this is already present upstream, and the issue will be
resolved with the next backmerge of drm-xe-next. So don't merge this
patch.

Thanks,
Thomas


> ---
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.c | 3 ---
> =C2=A01 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index cb45962be14c..41023a464480 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -494,9 +494,6 @@ void xe_exec_queue_destroy(struct kref *ref)
> =C2=A0
> =C2=A0	xe_assert(gt_to_xe(q->gt), atomic_read(&q->job_cnt) =3D=3D 0);
> =C2=A0
> -	if (q->ufence_syncobj)
> -		drm_syncobj_put(q->ufence_syncobj);
> -
> =C2=A0	if (q->ufence_syncobj)
> =C2=A0		drm_syncobj_put(q->ufence_syncobj);
> =C2=A0

