Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E73D6204F
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 09:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE8A10E5FD;
	Tue, 19 Nov 2024 09:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SrzFDOCQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCDA10E5FD
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 09:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732008584; x=1763544584;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=XT0OJDxB8ILsJq4eiStqsdJcIrxOe3wnj2AxAOeP/6U=;
 b=SrzFDOCQ88k3DlYrIgA26ycS8qa577M742uJbRS0hCF2XAv60s9CggiE
 ti6RxGTUG/ML1O24InfE6THkAhc8Sjp9HPtjyidaH4Ryl3p2nH0aNUzns
 54pufZu3u0TbXMPEmJMgF/eVeZzM4pe6+UfOiZPVeIEqCiqD+TamSrRmC
 MTldAk8bytJ14QRMGySZW3Bbc6x6fky2RXqxWOp5kqEpbI4n7GJ73eRRM
 oUpKRCX6le/+Pp3Pqbm0zLN5HLWZQIiyY4EK11BfQz7DdMRBDMDw5ExTq
 KYQDfM5i8tDgqn4E2VhrUQi0raD6Rcq7zQaB+07EFIdp+8j0OjO49ctKK w==;
X-CSE-ConnectionGUID: SSe5tZqWTb6aQdETZ+mTXQ==
X-CSE-MsgGUID: hdLcNPA3S6OJ9yRHrxE6MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="49533480"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="49533480"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 01:29:44 -0800
X-CSE-ConnectionGUID: n3akB7hxS6W2kEkEhMJKOg==
X-CSE-MsgGUID: ILYafH6ZTgWt/dZQ02H9xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="94546765"
Received: from hcaldwel-desk1.amr.corp.intel.com (HELO localhost)
 ([10.124.222.171])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 01:29:43 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241118213713.71017-1-matthew.s.atwood@intel.com>
References: <20241118213713.71017-1-matthew.s.atwood@intel.com>
Subject: Re: [PATCH] drm/xe/ptl: Update PTL GuC revision
From: Jordan Justen <jordan.l.justen@intel.com>
Cc: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>, intel-xe@lists.freedesktop.org
Date: Tue, 19 Nov 2024 01:29:42 -0800
Message-ID: <173200858234.5661.3019491505830458081@jljusten-skl>
User-Agent: alot/0.11
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

On 2024-11-18 13:37:13, Matt Atwood wrote:
> Update PTL guc version to 7.36.0.

7 =3D> 70

It doesn't seem realistic (or honest) to provide a Reviewed-by for
pointing at a new closed source software version, so,

Tested-by: Jordan Justen <jordan.l.justen@intel.com>

>=20
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index b0deb082ab2b..9c14b0adad0c 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -107,7 +107,7 @@ struct fw_blobs_by_type {
>  };
> =20
>  #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)                =
       \
> -       fw_def(PANTHERLAKE,     mmp_ver(xe,     guc,    ptl,    70, 33, 2=
))     \
> +       fw_def(PANTHERLAKE,     mmp_ver(xe,     guc,    ptl,    70, 36, 0=
))     \
>         fw_def(BATTLEMAGE,      major_ver(xe,   guc,    bmg,    70, 29, 2=
))     \
>         fw_def(LUNARLAKE,       major_ver(xe,   guc,    lnl,    70, 29, 2=
))     \
>         fw_def(METEORLAKE,      major_ver(i915, guc,    mtl,    70, 29, 2=
))     \
> --=20
> 2.45.0
>
