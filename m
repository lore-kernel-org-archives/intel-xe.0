Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64132C10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 11:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFE510F1AD;
	Mon,  6 May 2024 11:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jzR3n/JY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB5F10F1AD
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 11:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714996190; x=1746532190;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=RyZOVV27zUY48ZVeyKDEahhml7KUvraO9PIAz4+ZODg=;
 b=jzR3n/JYC9vqvkXoN/ivEo82zLzhzZXlwE5dCeUEU+axDZHCL7YY/upl
 U0k5CPipBITtEbABAAnjKjDZY6mmW6ws53JltnZzdMRDlhqyswnbSW9jm
 2MeUjQXDLbVNt85wxBZ5YjPQp/pvXvpbk5uLU/ubmj1JzQERUefgFbLes
 zeu8zaHvPlSjh4wsIXdK//3z3Id53AF/2oGL5GhC65QdBGnK2hlyL6HA0
 AaXA/Dp9ZRVY/9JmUfdAoauqtbDXlNYILRX0oECskmwyv4kOum0qPs+dW
 1XvEsuTJFeL+A+eszJaX658WovysH3Q8uMyLexEQt2IpcQrwM6UGbo4pi w==;
X-CSE-ConnectionGUID: h7QaKTfQSV28mJkbTWwwoA==
X-CSE-MsgGUID: /pTYen7aRSuogc09MsBgJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="21349071"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="21349071"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 04:49:49 -0700
X-CSE-ConnectionGUID: P/mPeqZzSSOqlZTgcd6YlQ==
X-CSE-MsgGUID: x09j70zOQviC+RAVu4hK5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="32617302"
Received: from unknown (HELO [10.245.245.120]) ([10.245.245.120])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 04:49:47 -0700
Message-ID: <93a77e18792823ab38073ed602e4d874e0dcd4d3.camel@linux.intel.com>
Subject: Re: [PATCH 2/7] drm/xe: Fix xe_pm_runtime_get_if_in_use documentation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, matthew.brost@intel.com, 
 francois.dugast@intel.com, matthew.auld@intel.com, anshuman.gupta@intel.com
Date: Mon, 06 May 2024 13:49:46 +0200
In-Reply-To: <20240503191309.7022-3-rodrigo.vivi@intel.com>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
 <20240503191309.7022-3-rodrigo.vivi@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Fri, 2024-05-03 at 15:13 -0400, Rodrigo Vivi wrote:
> Let's be clear on what it is actually doing and align with
> xe_pm_runtime_get_if_active doc style.
>=20
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_pm.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index eca977d1e1cb..c3adcbaba223 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -514,10 +514,11 @@ bool xe_pm_runtime_get_if_active(struct
> xe_device *xe)
> =C2=A0}
> =C2=A0
> =C2=A0/**
> - * xe_pm_runtime_get_if_in_use - Get a runtime_pm reference and
> resume if needed
> + * xe_pm_runtime_get_if_in_use - Get a new reference if device is
> active with previous ref taken
> =C2=A0 * @xe: xe device instance
> =C2=A0 *
> - * Returns: True if device is awake and the reference was taken,
> false otherwise.
> + * Returns: True if device is awake, a previous reference had been
> already taken,
Same here.

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> + * and a new reference was now taken, false otherwise.
> =C2=A0 */
> =C2=A0bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
> =C2=A0{

