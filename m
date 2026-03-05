Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F82F3093A
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 11:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD0510E251;
	Thu,  5 Mar 2026 11:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAKxSfrZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B815B10E251
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 11:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772709319; x=1804245319;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=M+MRwnsqH5FK+fKeCkJXuZ+hDK/9UNtCVQJ6mhQM9mw=;
 b=JAKxSfrZfoufrcR0+VatWBsvhrl45Pb+MF1BTh8XQG+6bRRKRZwWKTpq
 avBaOaFdxBWzSqu8zzS6HyccLZX5dfS6G+9qpuqcMcKNLiBFOxsL8pMbF
 XjHccDQuHZO1UAuVpgG3hKWFKRuq9zJ2PC3MqIWK/oRYDZM5KRK+zAQiO
 HM8xmUCUnzJVL10chkDiIlyTSqgfbFy9y4IQZSxf6YTP+h32gt1bYDZvH
 jXntv5XUu0i/Z7c67PWUOfepQGVa2u+Hz1UaOBXdljWcvto3ly28FHIQ0
 C6dpDbMzjOMepLXSedzRxm4HHoxUSuxC1mQ4f+/PvHmJBtYDdhWatB9CN g==;
X-CSE-ConnectionGUID: ON3rat7ERmKHxUEEwmDcDw==
X-CSE-MsgGUID: 6A679OjpRVS40uN3hVnqmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77395408"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="77395408"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 03:15:19 -0800
X-CSE-ConnectionGUID: EYnVPtzMRCSOogmTNhH0dQ==
X-CSE-MsgGUID: uuP23yYiQN6Essyqn7aeSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="256536319"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.71])
 ([10.245.244.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 03:15:18 -0800
Message-ID: <d67940a798cfcaba0cf6506947f02f23cacd388e.camel@linux.intel.com>
Subject: Re: [PATCH V5 4/4] drm/xe/xe3p: Skip TD flush
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, carl.zhang@intel.com, jose.souza@intel.com
Date: Thu, 05 Mar 2026 12:15:14 +0100
In-Reply-To: <20260303062441.1860959-10-tejas.upadhyay@intel.com>
References: <20260303062441.1860959-6-tejas.upadhyay@intel.com>
 <20260303062441.1860959-10-tejas.upadhyay@intel.com>
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

On Tue, 2026-03-03 at 11:54 +0530, Tejas Upadhyay wrote:
> Xe3p has HW ability to do transient display flush so the xe driver
> can
> enable this HW feature by default and skip the software TD flush.
>=20
> Bspec: 60002
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_device.c | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c
> index 94c9f17da4b4..0dca20133b94 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1166,6 +1166,14 @@ void xe_device_td_flush(struct xe_device *xe)
> =C2=A0{
> =C2=A0	struct xe_gt *root_gt;
> =C2=A0
> +	/*
> +	 * From Xe3p onward the HW takes care of flush of TD entries
> also along
> +	 * with flushing XA entries, which will be at the usual sync
> points,
> +	 * like at the end of submission, so no manual flush is
> needed here.
> +	 */
> +	if (GRAPHICS_VER(xe) >=3D 35)
> +		return;
> +
> =C2=A0	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
> =C2=A0		return;
> =C2=A0
